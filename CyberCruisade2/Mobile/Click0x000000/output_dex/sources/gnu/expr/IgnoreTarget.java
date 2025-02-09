package gnu.expr;

import gnu.bytecode.Type;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class IgnoreTarget extends Target {
    @Override // gnu.expr.Target
    public Type getType() {
        return Type.voidType;
    }

    @Override // gnu.expr.Target
    public void compileFromStack(Compilation comp, Type stackType) {
        if (!stackType.isVoid()) {
            comp.getCode().emitPop(1);
        }
    }
}
