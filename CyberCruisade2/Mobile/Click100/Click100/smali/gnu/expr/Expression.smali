.class public abstract Lgnu/expr/Expression;
.super Lgnu/mapping/Procedure0;
.source "Expression.java"

# interfaces
.implements Lgnu/text/Printable;
.implements Lgnu/text/SourceLocator;


# static fields
.field protected static final NEXT_AVAIL_FLAG:I = 0x2

.field public static final VALIDATED:I = 0x1

.field public static final noExpressions:[Lgnu/expr/Expression;


# instance fields
.field filename:Ljava/lang/String;

.field protected flags:I

.field position:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 268
    const/4 v0, 0x0

    new-array v0, v0, [Lgnu/expr/Expression;

    sput-object v0, Lgnu/expr/Expression;->noExpressions:[Lgnu/expr/Expression;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Lgnu/mapping/Procedure0;-><init>()V

    return-void
.end method

.method public static compileButFirst(Lgnu/expr/Expression;Lgnu/expr/Compilation;)V
    .locals 6
    .param p0, "exp"    # Lgnu/expr/Expression;
    .param p1, "comp"    # Lgnu/expr/Compilation;

    .line 184
    instance-of v0, p0, Lgnu/expr/BeginExp;

    if-eqz v0, :cond_1

    .line 186
    move-object v0, p0

    check-cast v0, Lgnu/expr/BeginExp;

    .line 187
    .local v0, "bexp":Lgnu/expr/BeginExp;
    iget v1, v0, Lgnu/expr/BeginExp;->length:I

    .line 188
    .local v1, "n":I
    if-nez v1, :cond_0

    .line 189
    return-void

    .line 190
    :cond_0
    iget-object v2, v0, Lgnu/expr/BeginExp;->exps:[Lgnu/expr/Expression;

    .line 191
    .local v2, "exps":[Lgnu/expr/Expression;
    const/4 v3, 0x0

    aget-object v3, v2, v3

    invoke-static {v3, p1}, Lgnu/expr/Expression;->compileButFirst(Lgnu/expr/Expression;Lgnu/expr/Compilation;)V

    .line 192
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_1

    .line 193
    aget-object v4, v2, v3

    sget-object v5, Lgnu/expr/Target;->Ignore:Lgnu/expr/Target;

    invoke-virtual {v4, p1, v5}, Lgnu/expr/Expression;->compileWithPosition(Lgnu/expr/Compilation;Lgnu/expr/Target;)V

    .line 192
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 195
    .end local v0    # "bexp":Lgnu/expr/BeginExp;
    .end local v1    # "n":I
    .end local v2    # "exps":[Lgnu/expr/Expression;
    .end local v3    # "i":I
    :cond_1
    return-void
.end method

.method protected static deepCopy(Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 1
    .param p0, "exp"    # Lgnu/expr/Expression;

    .line 234
    new-instance v0, Lgnu/kawa/util/IdentityHashTable;

    invoke-direct {v0}, Lgnu/kawa/util/IdentityHashTable;-><init>()V

    invoke-static {p0, v0}, Lgnu/expr/Expression;->deepCopy(Lgnu/expr/Expression;Lgnu/kawa/util/IdentityHashTable;)Lgnu/expr/Expression;

    move-result-object v0

    return-object v0
.end method

.method public static deepCopy(Lgnu/expr/Expression;Lgnu/kawa/util/IdentityHashTable;)Lgnu/expr/Expression;
    .locals 2
    .param p0, "exp"    # Lgnu/expr/Expression;
    .param p1, "mapper"    # Lgnu/kawa/util/IdentityHashTable;

    .line 205
    if-nez p0, :cond_0

    .line 206
    const/4 v0, 0x0

    return-object v0

    .line 207
    :cond_0
    invoke-virtual {p1, p0}, Lgnu/kawa/util/IdentityHashTable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 208
    .local v0, "tr":Ljava/lang/Object;
    if-eqz v0, :cond_1

    move-object v1, v0

    check-cast v1, Lgnu/expr/Expression;

    return-object v1

    .line 209
    :cond_1
    invoke-virtual {p0, p1}, Lgnu/expr/Expression;->deepCopy(Lgnu/kawa/util/IdentityHashTable;)Lgnu/expr/Expression;

    move-result-object v1

    .line 210
    .local v1, "copy":Lgnu/expr/Expression;
    invoke-virtual {p1, p0, v1}, Lgnu/kawa/util/IdentityHashTable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    return-object v1
.end method

.method public static deepCopy([Lgnu/expr/Expression;Lgnu/kawa/util/IdentityHashTable;)[Lgnu/expr/Expression;
    .locals 6
    .param p0, "exps"    # [Lgnu/expr/Expression;
    .param p1, "mapper"    # Lgnu/kawa/util/IdentityHashTable;

    .line 217
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 218
    return-object v0

    .line 219
    :cond_0
    array-length v1, p0

    .line 220
    .local v1, "nargs":I
    new-array v2, v1, [Lgnu/expr/Expression;

    .line 221
    .local v2, "a":[Lgnu/expr/Expression;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_2

    .line 223
    aget-object v4, p0, v3

    .line 224
    .local v4, "ei":Lgnu/expr/Expression;
    invoke-static {v4, p1}, Lgnu/expr/Expression;->deepCopy(Lgnu/expr/Expression;Lgnu/kawa/util/IdentityHashTable;)Lgnu/expr/Expression;

    move-result-object v5

    .line 225
    .local v5, "ai":Lgnu/expr/Expression;
    if-nez v5, :cond_1

    if-eqz v4, :cond_1

    .line 226
    return-object v0

    .line 227
    :cond_1
    aput-object v5, v2, v3

    .line 221
    .end local v4    # "ei":Lgnu/expr/Expression;
    .end local v5    # "ai":Lgnu/expr/Expression;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 229
    .end local v3    # "i":I
    :cond_2
    return-object v2
.end method

.method public static makeWhile(Ljava/lang/Object;Ljava/lang/Object;Lgnu/expr/Compilation;)Lgnu/expr/Expression;
    .locals 11
    .param p0, "cond"    # Ljava/lang/Object;
    .param p1, "body"    # Ljava/lang/Object;
    .param p2, "parser"    # Lgnu/expr/Compilation;

    .line 273
    const/4 v0, 0x1

    new-array v0, v0, [Lgnu/expr/Expression;

    .line 274
    .local v0, "inits":[Lgnu/expr/Expression;
    new-instance v1, Lgnu/expr/LetExp;

    invoke-direct {v1, v0}, Lgnu/expr/LetExp;-><init>([Lgnu/expr/Expression;)V

    .line 275
    .local v1, "let":Lgnu/expr/LetExp;
    const-string v2, "%do%loop"

    .line 276
    .local v2, "fname":Ljava/lang/String;
    invoke-virtual {v1, v2}, Lgnu/expr/LetExp;->addDeclaration(Ljava/lang/Object;)Lgnu/expr/Declaration;

    move-result-object v3

    .line 277
    .local v3, "fdecl":Lgnu/expr/Declaration;
    new-instance v4, Lgnu/expr/ApplyExp;

    new-instance v5, Lgnu/expr/ReferenceExp;

    invoke-direct {v5, v3}, Lgnu/expr/ReferenceExp;-><init>(Lgnu/expr/Declaration;)V

    sget-object v6, Lgnu/expr/Expression;->noExpressions:[Lgnu/expr/Expression;

    invoke-direct {v4, v5, v6}, Lgnu/expr/ApplyExp;-><init>(Lgnu/expr/Expression;[Lgnu/expr/Expression;)V

    .line 278
    .local v4, "recurse":Lgnu/expr/Expression;
    new-instance v5, Lgnu/expr/LambdaExp;

    invoke-direct {v5}, Lgnu/expr/LambdaExp;-><init>()V

    .line 279
    .local v5, "lexp":Lgnu/expr/LambdaExp;
    invoke-virtual {p2, v5}, Lgnu/expr/Compilation;->push(Lgnu/expr/ScopeExp;)V

    .line 280
    new-instance v7, Lgnu/expr/IfExp;

    invoke-virtual {p2, p0}, Lgnu/expr/Compilation;->parse(Ljava/lang/Object;)Lgnu/expr/Expression;

    move-result-object v8

    new-instance v9, Lgnu/expr/BeginExp;

    invoke-virtual {p2, p1}, Lgnu/expr/Compilation;->parse(Ljava/lang/Object;)Lgnu/expr/Expression;

    move-result-object v10

    invoke-direct {v9, v10, v4}, Lgnu/expr/BeginExp;-><init>(Lgnu/expr/Expression;Lgnu/expr/Expression;)V

    sget-object v10, Lgnu/expr/QuoteExp;->voidExp:Lgnu/expr/QuoteExp;

    invoke-direct {v7, v8, v9, v10}, Lgnu/expr/IfExp;-><init>(Lgnu/expr/Expression;Lgnu/expr/Expression;Lgnu/expr/Expression;)V

    iput-object v7, v5, Lgnu/expr/LambdaExp;->body:Lgnu/expr/Expression;

    .line 283
    invoke-virtual {v5, v2}, Lgnu/expr/LambdaExp;->setName(Ljava/lang/String;)V

    .line 284
    invoke-virtual {p2, v5}, Lgnu/expr/Compilation;->pop(Lgnu/expr/ScopeExp;)V

    .line 285
    const/4 v7, 0x0

    aput-object v5, v0, v7

    .line 286
    invoke-virtual {v3, v5}, Lgnu/expr/Declaration;->noteValue(Lgnu/expr/Expression;)V

    .line 287
    new-instance v7, Lgnu/expr/ApplyExp;

    new-instance v8, Lgnu/expr/ReferenceExp;

    invoke-direct {v8, v3}, Lgnu/expr/ReferenceExp;-><init>(Lgnu/expr/Declaration;)V

    invoke-direct {v7, v8, v6}, Lgnu/expr/ApplyExp;-><init>(Lgnu/expr/Expression;[Lgnu/expr/Expression;)V

    invoke-virtual {v1, v7}, Lgnu/expr/LetExp;->setBody(Lgnu/expr/Expression;)V

    .line 288
    return-object v1
.end method


# virtual methods
.method public apply(Lgnu/mapping/CallContext;)V
    .locals 3
    .param p1, "ctx"    # Lgnu/mapping/CallContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 72
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "internal error - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".eval called"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final apply0()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 60
    invoke-static {}, Lgnu/mapping/CallContext;->getInstance()Lgnu/mapping/CallContext;

    move-result-object v0

    .line 61
    .local v0, "ctx":Lgnu/mapping/CallContext;
    invoke-virtual {p0, v0}, Lgnu/expr/Expression;->check0(Lgnu/mapping/CallContext;)V

    .line 62
    invoke-virtual {v0}, Lgnu/mapping/CallContext;->runUntilValue()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public final compile(Lgnu/expr/Compilation;Lgnu/bytecode/Type;)V
    .locals 1
    .param p1, "comp"    # Lgnu/expr/Compilation;
    .param p2, "type"    # Lgnu/bytecode/Type;

    .line 166
    invoke-static {p2}, Lgnu/expr/StackTarget;->getInstance(Lgnu/bytecode/Type;)Lgnu/expr/Target;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lgnu/expr/Expression;->compile(Lgnu/expr/Compilation;Lgnu/expr/Target;)V

    .line 167
    return-void
.end method

.method public final compile(Lgnu/expr/Compilation;Lgnu/expr/Declaration;)V
    .locals 1
    .param p1, "comp"    # Lgnu/expr/Compilation;
    .param p2, "lhs"    # Lgnu/expr/Declaration;

    .line 176
    invoke-static {p2}, Lgnu/expr/CheckedTarget;->getInstance(Lgnu/expr/Declaration;)Lgnu/expr/Target;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lgnu/expr/Expression;->compile(Lgnu/expr/Compilation;Lgnu/expr/Target;)V

    .line 177
    return-void
.end method

.method public abstract compile(Lgnu/expr/Compilation;Lgnu/expr/Target;)V
.end method

.method public final compileNotePosition(Lgnu/expr/Compilation;Lgnu/expr/Target;Lgnu/expr/Expression;)V
    .locals 3
    .param p1, "comp"    # Lgnu/expr/Compilation;
    .param p2, "target"    # Lgnu/expr/Target;
    .param p3, "position"    # Lgnu/expr/Expression;

    .line 152
    invoke-virtual {p1}, Lgnu/expr/Compilation;->getFileName()Ljava/lang/String;

    move-result-object v0

    .line 153
    .local v0, "saveFilename":Ljava/lang/String;
    invoke-virtual {p1}, Lgnu/expr/Compilation;->getLineNumber()I

    move-result v1

    .line 154
    .local v1, "saveLine":I
    invoke-virtual {p1}, Lgnu/expr/Compilation;->getColumnNumber()I

    move-result v2

    .line 155
    .local v2, "saveColumn":I
    invoke-virtual {p1, p3}, Lgnu/expr/Compilation;->setLine(Lgnu/expr/Expression;)V

    .line 156
    invoke-virtual {p0, p1, p2}, Lgnu/expr/Expression;->compile(Lgnu/expr/Compilation;Lgnu/expr/Target;)V

    .line 160
    invoke-virtual {p1, v0, v1, v2}, Lgnu/expr/Compilation;->setLine(Ljava/lang/String;II)V

    .line 161
    return-void
.end method

.method public final compileWithPosition(Lgnu/expr/Compilation;Lgnu/expr/Target;)V
    .locals 3
    .param p1, "comp"    # Lgnu/expr/Compilation;
    .param p2, "target"    # Lgnu/expr/Target;

    .line 123
    invoke-virtual {p0}, Lgnu/expr/Expression;->getLineNumber()I

    move-result v0

    .line 124
    .local v0, "line":I
    if-lez v0, :cond_0

    .line 126
    invoke-virtual {p1}, Lgnu/expr/Compilation;->getCode()Lgnu/bytecode/CodeAttr;

    move-result-object v1

    invoke-virtual {p0}, Lgnu/expr/Expression;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lgnu/bytecode/CodeAttr;->putLineNumber(Ljava/lang/String;I)V

    .line 127
    invoke-virtual {p0, p1, p2, p0}, Lgnu/expr/Expression;->compileNotePosition(Lgnu/expr/Compilation;Lgnu/expr/Target;Lgnu/expr/Expression;)V

    goto :goto_0

    .line 130
    :cond_0
    invoke-virtual {p0, p1, p2}, Lgnu/expr/Expression;->compile(Lgnu/expr/Compilation;Lgnu/expr/Target;)V

    .line 131
    :goto_0
    return-void
.end method

.method public final compileWithPosition(Lgnu/expr/Compilation;Lgnu/expr/Target;Lgnu/expr/Expression;)V
    .locals 3
    .param p1, "comp"    # Lgnu/expr/Compilation;
    .param p2, "target"    # Lgnu/expr/Target;
    .param p3, "position"    # Lgnu/expr/Expression;

    .line 138
    invoke-virtual {p3}, Lgnu/expr/Expression;->getLineNumber()I

    move-result v0

    .line 139
    .local v0, "line":I
    if-lez v0, :cond_0

    .line 141
    invoke-virtual {p1}, Lgnu/expr/Compilation;->getCode()Lgnu/bytecode/CodeAttr;

    move-result-object v1

    invoke-virtual {p3}, Lgnu/expr/Expression;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lgnu/bytecode/CodeAttr;->putLineNumber(Ljava/lang/String;I)V

    .line 142
    invoke-virtual {p0, p1, p2, p3}, Lgnu/expr/Expression;->compileNotePosition(Lgnu/expr/Compilation;Lgnu/expr/Target;Lgnu/expr/Expression;)V

    goto :goto_0

    .line 145
    :cond_0
    invoke-virtual {p0, p1, p2}, Lgnu/expr/Expression;->compile(Lgnu/expr/Compilation;Lgnu/expr/Target;)V

    .line 146
    :goto_0
    return-void
.end method

.method protected deepCopy(Lgnu/kawa/util/IdentityHashTable;)Lgnu/expr/Expression;
    .locals 1
    .param p1, "mapper"    # Lgnu/kawa/util/IdentityHashTable;

    .line 239
    const/4 v0, 0x0

    return-object v0
.end method

.method public final eval(Lgnu/mapping/CallContext;)Ljava/lang/Object;
    .locals 2
    .param p1, "ctx"    # Lgnu/mapping/CallContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 22
    invoke-virtual {p1}, Lgnu/mapping/CallContext;->startFromContext()I

    move-result v0

    .line 25
    .local v0, "start":I
    :try_start_0
    invoke-virtual {p0, p1}, Lgnu/expr/Expression;->match0(Lgnu/mapping/CallContext;)I

    .line 26
    invoke-virtual {p1, v0}, Lgnu/mapping/CallContext;->getFromContext(I)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v1

    .line 28
    :catchall_0
    move-exception v1

    .line 30
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-virtual {p1, v0}, Lgnu/mapping/CallContext;->cleanupFromContext(I)V

    .line 31
    throw v1
.end method

.method public final eval(Lgnu/mapping/Environment;)Ljava/lang/Object;
    .locals 3
    .param p1, "env"    # Lgnu/mapping/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 37
    invoke-static {}, Lgnu/mapping/CallContext;->getInstance()Lgnu/mapping/CallContext;

    move-result-object v0

    .line 38
    .local v0, "ctx":Lgnu/mapping/CallContext;
    invoke-static {p1}, Lgnu/mapping/Environment;->setSaveCurrent(Lgnu/mapping/Environment;)Lgnu/mapping/Environment;

    move-result-object v1

    .line 41
    .local v1, "saveEnv":Lgnu/mapping/Environment;
    :try_start_0
    invoke-virtual {p0, v0}, Lgnu/expr/Expression;->eval(Lgnu/mapping/CallContext;)Ljava/lang/Object;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    invoke-static {v1}, Lgnu/mapping/Environment;->restoreCurrent(Lgnu/mapping/Environment;)V

    return-object v2

    :catchall_0
    move-exception v2

    invoke-static {v1}, Lgnu/mapping/Environment;->restoreCurrent(Lgnu/mapping/Environment;)V

    throw v2
.end method

.method public final getColumnNumber()I
    .locals 2

    .line 359
    iget v0, p0, Lgnu/expr/Expression;->position:I

    and-int/lit16 v0, v0, 0xfff

    .line 360
    .local v0, "column":I
    if-nez v0, :cond_0

    const/4 v1, -0x1

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    return v1
.end method

.method public final getFileName()Ljava/lang/String;
    .locals 1

    .line 325
    iget-object v0, p0, Lgnu/expr/Expression;->filename:Ljava/lang/String;

    return-object v0
.end method

.method public getFlag(I)Z
    .locals 1
    .param p1, "flag"    # I

    .line 404
    iget v0, p0, Lgnu/expr/Expression;->flags:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getFlags()I
    .locals 1

    .line 399
    iget v0, p0, Lgnu/expr/Expression;->flags:I

    return v0
.end method

.method public final getLineNumber()I
    .locals 2

    .line 353
    iget v0, p0, Lgnu/expr/Expression;->position:I

    shr-int/lit8 v0, v0, 0xc

    .line 354
    .local v0, "line":I
    if-nez v0, :cond_0

    const/4 v1, -0x1

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    return v1
.end method

.method public getPublicId()Ljava/lang/String;
    .locals 1

    .line 341
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSystemId()Ljava/lang/String;
    .locals 1

    .line 346
    iget-object v0, p0, Lgnu/expr/Expression;->filename:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lgnu/bytecode/Type;
    .locals 1

    .line 368
    sget-object v0, Lgnu/bytecode/Type;->pointer_type:Lgnu/bytecode/ClassType;

    return-object v0
.end method

.method public isSingleValue()Z
    .locals 1

    .line 373
    invoke-virtual {p0}, Lgnu/expr/Expression;->getType()Lgnu/bytecode/Type;

    move-result-object v0

    invoke-static {v0}, Lgnu/kawa/reflect/OccurrenceType;->itemCountIsOne(Lgnu/bytecode/Type;)Z

    move-result v0

    return v0
.end method

.method public isStableSourceLocation()Z
    .locals 1

    .line 363
    const/4 v0, 0x1

    return v0
.end method

.method public final match0(Lgnu/mapping/CallContext;)I
    .locals 1
    .param p1, "ctx"    # Lgnu/mapping/CallContext;

    .line 53
    iput-object p0, p1, Lgnu/mapping/CallContext;->proc:Lgnu/mapping/Procedure;

    .line 54
    const/4 v0, 0x0

    iput v0, p1, Lgnu/mapping/CallContext;->pc:I

    .line 55
    return v0
.end method

.method protected abstract mustCompile()Z
.end method

.method public final print(Lgnu/lists/Consumer;)V
    .locals 2
    .param p1, "out"    # Lgnu/lists/Consumer;

    .line 78
    instance-of v0, p1, Lgnu/mapping/OutPort;

    if-eqz v0, :cond_0

    .line 79
    move-object v0, p1

    check-cast v0, Lgnu/mapping/OutPort;

    invoke-virtual {p0, v0}, Lgnu/expr/Expression;->print(Lgnu/mapping/OutPort;)V

    goto :goto_0

    .line 80
    :cond_0
    instance-of v0, p1, Ljava/io/PrintWriter;

    if-eqz v0, :cond_1

    .line 82
    new-instance v0, Lgnu/mapping/OutPort;

    move-object v1, p1

    check-cast v1, Ljava/io/PrintWriter;

    invoke-direct {v0, v1}, Lgnu/mapping/OutPort;-><init>(Ljava/io/Writer;)V

    .line 83
    .local v0, "port":Lgnu/mapping/OutPort;
    invoke-virtual {p0, v0}, Lgnu/expr/Expression;->print(Lgnu/mapping/OutPort;)V

    .line 84
    invoke-virtual {v0}, Lgnu/mapping/OutPort;->close()V

    .line 85
    .end local v0    # "port":Lgnu/mapping/OutPort;
    goto :goto_0

    .line 88
    :cond_1
    new-instance v0, Lgnu/mapping/CharArrayOutPort;

    invoke-direct {v0}, Lgnu/mapping/CharArrayOutPort;-><init>()V

    .line 89
    .local v0, "port":Lgnu/mapping/CharArrayOutPort;
    invoke-virtual {p0, v0}, Lgnu/expr/Expression;->print(Lgnu/mapping/OutPort;)V

    .line 90
    invoke-virtual {v0}, Lgnu/mapping/CharArrayOutPort;->close()V

    .line 91
    invoke-virtual {v0, p1}, Lgnu/mapping/CharArrayOutPort;->writeTo(Lgnu/lists/Consumer;)V

    .line 93
    .end local v0    # "port":Lgnu/mapping/CharArrayOutPort;
    :goto_0
    return-void
.end method

.method public abstract print(Lgnu/mapping/OutPort;)V
.end method

.method public printLineColumn(Lgnu/mapping/OutPort;)V
    .locals 3
    .param p1, "out"    # Lgnu/mapping/OutPort;

    .line 103
    invoke-virtual {p0}, Lgnu/expr/Expression;->getLineNumber()I

    move-result v0

    .line 104
    .local v0, "line":I
    if-lez v0, :cond_1

    .line 106
    const-string v1, "line:"

    invoke-virtual {p1, v1}, Lgnu/mapping/OutPort;->print(Ljava/lang/String;)V

    .line 107
    invoke-virtual {p1, v0}, Lgnu/mapping/OutPort;->print(I)V

    .line 108
    invoke-virtual {p0}, Lgnu/expr/Expression;->getColumnNumber()I

    move-result v1

    .line 109
    .local v1, "column":I
    if-lez v1, :cond_0

    .line 111
    const/16 v2, 0x3a

    invoke-virtual {p1, v2}, Lgnu/mapping/OutPort;->print(C)V

    .line 112
    invoke-virtual {p1, v1}, Lgnu/mapping/OutPort;->print(I)V

    .line 114
    :cond_0
    invoke-virtual {p1}, Lgnu/mapping/OutPort;->writeSpaceFill()V

    .line 116
    .end local v1    # "column":I
    :cond_1
    return-void
.end method

.method public final setFile(Ljava/lang/String;)V
    .locals 0
    .param p1, "filename"    # Ljava/lang/String;

    .line 306
    iput-object p1, p0, Lgnu/expr/Expression;->filename:Ljava/lang/String;

    .line 307
    return-void
.end method

.method public setFlag(I)V
    .locals 1
    .param p1, "flag"    # I

    .line 394
    iget v0, p0, Lgnu/expr/Expression;->flags:I

    or-int/2addr v0, p1

    iput v0, p0, Lgnu/expr/Expression;->flags:I

    .line 395
    return-void
.end method

.method public setFlag(ZI)V
    .locals 2
    .param p1, "setting"    # Z
    .param p2, "flag"    # I

    .line 388
    if-eqz p1, :cond_0

    iget v0, p0, Lgnu/expr/Expression;->flags:I

    or-int/2addr v0, p2

    iput v0, p0, Lgnu/expr/Expression;->flags:I

    goto :goto_0

    .line 389
    :cond_0
    iget v0, p0, Lgnu/expr/Expression;->flags:I

    xor-int/lit8 v1, p2, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lgnu/expr/Expression;->flags:I

    .line 390
    :goto_0
    return-void
.end method

.method public final setLine(Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 0
    .param p1, "old"    # Lgnu/expr/Expression;

    .line 300
    invoke-virtual {p0, p1}, Lgnu/expr/Expression;->setLocation(Lgnu/text/SourceLocator;)V

    .line 301
    return-object p0
.end method

.method public final setLine(I)V
    .locals 1
    .param p1, "lineno"    # I

    .line 320
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lgnu/expr/Expression;->setLine(II)V

    .line 321
    return-void
.end method

.method public final setLine(II)V
    .locals 1
    .param p1, "lineno"    # I
    .param p2, "colno"    # I

    .line 311
    if-gez p1, :cond_0

    .line 312
    const/4 p1, 0x0

    .line 313
    :cond_0
    if-gez p2, :cond_1

    .line 314
    const/4 p2, 0x0

    .line 315
    :cond_1
    shl-int/lit8 v0, p1, 0xc

    add-int/2addr v0, p2

    iput v0, p0, Lgnu/expr/Expression;->position:I

    .line 316
    return-void
.end method

.method public setLine(Lgnu/expr/Compilation;)V
    .locals 2
    .param p1, "comp"    # Lgnu/expr/Compilation;

    .line 331
    invoke-virtual {p1}, Lgnu/expr/Compilation;->getLineNumber()I

    move-result v0

    .line 332
    .local v0, "line":I
    if-lez v0, :cond_0

    .line 334
    invoke-virtual {p1}, Lgnu/expr/Compilation;->getFileName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lgnu/expr/Expression;->setFile(Ljava/lang/String;)V

    .line 335
    invoke-virtual {p1}, Lgnu/expr/Compilation;->getColumnNumber()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lgnu/expr/Expression;->setLine(II)V

    .line 337
    :cond_0
    return-void
.end method

.method public final setLocation(Lgnu/text/SourceLocator;)V
    .locals 2
    .param p1, "location"    # Lgnu/text/SourceLocator;

    .line 294
    invoke-interface {p1}, Lgnu/text/SourceLocator;->getFileName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lgnu/expr/Expression;->filename:Ljava/lang/String;

    .line 295
    invoke-interface {p1}, Lgnu/text/SourceLocator;->getLineNumber()I

    move-result v0

    invoke-interface {p1}, Lgnu/text/SourceLocator;->getColumnNumber()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lgnu/expr/Expression;->setLine(II)V

    .line 296
    return-void
.end method

.method public side_effects()Z
    .locals 1

    .line 408
    const/4 v0, 0x1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 412
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 413
    .local v0, "tname":Ljava/lang/String;
    const-string v1, "gnu.expr."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 414
    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 415
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public validateApply(Lgnu/expr/ApplyExp;Lgnu/expr/InlineCalls;Lgnu/bytecode/Type;Lgnu/expr/Declaration;)Lgnu/expr/Expression;
    .locals 2
    .param p1, "exp"    # Lgnu/expr/ApplyExp;
    .param p2, "visitor"    # Lgnu/expr/InlineCalls;
    .param p3, "required"    # Lgnu/bytecode/Type;
    .param p4, "decl"    # Lgnu/expr/Declaration;

    .line 261
    iget-object v0, p1, Lgnu/expr/ApplyExp;->args:[Lgnu/expr/Expression;

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Lgnu/expr/InlineCalls;->visitExps([Lgnu/expr/Expression;Ljava/lang/Object;)[Lgnu/expr/Expression;

    move-result-object v0

    iput-object v0, p1, Lgnu/expr/ApplyExp;->args:[Lgnu/expr/Expression;

    .line 262
    return-object p1
.end method

.method public valueIfConstant()Ljava/lang/Object;
    .locals 1

    .line 379
    const/4 v0, 0x0

    return-object v0
.end method

.method protected visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            "D:",
            "Ljava/lang/Object;",
            ">(",
            "Lgnu/expr/ExpVisitor<",
            "TR;TD;>;TD;)TR;"
        }
    .end annotation

    .line 244
    .local p1, "visitor":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p1, p0, p2}, Lgnu/expr/ExpVisitor;->visitExpression(Lgnu/expr/Expression;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected visitChildren(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            "D:",
            "Ljava/lang/Object;",
            ">(",
            "Lgnu/expr/ExpVisitor<",
            "TR;TD;>;TD;)V"
        }
    .end annotation

    .line 247
    .local p1, "visitor":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    return-void
.end method
