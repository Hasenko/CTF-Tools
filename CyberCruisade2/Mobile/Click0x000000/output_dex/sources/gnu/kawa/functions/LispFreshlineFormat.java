package gnu.kawa.functions;

import gnu.mapping.OutPort;
import gnu.text.ReportFormat;
import java.io.IOException;
import java.io.Writer;
import java.text.FieldPosition;

/* compiled from: LispFormat.java */
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class LispFreshlineFormat extends ReportFormat {
    int count;

    public LispFreshlineFormat(int count) {
        this.count = count;
    }

    @Override // gnu.text.ReportFormat
    public int format(Object[] args, int start, Writer dst, FieldPosition fpos) throws IOException {
        int count = getParam(this.count, 1, args, start);
        if (this.count == -1610612736) {
            start++;
        }
        if (count > 0) {
            if (dst instanceof OutPort) {
                ((OutPort) dst).freshLine();
                count--;
            }
            while (true) {
                count--;
                if (count < 0) {
                    break;
                }
                dst.write(10);
            }
        }
        return start;
    }
}
