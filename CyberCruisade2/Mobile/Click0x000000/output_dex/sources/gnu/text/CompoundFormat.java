package gnu.text;

import java.io.IOException;
import java.io.Writer;
import java.text.FieldPosition;
import java.text.Format;
import java.text.ParsePosition;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class CompoundFormat extends ReportFormat {
    protected Format[] formats;
    protected int length;

    public CompoundFormat(Format[] formats, int length) {
        this.formats = formats;
        this.length = length;
    }

    public CompoundFormat(Format[] formats) {
        this.formats = formats;
        this.length = formats.length;
    }

    @Override // gnu.text.ReportFormat
    public int format(Object[] args, int start, Writer dst, FieldPosition fpos) throws IOException {
        for (int i = 0; i < this.length; i++) {
            Format fmt = this.formats[i];
            if (fmt instanceof ReportFormat) {
                start = ((ReportFormat) fmt).format(args, start, dst, fpos);
                if (start < 0) {
                    return start;
                }
            } else if (start >= args.length) {
                dst.write("#<missing format argument>");
            } else {
                StringBuffer sbuf = new StringBuffer();
                fmt.format(args[start], sbuf, fpos);
                dst.write(sbuf.toString());
                start++;
            }
        }
        return start;
    }

    @Override // gnu.text.ReportFormat
    public final int format(Object[] args, int start, StringBuffer sbuf, FieldPosition fpos) {
        for (int i = 0; i < this.length; i++) {
            Format fmt = this.formats[i];
            if (fmt instanceof ReportFormat) {
                start = ((ReportFormat) fmt).format(args, start, sbuf, fpos);
                if (start < 0) {
                    return start;
                }
            } else {
                fmt.format(args[start], sbuf, fpos);
                start++;
            }
        }
        return start;
    }

    @Override // gnu.text.ReportFormat, java.text.Format
    public Object parseObject(String text, ParsePosition status) {
        throw new Error("CompoundFormat.parseObject - not implemented");
    }

    public String toString() {
        StringBuffer sbuf = new StringBuffer();
        sbuf.append("CompoundFormat[");
        for (int i = 0; i < this.length; i++) {
            if (i > 0) {
                sbuf.append(", ");
            }
            sbuf.append(this.formats[i]);
        }
        sbuf.append("]");
        return sbuf.toString();
    }
}
