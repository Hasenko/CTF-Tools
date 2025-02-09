package gnu.kawa.functions;

import gnu.bytecode.ArrayType;
import gnu.bytecode.ClassType;
import gnu.bytecode.Type;
import gnu.expr.ApplyExp;
import gnu.expr.Declaration;
import gnu.expr.Expression;
import gnu.expr.InlineCalls;
import gnu.expr.QuoteExp;
import gnu.kawa.reflect.ArraySet;
import gnu.kawa.reflect.Invoke;

/* compiled from: CompilationHelpers.java */
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class SetArrayExp extends ApplyExp {
    public static final ClassType typeSetArray = ClassType.make("gnu.kawa.functions.SetArray");
    Type elementType;

    public SetArrayExp(Expression array, ArrayType arrayType) {
        super(Invoke.make, new QuoteExp(typeSetArray), array);
        this.elementType = arrayType.getComponentType();
    }

    @Override // gnu.expr.Expression
    public Expression validateApply(ApplyExp exp, InlineCalls visitor, Type required, Declaration decl) {
        exp.visitArgs(visitor);
        Expression[] args = exp.getArgs();
        if (args.length == 2) {
            Expression array = getArgs()[1];
            Expression[] xargs = {array, args[0], args[1]};
            ArraySet arrSetter = new ArraySet(this.elementType);
            return visitor.visitApplyOnly(new ApplyExp(arrSetter, xargs), required);
        }
        return exp;
    }
}
