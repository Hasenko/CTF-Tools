package kawa.lib;

import androidx.fragment.app.FragmentTransaction;
import gnu.expr.ModuleBody;
import gnu.expr.ModuleInfo;
import gnu.expr.ModuleMethod;
import gnu.expr.PrimProcedure;
import gnu.kawa.lispexpr.LispLanguage;
import gnu.lists.Consumer;
import gnu.lists.LList;
import gnu.lists.PairWithPosition;
import gnu.mapping.CallContext;
import gnu.mapping.Procedure;
import gnu.mapping.SimpleSymbol;
import gnu.mapping.WrongType;
import kawa.lang.Macro;
import kawa.lang.SyntaxPattern;
import kawa.lang.SyntaxRule;
import kawa.lang.SyntaxRules;

/* compiled from: trace.scm */
/* loaded from: classes.dex */
public class trace extends ModuleBody {
    public static final Macro $Pcdo$Mntrace;
    public static final trace $instance;
    static final SimpleSymbol Lit0;
    static final SyntaxRules Lit1;
    static final SimpleSymbol Lit2;
    static final SyntaxRules Lit3;
    static final SimpleSymbol Lit4;
    static final SyntaxRules Lit5;
    static final SimpleSymbol Lit6;
    static final SimpleSymbol Lit7;
    public static final ModuleMethod disassemble;
    public static final Macro trace;
    public static final Macro untrace;

    static {
        SimpleSymbol simpleSymbol = (SimpleSymbol) new SimpleSymbol("begin").readResolve();
        Lit7 = simpleSymbol;
        SimpleSymbol simpleSymbol2 = (SimpleSymbol) new SimpleSymbol("disassemble").readResolve();
        Lit6 = simpleSymbol2;
        SimpleSymbol simpleSymbol3 = (SimpleSymbol) new SimpleSymbol("untrace").readResolve();
        Lit4 = simpleSymbol3;
        SyntaxPattern syntaxPattern = new SyntaxPattern("\f\u0018\r\u0007\u0000\b\b", new Object[0], 1);
        SimpleSymbol simpleSymbol4 = (SimpleSymbol) new SimpleSymbol("%do-trace").readResolve();
        Lit0 = simpleSymbol4;
        SyntaxRules syntaxRules = new SyntaxRules(new Object[]{simpleSymbol3}, new SyntaxRule[]{new SyntaxRule(syntaxPattern, "\u0003", "\u0011\u0018\u0004\b\u0005\u0011\u0018\f\t\u0003\u0018\u0014", new Object[]{simpleSymbol, simpleSymbol4, PairWithPosition.make(Boolean.FALSE, LList.Empty, "/u2/home/jis/ai2-kawa/kawa/lib/trace.scm", 77851)}, 1)}, 1);
        Lit5 = syntaxRules;
        SimpleSymbol simpleSymbol5 = (SimpleSymbol) new SimpleSymbol("trace").readResolve();
        Lit2 = simpleSymbol5;
        SyntaxRules syntaxRules2 = new SyntaxRules(new Object[]{simpleSymbol5}, new SyntaxRule[]{new SyntaxRule(new SyntaxPattern("\f\u0018\r\u0007\u0000\b\b", new Object[0], 1), "\u0003", "\u0011\u0018\u0004\b\u0005\u0011\u0018\f\t\u0003\u0018\u0014", new Object[]{simpleSymbol, simpleSymbol4, PairWithPosition.make(Boolean.TRUE, LList.Empty, "/u2/home/jis/ai2-kawa/kawa/lib/trace.scm", 57371)}, 1)}, 1);
        Lit3 = syntaxRules2;
        SyntaxRules syntaxRules3 = new SyntaxRules(new Object[]{simpleSymbol4}, new SyntaxRule[]{new SyntaxRule(new SyntaxPattern("\f\u0018\f\u0007\f\u000f\b", new Object[0], 2), "\u0001\u0001", "\u0011\u0018\u0004\t\u0003\b\u0011\u0018\f\u0011\u0018\u0014\u0011\u0018\u001c\t\u0003\b\u000b", new Object[]{(SimpleSymbol) new SimpleSymbol("set!").readResolve(), (SimpleSymbol) new SimpleSymbol("invoke-static").readResolve(), (SimpleSymbol) new SimpleSymbol("<kawa.standard.TracedProcedure>").readResolve(), PairWithPosition.make((SimpleSymbol) new SimpleSymbol(LispLanguage.quote_sym).readResolve(), PairWithPosition.make((SimpleSymbol) new SimpleSymbol("doTrace").readResolve(), LList.Empty, "/u2/home/jis/ai2-kawa/kawa/lib/trace.scm", 32806), "/u2/home/jis/ai2-kawa/kawa/lib/trace.scm", 32806)}, 0)}, 2);
        Lit1 = syntaxRules3;
        trace traceVar = new trace();
        $instance = traceVar;
        $Pcdo$Mntrace = Macro.make(simpleSymbol4, syntaxRules3, traceVar);
        trace = Macro.make(simpleSymbol5, syntaxRules2, traceVar);
        untrace = Macro.make(simpleSymbol3, syntaxRules, traceVar);
        disassemble = new ModuleMethod(traceVar, 1, simpleSymbol2, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        traceVar.run();
    }

    public trace() {
        ModuleInfo.register(this);
    }

    @Override // gnu.expr.ModuleBody
    public final void run(CallContext $ctx) {
        Consumer $result = $ctx.consumer;
    }

    public static Object disassemble(Procedure proc) {
        CallContext $ctx = CallContext.getInstance();
        int startFromContext = $ctx.startFromContext();
        try {
            PrimProcedure.disassemble$X(proc, $ctx);
            return $ctx.getFromContext(startFromContext);
        } catch (Throwable th) {
            $ctx.cleanupFromContext(startFromContext);
            throw th;
        }
    }

    @Override // gnu.expr.ModuleBody
    public Object apply1(ModuleMethod moduleMethod, Object obj) {
        if (moduleMethod.selector != 1) {
            return super.apply1(moduleMethod, obj);
        }
        try {
            return disassemble((Procedure) obj);
        } catch (ClassCastException e) {
            throw new WrongType(e, "disassemble", 1, obj);
        }
    }

    @Override // gnu.expr.ModuleBody
    public int match1(ModuleMethod moduleMethod, Object obj, CallContext callContext) {
        if (moduleMethod.selector != 1) {
            return super.match1(moduleMethod, obj, callContext);
        }
        if (!(obj instanceof Procedure)) {
            return -786431;
        }
        callContext.value1 = obj;
        callContext.proc = moduleMethod;
        callContext.pc = 1;
        return 0;
    }
}
