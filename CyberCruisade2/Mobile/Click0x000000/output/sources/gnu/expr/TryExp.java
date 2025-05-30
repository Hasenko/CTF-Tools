package gnu.expr;

import gnu.bytecode.ClassType;
import gnu.bytecode.CodeAttr;
import gnu.bytecode.Type;
import gnu.mapping.CallContext;
import gnu.mapping.OutPort;

/* loaded from: classes.dex */
public class TryExp extends Expression {
    CatchClause catch_clauses;
    Expression finally_clause;
    Expression try_clause;

    public final CatchClause getCatchClauses() {
        return this.catch_clauses;
    }

    public final Expression getFinallyClause() {
        return this.finally_clause;
    }

    public final void setCatchClauses(CatchClause catch_clauses) {
        this.catch_clauses = catch_clauses;
    }

    public TryExp(Expression try_clause, Expression finally_clause) {
        this.try_clause = try_clause;
        this.finally_clause = finally_clause;
    }

    @Override // gnu.expr.Expression
    protected boolean mustCompile() {
        return false;
    }

    @Override // gnu.expr.Expression, gnu.mapping.Procedure
    public void apply(CallContext ctx) throws Throwable {
        try {
            this.try_clause.apply(ctx);
            ctx.runUntilDone();
        } catch (Throwable ex) {
            try {
                for (CatchClause clause = this.catch_clauses; clause != null; clause = clause.next) {
                    Declaration decl = clause.firstDecl();
                    ClassType typeVal = (ClassType) decl.getTypeExp().eval(ctx);
                    if (typeVal.isInstance(ex)) {
                        ctx.value1 = ex;
                        clause.apply(ctx);
                        Expression expression = this.finally_clause;
                        if (expression != null) {
                            expression.eval(ctx);
                            return;
                        }
                        return;
                    }
                }
                throw ex;
            } finally {
                Expression expression2 = this.finally_clause;
                if (expression2 != null) {
                    expression2.eval(ctx);
                }
            }
        }
    }

    @Override // gnu.expr.Expression
    public void compile(Compilation comp, Target target) {
        Target ttarg;
        CodeAttr code = comp.getCode();
        Expression expression = this.finally_clause;
        boolean has_finally = expression != null;
        if ((target instanceof StackTarget) || (target instanceof ConsumerTarget) || (target instanceof IgnoreTarget) || ((target instanceof ConditionalTarget) && expression == null)) {
            ttarg = target;
        } else {
            ttarg = Target.pushValue(target.getType());
        }
        code.emitTryStart(has_finally, ttarg instanceof StackTarget ? ttarg.getType() : null);
        this.try_clause.compileWithPosition(comp, ttarg);
        for (CatchClause catch_clause = this.catch_clauses; catch_clause != null; catch_clause = catch_clause.getNext()) {
            catch_clause.compile(comp, ttarg);
        }
        if (this.finally_clause != null) {
            code.emitFinallyStart();
            this.finally_clause.compileWithPosition(comp, Target.Ignore);
            code.emitFinallyEnd();
        }
        code.emitTryCatchEnd();
        if (ttarg != target) {
            target.compileFromStack(comp, target.getType());
        }
    }

    @Override // gnu.expr.Expression
    protected <R, D> R visit(ExpVisitor<R, D> visitor, D d) {
        return visitor.visitTryExp(this, d);
    }

    @Override // gnu.expr.Expression
    protected <R, D> void visitChildren(ExpVisitor<R, D> visitor, D d) {
        Expression expression;
        this.try_clause = visitor.visitAndUpdate(this.try_clause, d);
        for (CatchClause catch_clause = this.catch_clauses; visitor.exitValue == null && catch_clause != null; catch_clause = catch_clause.getNext()) {
            visitor.visit(catch_clause, d);
        }
        if (visitor.exitValue == null && (expression = this.finally_clause) != null) {
            this.finally_clause = visitor.visitAndUpdate(expression, d);
        }
    }

    @Override // gnu.expr.Expression
    public Type getType() {
        if (this.catch_clauses == null) {
            return this.try_clause.getType();
        }
        return super.getType();
    }

    @Override // gnu.expr.Expression
    public void print(OutPort ps) {
        ps.startLogicalBlock("(Try", ")", 2);
        ps.writeSpaceFill();
        this.try_clause.print(ps);
        for (CatchClause catch_clause = this.catch_clauses; catch_clause != null; catch_clause = catch_clause.getNext()) {
            catch_clause.print(ps);
        }
        if (this.finally_clause != null) {
            ps.writeSpaceLinear();
            ps.print(" finally: ");
            this.finally_clause.print(ps);
        }
        ps.endLogicalBlock(")");
    }
}
