.class public Lkawa/standard/syntax_error;
.super Lkawa/lang/Syntax;
.source "syntax_error.java"


# static fields
.field public static final syntax_error:Lkawa/standard/syntax_error;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 13
    new-instance v0, Lkawa/standard/syntax_error;

    invoke-direct {v0}, Lkawa/standard/syntax_error;-><init>()V

    sput-object v0, Lkawa/standard/syntax_error;->syntax_error:Lkawa/standard/syntax_error;

    .line 14
    const-string v1, "%syntax-error"

    invoke-virtual {v0, v1}, Lkawa/standard/syntax_error;->setName(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Lkawa/lang/Syntax;-><init>()V

    return-void
.end method

.method public static error(Ljava/lang/Object;[Ljava/lang/Object;)Lgnu/expr/Expression;
    .locals 5
    .param p0, "form"    # Ljava/lang/Object;
    .param p1, "message"    # [Ljava/lang/Object;

    .line 40
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 41
    .local v0, "buffer":Ljava/lang/StringBuffer;
    array-length v1, p1

    .line 42
    .local v1, "len":I
    if-eqz p1, :cond_1

    if-nez v1, :cond_0

    goto :goto_1

    .line 46
    :cond_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 47
    aget-object v3, p1, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 46
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 43
    .end local v2    # "i":I
    :cond_1
    :goto_1
    const-string v2, "invalid syntax"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 49
    :cond_2
    invoke-static {}, Lgnu/expr/Compilation;->getCurrent()Lgnu/expr/Compilation;

    move-result-object v2

    check-cast v2, Lkawa/lang/Translator;

    .line 50
    .local v2, "tr":Lkawa/lang/Translator;
    if-eqz v2, :cond_3

    .line 52
    invoke-virtual {v2, p0}, Lkawa/lang/Translator;->pushPositionOf(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 55
    .local v3, "savePos":Ljava/lang/Object;
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lkawa/lang/Translator;->syntaxError(Ljava/lang/String;)Lgnu/expr/Expression;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    invoke-virtual {v2, v3}, Lkawa/lang/Translator;->popPositionOf(Ljava/lang/Object;)V

    return-object v4

    :catchall_0
    move-exception v4

    invoke-virtual {v2, v3}, Lkawa/lang/Translator;->popPositionOf(Ljava/lang/Object;)V

    throw v4

    .line 51
    .end local v3    # "savePos":Ljava/lang/Object;
    :cond_3
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw v3

    :goto_3
    goto :goto_2
.end method


# virtual methods
.method public rewrite(Ljava/lang/Object;Lkawa/lang/Translator;)Lgnu/expr/Expression;
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "tr"    # Lkawa/lang/Translator;

    .line 18
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 19
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .line 20
    .local v1, "words":I
    :goto_0
    instance-of v2, p1, Lgnu/lists/Pair;

    const/16 v3, 0x20

    if-eqz v2, :cond_1

    .line 22
    move-object v2, p1

    check-cast v2, Lgnu/lists/Pair;

    .line 23
    .local v2, "pair":Lgnu/lists/Pair;
    if-lez v1, :cond_0

    .line 24
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 25
    :cond_0
    invoke-virtual {v2}, Lgnu/lists/Pair;->getCar()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 26
    invoke-virtual {v2}, Lgnu/lists/Pair;->getCdr()Ljava/lang/Object;

    move-result-object p1

    .line 27
    nop

    .end local v2    # "pair":Lgnu/lists/Pair;
    add-int/lit8 v1, v1, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    sget-object v2, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    if-eq p1, v2, :cond_3

    .line 31
    if-lez v1, :cond_2

    .line 32
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 33
    :cond_2
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 35
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lkawa/lang/Translator;->syntaxError(Ljava/lang/String;)Lgnu/expr/Expression;

    move-result-object v2

    return-object v2
.end method
