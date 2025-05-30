package com.google.appinventor.components.runtime.multidex;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.GregorianCalendar;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;

/* loaded from: classes.dex */
class ZipEntryReader {
    private static final long CENSIG = 33639248;
    private static final int GPBF_ENCRYPTED_FLAG = 1;
    private static final int GPBF_UNSUPPORTED_MASK = 1;
    static final Charset UTF_8 = Charset.forName("UTF-8");

    ZipEntryReader() {
    }

    static ZipEntry readEntry(ByteBuffer in) throws IOException {
        int i;
        int sig = in.getInt();
        if (sig != CENSIG) {
            throw new ZipException("Central Directory Entry not found");
        }
        int gpbf = in.getShort() & 65535;
        if ((gpbf & 1) != 0) {
            throw new ZipException("Invalid General Purpose Bit Flag: " + gpbf);
        }
        int compressionMethod = in.getShort() & 65535;
        int time = in.getShort() & 65535;
        int modDate = in.getShort() & 65535;
        long crc = in.getInt() & 4294967295L;
        long compressedSize = in.getInt() & 4294967295L;
        long size = in.getInt() & 4294967295L;
        int nameLength = in.getShort() & 65535;
        int extraLength = in.getShort() & 65535;
        int commentByteCount = 65535 & in.getShort();
        long j = in.getInt() & 4294967295L;
        byte[] nameBytes = new byte[nameLength];
        in.get(nameBytes, 0, nameBytes.length);
        int nameLength2 = nameBytes.length;
        Charset charset = UTF_8;
        String name = new String(nameBytes, 0, nameLength2, charset);
        ZipEntry entry = new ZipEntry(name);
        entry.setMethod(compressionMethod);
        entry.setTime(getTime(time, modDate));
        entry.setCrc(crc);
        entry.setCompressedSize(compressedSize);
        entry.setSize(size);
        if (commentByteCount > 0) {
            byte[] commentBytes = new byte[commentByteCount];
            i = 0;
            in.get(commentBytes, 0, commentByteCount);
            int compressionMethod2 = commentBytes.length;
            entry.setComment(new String(commentBytes, 0, compressionMethod2, charset));
        } else {
            i = 0;
        }
        if (extraLength > 0) {
            byte[] extra = new byte[extraLength];
            in.get(extra, i, extraLength);
            entry.setExtra(extra);
        }
        return entry;
    }

    private static long getTime(int time, int modDate) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.set(14, 0);
        cal.set(((modDate >> 9) & 127) + 1980, ((modDate >> 5) & 15) - 1, modDate & 31, (time >> 11) & 31, (time >> 5) & 63, (time & 31) << 1);
        return cal.getTime().getTime();
    }
}
