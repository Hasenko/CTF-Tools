package gnu.expr;

import gnu.bytecode.ObjectType;
import gnu.bytecode.Type;
import gnu.kawa.util.IdentityHashTable;
import gnu.lists.AbstractFormat;
import gnu.mapping.CallContext;
import gnu.mapping.MethodProc;
import gnu.mapping.OutPort;
import gnu.mapping.Procedure;
import gnu.mapping.Values;
import gnu.mapping.WrongArguments;
import gnu.text.SourceLocator;

/* loaded from: classes.dex */
public class QuoteExp extends Expression {
    public static final int EXPLICITLY_TYPED = 2;
    public static final int SHARED_CONSTANT = 4;
    protected Type type;
    Object value;
    public static QuoteExp undefined_exp = makeShared(Special.undefined);
    public static QuoteExp abstractExp = makeShared(Special.abstractSpecial);
    public static QuoteExp voidExp = makeShared(Values.empty, Type.voidType);
    public static QuoteExp trueExp = makeShared(Boolean.TRUE);
    public static QuoteExp falseExp = makeShared(Boolean.FALSE);
    public static QuoteExp nullExp = makeShared(null, Type.nullType);
    public static final QuoteExp classObjectExp = makeShared(Type.objectType);

    public final Object getValue() {
        return this.value;
    }

    @Override // gnu.expr.Expression
    public final Object valueIfConstant() {
        return this.value;
    }

    public final Type getRawType() {
        return this.type;
    }

    @Override // gnu.expr.Expression
    public final Type getType() {
        Type type = this.type;
        if (type != null) {
            return type;
        }
        if (this.value == Values.empty) {
            return Type.voidType;
        }
        Object obj = this.value;
        if (obj == null) {
            return Type.nullType;
        }
        if (this == undefined_exp) {
            return Type.pointer_type;
        }
        return Type.make(obj.getClass());
    }

    public void setType(Type type) {
        this.type = type;
        setFlag(2);
    }

    public boolean isExplicitlyTyped() {
        return getFlag(2);
    }

    public boolean isSharedConstant() {
        return getFlag(4);
    }

    public static QuoteExp getInstance(Object value) {
        return getInstance(value, null);
    }

    public static QuoteExp getInstance(Object value, SourceLocator position) {
        if (value == null) {
            return nullExp;
        }
        if (value == Type.pointer_type) {
            return classObjectExp;
        }
        if (value == Special.undefined) {
            return undefined_exp;
        }
        if (value == Values.empty) {
            return voidExp;
        }
        if (value instanceof Boolean) {
            return ((Boolean) value).booleanValue() ? trueExp : falseExp;
        }
        QuoteExp q = new QuoteExp(value);
        if (position != null) {
            q.setLocation(position);
        }
        return q;
    }

    static QuoteExp makeShared(Object value) {
        QuoteExp exp = new QuoteExp(value);
        exp.setFlag(4);
        return exp;
    }

    static QuoteExp makeShared(Object value, Type type) {
        QuoteExp exp = new QuoteExp(value, type);
        exp.setFlag(4);
        return exp;
    }

    public QuoteExp(Object val) {
        this.value = val;
    }

    public QuoteExp(Object val, Type type) {
        this.value = val;
        setType(type);
    }

    @Override // gnu.expr.Expression
    protected boolean mustCompile() {
        return false;
    }

    @Override // gnu.expr.Expression, gnu.mapping.Procedure
    public void apply(CallContext ctx) {
        ctx.writeValue(this.value);
    }

    @Override // gnu.expr.Expression
    public void compile(Compilation comp, Target target) {
        Type type = this.type;
        if (type != null && type != Type.pointer_type && !(target instanceof IgnoreTarget)) {
            Type type2 = this.type;
            if (!(type2 instanceof ObjectType) || !type2.isInstance(this.value)) {
                comp.compileConstant(this.value, StackTarget.getInstance(this.type));
                target.compileFromStack(comp, this.type);
                return;
            }
        }
        comp.compileConstant(this.value, target);
    }

    @Override // gnu.expr.Expression
    public Expression deepCopy(IdentityHashTable mapper) {
        return this;
    }

    @Override // gnu.expr.Expression
    protected <R, D> R visit(ExpVisitor<R, D> visitor, D d) {
        return visitor.visitQuoteExp(this, d);
    }

    @Override // gnu.expr.Expression
    public Expression validateApply(ApplyExp exp, InlineCalls visitor, Type required, Declaration decl) {
        ApplyExp nexp;
        Expression e;
        if (this == undefined_exp) {
            return exp;
        }
        Object fval = getValue();
        if (!(fval instanceof Procedure)) {
            return visitor.noteError((decl == null || fval == null) ? "called value is not a procedure" : "calling " + decl.getName() + " which is a " + fval.getClass().getName());
        }
        Procedure proc = (Procedure) fval;
        int nargs = exp.getArgCount();
        String msg = WrongArguments.checkArgCount(proc, nargs);
        if (msg != null) {
            return visitor.noteError(msg);
        }
        Expression inlined = visitor.maybeInline(exp, required, proc);
        if (inlined != null) {
            return inlined;
        }
        Expression[] args = exp.args;
        MethodProc asMProc = proc instanceof MethodProc ? (MethodProc) proc : null;
        for (int i = 0; i < nargs; i++) {
            Type ptype = asMProc != null ? asMProc.getParameterType(i) : null;
            if (i == nargs - 1 && ptype != null && asMProc.maxArgs() < 0 && i == asMProc.minArgs()) {
                ptype = null;
            }
            args[i] = visitor.visit(args[i], ptype);
        }
        if (exp.getFlag(4) && (e = exp.inlineIfConstant(proc, visitor)) != exp) {
            return visitor.visit(e, required);
        }
        Compilation comp = visitor.getCompilation();
        if (comp.inlineOk(proc)) {
            if (ApplyExp.asInlineable(proc) != null) {
                return exp.getFunction() == this ? exp : new ApplyExp((Expression) this, exp.getArgs()).setLine(exp);
            }
            PrimProcedure mproc = PrimProcedure.getMethodFor(proc, decl, exp.args, comp.getLanguage());
            if (mproc != null) {
                if (mproc.getStaticFlag() || decl == null) {
                    nexp = new ApplyExp(mproc, exp.args);
                } else {
                    if (decl.base == null) {
                        return exp;
                    }
                    Expression[] margs = new Expression[nargs + 1];
                    System.arraycopy(exp.getArgs(), 0, margs, 1, nargs);
                    margs[0] = new ReferenceExp(decl.base);
                    nexp = new ApplyExp(mproc, margs);
                }
                return nexp.setLine(exp);
            }
        }
        return exp;
    }

    @Override // gnu.expr.Expression
    public boolean side_effects() {
        return false;
    }

    @Override // gnu.expr.Expression, gnu.mapping.Procedure
    public String toString() {
        return "QuoteExp[" + this.value + "]";
    }

    @Override // gnu.expr.Expression
    public void print(OutPort out) {
        out.startLogicalBlock("(Quote", ")", 2);
        out.writeSpaceLinear();
        Object val = this.value;
        if (val instanceof Expression) {
            val = val.toString();
        }
        AbstractFormat saveFormat = out.objectFormat;
        try {
            out.objectFormat = Language.getDefaultLanguage().getFormat(true);
            out.print(val);
            if (this.type != null) {
                out.print(" ::");
                out.print(this.type.getName());
            }
            out.objectFormat = saveFormat;
            out.endLogicalBlock(")");
        } catch (Throwable th) {
            out.objectFormat = saveFormat;
            throw th;
        }
    }
}
