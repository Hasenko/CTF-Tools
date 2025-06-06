package gnu.bytecode;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class Access {
    public static final short ABSTRACT = 1024;
    public static final short ANNOTATION = 8192;
    public static final short BRIDGE = 64;
    public static final char CLASS_CONTEXT = 'C';
    public static final short CLASS_MODIFIERS = 30257;
    public static final short ENUM = 16384;
    public static final char FIELD_CONTEXT = 'F';
    public static final short FIELD_MODIFIERS = 20703;
    public static final short FINAL = 16;
    public static final char INNERCLASS_CONTEXT = 'I';
    public static final short INNERCLASS_MODIFIERS = 30239;
    public static final short INTERFACE = 512;
    public static final char METHOD_CONTEXT = 'M';
    public static final short METHOD_MODIFIERS = 7679;
    public static final short NATIVE = 256;
    public static final short PRIVATE = 2;
    public static final short PROTECTED = 4;
    public static final short PUBLIC = 1;
    public static final short STATIC = 8;
    public static final short STRICT = 2048;
    public static final short SUPER = 32;
    public static final short SYNCHRONIZED = 32;
    public static final short SYNTHETIC = 4096;
    public static final short TRANSIENT = 128;
    public static final short VARARGS = 128;
    public static final short VOLATILE = 64;

    public static String toString(int flags) {
        return toString(flags, (char) 0);
    }

    public static String toString(int flags, char kind) {
        short mask;
        if (kind == 'C') {
            mask = CLASS_MODIFIERS;
        } else if (kind == 'I') {
            mask = INNERCLASS_MODIFIERS;
        } else if (kind == 'F') {
            mask = FIELD_MODIFIERS;
        } else {
            mask = kind == 'M' ? METHOD_MODIFIERS : Short.MAX_VALUE;
        }
        short bad_flags = (short) ((mask ^ (-1)) & flags);
        int flags2 = flags & mask;
        StringBuffer buf = new StringBuffer();
        if ((flags2 & 1) != 0) {
            buf.append(" public");
        }
        if ((flags2 & 2) != 0) {
            buf.append(" private");
        }
        if ((flags2 & 4) != 0) {
            buf.append(" protected");
        }
        if ((flags2 & 8) != 0) {
            buf.append(" static");
        }
        if ((flags2 & 16) != 0) {
            buf.append(" final");
        }
        if ((flags2 & 32) != 0) {
            buf.append(kind == 'C' ? " super" : " synchronized");
        }
        if ((flags2 & 64) != 0) {
            buf.append(kind == 'M' ? " bridge" : " volatile");
        }
        if ((flags2 & 128) != 0) {
            buf.append(kind == 'M' ? " varargs" : " transient");
        }
        if ((flags2 & 256) != 0) {
            buf.append(" native");
        }
        if ((flags2 & 512) != 0) {
            buf.append(" interface");
        }
        if ((flags2 & 1024) != 0) {
            buf.append(" abstract");
        }
        if ((flags2 & 2048) != 0) {
            buf.append(" strict");
        }
        if ((flags2 & 16384) != 0) {
            buf.append(" enum");
        }
        if ((flags2 & 4096) != 0) {
            buf.append(" synthetic");
        }
        if ((flags2 & 8192) != 0) {
            buf.append(" annotation");
        }
        if (bad_flags != 0) {
            buf.append(" unknown-flags:0x");
            buf.append(Integer.toHexString(bad_flags));
        }
        return buf.toString();
    }
}
