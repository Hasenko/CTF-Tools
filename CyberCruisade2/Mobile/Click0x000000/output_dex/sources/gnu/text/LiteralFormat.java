package gnu.text;

import java.io.IOException;
import java.io.Writer;
import java.text.FieldPosition;
import java.text.ParsePosition;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class LiteralFormat extends ReportFormat {
    char[] text;

    public LiteralFormat(char[] text) {
        this.text = text;
    }

    public LiteralFormat(String text) {
        this.text = text.toCharArray();
    }

    public LiteralFormat(StringBuffer sbuf) {
        int len = sbuf.length();
        char[] cArr = new char[len];
        this.text = cArr;
        sbuf.getChars(0, len, cArr, 0);
    }

    @Override // gnu.text.ReportFormat
    public int format(Object[] args, int start, Writer dst, FieldPosition fpos) throws IOException {
        dst.write(this.text);
        return start;
    }

    @Override // gnu.text.ReportFormat, java.text.Format
    public Object parseObject(String text, ParsePosition status) {
        throw new Error("LiteralFormat.parseObject - not implemented");
    }

    public String content() {
        return new String(this.text);
    }

    public String toString() {
        StringBuffer sbuf = new StringBuffer("LiteralFormat[\"");
        sbuf.append(this.text);
        sbuf.append("\"]");
        return sbuf.toString();
    }
}
