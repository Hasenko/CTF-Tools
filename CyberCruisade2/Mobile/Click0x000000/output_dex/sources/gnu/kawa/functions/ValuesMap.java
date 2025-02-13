package gnu.kawa.functions;

import androidx.fragment.app.FragmentTransaction;
import gnu.bytecode.CodeAttr;
import gnu.bytecode.Label;
import gnu.bytecode.Method;
import gnu.bytecode.Scope;
import gnu.bytecode.Type;
import gnu.bytecode.Variable;
import gnu.expr.ApplyExp;
import gnu.expr.Compilation;
import gnu.expr.ConsumerTarget;
import gnu.expr.Declaration;
import gnu.expr.Expression;
import gnu.expr.IfExp;
import gnu.expr.IgnoreTarget;
import gnu.expr.Inlineable;
import gnu.expr.LambdaExp;
import gnu.expr.QuoteExp;
import gnu.expr.ReferenceExp;
import gnu.expr.StackTarget;
import gnu.expr.Target;
import gnu.lists.Consumer;
import gnu.mapping.CallContext;
import gnu.mapping.MethodProc;
import gnu.mapping.Procedure;
import gnu.mapping.Values;
import gnu.math.IntNum;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ValuesMap extends MethodProc implements Inlineable {
    public static final ValuesMap valuesMap = new ValuesMap(-1);
    public static final ValuesMap valuesMapWithPos = new ValuesMap(1);
    private final int startCounter;

    private ValuesMap(int startCounter) {
        this.startCounter = startCounter;
        setProperty(Procedure.validateApplyKey, "gnu.kawa.functions.CompileMisc:validateApplyValuesMap");
    }

    @Override // gnu.mapping.Procedure
    public int numArgs() {
        return FragmentTransaction.TRANSIT_FRAGMENT_CLOSE;
    }

    @Override // gnu.mapping.Procedure
    public void apply(CallContext ctx) throws Throwable {
        Procedure proc = (Procedure) ctx.getNextArg();
        Consumer consumer = ctx.consumer;
        Object val = ctx.getNextArg();
        Procedure.checkArgCount(proc, 1);
        if (val instanceof Values) {
            int ipos = 0;
            int count = this.startCounter;
            Values values = (Values) val;
            while (true) {
                int nextPos = values.nextPos(ipos);
                ipos = nextPos;
                if (nextPos != 0) {
                    Object v = values.getPosPrevious(ipos);
                    if (this.startCounter >= 0) {
                        proc.check2(v, IntNum.make(count), ctx);
                        count++;
                    } else {
                        proc.check1(v, ctx);
                    }
                    ctx.runUntilDone();
                } else {
                    return;
                }
            }
        } else {
            int i = this.startCounter;
            if (i >= 0) {
                proc.check2(val, IntNum.make(i), ctx);
            } else {
                proc.check1(val, ctx);
            }
            ctx.runUntilDone();
        }
    }

    static LambdaExp canInline(ApplyExp exp, ValuesMap proc) {
        Expression[] args = exp.getArgs();
        if (args.length != 2) {
            return null;
        }
        Expression arg0 = args[0];
        if (arg0 instanceof LambdaExp) {
            LambdaExp lexp = (LambdaExp) arg0;
            if (lexp.min_args != lexp.max_args) {
                return null;
            }
            if (lexp.min_args == (proc.startCounter < 0 ? 1 : 2)) {
                return lexp;
            }
            return null;
        }
        return null;
    }

    @Override // gnu.expr.Inlineable
    public void compile(ApplyExp exp, Compilation comp, Target target) {
        LambdaExp lambda = canInline(exp, this);
        if (lambda == null) {
            ApplyExp.compile(exp, comp, target);
            return;
        }
        Expression[] args = exp.getArgs();
        if (!(target instanceof IgnoreTarget) && !(target instanceof ConsumerTarget)) {
            ConsumerTarget.compileUsingConsumer(exp, comp, target);
        } else {
            Expression vals = args[1];
            compileInlined(lambda, vals, this.startCounter, null, comp, target);
        }
    }

    public static void compileInlined(LambdaExp lambda, Expression vals, int startCounter, Method matchesMethod, Compilation comp, Target target) {
        Variable counter;
        Declaration counterDecl;
        Expression[] args;
        Declaration param = lambda.firstDecl();
        CodeAttr code = comp.getCode();
        Scope scope = code.pushScope();
        Type paramType = param.getType();
        if (startCounter >= 0) {
            counter = scope.addVariable(code, Type.intType, "position");
            code.emitPushInt(startCounter);
            code.emitStore(counter);
            counterDecl = new Declaration(counter);
        } else {
            counter = null;
            counterDecl = null;
        }
        if (param.isSimple() && matchesMethod == null) {
            param.allocateVariable(code);
        } else {
            String pname = Compilation.mangleNameIfNeeded(param.getName());
            param = new Declaration(code.addLocal(paramType.getImplementationType(), pname));
        }
        if (startCounter >= 0) {
            args = new Expression[]{new ReferenceExp(param), new ReferenceExp(counterDecl)};
        } else {
            args = new Expression[]{new ReferenceExp(param)};
        }
        Expression app = new ApplyExp((Expression) lambda, args);
        if (matchesMethod != null) {
            if (app.getType().getImplementationType() != Type.booleanType) {
                app = new ApplyExp(matchesMethod, app, new ReferenceExp(counterDecl));
            }
            app = new IfExp(app, new ReferenceExp(param), QuoteExp.voidExp);
        }
        Variable indexVar = code.addLocal(Type.intType);
        Variable valuesVar = code.addLocal(Type.pointer_type);
        Variable nextVar = code.addLocal(Type.intType);
        vals.compileWithPosition(comp, Target.pushObject);
        code.emitStore(valuesVar);
        code.emitPushInt(0);
        code.emitStore(indexVar);
        Label top = new Label(code);
        Label doneLabel = new Label(code);
        top.define(code);
        code.emitLoad(valuesVar);
        code.emitLoad(indexVar);
        code.emitInvokeStatic(Compilation.typeValues.getDeclaredMethod("nextIndex", 2));
        code.emitDup(Type.intType);
        code.emitStore(nextVar);
        code.emitGotoIfIntLtZero(doneLabel);
        code.emitLoad(valuesVar);
        code.emitLoad(indexVar);
        code.emitInvokeStatic(Compilation.typeValues.getDeclaredMethod("nextValue", 2));
        StackTarget.convert(comp, Type.objectType, paramType);
        param.compileStore(comp);
        app.compile(comp, target);
        if (startCounter >= 0) {
            code.emitInc(counter, (short) 1);
        }
        code.emitLoad(nextVar);
        code.emitStore(indexVar);
        code.emitGoto(top);
        doneLabel.define(code);
        code.popScope();
    }

    @Override // gnu.mapping.Procedure
    public Type getReturnType(Expression[] args) {
        return Type.pointer_type;
    }
}
