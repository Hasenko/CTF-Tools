package gnu.expr;

import gnu.bytecode.CodeAttr;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ClassInitializer extends Initializer {
    ClassExp cexp;

    public ClassInitializer(ClassExp cexp, Compilation comp) {
        this.field = cexp.allocFieldFor(comp);
        cexp.compileMembers(comp);
        this.cexp = cexp;
        if (this.field.getStaticFlag()) {
            this.next = comp.clinitChain;
            comp.clinitChain = this;
        } else {
            LambdaExp heapLambda = cexp.getOwningLambda();
            this.next = heapLambda.initChain;
            heapLambda.initChain = this;
        }
    }

    @Override // gnu.expr.Initializer
    public void emit(Compilation comp) {
        CodeAttr code = comp.getCode();
        if (!this.field.getStaticFlag()) {
            code.emitPushThis();
        }
        this.cexp.compilePushClass(comp, Target.pushValue(Compilation.typeClassType));
        if (this.field.getStaticFlag()) {
            code.emitPutStatic(this.field);
        } else {
            code.emitPutField(this.field);
        }
    }
}
