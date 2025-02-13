.class public Lgnu/expr/FindTailCalls;
.super Lgnu/expr/ExpExpVisitor;
.source "FindTailCalls.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lgnu/expr/ExpExpVisitor<",
        "Lgnu/expr/Expression;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Lgnu/expr/ExpExpVisitor;-><init>()V

    return-void
.end method

.method public static findTailCalls(Lgnu/expr/Expression;Lgnu/expr/Compilation;)V
    .locals 1
    .param p0, "exp"    # Lgnu/expr/Expression;
    .param p1, "comp"    # Lgnu/expr/Compilation;

    .line 26
    new-instance v0, Lgnu/expr/FindTailCalls;

    invoke-direct {v0}, Lgnu/expr/FindTailCalls;-><init>()V

    .line 27
    .local v0, "visitor":Lgnu/expr/FindTailCalls;
    invoke-virtual {v0, p1}, Lgnu/expr/FindTailCalls;->setContext(Lgnu/expr/Compilation;)V

    .line 28
    invoke-virtual {v0, p0, p0}, Lgnu/expr/FindTailCalls;->visit(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    return-void
.end method


# virtual methods
.method public postVisitDecls(Lgnu/expr/ScopeExp;)V
    .locals 6
    .param p1, "exp"    # Lgnu/expr/ScopeExp;

    .line 193
    invoke-virtual {p1}, Lgnu/expr/ScopeExp;->firstDecl()Lgnu/expr/Declaration;

    move-result-object v0

    .line 194
    .local v0, "decl":Lgnu/expr/Declaration;
    :goto_0
    if-eqz v0, :cond_3

    .line 196
    invoke-virtual {v0}, Lgnu/expr/Declaration;->getValue()Lgnu/expr/Expression;

    move-result-object v1

    .line 197
    .local v1, "value":Lgnu/expr/Expression;
    instance-of v2, v1, Lgnu/expr/LambdaExp;

    if-eqz v2, :cond_1

    .line 199
    move-object v2, v1

    check-cast v2, Lgnu/expr/LambdaExp;

    .line 200
    .local v2, "lexp":Lgnu/expr/LambdaExp;
    invoke-virtual {v0}, Lgnu/expr/Declaration;->getCanRead()Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_0

    .line 201
    invoke-virtual {v2, v4}, Lgnu/expr/LambdaExp;->setCanRead(Z)V

    .line 202
    :cond_0
    invoke-virtual {v0}, Lgnu/expr/Declaration;->getCanCall()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 203
    invoke-virtual {v2, v4}, Lgnu/expr/LambdaExp;->setCanCall(Z)V

    .line 205
    .end local v2    # "lexp":Lgnu/expr/LambdaExp;
    :cond_1
    const-wide/16 v2, 0x400

    invoke-virtual {v0, v2, v3}, Lgnu/expr/Declaration;->getFlag(J)Z

    move-result v2

    if-eqz v2, :cond_2

    instance-of v2, v1, Lgnu/expr/ReferenceExp;

    if-eqz v2, :cond_2

    .line 208
    move-object v2, v1

    check-cast v2, Lgnu/expr/ReferenceExp;

    .line 209
    .local v2, "rexp":Lgnu/expr/ReferenceExp;
    invoke-virtual {v2}, Lgnu/expr/ReferenceExp;->contextDecl()Lgnu/expr/Declaration;

    move-result-object v3

    .line 210
    .local v3, "context":Lgnu/expr/Declaration;
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lgnu/expr/Declaration;->isPrivate()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 211
    const-wide/32 v4, 0x80000

    invoke-virtual {v3, v4, v5}, Lgnu/expr/Declaration;->setFlag(J)V

    .line 194
    .end local v1    # "value":Lgnu/expr/Expression;
    .end local v2    # "rexp":Lgnu/expr/ReferenceExp;
    .end local v3    # "context":Lgnu/expr/Declaration;
    :cond_2
    invoke-virtual {v0}, Lgnu/expr/Declaration;->nextDecl()Lgnu/expr/Declaration;

    move-result-object v0

    goto :goto_0

    .line 214
    :cond_3
    return-void
.end method

.method protected visitApplyExp(Lgnu/expr/ApplyExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 8
    .param p1, "exp"    # Lgnu/expr/ApplyExp;
    .param p2, "returnContinuation"    # Lgnu/expr/Expression;

    .line 49
    iget-object v0, p0, Lgnu/expr/FindTailCalls;->currentLambda:Lgnu/expr/LambdaExp;

    iget-object v0, v0, Lgnu/expr/LambdaExp;->body:Lgnu/expr/Expression;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p2, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 50
    .local v0, "inTailContext":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 51
    invoke-virtual {p1, v2}, Lgnu/expr/ApplyExp;->setTailCall(Z)V

    .line 52
    :cond_1
    iget-object v3, p0, Lgnu/expr/FindTailCalls;->currentLambda:Lgnu/expr/LambdaExp;

    iput-object v3, p1, Lgnu/expr/ApplyExp;->context:Lgnu/expr/LambdaExp;

    .line 53
    const/4 v3, 0x0

    .line 54
    .local v3, "lexp":Lgnu/expr/LambdaExp;
    const/4 v4, 0x0

    .line 55
    .local v4, "isAppendValues":Z
    iget-object v5, p1, Lgnu/expr/ApplyExp;->func:Lgnu/expr/Expression;

    instance-of v5, v5, Lgnu/expr/ReferenceExp;

    if-eqz v5, :cond_5

    .line 57
    iget-object v1, p1, Lgnu/expr/ApplyExp;->func:Lgnu/expr/Expression;

    check-cast v1, Lgnu/expr/ReferenceExp;

    .line 58
    .local v1, "func":Lgnu/expr/ReferenceExp;
    iget-object v2, v1, Lgnu/expr/ReferenceExp;->binding:Lgnu/expr/Declaration;

    invoke-static {v2}, Lgnu/expr/Declaration;->followAliases(Lgnu/expr/Declaration;)Lgnu/expr/Declaration;

    move-result-object v2

    .line 59
    .local v2, "binding":Lgnu/expr/Declaration;
    if-eqz v2, :cond_4

    .line 64
    const-wide/16 v5, 0x800

    invoke-virtual {v2, v5, v6}, Lgnu/expr/Declaration;->getFlag(J)Z

    move-result v5

    if-nez v5, :cond_2

    .line 66
    iget-object v5, v2, Lgnu/expr/Declaration;->firstCall:Lgnu/expr/ApplyExp;

    iput-object v5, p1, Lgnu/expr/ApplyExp;->nextCall:Lgnu/expr/ApplyExp;

    .line 67
    iput-object p1, v2, Lgnu/expr/Declaration;->firstCall:Lgnu/expr/ApplyExp;

    .line 69
    :cond_2
    invoke-virtual {p0}, Lgnu/expr/FindTailCalls;->getCompilation()Lgnu/expr/Compilation;

    move-result-object v5

    .line 70
    .local v5, "comp":Lgnu/expr/Compilation;
    invoke-virtual {v2}, Lgnu/expr/Declaration;->setCanCall()V

    .line 71
    iget-boolean v6, v5, Lgnu/expr/Compilation;->mustCompile:Z

    if-nez v6, :cond_3

    .line 73
    invoke-virtual {v2}, Lgnu/expr/Declaration;->setCanRead()V

    .line 74
    :cond_3
    invoke-virtual {v2}, Lgnu/expr/Declaration;->getValue()Lgnu/expr/Expression;

    move-result-object v6

    .line 75
    .local v6, "value":Lgnu/expr/Expression;
    instance-of v7, v6, Lgnu/expr/LambdaExp;

    if-eqz v7, :cond_4

    .line 76
    move-object v3, v6

    check-cast v3, Lgnu/expr/LambdaExp;

    .line 78
    .end local v1    # "func":Lgnu/expr/ReferenceExp;
    .end local v2    # "binding":Lgnu/expr/Declaration;
    .end local v5    # "comp":Lgnu/expr/Compilation;
    .end local v6    # "value":Lgnu/expr/Expression;
    :cond_4
    goto :goto_1

    .line 79
    :cond_5
    iget-object v5, p1, Lgnu/expr/ApplyExp;->func:Lgnu/expr/Expression;

    instance-of v5, v5, Lgnu/expr/LambdaExp;

    if-eqz v5, :cond_6

    iget-object v5, p1, Lgnu/expr/ApplyExp;->func:Lgnu/expr/Expression;

    instance-of v5, v5, Lgnu/expr/ClassExp;

    if-nez v5, :cond_6

    .line 82
    iget-object v5, p1, Lgnu/expr/ApplyExp;->func:Lgnu/expr/Expression;

    move-object v3, v5

    check-cast v3, Lgnu/expr/LambdaExp;

    .line 83
    invoke-virtual {p0, v3, v1}, Lgnu/expr/FindTailCalls;->visitLambdaExp(Lgnu/expr/LambdaExp;Z)V

    .line 84
    invoke-virtual {v3, v2}, Lgnu/expr/LambdaExp;->setCanCall(Z)V

    goto :goto_1

    .line 86
    :cond_6
    iget-object v1, p1, Lgnu/expr/ApplyExp;->func:Lgnu/expr/Expression;

    instance-of v1, v1, Lgnu/expr/QuoteExp;

    if-eqz v1, :cond_7

    iget-object v1, p1, Lgnu/expr/ApplyExp;->func:Lgnu/expr/Expression;

    check-cast v1, Lgnu/expr/QuoteExp;

    invoke-virtual {v1}, Lgnu/expr/QuoteExp;->getValue()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lgnu/kawa/functions/AppendValues;->appendValues:Lgnu/kawa/functions/AppendValues;

    if-ne v1, v2, :cond_7

    .line 89
    const/4 v4, 0x1

    goto :goto_1

    .line 92
    :cond_7
    iget-object v1, p1, Lgnu/expr/ApplyExp;->func:Lgnu/expr/Expression;

    iget-object v2, p1, Lgnu/expr/ApplyExp;->func:Lgnu/expr/Expression;

    invoke-virtual {p0, v1, v2}, Lgnu/expr/FindTailCalls;->visitExpression(Lgnu/expr/Expression;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v1

    iput-object v1, p1, Lgnu/expr/ApplyExp;->func:Lgnu/expr/Expression;

    .line 94
    :goto_1
    if-eqz v3, :cond_d

    .line 96
    iget-object v1, v3, Lgnu/expr/LambdaExp;->returnContinuation:Lgnu/expr/Expression;

    if-ne v1, p2, :cond_8

    goto :goto_2

    .line 97
    :cond_8
    iget-object v1, p0, Lgnu/expr/FindTailCalls;->currentLambda:Lgnu/expr/LambdaExp;

    if-ne v3, v1, :cond_9

    if-eqz v0, :cond_9

    .line 98
    goto :goto_2

    .line 99
    :cond_9
    if-eqz v0, :cond_b

    .line 101
    iget-object v1, v3, Lgnu/expr/LambdaExp;->tailCallers:Ljava/util/Set;

    if-nez v1, :cond_a

    .line 102
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, v3, Lgnu/expr/LambdaExp;->tailCallers:Ljava/util/Set;

    .line 103
    :cond_a
    iget-object v1, v3, Lgnu/expr/LambdaExp;->tailCallers:Ljava/util/Set;

    iget-object v2, p0, Lgnu/expr/FindTailCalls;->currentLambda:Lgnu/expr/LambdaExp;

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 105
    :cond_b
    iget-object v1, v3, Lgnu/expr/LambdaExp;->returnContinuation:Lgnu/expr/Expression;

    if-nez v1, :cond_c

    .line 107
    iput-object p2, v3, Lgnu/expr/LambdaExp;->returnContinuation:Lgnu/expr/Expression;

    .line 108
    iget-object v1, p0, Lgnu/expr/FindTailCalls;->currentLambda:Lgnu/expr/LambdaExp;

    iput-object v1, v3, Lgnu/expr/LambdaExp;->inlineHome:Lgnu/expr/LambdaExp;

    goto :goto_2

    .line 112
    :cond_c
    sget-object v1, Lgnu/expr/LambdaExp;->unknownContinuation:Lgnu/expr/ApplyExp;

    iput-object v1, v3, Lgnu/expr/LambdaExp;->returnContinuation:Lgnu/expr/Expression;

    .line 113
    const/4 v1, 0x0

    iput-object v1, v3, Lgnu/expr/LambdaExp;->inlineHome:Lgnu/expr/LambdaExp;

    .line 129
    :cond_d
    :goto_2
    iget-object v1, p1, Lgnu/expr/ApplyExp;->args:[Lgnu/expr/Expression;

    invoke-virtual {p0, v1}, Lgnu/expr/FindTailCalls;->visitExps([Lgnu/expr/Expression;)[Lgnu/expr/Expression;

    move-result-object v1

    iput-object v1, p1, Lgnu/expr/ApplyExp;->args:[Lgnu/expr/Expression;

    .line 130
    return-object p1
.end method

.method protected bridge synthetic visitApplyExp(Lgnu/expr/ApplyExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lgnu/expr/ApplyExp;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 22
    move-object v0, p2

    check-cast v0, Lgnu/expr/Expression;

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitApplyExp(Lgnu/expr/ApplyExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method protected visitBeginExp(Lgnu/expr/BeginExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 5
    .param p1, "exp"    # Lgnu/expr/BeginExp;
    .param p2, "returnContinuation"    # Lgnu/expr/Expression;

    .line 143
    iget v0, p1, Lgnu/expr/BeginExp;->length:I

    add-int/lit8 v0, v0, -0x1

    .line 144
    .local v0, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-gt v1, v0, :cond_1

    .line 145
    iget-object v2, p1, Lgnu/expr/BeginExp;->exps:[Lgnu/expr/Expression;

    iget-object v3, p1, Lgnu/expr/BeginExp;->exps:[Lgnu/expr/Expression;

    aget-object v3, v3, v1

    if-ne v1, v0, :cond_0

    move-object v4, p2

    goto :goto_1

    :cond_0
    iget-object v4, p1, Lgnu/expr/BeginExp;->exps:[Lgnu/expr/Expression;

    aget-object v4, v4, v1

    :goto_1
    invoke-virtual {v3, p0, v4}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgnu/expr/Expression;

    aput-object v3, v2, v1

    .line 144
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 146
    .end local v1    # "i":I
    :cond_1
    return-object p1
.end method

.method protected bridge synthetic visitBeginExp(Lgnu/expr/BeginExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lgnu/expr/BeginExp;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 22
    move-object v0, p2

    check-cast v0, Lgnu/expr/Expression;

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitBeginExp(Lgnu/expr/BeginExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method protected visitBlockExp(Lgnu/expr/BlockExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 2
    .param p1, "exp"    # Lgnu/expr/BlockExp;
    .param p2, "returnContinuation"    # Lgnu/expr/Expression;

    .line 135
    iget-object v0, p1, Lgnu/expr/BlockExp;->body:Lgnu/expr/Expression;

    invoke-virtual {v0, p0, p2}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgnu/expr/Expression;

    iput-object v0, p1, Lgnu/expr/BlockExp;->body:Lgnu/expr/Expression;

    .line 136
    iget-object v0, p1, Lgnu/expr/BlockExp;->exitBody:Lgnu/expr/Expression;

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p1, Lgnu/expr/BlockExp;->exitBody:Lgnu/expr/Expression;

    iget-object v1, p1, Lgnu/expr/BlockExp;->exitBody:Lgnu/expr/Expression;

    invoke-virtual {v0, p0, v1}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgnu/expr/Expression;

    iput-object v0, p1, Lgnu/expr/BlockExp;->exitBody:Lgnu/expr/Expression;

    .line 138
    :cond_0
    return-object p1
.end method

.method protected bridge synthetic visitBlockExp(Lgnu/expr/BlockExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lgnu/expr/BlockExp;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 22
    move-object v0, p2

    check-cast v0, Lgnu/expr/Expression;

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitBlockExp(Lgnu/expr/BlockExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method protected visitClassExp(Lgnu/expr/ClassExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 3
    .param p1, "exp"    # Lgnu/expr/ClassExp;
    .param p2, "returnContinuation"    # Lgnu/expr/Expression;

    .line 260
    iget-object v0, p0, Lgnu/expr/FindTailCalls;->currentLambda:Lgnu/expr/LambdaExp;

    .line 261
    .local v0, "parent":Lgnu/expr/LambdaExp;
    iput-object p1, p0, Lgnu/expr/FindTailCalls;->currentLambda:Lgnu/expr/LambdaExp;

    .line 264
    :try_start_0
    iget-object v1, p1, Lgnu/expr/ClassExp;->firstChild:Lgnu/expr/LambdaExp;

    .line 265
    .local v1, "child":Lgnu/expr/LambdaExp;
    :goto_0
    if-eqz v1, :cond_0

    iget-object v2, p0, Lgnu/expr/FindTailCalls;->exitValue:Ljava/lang/Object;

    if-nez v2, :cond_0

    .line 266
    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lgnu/expr/FindTailCalls;->visitLambdaExp(Lgnu/expr/LambdaExp;Z)V

    .line 265
    iget-object v2, v1, Lgnu/expr/LambdaExp;->nextSibling:Lgnu/expr/LambdaExp;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v1, v2

    goto :goto_0

    .line 270
    .end local v1    # "child":Lgnu/expr/LambdaExp;
    :cond_0
    iput-object v0, p0, Lgnu/expr/FindTailCalls;->currentLambda:Lgnu/expr/LambdaExp;

    .line 271
    nop

    .line 273
    return-object p1

    .line 270
    :catchall_0
    move-exception v1

    iput-object v0, p0, Lgnu/expr/FindTailCalls;->currentLambda:Lgnu/expr/LambdaExp;

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method protected bridge synthetic visitClassExp(Lgnu/expr/ClassExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lgnu/expr/ClassExp;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 22
    move-object v0, p2

    check-cast v0, Lgnu/expr/Expression;

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitClassExp(Lgnu/expr/ClassExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method protected visitExpression(Lgnu/expr/Expression;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/Expression;
    .param p2, "returnContinuation"    # Lgnu/expr/Expression;

    .line 33
    invoke-super {p0, p1, p1}, Lgnu/expr/ExpExpVisitor;->visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgnu/expr/Expression;

    return-object v0
.end method

.method protected bridge synthetic visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lgnu/expr/Expression;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 22
    move-object v0, p2

    check-cast v0, Lgnu/expr/Expression;

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitExpression(Lgnu/expr/Expression;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method public visitExps([Lgnu/expr/Expression;)[Lgnu/expr/Expression;
    .locals 4
    .param p1, "exps"    # [Lgnu/expr/Expression;

    .line 38
    array-length v0, p1

    .line 39
    .local v0, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 41
    aget-object v2, p1, v1

    .line 42
    .local v2, "expi":Lgnu/expr/Expression;
    invoke-virtual {p0, v2, v2}, Lgnu/expr/FindTailCalls;->visit(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgnu/expr/Expression;

    aput-object v3, p1, v1

    .line 39
    .end local v2    # "expi":Lgnu/expr/Expression;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 44
    .end local v1    # "i":I
    :cond_0
    return-object p1
.end method

.method protected visitFluidLetExp(Lgnu/expr/FluidLetExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 3
    .param p1, "exp"    # Lgnu/expr/FluidLetExp;
    .param p2, "returnContinuation"    # Lgnu/expr/Expression;

    .line 151
    invoke-virtual {p1}, Lgnu/expr/FluidLetExp;->firstDecl()Lgnu/expr/Declaration;

    move-result-object v0

    .line 152
    .local v0, "decl":Lgnu/expr/Declaration;
    :goto_0
    if-eqz v0, :cond_1

    .line 154
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lgnu/expr/Declaration;->setCanRead(Z)V

    .line 155
    iget-object v2, v0, Lgnu/expr/Declaration;->base:Lgnu/expr/Declaration;

    if-eqz v2, :cond_0

    .line 156
    iget-object v2, v0, Lgnu/expr/Declaration;->base:Lgnu/expr/Declaration;

    invoke-virtual {v2, v1}, Lgnu/expr/Declaration;->setCanRead(Z)V

    .line 152
    :cond_0
    invoke-virtual {v0}, Lgnu/expr/Declaration;->nextDecl()Lgnu/expr/Declaration;

    move-result-object v0

    goto :goto_0

    .line 158
    .end local v0    # "decl":Lgnu/expr/Declaration;
    :cond_1
    invoke-virtual {p0, p1}, Lgnu/expr/FindTailCalls;->visitLetDecls(Lgnu/expr/LetExp;)V

    .line 159
    iget-object v0, p1, Lgnu/expr/FluidLetExp;->body:Lgnu/expr/Expression;

    iget-object v1, p1, Lgnu/expr/FluidLetExp;->body:Lgnu/expr/Expression;

    invoke-virtual {v0, p0, v1}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgnu/expr/Expression;

    iput-object v0, p1, Lgnu/expr/FluidLetExp;->body:Lgnu/expr/Expression;

    .line 160
    invoke-virtual {p0, p1}, Lgnu/expr/FindTailCalls;->postVisitDecls(Lgnu/expr/ScopeExp;)V

    .line 161
    return-object p1
.end method

.method protected bridge synthetic visitFluidLetExp(Lgnu/expr/FluidLetExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lgnu/expr/FluidLetExp;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 22
    move-object v0, p2

    check-cast v0, Lgnu/expr/Expression;

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitFluidLetExp(Lgnu/expr/FluidLetExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method protected visitIfExp(Lgnu/expr/IfExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 2
    .param p1, "exp"    # Lgnu/expr/IfExp;
    .param p2, "returnContinuation"    # Lgnu/expr/Expression;

    .line 218
    iget-object v0, p1, Lgnu/expr/IfExp;->test:Lgnu/expr/Expression;

    iget-object v1, p1, Lgnu/expr/IfExp;->test:Lgnu/expr/Expression;

    invoke-virtual {v0, p0, v1}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgnu/expr/Expression;

    iput-object v0, p1, Lgnu/expr/IfExp;->test:Lgnu/expr/Expression;

    .line 219
    iget-object v0, p1, Lgnu/expr/IfExp;->then_clause:Lgnu/expr/Expression;

    invoke-virtual {v0, p0, p2}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgnu/expr/Expression;

    iput-object v0, p1, Lgnu/expr/IfExp;->then_clause:Lgnu/expr/Expression;

    .line 220
    iget-object v0, p1, Lgnu/expr/IfExp;->else_clause:Lgnu/expr/Expression;

    .line 221
    .local v0, "else_clause":Lgnu/expr/Expression;
    if-eqz v0, :cond_0

    .line 222
    invoke-virtual {v0, p0, p2}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgnu/expr/Expression;

    iput-object v1, p1, Lgnu/expr/IfExp;->else_clause:Lgnu/expr/Expression;

    .line 223
    :cond_0
    return-object p1
.end method

.method protected bridge synthetic visitIfExp(Lgnu/expr/IfExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lgnu/expr/IfExp;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 22
    move-object v0, p2

    check-cast v0, Lgnu/expr/Expression;

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitIfExp(Lgnu/expr/IfExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method protected visitLambdaExp(Lgnu/expr/LambdaExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/LambdaExp;
    .param p2, "returnContinuation"    # Lgnu/expr/Expression;

    .line 228
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitLambdaExp(Lgnu/expr/LambdaExp;Z)V

    .line 229
    return-object p1
.end method

.method protected bridge synthetic visitLambdaExp(Lgnu/expr/LambdaExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lgnu/expr/LambdaExp;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 22
    move-object v0, p2

    check-cast v0, Lgnu/expr/Expression;

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitLambdaExp(Lgnu/expr/LambdaExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method final visitLambdaExp(Lgnu/expr/LambdaExp;Z)V
    .locals 3
    .param p1, "exp"    # Lgnu/expr/LambdaExp;
    .param p2, "canRead"    # Z

    .line 234
    iget-object v0, p0, Lgnu/expr/FindTailCalls;->currentLambda:Lgnu/expr/LambdaExp;

    .line 235
    .local v0, "parent":Lgnu/expr/LambdaExp;
    iput-object p1, p0, Lgnu/expr/FindTailCalls;->currentLambda:Lgnu/expr/LambdaExp;

    .line 236
    if-eqz p2, :cond_0

    .line 237
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lgnu/expr/LambdaExp;->setCanRead(Z)V

    .line 240
    :cond_0
    :try_start_0
    iget-object v1, p1, Lgnu/expr/LambdaExp;->defaultArgs:[Lgnu/expr/Expression;

    if-eqz v1, :cond_1

    .line 241
    iget-object v1, p1, Lgnu/expr/LambdaExp;->defaultArgs:[Lgnu/expr/Expression;

    invoke-virtual {p0, v1}, Lgnu/expr/FindTailCalls;->visitExps([Lgnu/expr/Expression;)[Lgnu/expr/Expression;

    move-result-object v1

    iput-object v1, p1, Lgnu/expr/LambdaExp;->defaultArgs:[Lgnu/expr/Expression;

    .line 242
    :cond_1
    iget-object v1, p0, Lgnu/expr/FindTailCalls;->exitValue:Ljava/lang/Object;

    if-nez v1, :cond_3

    iget-object v1, p1, Lgnu/expr/LambdaExp;->body:Lgnu/expr/Expression;

    if-eqz v1, :cond_3

    .line 243
    iget-object v1, p1, Lgnu/expr/LambdaExp;->body:Lgnu/expr/Expression;

    invoke-virtual {p1}, Lgnu/expr/LambdaExp;->getInlineOnly()Z

    move-result v2

    if-eqz v2, :cond_2

    move-object v2, p1

    goto :goto_0

    :cond_2
    iget-object v2, p1, Lgnu/expr/LambdaExp;->body:Lgnu/expr/Expression;

    :goto_0
    invoke-virtual {v1, p0, v2}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgnu/expr/Expression;

    iput-object v1, p1, Lgnu/expr/LambdaExp;->body:Lgnu/expr/Expression;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 247
    :cond_3
    iput-object v0, p0, Lgnu/expr/FindTailCalls;->currentLambda:Lgnu/expr/LambdaExp;

    .line 248
    nop

    .line 250
    invoke-virtual {p0, p1}, Lgnu/expr/FindTailCalls;->postVisitDecls(Lgnu/expr/ScopeExp;)V

    .line 251
    return-void

    .line 247
    :catchall_0
    move-exception v1

    iput-object v0, p0, Lgnu/expr/FindTailCalls;->currentLambda:Lgnu/expr/LambdaExp;

    throw v1
.end method

.method visitLetDecls(Lgnu/expr/LetExp;)V
    .locals 6
    .param p1, "exp"    # Lgnu/expr/LetExp;

    .line 166
    invoke-virtual {p1}, Lgnu/expr/LetExp;->firstDecl()Lgnu/expr/Declaration;

    move-result-object v0

    .line 167
    .local v0, "decl":Lgnu/expr/Declaration;
    iget-object v1, p1, Lgnu/expr/LetExp;->inits:[Lgnu/expr/Expression;

    array-length v1, v1

    .line 168
    .local v1, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 170
    iget-object v3, p1, Lgnu/expr/LetExp;->inits:[Lgnu/expr/Expression;

    aget-object v3, v3, v2

    invoke-virtual {p0, v0, v3}, Lgnu/expr/FindTailCalls;->visitSetExp(Lgnu/expr/Declaration;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v3

    .line 172
    .local v3, "init":Lgnu/expr/Expression;
    sget-object v4, Lgnu/expr/QuoteExp;->undefined_exp:Lgnu/expr/QuoteExp;

    if-ne v3, v4, :cond_1

    .line 174
    invoke-virtual {v0}, Lgnu/expr/Declaration;->getValue()Lgnu/expr/Expression;

    move-result-object v4

    .line 175
    .local v4, "value":Lgnu/expr/Expression;
    instance-of v5, v4, Lgnu/expr/LambdaExp;

    if-nez v5, :cond_0

    if-eq v4, v3, :cond_1

    instance-of v5, v4, Lgnu/expr/QuoteExp;

    if-eqz v5, :cond_1

    .line 177
    :cond_0
    move-object v3, v4

    .line 179
    .end local v4    # "value":Lgnu/expr/Expression;
    :cond_1
    iget-object v4, p1, Lgnu/expr/LetExp;->inits:[Lgnu/expr/Expression;

    aput-object v3, v4, v2

    .line 168
    .end local v3    # "init":Lgnu/expr/Expression;
    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0}, Lgnu/expr/Declaration;->nextDecl()Lgnu/expr/Declaration;

    move-result-object v0

    goto :goto_0

    .line 181
    .end local v2    # "i":I
    :cond_2
    return-void
.end method

.method protected visitLetExp(Lgnu/expr/LetExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/LetExp;
    .param p2, "returnContinuation"    # Lgnu/expr/Expression;

    .line 185
    invoke-virtual {p0, p1}, Lgnu/expr/FindTailCalls;->visitLetDecls(Lgnu/expr/LetExp;)V

    .line 186
    iget-object v0, p1, Lgnu/expr/LetExp;->body:Lgnu/expr/Expression;

    invoke-virtual {v0, p0, p2}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgnu/expr/Expression;

    iput-object v0, p1, Lgnu/expr/LetExp;->body:Lgnu/expr/Expression;

    .line 187
    invoke-virtual {p0, p1}, Lgnu/expr/FindTailCalls;->postVisitDecls(Lgnu/expr/ScopeExp;)V

    .line 188
    return-object p1
.end method

.method protected bridge synthetic visitLetExp(Lgnu/expr/LetExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lgnu/expr/LetExp;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 22
    move-object v0, p2

    check-cast v0, Lgnu/expr/Expression;

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitLetExp(Lgnu/expr/LetExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method protected visitReferenceExp(Lgnu/expr/ReferenceExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 4
    .param p1, "exp"    # Lgnu/expr/ReferenceExp;
    .param p2, "returnContinuation"    # Lgnu/expr/Expression;

    .line 278
    iget-object v0, p1, Lgnu/expr/ReferenceExp;->binding:Lgnu/expr/Declaration;

    invoke-static {v0}, Lgnu/expr/Declaration;->followAliases(Lgnu/expr/Declaration;)Lgnu/expr/Declaration;

    move-result-object v0

    .line 279
    .local v0, "decl":Lgnu/expr/Declaration;
    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 285
    iget-object v2, v0, Lgnu/expr/Declaration;->type:Lgnu/bytecode/Type;

    .line 286
    .local v2, "type":Lgnu/bytecode/Type;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lgnu/bytecode/Type;->isVoid()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 287
    sget-object v1, Lgnu/expr/QuoteExp;->voidExp:Lgnu/expr/QuoteExp;

    return-object v1

    .line 288
    :cond_0
    invoke-virtual {v0, v1}, Lgnu/expr/Declaration;->setCanRead(Z)V

    .line 290
    .end local v2    # "type":Lgnu/bytecode/Type;
    :cond_1
    invoke-virtual {p1}, Lgnu/expr/ReferenceExp;->contextDecl()Lgnu/expr/Declaration;

    move-result-object v2

    .line 291
    .local v2, "ctx":Lgnu/expr/Declaration;
    if-eqz v2, :cond_2

    .line 292
    invoke-virtual {v2, v1}, Lgnu/expr/Declaration;->setCanRead(Z)V

    .line 293
    :cond_2
    return-object p1
.end method

.method protected bridge synthetic visitReferenceExp(Lgnu/expr/ReferenceExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lgnu/expr/ReferenceExp;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 22
    move-object v0, p2

    check-cast v0, Lgnu/expr/Expression;

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitReferenceExp(Lgnu/expr/ReferenceExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method final visitSetExp(Lgnu/expr/Declaration;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 2
    .param p1, "decl"    # Lgnu/expr/Declaration;
    .param p2, "value"    # Lgnu/expr/Expression;

    .line 298
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lgnu/expr/Declaration;->getValue()Lgnu/expr/Expression;

    move-result-object v0

    if-ne v0, p2, :cond_0

    instance-of v0, p2, Lgnu/expr/LambdaExp;

    if-eqz v0, :cond_0

    instance-of v0, p2, Lgnu/expr/ClassExp;

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lgnu/expr/Declaration;->isPublic()Z

    move-result v0

    if-nez v0, :cond_0

    .line 302
    move-object v0, p2

    check-cast v0, Lgnu/expr/LambdaExp;

    .line 303
    .local v0, "lexp":Lgnu/expr/LambdaExp;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lgnu/expr/FindTailCalls;->visitLambdaExp(Lgnu/expr/LambdaExp;Z)V

    .line 304
    return-object v0

    .line 307
    .end local v0    # "lexp":Lgnu/expr/LambdaExp;
    :cond_0
    invoke-virtual {p2, p0, p2}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgnu/expr/Expression;

    return-object v0
.end method

.method protected visitSetExp(Lgnu/expr/SetExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 4
    .param p1, "exp"    # Lgnu/expr/SetExp;
    .param p2, "returnContinuation"    # Lgnu/expr/Expression;

    .line 312
    iget-object v0, p1, Lgnu/expr/SetExp;->binding:Lgnu/expr/Declaration;

    .line 313
    .local v0, "decl":Lgnu/expr/Declaration;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lgnu/expr/Declaration;->isAlias()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 315
    invoke-virtual {p1}, Lgnu/expr/SetExp;->isDefining()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 317
    iget-object v1, p1, Lgnu/expr/SetExp;->new_value:Lgnu/expr/Expression;

    iget-object v2, p1, Lgnu/expr/SetExp;->new_value:Lgnu/expr/Expression;

    invoke-virtual {v1, p0, v2}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgnu/expr/Expression;

    iput-object v1, p1, Lgnu/expr/SetExp;->new_value:Lgnu/expr/Expression;

    .line 318
    return-object p1

    .line 320
    :cond_0
    invoke-static {v0}, Lgnu/expr/Declaration;->followAliases(Lgnu/expr/Declaration;)Lgnu/expr/Declaration;

    move-result-object v0

    .line 322
    :cond_1
    invoke-virtual {p1}, Lgnu/expr/SetExp;->contextDecl()Lgnu/expr/Declaration;

    move-result-object v1

    .line 323
    .local v1, "ctx":Lgnu/expr/Declaration;
    if-eqz v1, :cond_2

    .line 324
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lgnu/expr/Declaration;->setCanRead(Z)V

    .line 325
    :cond_2
    iget-object v2, p1, Lgnu/expr/SetExp;->new_value:Lgnu/expr/Expression;

    invoke-virtual {p0, v0, v2}, Lgnu/expr/FindTailCalls;->visitSetExp(Lgnu/expr/Declaration;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v2

    .line 326
    .local v2, "value":Lgnu/expr/Expression;
    if-eqz v0, :cond_4

    iget-object v3, v0, Lgnu/expr/Declaration;->context:Lgnu/expr/ScopeExp;

    instance-of v3, v3, Lgnu/expr/LetExp;

    if-eqz v3, :cond_4

    invoke-virtual {v0}, Lgnu/expr/Declaration;->getValue()Lgnu/expr/Expression;

    move-result-object v3

    if-ne v2, v3, :cond_4

    instance-of v3, v2, Lgnu/expr/LambdaExp;

    if-nez v3, :cond_3

    instance-of v3, v2, Lgnu/expr/QuoteExp;

    if-eqz v3, :cond_4

    .line 332
    :cond_3
    sget-object v3, Lgnu/expr/QuoteExp;->voidExp:Lgnu/expr/QuoteExp;

    return-object v3

    .line 334
    :cond_4
    iput-object v2, p1, Lgnu/expr/SetExp;->new_value:Lgnu/expr/Expression;

    .line 335
    return-object p1
.end method

.method protected bridge synthetic visitSetExp(Lgnu/expr/SetExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lgnu/expr/SetExp;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 22
    move-object v0, p2

    check-cast v0, Lgnu/expr/Expression;

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitSetExp(Lgnu/expr/SetExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method protected visitSynchronizedExp(Lgnu/expr/SynchronizedExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 2
    .param p1, "exp"    # Lgnu/expr/SynchronizedExp;
    .param p2, "returnContinuation"    # Lgnu/expr/Expression;

    .line 359
    iget-object v0, p1, Lgnu/expr/SynchronizedExp;->object:Lgnu/expr/Expression;

    iget-object v1, p1, Lgnu/expr/SynchronizedExp;->object:Lgnu/expr/Expression;

    invoke-virtual {v0, p0, v1}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgnu/expr/Expression;

    iput-object v0, p1, Lgnu/expr/SynchronizedExp;->object:Lgnu/expr/Expression;

    .line 360
    iget-object v0, p1, Lgnu/expr/SynchronizedExp;->body:Lgnu/expr/Expression;

    iget-object v1, p1, Lgnu/expr/SynchronizedExp;->body:Lgnu/expr/Expression;

    invoke-virtual {v0, p0, v1}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgnu/expr/Expression;

    iput-object v0, p1, Lgnu/expr/SynchronizedExp;->body:Lgnu/expr/Expression;

    .line 361
    return-object p1
.end method

.method protected bridge synthetic visitSynchronizedExp(Lgnu/expr/SynchronizedExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lgnu/expr/SynchronizedExp;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 22
    move-object v0, p2

    check-cast v0, Lgnu/expr/Expression;

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitSynchronizedExp(Lgnu/expr/SynchronizedExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method protected visitTryExp(Lgnu/expr/TryExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 4
    .param p1, "exp"    # Lgnu/expr/TryExp;
    .param p2, "returnContinuation"    # Lgnu/expr/Expression;

    .line 340
    iget-object v0, p1, Lgnu/expr/TryExp;->finally_clause:Lgnu/expr/Expression;

    if-nez v0, :cond_0

    move-object v0, p2

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lgnu/expr/TryExp;->try_clause:Lgnu/expr/Expression;

    .line 342
    .local v0, "tryContinuation":Lgnu/expr/Expression;
    :goto_0
    iget-object v1, p1, Lgnu/expr/TryExp;->try_clause:Lgnu/expr/Expression;

    invoke-virtual {v1, p0, v0}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgnu/expr/Expression;

    iput-object v1, p1, Lgnu/expr/TryExp;->try_clause:Lgnu/expr/Expression;

    .line 343
    iget-object v1, p1, Lgnu/expr/TryExp;->catch_clauses:Lgnu/expr/CatchClause;

    .line 344
    .local v1, "catch_clause":Lgnu/expr/CatchClause;
    :goto_1
    iget-object v2, p0, Lgnu/expr/FindTailCalls;->exitValue:Ljava/lang/Object;

    if-nez v2, :cond_2

    if-eqz v1, :cond_2

    .line 346
    iget-object v2, p1, Lgnu/expr/TryExp;->finally_clause:Lgnu/expr/Expression;

    if-nez v2, :cond_1

    move-object v2, p2

    goto :goto_2

    :cond_1
    iget-object v2, v1, Lgnu/expr/CatchClause;->body:Lgnu/expr/Expression;

    .line 348
    .local v2, "clauseContinuation":Lgnu/expr/Expression;
    :goto_2
    iget-object v3, v1, Lgnu/expr/CatchClause;->body:Lgnu/expr/Expression;

    invoke-virtual {v3, p0, v2}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgnu/expr/Expression;

    iput-object v3, v1, Lgnu/expr/CatchClause;->body:Lgnu/expr/Expression;

    .line 349
    invoke-virtual {v1}, Lgnu/expr/CatchClause;->getNext()Lgnu/expr/CatchClause;

    move-result-object v1

    .line 350
    .end local v2    # "clauseContinuation":Lgnu/expr/Expression;
    goto :goto_1

    .line 351
    :cond_2
    iget-object v2, p1, Lgnu/expr/TryExp;->finally_clause:Lgnu/expr/Expression;

    .line 352
    .local v2, "finally_clause":Lgnu/expr/Expression;
    if-eqz v2, :cond_3

    .line 353
    invoke-virtual {v2, p0, v2}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgnu/expr/Expression;

    iput-object v3, p1, Lgnu/expr/TryExp;->finally_clause:Lgnu/expr/Expression;

    .line 354
    :cond_3
    return-object p1
.end method

.method protected bridge synthetic visitTryExp(Lgnu/expr/TryExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lgnu/expr/TryExp;
    .param p2, "x1"    # Ljava/lang/Object;

    .line 22
    move-object v0, p2

    check-cast v0, Lgnu/expr/Expression;

    invoke-virtual {p0, p1, v0}, Lgnu/expr/FindTailCalls;->visitTryExp(Lgnu/expr/TryExp;Lgnu/expr/Expression;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method
