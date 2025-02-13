package gnu.text;

import gnu.lists.Consumer;
import java.io.CharArrayWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.text.FieldPosition;
import java.text.Format;
import java.text.MessageFormat;
import java.text.ParsePosition;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public abstract class ReportFormat extends Format {
    public static final int PARAM_FROM_COUNT = -1342177280;
    public static final int PARAM_FROM_LIST = -1610612736;
    public static final int PARAM_UNSPECIFIED = -1073741824;

    public abstract int format(Object[] objArr, int i, Writer writer, FieldPosition fieldPosition) throws IOException;

    public static int result(int resultCode, int nextArg) {
        return (resultCode << 24) | nextArg;
    }

    public static int nextArg(int result) {
        return 16777215 & result;
    }

    public static int resultCode(int result) {
        return result >>> 24;
    }

    public int format(Object arg, int start, Writer dst, FieldPosition fpos) throws IOException {
        if (arg instanceof Object[]) {
            return format((Object[]) arg, start, dst, fpos);
        }
        Object[] args = {arg};
        return format(args, start, dst, fpos);
    }

    @Override // java.text.Format
    public StringBuffer format(Object obj, StringBuffer sbuf, FieldPosition fpos) {
        format((Object[]) obj, 0, sbuf, fpos);
        return sbuf;
    }

    public int format(Object[] args, int start, StringBuffer sbuf, FieldPosition fpos) {
        CharArrayWriter wr = new CharArrayWriter();
        try {
            int start2 = format(args, start, (Writer) wr, fpos);
            if (start2 < 0) {
                return start2;
            }
            sbuf.append(wr.toCharArray());
            return start2;
        } catch (IOException ex) {
            throw new Error("unexpected exception: " + ex);
        }
    }

    public static int format(Format fmt, Object[] args, int start, Writer dst, FieldPosition fpos) throws IOException {
        int start2;
        if (fmt instanceof ReportFormat) {
            return ((ReportFormat) fmt).format(args, start, dst, fpos);
        }
        StringBuffer sbuf = new StringBuffer();
        if (fmt instanceof MessageFormat) {
            start2 = format(fmt, args, start, sbuf, fpos);
        } else {
            fmt.format(args[start], sbuf, fpos);
            start2 = start + 1;
        }
        int slen = sbuf.length();
        char[] cbuf = new char[slen];
        sbuf.getChars(0, slen, cbuf, 0);
        dst.write(cbuf);
        return start2;
    }

    public static int format(Format format, Object[] objArr, int i, StringBuffer stringBuffer, FieldPosition fieldPosition) {
        int i2;
        Object obj;
        if (format instanceof ReportFormat) {
            return ((ReportFormat) format).format(objArr, i, stringBuffer, fieldPosition);
        }
        if (format instanceof MessageFormat) {
            i2 = objArr.length - i;
            if (i > 0) {
                Object[] objArr2 = new Object[objArr.length - i];
                System.arraycopy(objArr, i, objArr2, 0, objArr2.length);
                obj = objArr2;
            } else {
                obj = objArr;
            }
        } else {
            i2 = 1;
            obj = objArr[i];
        }
        format.format(obj, stringBuffer, fieldPosition);
        return i + i2;
    }

    public static void print(Writer dst, String str) throws IOException {
        if (dst instanceof PrintWriter) {
            ((PrintWriter) dst).print(str);
        } else {
            dst.write(str.toCharArray());
        }
    }

    public static void print(Object value, Consumer out) {
        if (value instanceof Printable) {
            ((Printable) value).print(out);
        } else {
            out.write(value == null ? "null" : value.toString());
        }
    }

    @Override // java.text.Format
    public Object parseObject(String text, ParsePosition status) {
        throw new Error("ReportFormat.parseObject - not implemented");
    }

    public static int getParam(Object arg, int defaultValue) {
        if (arg instanceof Number) {
            return ((Number) arg).intValue();
        }
        if (arg instanceof Character) {
            return ((Character) arg).charValue();
        }
        if (arg instanceof Char) {
            return ((Char) arg).charValue();
        }
        return defaultValue;
    }

    protected static int getParam(int param, int defaultValue, Object[] args, int start) {
        if (param == -1342177280) {
            return args.length - start;
        }
        if (param == -1610612736) {
            return args == null ? defaultValue : getParam(args[start], defaultValue);
        }
        if (param == -1073741824) {
            return defaultValue;
        }
        return param;
    }

    protected static char getParam(int param, char defaultValue, Object[] args, int start) {
        return (char) getParam(param, (int) defaultValue, args, start);
    }
}
