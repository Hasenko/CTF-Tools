package gnu.expr;

import gnu.mapping.EnvironmentKey;
import gnu.mapping.KeyPair;
import gnu.mapping.Symbol;
import gnu.text.SourceLocator;
import java.util.Hashtable;
import java.util.LinkedHashSet;
import java.util.Set;

/* loaded from: classes.dex */
public class FindCapturedVars extends ExpExpVisitor<Void> {
    int backJumpPossible = 0;
    Hashtable unknownDecls = null;
    ModuleExp currentModule = null;

    public static void findCapturedVars(Expression exp, Compilation comp) {
        FindCapturedVars visitor = new FindCapturedVars();
        visitor.setContext(comp);
        exp.visit(visitor, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // gnu.expr.ExpVisitor
    public Expression visitApplyExp(ApplyExp exp, Void ignored) {
        int oldBackJumpPossible = this.backJumpPossible;
        boolean skipFunc = false;
        boolean skipArgs = false;
        if ((exp.func instanceof ReferenceExp) && Compilation.defaultCallConvention <= 1) {
            Declaration decl = Declaration.followAliases(((ReferenceExp) exp.func).binding);
            if (decl != null && (decl.context instanceof ModuleExp) && !decl.isPublic() && !decl.getFlag(4096L)) {
                Expression value = decl.getValue();
                if (value instanceof LambdaExp) {
                    LambdaExp lexp = (LambdaExp) value;
                    if (!lexp.getNeedsClosureEnv()) {
                        skipFunc = true;
                    }
                }
            }
        } else if ((exp.func instanceof QuoteExp) && exp.getArgCount() > 0) {
            Object val = ((QuoteExp) exp.func).getValue();
            Expression arg0 = exp.getArg(0);
            if ((val instanceof PrimProcedure) && (arg0 instanceof ReferenceExp)) {
                Declaration decl2 = Declaration.followAliases(((ReferenceExp) arg0).binding);
                if (decl2 != null && (decl2.context instanceof ModuleExp) && !decl2.getFlag(4096L)) {
                    Expression value2 = decl2.getValue();
                    if (value2 instanceof ClassExp) {
                        Expression[] args = exp.getArgs();
                        LambdaExp lexp2 = (LambdaExp) value2;
                        if (!lexp2.getNeedsClosureEnv()) {
                            exp.nextCall = decl2.firstCall;
                            decl2.firstCall = exp;
                            for (int i = 1; i < args.length; i++) {
                                args[i].visit(this, ignored);
                            }
                            skipArgs = true;
                            skipFunc = true;
                        }
                    }
                }
            }
        }
        if (!skipFunc) {
            exp.func = (Expression) exp.func.visit(this, ignored);
        }
        if (this.exitValue == null && !skipArgs) {
            exp.args = visitExps(exp.args, ignored);
        }
        if (this.backJumpPossible > oldBackJumpPossible) {
            exp.setFlag(8);
        }
        return exp;
    }

    @Override // gnu.expr.ExpVisitor
    public void visitDefaultArgs(LambdaExp exp, Void ignored) {
        if (exp.defaultArgs == null) {
            return;
        }
        super.visitDefaultArgs(exp, (LambdaExp) ignored);
        for (Declaration param = exp.firstDecl(); param != null; param = param.nextDecl()) {
            if (!param.isSimple()) {
                exp.setFlag(true, 512);
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // gnu.expr.ExpVisitor
    public Expression visitClassExp(ClassExp exp, Void ignored) {
        Expression ret = (Expression) super.visitClassExp(exp, (ClassExp) ignored);
        if (!exp.explicitInit && !exp.instanceType.isInterface()) {
            Compilation.getConstructor(exp.instanceType, exp);
        } else if (exp.getNeedsClosureEnv()) {
            for (LambdaExp child = exp.firstChild; child != null; child = child.nextSibling) {
                if ("*init*".equals(child.getName())) {
                    child.setNeedsStaticLink(true);
                }
            }
        }
        if (exp.isSimple() && exp.getNeedsClosureEnv() && exp.nameDecl != null && exp.nameDecl.getType() == Compilation.typeClass) {
            exp.nameDecl.setType(Compilation.typeClassType);
        }
        return ret;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // gnu.expr.ExpVisitor
    public Expression visitModuleExp(ModuleExp exp, Void ignored) {
        ModuleExp saveModule = this.currentModule;
        Hashtable saveDecls = this.unknownDecls;
        this.currentModule = exp;
        this.unknownDecls = null;
        try {
            return visitLambdaExp((LambdaExp) exp, ignored);
        } finally {
            this.currentModule = saveModule;
            this.unknownDecls = saveDecls;
        }
    }

    void maybeWarnNoDeclarationSeen(Object name, Compilation comp, SourceLocator location) {
        if (comp.warnUndefinedVariable()) {
            comp.error('w', "no declaration seen for " + name, location);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // gnu.expr.ExpVisitor
    public Expression visitFluidLetExp(FluidLetExp exp, Void ignored) {
        for (Declaration decl = exp.firstDecl(); decl != null; decl = decl.nextDecl()) {
            if (decl.base == null) {
                Object name = decl.getSymbol();
                Declaration bind = allocUnboundDecl(name, false);
                maybeWarnNoDeclarationSeen(name, this.comp, exp);
                capture(bind);
                decl.base = bind;
            }
        }
        return (Expression) super.visitLetExp((LetExp) exp, (FluidLetExp) ignored);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // gnu.expr.ExpVisitor
    public Expression visitLetExp(LetExp exp, Void ignored) {
        if (exp.body instanceof BeginExp) {
            Expression[] inits = exp.inits;
            int len = inits.length;
            Expression[] exps = ((BeginExp) exp.body).exps;
            int init_index = 0;
            Declaration decl = exp.firstDecl();
            for (int begin_index = 0; begin_index < exps.length && init_index < len; begin_index++) {
                Expression st = exps[begin_index];
                if (st instanceof SetExp) {
                    SetExp set = (SetExp) st;
                    if (set.binding == decl && inits[init_index] == QuoteExp.nullExp && set.isDefining()) {
                        Expression new_value = set.new_value;
                        if (((new_value instanceof QuoteExp) || (new_value instanceof LambdaExp)) && decl.getValue() == new_value) {
                            inits[init_index] = new_value;
                            exps[begin_index] = QuoteExp.voidExp;
                        }
                        init_index++;
                        decl = decl.nextDecl();
                    }
                }
            }
        }
        return (Expression) super.visitLetExp(exp, (LetExp) ignored);
    }

    static Expression checkInlineable(LambdaExp current, Set<LambdaExp> seen) {
        if (current.returnContinuation == LambdaExp.unknownContinuation) {
            return current.returnContinuation;
        }
        if (seen.contains(current)) {
            return current.returnContinuation;
        }
        if (current.getCanRead() || current.isClassMethod() || current.min_args != current.max_args) {
            current.returnContinuation = LambdaExp.unknownContinuation;
            return LambdaExp.unknownContinuation;
        }
        seen.add(current);
        Expression r = current.returnContinuation;
        if (current.tailCallers != null) {
            for (LambdaExp p : current.tailCallers) {
                Expression t = checkInlineable(p, seen);
                if (t == LambdaExp.unknownContinuation) {
                    if (r == null || r == p.body) {
                        r = p.body;
                        current.inlineHome = p;
                    } else {
                        current.returnContinuation = LambdaExp.unknownContinuation;
                        return t;
                    }
                } else if (r == null) {
                    r = t;
                    if (current.inlineHome == null) {
                        current.inlineHome = current.nestedIn(p) ? p : p.inlineHome;
                    }
                } else if ((t != null && r != t) || current.getFlag(32)) {
                    current.returnContinuation = LambdaExp.unknownContinuation;
                    return LambdaExp.unknownContinuation;
                }
            }
        }
        return r;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // gnu.expr.ExpVisitor
    public Expression visitLambdaExp(LambdaExp exp, Void ignored) {
        Set<LambdaExp> seen = new LinkedHashSet<>();
        Expression caller = checkInlineable(exp, seen);
        if (caller != LambdaExp.unknownContinuation && (!(exp.outer instanceof ModuleExp) || exp.nameDecl == null)) {
            exp.setInlineOnly(true);
            this.backJumpPossible++;
        }
        return (Expression) super.visitLambdaExp(exp, (LambdaExp) ignored);
    }

    public void capture(Declaration decl) {
        LambdaExp declValue;
        ScopeExp sc;
        LambdaExp oldParent;
        FindCapturedVars findCapturedVars = this;
        if (!decl.getCanRead() && !decl.getCanCall()) {
            return;
        }
        if (decl.field != null && decl.field.getStaticFlag()) {
            return;
        }
        if (findCapturedVars.comp.immediate && decl.hasConstantValue()) {
            return;
        }
        LambdaExp curLambda = getCurrentLambda();
        ScopeExp sc2 = decl.getContext();
        if (sc2 == null) {
            throw new Error("null context for " + decl + " curL:" + curLambda);
        }
        LambdaExp declLambda = sc2.currentLambda();
        LambdaExp oldParent2 = null;
        LambdaExp chain = null;
        while (curLambda != declLambda && curLambda.getInlineOnly()) {
            LambdaExp curParent = curLambda.outerLambda();
            if (curParent != oldParent2) {
                chain = curParent.firstChild;
                oldParent2 = curParent;
            }
            if (chain == null || curLambda.inlineHome == null) {
                curLambda.setCanCall(false);
                return;
            } else {
                curLambda = curLambda.getCaller();
                chain = chain.nextSibling;
            }
        }
        if (findCapturedVars.comp.usingCPStyle()) {
            if (curLambda instanceof ModuleExp) {
                return;
            }
        } else if (curLambda == declLambda) {
            return;
        }
        Expression value = decl.getValue();
        if (value == null || !(value instanceof LambdaExp)) {
            declValue = null;
        } else {
            declValue = (LambdaExp) value;
            if (declValue.getInlineOnly()) {
                return;
            }
            if (declValue.isHandlingTailCalls()) {
                declValue = null;
            } else if (declValue == curLambda && !decl.getCanRead()) {
                return;
            }
        }
        long j = 2048;
        if (decl.getFlag(65536L)) {
            LambdaExp parent = curLambda;
            while (true) {
                if (parent == declLambda) {
                    break;
                }
                if (parent.nameDecl == null || !parent.nameDecl.getFlag(2048L)) {
                    parent = parent.outerLambda();
                } else {
                    decl.setFlag(2048L);
                    break;
                }
            }
        }
        if (decl.base != null) {
            decl.base.setCanRead(true);
            findCapturedVars.capture(decl.base);
            return;
        }
        if (decl.getCanRead() || decl.getCanCall() || declValue == null) {
            if (!decl.isStatic()) {
                LambdaExp heapLambda = curLambda;
                if (!decl.isFluid()) {
                    heapLambda.setImportsLexVars();
                }
                LambdaExp parent2 = heapLambda.outerLambda();
                LambdaExp outer = parent2;
                while (outer != declLambda && outer != null) {
                    LambdaExp heapLambda2 = outer;
                    if (!decl.getCanRead() && declValue == outer) {
                        break;
                    }
                    Declaration heapDecl = heapLambda2.nameDecl;
                    if (heapDecl == null || !heapDecl.getFlag(j)) {
                        sc = sc2;
                    } else {
                        sc = sc2;
                        findCapturedVars.comp.error('e', "static " + heapLambda2.getName() + " references non-static " + decl.getName());
                    }
                    if (!(heapLambda2 instanceof ClassExp) || heapLambda2.getName() == null || !((ClassExp) heapLambda2).isSimple()) {
                        oldParent = oldParent2;
                    } else {
                        oldParent = oldParent2;
                        findCapturedVars.comp.error('w', heapLambda2.nameDecl, "simple class ", " requiring lexical link (because of reference to " + decl.getName() + ") - use define-class instead");
                    }
                    heapLambda2.setNeedsStaticLink();
                    outer = heapLambda2.outerLambda();
                    findCapturedVars = this;
                    sc2 = sc;
                    oldParent2 = oldParent;
                    j = 2048;
                }
            }
            if (declLambda == null) {
                System.err.println("null declLambda for " + decl + " curL:" + curLambda);
                for (ScopeExp c = decl.context; c != null; c = c.outer) {
                    System.err.println("- context:" + c);
                }
            }
            declLambda.capture(decl);
        }
    }

    Declaration allocUnboundDecl(Object name, boolean function) {
        Declaration decl;
        Object key = name;
        if (function && (name instanceof Symbol)) {
            if (!getCompilation().getLanguage().hasSeparateFunctionNamespace()) {
                function = false;
            } else {
                key = new KeyPair((Symbol) name, EnvironmentKey.FUNCTION);
            }
        }
        Hashtable hashtable = this.unknownDecls;
        if (hashtable == null) {
            this.unknownDecls = new Hashtable(100);
            decl = null;
        } else {
            decl = (Declaration) hashtable.get(key);
        }
        if (decl == null) {
            decl = this.currentModule.addDeclaration(name);
            decl.setSimple(false);
            decl.setPrivate(true);
            if (function) {
                decl.setProcedureDecl(true);
            }
            if (this.currentModule.isStatic()) {
                decl.setFlag(2048L);
            }
            decl.setCanRead(true);
            decl.setCanWrite(true);
            decl.setFlag(327680L);
            decl.setIndirectBinding(true);
            this.unknownDecls.put(key, decl);
        }
        return decl;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // gnu.expr.ExpVisitor
    public Expression visitReferenceExp(ReferenceExp exp, Void ignored) {
        Declaration decl = exp.getBinding();
        if (decl == null) {
            decl = allocUnboundDecl(exp.getSymbol(), exp.isProcedureName());
            exp.setBinding(decl);
        }
        if (decl.getFlag(65536L) && this.comp.resolve(exp.getSymbol(), exp.isProcedureName()) == null) {
            maybeWarnNoDeclarationSeen(exp.getSymbol(), this.comp, exp);
        }
        capture(exp.contextDecl(), decl);
        return exp;
    }

    void capture(Declaration containing, Declaration decl) {
        ReferenceExp rexp;
        Declaration orig;
        if (decl.isAlias() && (decl.value instanceof ReferenceExp) && (orig = (rexp = (ReferenceExp) decl.value).binding) != null && (containing == null || !orig.needsContext())) {
            capture(rexp.contextDecl(), orig);
            return;
        }
        while (decl.isFluid() && (decl.context instanceof FluidLetExp)) {
            decl = decl.base;
        }
        if (containing != null && decl.needsContext()) {
            capture(containing);
        } else {
            capture(decl);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // gnu.expr.ExpVisitor
    public Expression visitThisExp(ThisExp exp, Void ignored) {
        if (exp.isForContext()) {
            getCurrentLambda().setImportsLexVars();
            return exp;
        }
        return visitReferenceExp((ReferenceExp) exp, ignored);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // gnu.expr.ExpVisitor
    public Expression visitSetExp(SetExp exp, Void ignored) {
        Declaration decl = exp.binding;
        if (decl == null) {
            decl = allocUnboundDecl(exp.getSymbol(), exp.isFuncDef());
            exp.binding = decl;
        }
        if (!decl.ignorable()) {
            if (!exp.isDefining()) {
                decl = Declaration.followAliases(decl);
            }
            capture(exp.contextDecl(), decl);
        }
        return (Expression) super.visitSetExp(exp, (SetExp) ignored);
    }
}
