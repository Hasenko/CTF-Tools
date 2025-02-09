package gnu.kawa.functions;

import gnu.lists.FString;
import gnu.mapping.CharArrayInPort;
import gnu.mapping.InPort;
import gnu.mapping.Procedure1;
import gnu.text.LineBufferedReader;
import gnu.text.ReportFormat;
import java.io.IOException;
import java.text.ParseException;

/* loaded from: classes.dex */
public class ParseFormat extends Procedure1 {
    public static final int PARAM_FROM_LIST = -1610612736;
    public static final int PARAM_UNSPECIFIED = -1073741824;
    public static final int SEEN_HASH = 16;
    public static final int SEEN_MINUS = 1;
    public static final int SEEN_PLUS = 2;
    public static final int SEEN_SPACE = 4;
    public static final int SEEN_ZERO = 8;
    public static final ParseFormat parseFormat = new ParseFormat(false);
    boolean emacsStyle;

    public ParseFormat(boolean emacsStyle) {
        this.emacsStyle = true;
        this.emacsStyle = emacsStyle;
    }

    public ReportFormat parseFormat(LineBufferedReader fmt) throws ParseException, IOException {
        return parseFormat(fmt, this.emacsStyle ? '?' : '~');
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x017c, code lost:
    
        if (r4 != 83) goto L103;
     */
    /* JADX WARN: Code restructure failed: missing block: B:101:0x017f, code lost:
    
        r5 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:102:0x0180, code lost:
    
        r4 = new gnu.kawa.functions.ObjectFormat(r5, r15);
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x010c, code lost:
    
        throw new java.text.ParseException("unknown format character '" + r4 + "'", -1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x00d3, code lost:
    
        r11 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x00d4, code lost:
    
        r4 = r20.read();
        r12 = java.lang.Character.digit((char) r4, 10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:108:0x00dd, code lost:
    
        if (r12 >= 0) goto L60;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x00e1, code lost:
    
        r11 = (r11 * 10) + r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x00df, code lost:
    
        r15 = r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x00e5, code lost:
    
        r15 = -1073741824;
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x00c2, code lost:
    
        if (r4 != 42) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x00c4, code lost:
    
        r10 = -1610612736;
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x00c7, code lost:
    
        r10 = -1073741824;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00a4, code lost:
    
        r10 = java.lang.Character.digit(r10, 10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00af, code lost:
    
        if (r10 < 0) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00b2, code lost:
    
        r4 = r20.read();
        r14 = java.lang.Character.digit((char) r4, 10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00bb, code lost:
    
        if (r14 >= 0) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00be, code lost:
    
        r10 = (r10 * 10) + r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00cc, code lost:
    
        if (r4 != 46) goto L61;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00ce, code lost:
    
        if (r4 != 42) goto L56;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00d0, code lost:
    
        r15 = -1610612736;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00e7, code lost:
    
        r12 = ' ';
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00eb, code lost:
    
        switch(r4) {
            case 83: goto L100;
            case 88: goto L67;
            case 100: goto L67;
            case 101: goto L66;
            case 102: goto L66;
            case 103: goto L66;
            case 105: goto L67;
            case 111: goto L67;
            case 115: goto L100;
            case 120: goto L67;
            default: goto L123;
        };
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x010d, code lost:
    
        r4 = new gnu.kawa.functions.ObjectFormat(false);
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0184, code lost:
    
        if (r10 <= 0) goto L116;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0188, code lost:
    
        if ((r7 & 8) == 0) goto L109;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x018a, code lost:
    
        r12 = '0';
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x018e, code lost:
    
        if ((r7 & 1) == 0) goto L112;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0190, code lost:
    
        r6 = 100;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x0198, code lost:
    
        r4 = new gnu.text.PadFormat(r4, r10, r12, r6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x0193, code lost:
    
        if (r12 != '0') goto L115;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0195, code lost:
    
        r6 = -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x019e, code lost:
    
        r3.addElement(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x000f, code lost:
    
        continue;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x0117, code lost:
    
        if (r4 == 100) goto L79;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x011b, code lost:
    
        if (r4 != 105) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x0120, code lost:
    
        if (r4 != 111) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x0122, code lost:
    
        r4 = 0;
        r14 = 8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0139, code lost:
    
        if ((r7 & 9) != 8) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x013b, code lost:
    
        r16 = 48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x0142, code lost:
    
        if ((r7 & 16) == 0) goto L87;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x0144, code lost:
    
        r4 = r4 | 8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x0148, code lost:
    
        if ((r7 & 2) == 0) goto L90;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x014a, code lost:
    
        r4 = r4 | 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x014e, code lost:
    
        if ((r7 & 1) == 0) goto L93;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x0150, code lost:
    
        r4 = r4 | 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x0154, code lost:
    
        if ((r7 & 4) == 0) goto L96;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x0156, code lost:
    
        r19 = r4 | 4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x015d, code lost:
    
        if (r15 == (-1073741824)) goto L99;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x015f, code lost:
    
        r7 = r7 & (-9);
        r4 = gnu.kawa.functions.IntegerFormat.getInstance(r14, r15, 48, -1073741824, -1073741824, r19 | 64);
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x016e, code lost:
    
        r4 = gnu.kawa.functions.IntegerFormat.getInstance(r14, r10, r16, -1073741824, -1073741824, r19);
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x015b, code lost:
    
        r19 = r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x013e, code lost:
    
        r16 = 32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x0126, code lost:
    
        r14 = 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x012b, code lost:
    
        if (r4 != 88) goto L78;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x012d, code lost:
    
        r4 = 32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x0130, code lost:
    
        r4 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x0132, code lost:
    
        r4 = 0;
        r14 = 10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static gnu.text.ReportFormat parseFormat(gnu.text.LineBufferedReader r20, char r21) throws java.text.ParseException, java.io.IOException {
        /*
            Method dump skipped, instructions count: 484
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: gnu.kawa.functions.ParseFormat.parseFormat(gnu.text.LineBufferedReader, char):gnu.text.ReportFormat");
    }

    @Override // gnu.mapping.Procedure1, gnu.mapping.Procedure
    public Object apply1(Object arg) {
        return asFormat(arg, this.emacsStyle ? '?' : '~');
    }

    public static ReportFormat asFormat(Object arg, char style) {
        InPort iport;
        try {
            if (arg instanceof ReportFormat) {
                return (ReportFormat) arg;
            }
            if (style == '~') {
                return new LispFormat(arg.toString());
            }
            if (arg instanceof FString) {
                FString str = (FString) arg;
                iport = new CharArrayInPort(str.data, str.size);
            } else {
                iport = new CharArrayInPort(arg.toString());
            }
            try {
                return parseFormat(iport, style);
            } finally {
                iport.close();
            }
        } catch (IOException ex) {
            throw new RuntimeException("Error parsing format (" + ex + ")");
        } catch (IndexOutOfBoundsException e) {
            throw new RuntimeException("End while parsing format");
        } catch (ParseException ex2) {
            throw new RuntimeException("Invalid format (" + ex2 + ")");
        }
    }
}
