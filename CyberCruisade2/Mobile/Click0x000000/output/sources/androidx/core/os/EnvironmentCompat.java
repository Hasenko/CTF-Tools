package androidx.core.os;

import android.os.Build;
import android.os.Environment;
import android.util.Log;
import java.io.File;
import java.io.IOException;

/* loaded from: classes2.dex */
public final class EnvironmentCompat {
    public static final String MEDIA_UNKNOWN = "unknown";
    private static final String TAG = "EnvironmentCompat";

    public static String getStorageState(File path) {
        if (Build.VERSION.SDK_INT >= 21) {
            return Api21Impl.getExternalStorageState(path);
        }
        if (Build.VERSION.SDK_INT >= 19) {
            return Api19Impl.getStorageState(path);
        }
        try {
            String canonicalPath = path.getCanonicalPath();
            String canonicalExternal = Environment.getExternalStorageDirectory().getCanonicalPath();
            if (canonicalPath.startsWith(canonicalExternal)) {
                return Environment.getExternalStorageState();
            }
            return MEDIA_UNKNOWN;
        } catch (IOException e) {
            Log.w(TAG, "Failed to resolve canonical path: " + e);
            return MEDIA_UNKNOWN;
        }
    }

    private EnvironmentCompat() {
    }

    static class Api21Impl {
        private Api21Impl() {
        }

        static String getExternalStorageState(File path) {
            return Environment.getExternalStorageState(path);
        }
    }

    static class Api19Impl {
        private Api19Impl() {
        }

        static String getStorageState(File path) {
            return Environment.getStorageState(path);
        }
    }
}
