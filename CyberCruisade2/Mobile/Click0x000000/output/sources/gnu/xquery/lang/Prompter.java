package gnu.xquery.lang;

import gnu.mapping.InPort;
import gnu.mapping.Procedure1;

/* compiled from: XQuery.java */
/* loaded from: classes2.dex */
class Prompter extends Procedure1 {
    Prompter() {
    }

    @Override // gnu.mapping.Procedure1, gnu.mapping.Procedure
    public Object apply1(Object arg) {
        InPort port = (InPort) arg;
        int line = port.getLineNumber() + 1;
        char state = port.readState;
        if (state == '\n') {
            state = ' ';
        }
        if (state == '<') {
            return "<!--" + line + "-->";
        }
        if (state == ':') {
            return "-(:" + line + "c:) ";
        }
        return "(: " + line + state + ":) ";
    }
}
