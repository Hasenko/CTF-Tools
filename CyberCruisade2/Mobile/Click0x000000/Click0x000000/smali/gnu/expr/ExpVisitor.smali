.class public Lgnu/expr/ExpVisitor;
.super Ljava/lang/Object;
.source "ExpVisitor.java"

# interfaces
.implements Lgnu/text/SourceLocator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        "D:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lgnu/text/SourceLocator;"
    }
.end annotation


# instance fields
.field comp:Lgnu/expr/Compilation;

.field protected currentLambda:Lgnu/expr/LambdaExp;

.field protected exitValue:Ljava/lang/Object;

.field protected messages:Lgnu/text/SourceMessages;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    const/4 v0, 0x0

    iput-object v0, p0, Lgnu/expr/ExpVisitor;->currentLambda:Lgnu/expr/LambdaExp;

    .line 153
    iput-object v0, p0, Lgnu/expr/ExpVisitor;->exitValue:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected defaultValue(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "r"    # Lgnu/expr/Expression;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/Expression;",
            "TD;)TR;"
        }
    .end annotation

    .line 22
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public error(CLjava/lang/String;)V
    .locals 3
    .param p1, "kind"    # C
    .param p2, "message"    # Ljava/lang/String;

    .line 186
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    const/16 v0, 0x77

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lgnu/expr/ExpVisitor;->comp:Lgnu/expr/Compilation;

    invoke-virtual {v0}, Lgnu/expr/Compilation;->warnAsError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 187
    const/16 p1, 0x65

    .line 188
    :cond_0
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    if-eqz v0, :cond_1

    .line 189
    invoke-virtual {v0, p1, p2}, Lgnu/text/SourceMessages;->error(CLjava/lang/String;)V

    goto :goto_0

    .line 191
    :cond_1
    new-instance v0, Ljava/lang/Error;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "internal error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    .line 192
    :goto_0
    return-void
.end method

.method public final getColumnNumber()I
    .locals 1

    .line 203
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    invoke-virtual {v0}, Lgnu/text/SourceMessages;->getColumnNumber()I

    move-result v0

    return v0
.end method

.method public getCompilation()Lgnu/expr/Compilation;
    .locals 1

    .line 16
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->comp:Lgnu/expr/Compilation;

    return-object v0
.end method

.method public final getCurrentLambda()Lgnu/expr/LambdaExp;
    .locals 1

    .line 157
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->currentLambda:Lgnu/expr/LambdaExp;

    return-object v0
.end method

.method public getExitValue()Ljava/lang/Object;
    .locals 1

    .line 155
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->exitValue:Ljava/lang/Object;

    return-object v0
.end method

.method public final getFileName()Ljava/lang/String;
    .locals 1

    .line 201
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    invoke-virtual {v0}, Lgnu/text/SourceMessages;->getFileName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getLineNumber()I
    .locals 1

    .line 202
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    invoke-virtual {v0}, Lgnu/text/SourceMessages;->getLineNumber()I

    move-result v0

    return v0
.end method

.method public getMessages()Lgnu/text/SourceMessages;
    .locals 1

    .line 18
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    return-object v0
.end method

.method public getPublicId()Ljava/lang/String;
    .locals 1

    .line 204
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    invoke-virtual {v0}, Lgnu/text/SourceMessages;->getPublicId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSystemId()Ljava/lang/String;
    .locals 1

    .line 205
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    invoke-virtual {v0}, Lgnu/text/SourceMessages;->getSystemId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isStableSourceLocation()Z
    .locals 1

    .line 208
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public noteError(Ljava/lang/String;)Lgnu/expr/Expression;
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .line 196
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    if-eqz v0, :cond_0

    .line 197
    const/16 v1, 0x65

    invoke-virtual {v0, v1, p1}, Lgnu/text/SourceMessages;->error(CLjava/lang/String;)V

    .line 198
    :cond_0
    new-instance v0, Lgnu/expr/ErrorExp;

    invoke-direct {v0, p1}, Lgnu/expr/ErrorExp;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public setColumn(I)V
    .locals 1
    .param p1, "column"    # I

    .line 212
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    invoke-virtual {v0, p1}, Lgnu/text/SourceMessages;->setColumn(I)V

    return-void
.end method

.method public setContext(Lgnu/expr/Compilation;)V
    .locals 1
    .param p1, "comp"    # Lgnu/expr/Compilation;

    .line 33
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iput-object p1, p0, Lgnu/expr/ExpVisitor;->comp:Lgnu/expr/Compilation;

    .line 34
    invoke-virtual {p1}, Lgnu/expr/Compilation;->getMessages()Lgnu/text/SourceMessages;

    move-result-object v0

    iput-object v0, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    .line 35
    return-void
.end method

.method public setFile(Ljava/lang/String;)V
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;

    .line 210
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    invoke-virtual {v0, p1}, Lgnu/text/SourceMessages;->setFile(Ljava/lang/String;)V

    return-void
.end method

.method public setLine(I)V
    .locals 1
    .param p1, "line"    # I

    .line 211
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    invoke-virtual {v0, p1}, Lgnu/text/SourceMessages;->setLine(I)V

    return-void
.end method

.method public setLine(Ljava/lang/String;II)V
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "line"    # I
    .param p3, "column"    # I

    .line 216
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    invoke-virtual {v0, p1, p2, p3}, Lgnu/text/SourceMessages;->setLine(Ljava/lang/String;II)V

    .line 217
    return-void
.end method

.method protected update(Lgnu/expr/Expression;Ljava/lang/Object;)Lgnu/expr/Expression;
    .locals 0
    .param p1, "exp"    # Lgnu/expr/Expression;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/Expression;",
            "TR;)",
            "Lgnu/expr/Expression;"
        }
    .end annotation

    .line 60
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "r":Ljava/lang/Object;, "TR;"
    return-object p1
.end method

.method public visit(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "exp"    # Lgnu/expr/Expression;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/Expression;",
            "TD;)TR;"
        }
    .end annotation

    .line 44
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p1}, Lgnu/expr/Expression;->getLineNumber()I

    move-result v0

    .line 45
    .local v0, "line":I
    iget-object v1, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    if-eqz v1, :cond_0

    if-lez v0, :cond_0

    .line 47
    invoke-virtual {v1}, Lgnu/text/SourceMessages;->getFileName()Ljava/lang/String;

    move-result-object v1

    .line 48
    .local v1, "saveFile":Ljava/lang/String;
    iget-object v2, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    invoke-virtual {v2}, Lgnu/text/SourceMessages;->getLineNumber()I

    move-result v2

    .line 49
    .local v2, "saveLine":I
    iget-object v3, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    invoke-virtual {v3}, Lgnu/text/SourceMessages;->getColumnNumber()I

    move-result v3

    .line 50
    .local v3, "saveColumn":I
    iget-object v4, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    invoke-virtual {p1}, Lgnu/expr/Expression;->getFileName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lgnu/expr/Expression;->getColumnNumber()I

    move-result v6

    invoke-virtual {v4, v5, v0, v6}, Lgnu/text/SourceMessages;->setLine(Ljava/lang/String;II)V

    .line 51
    invoke-virtual {p1, p0, p2}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 52
    .local v4, "ret":Ljava/lang/Object;, "TR;"
    iget-object v5, p0, Lgnu/expr/ExpVisitor;->messages:Lgnu/text/SourceMessages;

    invoke-virtual {v5, v1, v2, v3}, Lgnu/text/SourceMessages;->setLine(Ljava/lang/String;II)V

    .line 53
    return-object v4

    .line 55
    .end local v1    # "saveFile":Ljava/lang/String;
    .end local v2    # "saveLine":I
    .end local v3    # "saveColumn":I
    .end local v4    # "ret":Ljava/lang/Object;, "TR;"
    :cond_0
    invoke-virtual {p1, p0, p2}, Lgnu/expr/Expression;->visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public visitAndUpdate(Lgnu/expr/Expression;Ljava/lang/Object;)Lgnu/expr/Expression;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/Expression;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/Expression;",
            "TD;)",
            "Lgnu/expr/Expression;"
        }
    .end annotation

    .line 161
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visit(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lgnu/expr/ExpVisitor;->update(Lgnu/expr/Expression;Ljava/lang/Object;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method protected visitApplyExp(Lgnu/expr/ApplyExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/ApplyExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/ApplyExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 65
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitBeginExp(Lgnu/expr/BeginExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/BeginExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/BeginExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 133
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitBlockExp(Lgnu/expr/BlockExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/BlockExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/BlockExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 141
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitClassExp(Lgnu/expr/ClassExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/ClassExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/ClassExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 101
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitLambdaExp(Lgnu/expr/LambdaExp;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected final visitDeclarationType(Lgnu/expr/Declaration;)V
    .locals 2
    .param p1, "decl"    # Lgnu/expr/Declaration;

    .line 75
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    iget-object v0, p1, Lgnu/expr/Declaration;->typeExp:Lgnu/expr/Expression;

    .line 76
    .local v0, "texp1":Lgnu/expr/Expression;
    if-eqz v0, :cond_0

    .line 78
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lgnu/expr/ExpVisitor;->visitAndUpdate(Lgnu/expr/Expression;Ljava/lang/Object;)Lgnu/expr/Expression;

    move-result-object v1

    .line 79
    .local v1, "texp2":Lgnu/expr/Expression;
    if-eq v1, v0, :cond_0

    .line 80
    invoke-virtual {p1, v1}, Lgnu/expr/Declaration;->setTypeExp(Lgnu/expr/Expression;)V

    .line 82
    .end local v1    # "texp2":Lgnu/expr/Expression;
    :cond_0
    return-void
.end method

.method protected final visitDeclarationTypes(Lgnu/expr/ScopeExp;)V
    .locals 1
    .param p1, "exp"    # Lgnu/expr/ScopeExp;

    .line 86
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    invoke-virtual {p1}, Lgnu/expr/ScopeExp;->firstDecl()Lgnu/expr/Declaration;

    move-result-object v0

    .local v0, "decl":Lgnu/expr/Declaration;
    :goto_0
    if-eqz v0, :cond_0

    .line 89
    invoke-virtual {p0, v0}, Lgnu/expr/ExpVisitor;->visitDeclarationType(Lgnu/expr/Declaration;)V

    .line 87
    invoke-virtual {v0}, Lgnu/expr/Declaration;->nextDecl()Lgnu/expr/Declaration;

    move-result-object v0

    goto :goto_0

    .line 91
    .end local v0    # "decl":Lgnu/expr/Declaration;
    :cond_0
    return-void
.end method

.method public visitDefaultArgs(Lgnu/expr/LambdaExp;Ljava/lang/Object;)V
    .locals 1
    .param p1, "exp"    # Lgnu/expr/LambdaExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/LambdaExp;",
            "TD;)V"
        }
    .end annotation

    .line 181
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    iget-object v0, p1, Lgnu/expr/LambdaExp;->defaultArgs:[Lgnu/expr/Expression;

    invoke-virtual {p0, v0, p2}, Lgnu/expr/ExpVisitor;->visitExps([Lgnu/expr/Expression;Ljava/lang/Object;)[Lgnu/expr/Expression;

    move-result-object v0

    iput-object v0, p1, Lgnu/expr/LambdaExp;->defaultArgs:[Lgnu/expr/Expression;

    .line 182
    return-void
.end method

.method protected visitExitExp(Lgnu/expr/ExitExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/ExitExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/ExitExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 142
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/Expression;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/Expression;",
            "TD;)TR;"
        }
    .end annotation

    .line 27
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p1, p0, p2}, Lgnu/expr/Expression;->visitChildren(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)V

    .line 28
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->defaultValue(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public visitExps([Lgnu/expr/Expression;ILjava/lang/Object;)[Lgnu/expr/Expression;
    .locals 2
    .param p1, "exps"    # [Lgnu/expr/Expression;
    .param p2, "n"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lgnu/expr/Expression;",
            "ITD;)[",
            "Lgnu/expr/Expression;"
        }
    .end annotation

    .line 174
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p3, "d":Ljava/lang/Object;, "TD;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p2, :cond_0

    iget-object v1, p0, Lgnu/expr/ExpVisitor;->exitValue:Ljava/lang/Object;

    if-nez v1, :cond_0

    .line 175
    aget-object v1, p1, v0

    invoke-virtual {p0, v1, p3}, Lgnu/expr/ExpVisitor;->visitAndUpdate(Lgnu/expr/Expression;Ljava/lang/Object;)Lgnu/expr/Expression;

    move-result-object v1

    aput-object v1, p1, v0

    .line 174
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 176
    .end local v0    # "i":I
    :cond_0
    return-object p1
.end method

.method public visitExps([Lgnu/expr/Expression;Ljava/lang/Object;)[Lgnu/expr/Expression;
    .locals 1
    .param p1, "exps"    # [Lgnu/expr/Expression;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lgnu/expr/Expression;",
            "TD;)[",
            "Lgnu/expr/Expression;"
        }
    .end annotation

    .line 166
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    array-length v0, p1

    invoke-virtual {p0, p1, v0, p2}, Lgnu/expr/ExpVisitor;->visitExps([Lgnu/expr/Expression;ILjava/lang/Object;)[Lgnu/expr/Expression;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method protected visitFluidLetExp(Lgnu/expr/FluidLetExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/FluidLetExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/FluidLetExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 145
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitLetExp(Lgnu/expr/LetExp;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitIfExp(Lgnu/expr/IfExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/IfExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/IfExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 70
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitLambdaExp(Lgnu/expr/LambdaExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/LambdaExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/LambdaExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 100
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitScopeExp(Lgnu/expr/ScopeExp;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitLangExp(Lgnu/expr/LangExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/LangExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/LangExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 148
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitLetExp(Lgnu/expr/LetExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/LetExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/LetExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 99
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitScopeExp(Lgnu/expr/ScopeExp;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitModuleExp(Lgnu/expr/ModuleExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/ModuleExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/ModuleExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 103
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitLambdaExp(Lgnu/expr/LambdaExp;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitObjectExp(Lgnu/expr/ObjectExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/ObjectExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/ObjectExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 102
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitClassExp(Lgnu/expr/ClassExp;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitQuoteExp(Lgnu/expr/QuoteExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/QuoteExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/QuoteExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 134
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitReferenceExp(Lgnu/expr/ReferenceExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/ReferenceExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/ReferenceExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 136
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitScopeExp(Lgnu/expr/ScopeExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/ScopeExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/ScopeExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 95
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1}, Lgnu/expr/ExpVisitor;->visitDeclarationTypes(Lgnu/expr/ScopeExp;)V

    .line 96
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitSetExp(Lgnu/expr/SetExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "exp"    # Lgnu/expr/SetExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/SetExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 112
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    iget-object v0, p1, Lgnu/expr/SetExp;->binding:Lgnu/expr/Declaration;

    .line 113
    .local v0, "decl":Lgnu/expr/Declaration;
    if-eqz v0, :cond_0

    iget-object v1, v0, Lgnu/expr/Declaration;->value:Lgnu/expr/Expression;

    iget-object v2, p1, Lgnu/expr/SetExp;->new_value:Lgnu/expr/Expression;

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 114
    .local v1, "updateNeeded":Z
    :goto_0
    iget-object v2, p1, Lgnu/expr/SetExp;->new_value:Lgnu/expr/Expression;

    invoke-virtual {p1}, Lgnu/expr/SetExp;->getBinding()Lgnu/expr/Declaration;

    move-result-object v3

    invoke-virtual {p0, v2, p2, v3}, Lgnu/expr/ExpVisitor;->visitSetExpValue(Lgnu/expr/Expression;Ljava/lang/Object;Lgnu/expr/Declaration;)Lgnu/expr/Expression;

    move-result-object v2

    iput-object v2, p1, Lgnu/expr/SetExp;->new_value:Lgnu/expr/Expression;

    .line 122
    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lgnu/expr/SetExp;->isDefining()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 124
    iget-object v2, p1, Lgnu/expr/SetExp;->new_value:Lgnu/expr/Expression;

    iput-object v2, v0, Lgnu/expr/Declaration;->value:Lgnu/expr/Expression;

    .line 125
    iget-object v2, p1, Lgnu/expr/SetExp;->new_value:Lgnu/expr/Expression;

    instance-of v2, v2, Lgnu/expr/LambdaExp;

    if-eqz v2, :cond_1

    .line 126
    iget-object v2, p1, Lgnu/expr/SetExp;->new_value:Lgnu/expr/Expression;

    check-cast v2, Lgnu/expr/LambdaExp;

    iput-object v0, v2, Lgnu/expr/LambdaExp;->nameDecl:Lgnu/expr/Declaration;

    .line 128
    :cond_1
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->defaultValue(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method protected visitSetExpValue(Lgnu/expr/Expression;Ljava/lang/Object;Lgnu/expr/Declaration;)Lgnu/expr/Expression;
    .locals 1
    .param p1, "new_value"    # Lgnu/expr/Expression;
    .param p3, "decl"    # Lgnu/expr/Declaration;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/Expression;",
            "TD;",
            "Lgnu/expr/Declaration;",
            ")",
            "Lgnu/expr/Expression;"
        }
    .end annotation

    .line 107
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitAndUpdate(Lgnu/expr/Expression;Ljava/lang/Object;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method protected visitSynchronizedExp(Lgnu/expr/SynchronizedExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/SynchronizedExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/SynchronizedExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 139
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitThisExp(Lgnu/expr/ThisExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/ThisExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/ThisExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 137
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitReferenceExp(Lgnu/expr/ReferenceExp;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitTryExp(Lgnu/expr/TryExp;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "exp"    # Lgnu/expr/TryExp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/expr/TryExp;",
            "TD;)TR;"
        }
    .end annotation

    .line 132
    .local p0, "this":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ExpVisitor;->visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
