.class public Lgnu/kawa/lispexpr/ReaderDispatchMacro;
.super Lgnu/kawa/lispexpr/ReaderMisc;
.source "ReaderDispatchMacro.java"


# instance fields
.field procedure:Lgnu/mapping/Procedure;


# direct methods
.method public constructor <init>(Lgnu/mapping/Procedure;)V
    .locals 1
    .param p1, "procedure"    # Lgnu/mapping/Procedure;

    .line 19
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lgnu/kawa/lispexpr/ReaderMisc;-><init>(I)V

    .line 20
    iput-object p1, p0, Lgnu/kawa/lispexpr/ReaderDispatchMacro;->procedure:Lgnu/mapping/Procedure;

    .line 21
    return-void
.end method


# virtual methods
.method public getProcedure()Lgnu/mapping/Procedure;
    .locals 1

    .line 25
    iget-object v0, p0, Lgnu/kawa/lispexpr/ReaderDispatchMacro;->procedure:Lgnu/mapping/Procedure;

    return-object v0
.end method

.method public read(Lgnu/text/Lexer;II)Ljava/lang/Object;
    .locals 4
    .param p1, "in"    # Lgnu/text/Lexer;
    .param p2, "ch"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lgnu/text/SyntaxException;
        }
    .end annotation

    .line 32
    invoke-virtual {p1}, Lgnu/text/Lexer;->getPort()Lgnu/text/LineBufferedReader;

    move-result-object v0

    .line 35
    .local v0, "reader":Ljava/io/Reader;
    :try_start_0
    iget-object v1, p0, Lgnu/kawa/lispexpr/ReaderDispatchMacro;->procedure:Lgnu/mapping/Procedure;

    invoke-static {p2}, Lgnu/text/Char;->make(I)Lgnu/text/Char;

    move-result-object v2

    invoke-static {p3}, Lgnu/math/IntNum;->make(I)Lgnu/math/IntNum;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Lgnu/mapping/Procedure;->apply3(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lgnu/text/SyntaxException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v1

    .line 45
    :catchall_0
    move-exception v1

    .line 47
    .local v1, "ex":Ljava/lang/Throwable;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "reader macro \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lgnu/kawa/lispexpr/ReaderDispatchMacro;->procedure:Lgnu/mapping/Procedure;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' threw: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lgnu/text/Lexer;->fatal(Ljava/lang/String;)V

    .line 48
    const/4 v2, 0x0

    return-object v2

    .line 41
    .end local v1    # "ex":Ljava/lang/Throwable;
    :catch_0
    move-exception v1

    .line 43
    .local v1, "ex":Lgnu/text/SyntaxException;
    throw v1

    .line 37
    .end local v1    # "ex":Lgnu/text/SyntaxException;
    :catch_1
    move-exception v1

    .line 39
    .local v1, "ex":Ljava/io/IOException;
    throw v1
.end method
