package kawa.standard;

import gnu.bytecode.ClassType;
import gnu.expr.ApplyExp;
import gnu.expr.Declaration;
import gnu.expr.Expression;
import gnu.expr.LambdaExp;
import gnu.expr.ModuleExp;
import gnu.expr.PrimProcedure;
import gnu.expr.QuoteExp;
import gnu.expr.ReferenceExp;
import gnu.expr.ScopeExp;
import gnu.expr.SetExp;
import gnu.expr.ThisExp;
import gnu.lists.LList;
import gnu.lists.Pair;
import gnu.mapping.Symbol;
import kawa.lang.Macro;
import kawa.lang.Syntax;
import kawa.lang.SyntaxForm;
import kawa.lang.Translator;

/* loaded from: classes.dex */
public class define_syntax extends Syntax {
    boolean hygienic;
    public static final define_syntax define_macro = new define_syntax("%define-macro", false);
    public static final define_syntax define_syntax = new define_syntax("%define-syntax", true);
    static ClassType typeMacro = ClassType.make("kawa.lang.Macro");
    static PrimProcedure makeHygienic = new PrimProcedure(typeMacro.getDeclaredMethod("make", 3));
    static PrimProcedure makeNonHygienic = new PrimProcedure(typeMacro.getDeclaredMethod("makeNonHygienic", 3));
    static PrimProcedure setCapturedScope = new PrimProcedure(typeMacro.getDeclaredMethod("setCapturedScope", 1));

    static {
        makeHygienic.setSideEffectFree();
        makeNonHygienic.setSideEffectFree();
    }

    public define_syntax() {
        this.hygienic = true;
    }

    public define_syntax(Object name, boolean hygienic) {
        super(name);
        this.hygienic = hygienic;
    }

    @Override // kawa.lang.Syntax
    public Expression rewriteForm(Pair form, Translator tr) {
        return tr.syntaxError("define-syntax not in a body");
    }

    @Override // kawa.lang.Syntax
    public void scanForm(Pair st, ScopeExp defs, Translator tr) {
        Object name;
        SyntaxForm syntax = null;
        Object st_cdr = st.getCdr();
        while (st_cdr instanceof SyntaxForm) {
            syntax = (SyntaxForm) st_cdr;
            st_cdr = syntax.getDatum();
        }
        Object p = st_cdr;
        if (p instanceof Pair) {
            Pair pp = (Pair) p;
            name = pp.getCar();
            p = pp.getCdr();
        } else {
            name = null;
        }
        SyntaxForm nameSyntax = syntax;
        while (name instanceof SyntaxForm) {
            nameSyntax = (SyntaxForm) name;
            name = nameSyntax.getDatum();
        }
        Object name2 = tr.namespaceResolve(name);
        if (!(name2 instanceof Symbol)) {
            tr.formStack.addElement(tr.syntaxError("missing macro name for " + Translator.safeCar(st)));
            return;
        }
        if (p == null || Translator.safeCdr(p) != LList.Empty) {
            tr.formStack.addElement(tr.syntaxError("invalid syntax for " + getName()));
            return;
        }
        Declaration decl = tr.define(name2, nameSyntax, defs);
        decl.setType(typeMacro);
        tr.push(decl);
        Macro savedMacro = tr.currentMacroDefinition;
        Macro macro = Macro.make(decl);
        macro.setHygienic(this.hygienic);
        tr.currentMacroDefinition = macro;
        Expression rule = tr.rewrite_car((Pair) p, syntax);
        tr.currentMacroDefinition = savedMacro;
        macro.expander = rule;
        if (rule instanceof LambdaExp) {
            ((LambdaExp) rule).setFlag(256);
        }
        Expression[] args = {new QuoteExp(name2), rule, ThisExp.makeGivingContext(defs)};
        Expression rule2 = new ApplyExp(this.hygienic ? makeHygienic : makeNonHygienic, args);
        decl.noteValue(rule2);
        decl.setProcedureDecl(true);
        if (decl.context instanceof ModuleExp) {
            SetExp result = new SetExp(decl, rule2);
            result.setDefining(true);
            if (tr.getLanguage().hasSeparateFunctionNamespace()) {
                result.setFuncDef(true);
            }
            tr.formStack.addElement(result);
            if (tr.immediate) {
                Expression[] args2 = {new ReferenceExp(decl), new QuoteExp(defs)};
                tr.formStack.addElement(new ApplyExp(setCapturedScope, args2));
            }
        }
    }
}
