package gnu.kawa.functions;

import gnu.mapping.OutPort;
import gnu.text.ReportFormat;
import java.io.IOException;
import java.io.Writer;
import java.text.FieldPosition;

/* compiled from: LispFormat.java */
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class LispIndentFormat extends ReportFormat {
    int columns;
    boolean current;

    LispIndentFormat() {
    }

    public static LispIndentFormat getInstance(int columns, boolean current) {
        LispIndentFormat fmt = new LispIndentFormat();
        fmt.columns = columns;
        fmt.current = current;
        return fmt;
    }

    @Override // gnu.text.ReportFormat
    public int format(Object[] args, int start, Writer dst, FieldPosition fpos) throws IOException {
        int columns = getParam(this.columns, 0, args, start);
        if (this.columns == -1610612736) {
            start++;
        }
        if (dst instanceof OutPort) {
            ((OutPort) dst).setIndentation(columns, this.current);
        }
        return start;
    }
}
