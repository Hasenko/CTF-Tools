package com.google.appinventor.components.runtime.multidex;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import android.util.Log;
import com.google.appinventor.components.runtime.util.IOUtils;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileFilter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

/* loaded from: classes.dex */
final class MultiDexExtractor {
    private static final int BUFFER_SIZE = 16384;
    private static final String DEX_PREFIX = "classes";
    private static final String DEX_SUFFIX = ".dex";
    private static final String EXTRACTED_NAME_EXT = ".classes";
    private static final String EXTRACTED_SUFFIX = ".zip";
    private static final String KEY_CRC = "crc";
    private static final String KEY_DEX_NUMBER = "dex.number";
    private static final String KEY_TIME_STAMP = "timestamp";
    private static final int MAX_EXTRACT_ATTEMPTS = 3;
    private static final long NO_VALUE = -1;
    private static final String PREFS_FILE = "multidex.version";
    private static final String TAG = "MultiDex";
    private static Method sApplyMethod;

    MultiDexExtractor() {
    }

    public static boolean mustLoad(Context context, ApplicationInfo applicationInfo) {
        File sourceApk = new File(applicationInfo.sourceDir);
        try {
            long currentCrc = getZipCrc(sourceApk);
            if (isModified(context, sourceApk, currentCrc)) {
                return true;
            }
            return false;
        } catch (IOException e) {
            return false;
        }
    }

    static List<File> load(Context context, ApplicationInfo applicationInfo, File dexDir, boolean forceReload) throws IOException {
        List<File> files;
        Log.i(TAG, "MultiDexExtractor.load(" + applicationInfo.sourceDir + ", " + forceReload + ")");
        File sourceApk = new File(applicationInfo.sourceDir);
        long currentCrc = getZipCrc(sourceApk);
        if (!forceReload && !isModified(context, sourceApk, currentCrc)) {
            try {
                files = loadExistingExtractions(context, sourceApk, dexDir);
            } catch (IOException ioe) {
                Log.w(TAG, "Failed to reload existing extracted secondary dex files, falling back to fresh extraction", ioe);
                List<File> files2 = performExtractions(sourceApk, dexDir);
                putStoredApkInfo(context, getTimeStamp(sourceApk), currentCrc, files2.size() + 1);
                files = files2;
            }
        } else {
            Log.i(TAG, "Detected that extraction must be performed.");
            List<File> files3 = performExtractions(sourceApk, dexDir);
            putStoredApkInfo(context, getTimeStamp(sourceApk), currentCrc, files3.size() + 1);
            files = files3;
        }
        Log.i(TAG, "load found " + files.size() + " secondary dex files");
        return files;
    }

    private static List<File> loadExistingExtractions(Context context, File sourceApk, File dexDir) throws IOException {
        Log.i(TAG, "loading existing secondary dex files");
        String extractedFilePrefix = sourceApk.getName() + EXTRACTED_NAME_EXT;
        int totalDexNumber = getMultiDexPreferences(context).getInt(KEY_DEX_NUMBER, 1);
        List<File> files = new ArrayList<>(totalDexNumber);
        for (int secondaryNumber = 2; secondaryNumber <= totalDexNumber; secondaryNumber++) {
            String fileName = extractedFilePrefix + secondaryNumber + EXTRACTED_SUFFIX;
            File extractedFile = new File(dexDir, fileName);
            if (extractedFile.isFile()) {
                files.add(extractedFile);
                if (!verifyZipFile(extractedFile)) {
                    Log.i(TAG, "Invalid zip file: " + extractedFile);
                    throw new IOException("Invalid ZIP file.");
                }
            } else {
                throw new IOException("Missing extracted secondary dex file '" + extractedFile.getPath() + "'");
            }
        }
        return files;
    }

    private static boolean isModified(Context context, File archive, long currentCrc) {
        SharedPreferences prefs = getMultiDexPreferences(context);
        return (prefs.getLong(KEY_TIME_STAMP, NO_VALUE) == getTimeStamp(archive) && prefs.getLong(KEY_CRC, NO_VALUE) == currentCrc) ? false : true;
    }

    private static long getTimeStamp(File archive) {
        long timeStamp = archive.lastModified();
        if (timeStamp == NO_VALUE) {
            return timeStamp - 1;
        }
        return timeStamp;
    }

    private static long getZipCrc(File archive) throws IOException {
        long computedValue = ZipUtil.getZipCrc(archive);
        if (computedValue == NO_VALUE) {
            return computedValue - 1;
        }
        return computedValue;
    }

    /* JADX WARN: Unreachable blocks removed: 2, instructions: 3 */
    private static List<File> performExtractions(File sourceApk, File dexDir) throws IOException {
        Throwable th;
        File file = dexDir;
        String extractedFilePrefix = sourceApk.getName() + EXTRACTED_NAME_EXT;
        prepareDexDir(file, extractedFilePrefix);
        List<File> files = new ArrayList<>();
        ZipFile apk = new ZipFile(sourceApk);
        int secondaryNumber = 2;
        try {
            ZipEntry dexFile = apk.getEntry(DEX_PREFIX + 2 + DEX_SUFFIX);
            while (dexFile != null) {
                String fileName = extractedFilePrefix + secondaryNumber + EXTRACTED_SUFFIX;
                File extractedFile = new File(file, fileName);
                files.add(extractedFile);
                Log.i(TAG, "Extraction is needed for file " + extractedFile);
                int numAttempts = 0;
                boolean isExtractionSuccessful = false;
                while (numAttempts < 3 && !isExtractionSuccessful) {
                    numAttempts++;
                    extract(apk, dexFile, extractedFile, extractedFilePrefix);
                    isExtractionSuccessful = verifyZipFile(extractedFile);
                    ZipEntry dexFile2 = dexFile;
                    String fileName2 = fileName;
                    String extractedFilePrefix2 = extractedFilePrefix;
                    try {
                        Log.i(TAG, "Extraction " + (isExtractionSuccessful ? "success" : "failed") + " - length " + extractedFile.getAbsolutePath() + ": " + extractedFile.length());
                        if (!isExtractionSuccessful) {
                            extractedFile.delete();
                            if (extractedFile.exists()) {
                                Log.w(TAG, "Failed to delete corrupted secondary dex '" + extractedFile.getPath() + "'");
                            }
                        }
                        dexFile = dexFile2;
                        fileName = fileName2;
                        extractedFilePrefix = extractedFilePrefix2;
                    } catch (Throwable th2) {
                        th = th2;
                        try {
                            apk.close();
                            throw th;
                        } catch (IOException e) {
                            Log.w(TAG, "Failed to close resource", e);
                            throw th;
                        }
                    }
                }
                String extractedFilePrefix3 = extractedFilePrefix;
                if (!isExtractionSuccessful) {
                    throw new IOException("Could not create zip file " + extractedFile.getAbsolutePath() + " for secondary dex (" + secondaryNumber + ")");
                }
                secondaryNumber++;
                dexFile = apk.getEntry(DEX_PREFIX + secondaryNumber + DEX_SUFFIX);
                file = dexDir;
                extractedFilePrefix = extractedFilePrefix3;
            }
            try {
                apk.close();
            } catch (IOException e2) {
                Log.w(TAG, "Failed to close resource", e2);
            }
            return files;
        } catch (Throwable th3) {
            th = th3;
        }
    }

    private static void putStoredApkInfo(Context context, long timeStamp, long crc, int totalDexNumber) {
        SharedPreferences prefs = getMultiDexPreferences(context);
        SharedPreferences.Editor edit = prefs.edit();
        edit.putLong(KEY_TIME_STAMP, timeStamp);
        edit.putLong(KEY_CRC, crc);
        edit.putInt(KEY_DEX_NUMBER, totalDexNumber);
        apply(edit);
    }

    private static SharedPreferences getMultiDexPreferences(Context context) {
        int i;
        if (Build.VERSION.SDK_INT < 11) {
            i = 0;
        } else {
            i = 4;
        }
        return context.getSharedPreferences(PREFS_FILE, i);
    }

    private static void prepareDexDir(File dexDir, final String extractedFilePrefix) throws IOException {
        dexDir.mkdirs();
        if (!dexDir.isDirectory()) {
            throw new IOException("Failed to create dex directory " + dexDir.getPath());
        }
        FileFilter filter = new FileFilter() { // from class: com.google.appinventor.components.runtime.multidex.MultiDexExtractor.1
            @Override // java.io.FileFilter
            public boolean accept(File pathname) {
                return !pathname.getName().startsWith(extractedFilePrefix);
            }
        };
        File[] files = dexDir.listFiles(filter);
        if (files == null) {
            Log.w(TAG, "Failed to list secondary dex dir content (" + dexDir.getPath() + ").");
            return;
        }
        for (File oldFile : files) {
            Log.i(TAG, "Trying to delete old file " + oldFile.getPath() + " of size " + oldFile.length());
            if (!oldFile.delete()) {
                Log.w(TAG, "Failed to delete old file " + oldFile.getPath());
            } else {
                Log.i(TAG, "Deleted old file " + oldFile.getPath());
            }
        }
    }

    private static void extract(ZipFile apk, ZipEntry dexFile, File extractTo, String extractedFilePrefix) throws IOException, FileNotFoundException {
        InputStream in = apk.getInputStream(dexFile);
        File tmp = File.createTempFile(extractedFilePrefix, EXTRACTED_SUFFIX, extractTo.getParentFile());
        Log.i(TAG, "Extracting " + tmp.getPath());
        try {
            ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(tmp)));
            try {
                ZipEntry classesDex = new ZipEntry("classes.dex");
                classesDex.setTime(dexFile.getTime());
                out.putNextEntry(classesDex);
                byte[] buffer = new byte[16384];
                for (int length = in.read(buffer); length != -1; length = in.read(buffer)) {
                    out.write(buffer, 0, length);
                }
                out.closeEntry();
                out.close();
                Log.i(TAG, "Renaming to " + extractTo.getPath());
                if (!tmp.renameTo(extractTo)) {
                    throw new IOException("Failed to rename \"" + tmp.getAbsolutePath() + "\" to \"" + extractTo.getAbsolutePath() + "\"");
                }
            } catch (Throwable th) {
                out.close();
                throw th;
            }
        } finally {
            IOUtils.closeQuietly(TAG, in);
            tmp.delete();
        }
    }

    static boolean verifyZipFile(File file) {
        try {
            try {
                ZipFile zipFile = new ZipFile(file);
                try {
                    zipFile.close();
                    return true;
                } catch (IOException e) {
                    Log.w(TAG, "Failed to close zip file: " + file.getAbsolutePath());
                    return false;
                }
            } catch (IOException ex) {
                Log.w(TAG, "Got an IOException trying to open zip file: " + file.getAbsolutePath(), ex);
                return false;
            }
        } catch (ZipException ex2) {
            Log.w(TAG, "File " + file.getAbsolutePath() + " is not a valid zip file.", ex2);
            return false;
        }
    }

    static {
        try {
            sApplyMethod = SharedPreferences.Editor.class.getMethod("apply", new Class[0]);
        } catch (NoSuchMethodException e) {
            sApplyMethod = null;
        }
    }

    private static void apply(SharedPreferences.Editor editor) {
        Method method = sApplyMethod;
        if (method != null) {
            try {
                method.invoke(editor, new Object[0]);
                return;
            } catch (IllegalAccessException e) {
            } catch (InvocationTargetException e2) {
            }
        }
        editor.commit();
    }
}
