.class public Lgnu/kawa/lispexpr/ReaderColon;
.super Lgnu/kawa/lispexpr/ReadTableEntry;
.source "ReaderColon.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Lgnu/kawa/lispexpr/ReadTableEntry;-><init>()V

    return-void
.end method


# virtual methods
.method public getKind()I
    .locals 1

    .line 10
    const/4 v0, 0x6

    return v0
.end method

.method public read(Lgnu/text/Lexer;II)Ljava/lang/Object;
    .locals 5
    .param p1, "in"    # Lgnu/text/Lexer;
    .param p2, "ch"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lgnu/text/SyntaxException;
        }
    .end annotation

    .line 15
    move-object v0, p1

    check-cast v0, Lgnu/kawa/lispexpr/LispReader;

    .line 16
    .local v0, "reader":Lgnu/kawa/lispexpr/LispReader;
    invoke-static {}, Lgnu/kawa/lispexpr/ReadTable;->getCurrent()Lgnu/kawa/lispexpr/ReadTable;

    move-result-object v1

    .line 17
    .local v1, "rtable":Lgnu/kawa/lispexpr/ReadTable;
    iget v2, v0, Lgnu/kawa/lispexpr/LispReader;->tokenBufferLength:I

    .line 18
    .local v2, "startPos":I
    iget-char v3, v1, Lgnu/kawa/lispexpr/ReadTable;->postfixLookupOperator:C

    if-ne p2, v3, :cond_1

    .line 20
    invoke-virtual {v0}, Lgnu/kawa/lispexpr/LispReader;->read()I

    move-result v3

    .line 21
    .local v3, "next":I
    const/16 v4, 0x3a

    if-ne v3, v4, :cond_0

    .line 22
    const-string v4, "::"

    invoke-virtual {v1, v4}, Lgnu/kawa/lispexpr/ReadTable;->makeSymbol(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    return-object v4

    .line 24
    :cond_0
    invoke-virtual {v0, p2}, Lgnu/kawa/lispexpr/LispReader;->tokenBufferAppend(I)V

    .line 25
    move p2, v3

    .line 27
    .end local v3    # "next":I
    :cond_1
    invoke-virtual {v0, p2, v2, v1}, Lgnu/kawa/lispexpr/LispReader;->readAndHandleToken(IILgnu/kawa/lispexpr/ReadTable;)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method
