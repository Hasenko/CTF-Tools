package gnu.expr;

import gnu.text.SourceLocator;
import gnu.text.SourceMessages;

/* loaded from: classes.dex */
public class ExpVisitor<R, D> implements SourceLocator {
    Compilation comp;
    protected LambdaExp currentLambda = null;
    protected Object exitValue = null;
    protected SourceMessages messages;

    public Compilation getCompilation() {
        return this.comp;
    }

    public SourceMessages getMessages() {
        return this.messages;
    }

    protected R defaultValue(Expression r, D d) {
        return null;
    }

    protected R visitExpression(Expression exp, D d) {
        exp.visitChildren(this, d);
        return defaultValue(exp, d);
    }

    public void setContext(Compilation comp) {
        this.comp = comp;
        this.messages = comp.getMessages();
    }

    public R visit(Expression expression, D d) {
        int lineNumber = expression.getLineNumber();
        SourceMessages sourceMessages = this.messages;
        if (sourceMessages != null && lineNumber > 0) {
            String fileName = sourceMessages.getFileName();
            int lineNumber2 = this.messages.getLineNumber();
            int columnNumber = this.messages.getColumnNumber();
            this.messages.setLine(expression.getFileName(), lineNumber, expression.getColumnNumber());
            R r = (R) expression.visit(this, d);
            this.messages.setLine(fileName, lineNumber2, columnNumber);
            return r;
        }
        return (R) expression.visit(this, d);
    }

    protected Expression update(Expression exp, R r) {
        return exp;
    }

    protected R visitApplyExp(ApplyExp exp, D d) {
        return visitExpression(exp, d);
    }

    protected R visitIfExp(IfExp exp, D d) {
        return visitExpression(exp, d);
    }

    protected final void visitDeclarationType(Declaration decl) {
        Expression texp2;
        Expression texp1 = decl.typeExp;
        if (texp1 != null && (texp2 = visitAndUpdate(texp1, null)) != texp1) {
            decl.setTypeExp(texp2);
        }
    }

    protected final void visitDeclarationTypes(ScopeExp exp) {
        for (Declaration decl = exp.firstDecl(); decl != null; decl = decl.nextDecl()) {
            visitDeclarationType(decl);
        }
    }

    protected R visitScopeExp(ScopeExp exp, D d) {
        visitDeclarationTypes(exp);
        return visitExpression(exp, d);
    }

    protected R visitLetExp(LetExp exp, D d) {
        return visitScopeExp(exp, d);
    }

    protected R visitLambdaExp(LambdaExp exp, D d) {
        return visitScopeExp(exp, d);
    }

    protected R visitClassExp(ClassExp exp, D d) {
        return visitLambdaExp(exp, d);
    }

    protected R visitObjectExp(ObjectExp exp, D d) {
        return visitClassExp(exp, d);
    }

    protected R visitModuleExp(ModuleExp exp, D d) {
        return visitLambdaExp(exp, d);
    }

    protected Expression visitSetExpValue(Expression new_value, D d, Declaration decl) {
        return visitAndUpdate(new_value, d);
    }

    protected R visitSetExp(SetExp exp, D d) {
        Declaration decl = exp.binding;
        boolean updateNeeded = decl != null && decl.value == exp.new_value;
        exp.new_value = visitSetExpValue(exp.new_value, d, exp.getBinding());
        if (updateNeeded && exp.isDefining()) {
            decl.value = exp.new_value;
            if (exp.new_value instanceof LambdaExp) {
                ((LambdaExp) exp.new_value).nameDecl = decl;
            }
        }
        return defaultValue(exp, d);
    }

    protected R visitTryExp(TryExp exp, D d) {
        return visitExpression(exp, d);
    }

    protected R visitBeginExp(BeginExp exp, D d) {
        return visitExpression(exp, d);
    }

    protected R visitQuoteExp(QuoteExp exp, D d) {
        return visitExpression(exp, d);
    }

    protected R visitReferenceExp(ReferenceExp exp, D d) {
        return visitExpression(exp, d);
    }

    protected R visitThisExp(ThisExp exp, D d) {
        return visitReferenceExp(exp, d);
    }

    protected R visitSynchronizedExp(SynchronizedExp exp, D d) {
        return visitExpression(exp, d);
    }

    protected R visitBlockExp(BlockExp exp, D d) {
        return visitExpression(exp, d);
    }

    protected R visitExitExp(ExitExp exp, D d) {
        return visitExpression(exp, d);
    }

    protected R visitFluidLetExp(FluidLetExp exp, D d) {
        return visitLetExp(exp, d);
    }

    protected R visitLangExp(LangExp exp, D d) {
        return visitExpression(exp, d);
    }

    public Object getExitValue() {
        return this.exitValue;
    }

    public final LambdaExp getCurrentLambda() {
        return this.currentLambda;
    }

    public Expression visitAndUpdate(Expression exp, D d) {
        return update(exp, visit(exp, d));
    }

    public Expression[] visitExps(Expression[] exps, D d) {
        if (exps == null) {
            return null;
        }
        return visitExps(exps, exps.length, d);
    }

    public Expression[] visitExps(Expression[] exps, int n, D d) {
        for (int i = 0; i < n && this.exitValue == null; i++) {
            exps[i] = visitAndUpdate(exps[i], d);
        }
        return exps;
    }

    public void visitDefaultArgs(LambdaExp exp, D d) {
        exp.defaultArgs = visitExps(exp.defaultArgs, d);
    }

    public void error(char kind, String message) {
        if (kind == 'w' && this.comp.warnAsError()) {
            kind = 'e';
        }
        SourceMessages sourceMessages = this.messages;
        if (sourceMessages != null) {
            sourceMessages.error(kind, message);
        } else {
            new Error("internal error: " + message);
        }
    }

    public Expression noteError(String message) {
        SourceMessages sourceMessages = this.messages;
        if (sourceMessages != null) {
            sourceMessages.error('e', message);
        }
        return new ErrorExp(message);
    }

    @Override // gnu.text.SourceLocator
    public final String getFileName() {
        return this.messages.getFileName();
    }

    @Override // gnu.text.SourceLocator, org.xml.sax.Locator
    public final int getLineNumber() {
        return this.messages.getLineNumber();
    }

    @Override // gnu.text.SourceLocator, org.xml.sax.Locator
    public final int getColumnNumber() {
        return this.messages.getColumnNumber();
    }

    @Override // gnu.text.SourceLocator, org.xml.sax.Locator
    public String getPublicId() {
        return this.messages.getPublicId();
    }

    @Override // gnu.text.SourceLocator, org.xml.sax.Locator
    public String getSystemId() {
        return this.messages.getSystemId();
    }

    @Override // gnu.text.SourceLocator
    public boolean isStableSourceLocation() {
        return false;
    }

    public void setFile(String filename) {
        this.messages.setFile(filename);
    }

    public void setLine(int line) {
        this.messages.setLine(line);
    }

    public void setColumn(int column) {
        this.messages.setColumn(column);
    }

    public void setLine(String filename, int line, int column) {
        this.messages.setLine(filename, line, column);
    }
}
