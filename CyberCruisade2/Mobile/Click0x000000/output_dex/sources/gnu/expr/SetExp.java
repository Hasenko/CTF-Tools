package gnu.expr;

import gnu.bytecode.ClassType;
import gnu.bytecode.CodeAttr;
import gnu.bytecode.Field;
import gnu.bytecode.Method;
import gnu.bytecode.Type;
import gnu.bytecode.Variable;
import gnu.kawa.functions.AddOp;
import gnu.mapping.CallContext;
import gnu.mapping.Environment;
import gnu.mapping.EnvironmentKey;
import gnu.mapping.Location;
import gnu.mapping.OutPort;
import gnu.mapping.Symbol;
import gnu.mapping.Values;
import gnu.math.IntNum;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class SetExp extends AccessExp {
    public static final int BAD_SHORT = 65536;
    public static final int DEFINING_FLAG = 2;
    public static final int GLOBAL_FLAG = 4;
    public static final int HAS_VALUE = 64;
    public static final int PREFER_BINDING2 = 8;
    public static final int PROCEDURE = 16;
    public static final int SET_IF_UNBOUND = 32;
    Expression new_value;

    public SetExp(Object symbol, Expression val) {
        this.symbol = symbol;
        this.new_value = val;
    }

    public SetExp(Declaration decl, Expression val) {
        this.binding = decl;
        this.symbol = decl.getSymbol();
        this.new_value = val;
    }

    public static SetExp makeDefinition(Object symbol, Expression val) {
        SetExp sexp = new SetExp(symbol, val);
        sexp.setDefining(true);
        return sexp;
    }

    public static SetExp makeDefinition(Declaration decl, Expression val) {
        SetExp sexp = new SetExp(decl, val);
        sexp.setDefining(true);
        return sexp;
    }

    public final Expression getNewValue() {
        return this.new_value;
    }

    public final boolean isDefining() {
        return (this.flags & 2) != 0;
    }

    public final void setDefining(boolean value) {
        int i = this.flags;
        this.flags = value ? i | 2 : i & (-3);
    }

    public final boolean getHasValue() {
        return (this.flags & 64) != 0;
    }

    public final void setHasValue(boolean value) {
        int i = this.flags;
        this.flags = value ? i | 64 : i & (-65);
    }

    public final boolean isFuncDef() {
        return (this.flags & 16) != 0;
    }

    public final void setFuncDef(boolean value) {
        int i = this.flags;
        this.flags = value ? i | 16 : i & (-17);
    }

    public final boolean isSetIfUnbound() {
        return (this.flags & 32) != 0;
    }

    public final void setSetIfUnbound(boolean value) {
        int i = this.flags;
        this.flags = value ? i | 32 : i & (-33);
    }

    @Override // gnu.expr.Expression
    protected boolean mustCompile() {
        return false;
    }

    @Override // gnu.expr.Expression, gnu.mapping.Procedure
    public void apply(CallContext ctx) throws Throwable {
        Environment env = Environment.getCurrent();
        Symbol sym = this.symbol instanceof Symbol ? (Symbol) this.symbol : env.getSymbol(this.symbol.toString());
        Object property = null;
        Language language = Language.getDefaultLanguage();
        if (isFuncDef() && language.hasSeparateFunctionNamespace()) {
            property = EnvironmentKey.FUNCTION;
        }
        if (isSetIfUnbound()) {
            Location loc = env.getLocation(sym, property);
            if (!loc.isBound()) {
                loc.set(this.new_value.eval(env));
            }
            if (getHasValue()) {
                ctx.writeValue(loc);
                return;
            }
            return;
        }
        Object new_val = this.new_value.eval(env);
        if (this.binding != null && !(this.binding.context instanceof ModuleExp)) {
            Object[] evalFrame = ctx.evalFrames[ScopeExp.nesting(this.binding.context)];
            if (this.binding.isIndirectBinding()) {
                if (isDefining()) {
                    evalFrame[this.binding.evalIndex] = Location.make(sym);
                }
                ((Location) evalFrame[this.binding.evalIndex]).set(this.new_value);
            } else {
                evalFrame[this.binding.evalIndex] = new_val;
            }
        } else if (isDefining()) {
            env.define(sym, property, new_val);
        } else {
            env.put(sym, property, new_val);
        }
        if (getHasValue()) {
            ctx.writeValue(new_val);
        }
    }

    @Override // gnu.expr.Expression
    public void compile(Compilation comp, Target target) {
        ReferenceExp rexp;
        Declaration orig;
        Expression expression;
        Expression expression2 = this.new_value;
        if ((expression2 instanceof LambdaExp) && (target instanceof IgnoreTarget) && ((LambdaExp) expression2).getInlineOnly()) {
            return;
        }
        CodeAttr code = comp.getCode();
        boolean needValue = getHasValue() && !(target instanceof IgnoreTarget);
        boolean valuePushed = false;
        Declaration decl = this.binding;
        Expression declValue = decl.getValue();
        if ((declValue instanceof LambdaExp) && (decl.context instanceof ModuleExp) && !decl.ignorable() && ((LambdaExp) declValue).getName() != null && declValue == (expression = this.new_value)) {
            ((LambdaExp) expression).compileSetField(comp);
        } else if ((decl.shouldEarlyInit() || decl.isAlias()) && (decl.context instanceof ModuleExp) && isDefining() && !decl.ignorable()) {
            if (decl.shouldEarlyInit()) {
                BindingInitializer.create(decl, this.new_value, comp);
            }
            if (needValue) {
                decl.load(this, 0, comp, Target.pushObject);
                valuePushed = true;
            }
        } else {
            AccessExp access = this;
            Declaration owner = contextDecl();
            if (!isDefining()) {
                while (decl != null && decl.isAlias()) {
                    Expression declValue2 = decl.getValue();
                    if (!(declValue2 instanceof ReferenceExp) || (orig = (rexp = (ReferenceExp) declValue2).binding) == null || (owner != null && orig.needsContext())) {
                        break;
                    }
                    owner = rexp.contextDecl();
                    access = rexp;
                    decl = orig;
                }
            }
            if (decl.ignorable()) {
                this.new_value.compile(comp, Target.Ignore);
            } else if (decl.isAlias() && isDefining()) {
                decl.load(this, 2, comp, Target.pushObject);
                ClassType locType = ClassType.make("gnu.mapping.IndirectableLocation");
                code.emitCheckcast(locType);
                this.new_value.compile(comp, Target.pushObject);
                Method meth = locType.getDeclaredMethod("setAlias", 1);
                code.emitInvokeVirtual(meth);
            } else if (decl.isIndirectBinding()) {
                decl.load(access, 2, comp, Target.pushObject);
                if (isSetIfUnbound()) {
                    if (needValue) {
                        code.emitDup();
                        valuePushed = true;
                    }
                    code.pushScope();
                    code.emitDup();
                    Variable symLoc = code.addLocal(Compilation.typeLocation);
                    code.emitStore(symLoc);
                    code.emitInvokeVirtual(Compilation.typeLocation.getDeclaredMethod("isBound", 0));
                    code.emitIfIntEqZero();
                    code.emitLoad(symLoc);
                }
                this.new_value.compile(comp, Target.pushObject);
                if (needValue && !isSetIfUnbound()) {
                    code.emitDupX();
                    valuePushed = true;
                }
                code.emitInvokeVirtual(Compilation.typeLocation.getDeclaredMethod("set", 1));
                if (isSetIfUnbound()) {
                    code.emitFi();
                    code.popScope();
                }
            } else if (decl.isSimple()) {
                Type type = decl.getType();
                Variable var = decl.getVariable();
                if (var == null) {
                    var = decl.allocateVariable(code);
                }
                int delta = canUseInc(this.new_value, decl);
                if (delta != 65536) {
                    comp.getCode().emitInc(var, (short) delta);
                    if (needValue) {
                        code.emitLoad(var);
                        valuePushed = true;
                    }
                } else {
                    this.new_value.compile(comp, decl);
                    if (needValue) {
                        code.emitDup(type);
                        valuePushed = true;
                    }
                    code.emitStore(var);
                }
            } else if ((decl.context instanceof ClassExp) && decl.field == null && !getFlag(16) && ((ClassExp) decl.context).isMakingClassPair()) {
                String setName = ClassExp.slotToMethodName("set", decl.getName());
                ClassExp cl = (ClassExp) decl.context;
                Method setter = cl.type.getDeclaredMethod(setName, 1);
                cl.loadHeapFrame(comp);
                this.new_value.compile(comp, decl);
                if (needValue) {
                    code.emitDupX();
                    valuePushed = true;
                }
                code.emitInvoke(setter);
            } else {
                Field field = decl.field;
                if (!field.getStaticFlag()) {
                    decl.loadOwningObject(owner, comp);
                }
                Type type2 = field.getType();
                this.new_value.compile(comp, decl);
                comp.usedClass(field.getDeclaringClass());
                if (field.getStaticFlag()) {
                    if (needValue) {
                        code.emitDup(type2);
                        valuePushed = true;
                    }
                    code.emitPutStatic(field);
                } else {
                    if (needValue) {
                        code.emitDupX();
                        valuePushed = true;
                    }
                    code.emitPutField(field);
                }
            }
        }
        if (needValue && !valuePushed) {
            throw new Error("SetExp.compile: not implemented - return value");
        }
        if (needValue) {
            target.compileFromStack(comp, getType());
        } else {
            comp.compileConstant(Values.empty, target);
        }
    }

    public static int canUseInc(Expression rhs, Declaration target) {
        int sign;
        Variable var = target.getVariable();
        if (!target.isSimple() || var.getType().getImplementationType().promote() != Type.intType || !(rhs instanceof ApplyExp)) {
            return 65536;
        }
        ApplyExp aexp = (ApplyExp) rhs;
        if (aexp.getArgCount() == 2) {
            Expression funcExp = aexp.getFunction();
            Object func = funcExp.valueIfConstant();
            if (func == AddOp.$Pl) {
                sign = 1;
            } else if (func == AddOp.$Mn) {
                sign = -1;
            } else {
                return 65536;
            }
            Expression arg0 = aexp.getArg(0);
            Expression arg1 = aexp.getArg(1);
            if ((arg0 instanceof QuoteExp) && sign > 0) {
                arg1 = arg0;
                arg0 = arg1;
            }
            if (arg0 instanceof ReferenceExp) {
                ReferenceExp ref0 = (ReferenceExp) arg0;
                if (ref0.getBinding() == target && !ref0.getDontDereference()) {
                    Object value1 = arg1.valueIfConstant();
                    if (value1 instanceof Integer) {
                        int val1 = ((Integer) value1).intValue();
                        if (sign < 0) {
                            val1 = -val1;
                        }
                        if (((short) val1) == val1) {
                            return val1;
                        }
                        return 65536;
                    }
                    if (value1 instanceof IntNum) {
                        IntNum int1 = (IntNum) value1;
                        int hi = 32767;
                        int lo = -32767;
                        if (sign > 0) {
                            lo--;
                        } else {
                            hi = 32767 + 1;
                        }
                        if (IntNum.compare(int1, lo) >= 0 && IntNum.compare(int1, hi) <= 0) {
                            return int1.intValue() * sign;
                        }
                        return 65536;
                    }
                    return 65536;
                }
                return 65536;
            }
            return 65536;
        }
        return 65536;
    }

    @Override // gnu.expr.Expression
    public final Type getType() {
        return !getHasValue() ? Type.voidType : this.binding == null ? Type.pointer_type : this.binding.getType();
    }

    @Override // gnu.expr.Expression
    protected <R, D> R visit(ExpVisitor<R, D> visitor, D d) {
        return visitor.visitSetExp(this, d);
    }

    @Override // gnu.expr.Expression
    protected <R, D> void visitChildren(ExpVisitor<R, D> visitor, D d) {
        this.new_value = visitor.visitAndUpdate(this.new_value, d);
    }

    @Override // gnu.expr.Expression
    public void print(OutPort out) {
        out.startLogicalBlock(isDefining() ? "(Define" : "(Set", ")", 2);
        out.writeSpaceFill();
        printLineColumn(out);
        if (this.binding == null || this.symbol.toString() != this.binding.getName()) {
            out.print('/');
            out.print(this.symbol);
        }
        if (this.binding != null) {
            out.print('/');
            out.print(this.binding);
        }
        out.writeSpaceLinear();
        this.new_value.print(out);
        out.endLogicalBlock(")");
    }

    @Override // gnu.expr.Expression, gnu.mapping.Procedure
    public String toString() {
        return "SetExp[" + this.symbol + ":=" + this.new_value + ']';
    }
}
