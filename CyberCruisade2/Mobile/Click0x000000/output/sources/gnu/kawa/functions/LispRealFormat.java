package gnu.kawa.functions;

import gnu.math.ExponentialFormat;
import gnu.math.FixedRealFormat;
import gnu.math.RealNum;
import gnu.text.ReportFormat;
import java.io.IOException;
import java.io.Writer;
import java.text.FieldPosition;

/* compiled from: LispFormat.java */
/* loaded from: classes.dex */
class LispRealFormat extends ReportFormat {
    int arg1;
    int arg2;
    int arg3;
    int arg4;
    int arg5;
    int arg6;
    int arg7;
    int argsUsed;
    boolean internalPad;
    char op;
    boolean showPlus;

    LispRealFormat() {
        int i = this.arg1;
        int i2 = (i == -1342177280 || this.arg2 == -1342177280 || this.arg3 == -1342177280 || this.arg4 == -1342177280 || this.arg5 == -1342177280 || this.arg6 == -1342177280 || this.arg7 == -1342177280) ? 1 : 0;
        this.argsUsed = i2;
        if (i == -1610612736) {
            this.argsUsed = i2 + 2;
        }
        if (this.arg2 == -1610612736) {
            this.argsUsed += 2;
        }
        if (this.arg3 == -1610612736) {
            this.argsUsed += 2;
        }
        if (this.arg4 == -1610612736) {
            this.argsUsed += 2;
        }
        if (this.arg5 == -1610612736) {
            this.argsUsed += 2;
        }
        if (this.arg6 == -1610612736) {
            this.argsUsed += 2;
        }
        if (this.arg7 == -1610612736) {
            this.argsUsed += 2;
        }
    }

    public java.text.Format resolve(Object[] args, int start) {
        char c = this.op;
        if (c == '$') {
            FixedRealFormat mfmt = new FixedRealFormat();
            int decimals = getParam(this.arg1, 2, args, start);
            if (this.arg1 == -1610612736) {
                start++;
            }
            int digits = getParam(this.arg2, 1, args, start);
            if (this.arg2 == -1610612736) {
                start++;
            }
            int width = getParam(this.arg3, 0, args, start);
            if (this.arg3 == -1610612736) {
                start++;
            }
            char padChar = getParam(this.arg4, ' ', args, start);
            if (this.arg4 == -1610612736) {
                int i = start + 1;
            }
            mfmt.setMaximumFractionDigits(decimals);
            mfmt.setMinimumIntegerDigits(digits);
            mfmt.width = width;
            mfmt.padChar = padChar;
            mfmt.internalPad = this.internalPad;
            mfmt.showPlus = this.showPlus;
            return mfmt;
        }
        if (c == 'F') {
            FixedRealFormat mfmt2 = new FixedRealFormat();
            int width2 = getParam(this.arg1, 0, args, start);
            if (this.arg1 == -1610612736) {
                start++;
            }
            int decimals2 = getParam(this.arg2, -1, args, start);
            if (this.arg2 == -1610612736) {
                start++;
            }
            int scale = getParam(this.arg3, 0, args, start);
            if (this.arg3 == -1610612736) {
                start++;
            }
            mfmt2.overflowChar = getParam(this.arg4, (char) 0, args, start);
            if (this.arg4 == -1610612736) {
                start++;
            }
            char padChar2 = getParam(this.arg5, ' ', args, start);
            if (this.arg5 == -1610612736) {
                int i2 = start + 1;
            }
            mfmt2.setMaximumFractionDigits(decimals2);
            mfmt2.setMinimumIntegerDigits(0);
            mfmt2.width = width2;
            mfmt2.scale = scale;
            mfmt2.padChar = padChar2;
            mfmt2.internalPad = this.internalPad;
            mfmt2.showPlus = this.showPlus;
            return mfmt2;
        }
        ExponentialFormat efmt = new ExponentialFormat();
        efmt.exponentShowSign = true;
        efmt.width = getParam(this.arg1, 0, args, start);
        if (this.arg1 == -1610612736) {
            start++;
        }
        efmt.fracDigits = getParam(this.arg2, -1, args, start);
        if (this.arg2 == -1610612736) {
            start++;
        }
        efmt.expDigits = getParam(this.arg3, 0, args, start);
        if (this.arg3 == -1610612736) {
            start++;
        }
        efmt.intDigits = getParam(this.arg4, 1, args, start);
        if (this.arg4 == -1610612736) {
            start++;
        }
        efmt.overflowChar = getParam(this.arg5, (char) 0, args, start);
        if (this.arg5 == -1610612736) {
            start++;
        }
        efmt.padChar = getParam(this.arg6, ' ', args, start);
        if (this.arg6 == -1610612736) {
            start++;
        }
        efmt.exponentChar = getParam(this.arg7, 'E', args, start);
        if (this.arg7 == -1610612736) {
            int i3 = start + 1;
        }
        efmt.general = this.op == 'G';
        efmt.showPlus = this.showPlus;
        return efmt;
    }

    @Override // gnu.text.ReportFormat
    public int format(Object[] args, int start, Writer dst, FieldPosition fpos) throws IOException {
        StringBuffer sbuf = new StringBuffer(100);
        java.text.Format fmt = resolve(args, start);
        int start2 = start + (this.argsUsed >> 1);
        int start3 = start2 + 1;
        RealNum value = (RealNum) args[start2];
        fmt.format(value, sbuf, fpos);
        dst.write(sbuf.toString());
        return start3;
    }
}
