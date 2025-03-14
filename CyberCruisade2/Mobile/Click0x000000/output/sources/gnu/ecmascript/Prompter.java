package gnu.ecmascript;

import gnu.mapping.InPort;
import gnu.mapping.Procedure1;

/* loaded from: classes2.dex */
class Prompter extends Procedure1 {
    Prompter() {
    }

    String prompt(InPort port) {
        return "(EcmaScript:" + (port.getLineNumber() + 1) + ") ";
    }

    @Override // gnu.mapping.Procedure1, gnu.mapping.Procedure
    public Object apply1(Object arg) {
        return prompt((InPort) arg);
    }
}
