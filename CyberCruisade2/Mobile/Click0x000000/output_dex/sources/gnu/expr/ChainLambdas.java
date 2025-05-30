package gnu.expr;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ChainLambdas extends ExpExpVisitor<ScopeExp> {
    public static void chainLambdas(Expression exp, Compilation comp) {
        ChainLambdas visitor = new ChainLambdas();
        visitor.setContext(comp);
        visitor.visit(exp, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // gnu.expr.ExpVisitor
    public Expression visitScopeExp(ScopeExp exp, ScopeExp scope) {
        exp.outer = scope;
        exp.visitChildren(this, exp);
        exp.setIndexes();
        if (exp.mustCompile()) {
            this.comp.mustCompileHere();
        }
        return exp;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // gnu.expr.ExpVisitor
    public Expression visitLambdaExp(LambdaExp exp, ScopeExp scope) {
        LambdaExp parent = this.currentLambda;
        if (parent != null && !(parent instanceof ClassExp)) {
            exp.nextSibling = parent.firstChild;
            parent.firstChild = exp;
        }
        exp.outer = scope;
        exp.firstChild = null;
        exp.visitChildrenOnly(this, exp);
        exp.visitProperties(this, exp);
        LambdaExp prev = null;
        LambdaExp child = exp.firstChild;
        while (child != null) {
            LambdaExp next = child.nextSibling;
            child.nextSibling = prev;
            prev = child;
            child = next;
        }
        exp.firstChild = prev;
        if (exp.getName() == null && exp.nameDecl != null) {
            exp.setName(exp.nameDecl.getName());
        }
        exp.setIndexes();
        if (exp.mustCompile()) {
            this.comp.mustCompileHere();
        }
        return exp;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // gnu.expr.ExpVisitor
    public Expression visitClassExp(ClassExp exp, ScopeExp scope) {
        LambdaExp parent = this.currentLambda;
        if (parent != null && !(parent instanceof ClassExp)) {
            exp.nextSibling = parent.firstChild;
            parent.firstChild = exp;
        }
        visitScopeExp((ScopeExp) exp, scope);
        return exp;
    }
}
