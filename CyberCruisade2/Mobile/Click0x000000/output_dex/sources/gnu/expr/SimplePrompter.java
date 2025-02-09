package gnu.expr;

import gnu.mapping.InPort;
import gnu.mapping.Procedure1;

/* compiled from: Language.java */
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class SimplePrompter extends Procedure1 {
    public String prefix = "[";
    public String suffix = "] ";

    SimplePrompter() {
    }

    @Override // gnu.mapping.Procedure1, gnu.mapping.Procedure
    public Object apply1(Object arg) {
        if (arg instanceof InPort) {
            InPort port = (InPort) arg;
            int line = port.getLineNumber() + 1;
            if (line >= 0) {
                return this.prefix + line + this.suffix;
            }
        }
        return this.suffix;
    }
}
