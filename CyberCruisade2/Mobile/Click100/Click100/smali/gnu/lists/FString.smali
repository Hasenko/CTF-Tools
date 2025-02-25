.class public Lgnu/lists/FString;
.super Lgnu/lists/SimpleVector;
.source "FString.java"

# interfaces
.implements Ljava/lang/Comparable;
.implements Ljava/lang/Appendable;
.implements Lgnu/lists/CharSeq;
.implements Ljava/io/Externalizable;
.implements Lgnu/lists/Consumable;


# static fields
.field protected static empty:[C


# instance fields
.field public data:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 23
    const/4 v0, 0x0

    new-array v0, v0, [C

    sput-object v0, Lgnu/lists/FString;->empty:[C

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lgnu/lists/SimpleVector;-><init>()V

    .line 27
    sget-object v0, Lgnu/lists/FString;->empty:[C

    iput-object v0, p0, Lgnu/lists/FString;->data:[C

    .line 28
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "num"    # I

    .line 31
    invoke-direct {p0}, Lgnu/lists/SimpleVector;-><init>()V

    .line 32
    iput p1, p0, Lgnu/lists/FString;->size:I

    .line 33
    new-array v0, p1, [C

    iput-object v0, p0, Lgnu/lists/FString;->data:[C

    .line 34
    return-void
.end method

.method public constructor <init>(IC)V
    .locals 1
    .param p1, "num"    # I
    .param p2, "value"    # C

    .line 37
    invoke-direct {p0}, Lgnu/lists/SimpleVector;-><init>()V

    .line 38
    new-array v0, p1, [C

    .line 39
    .local v0, "array":[C
    iput-object v0, p0, Lgnu/lists/FString;->data:[C

    .line 40
    iput p1, p0, Lgnu/lists/FString;->size:I

    .line 41
    :goto_0
    add-int/lit8 p1, p1, -0x1

    if-ltz p1, :cond_0

    .line 42
    aput-char p2, v0, p1

    goto :goto_0

    .line 43
    :cond_0
    return-void
.end method

.method public constructor <init>(Lgnu/lists/CharSeq;)V
    .locals 2
    .param p1, "seq"    # Lgnu/lists/CharSeq;

    .line 87
    const/4 v0, 0x0

    invoke-interface {p1}, Lgnu/lists/CharSeq;->size()I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Lgnu/lists/FString;-><init>(Lgnu/lists/CharSeq;II)V

    .line 88
    return-void
.end method

.method public constructor <init>(Lgnu/lists/CharSeq;II)V
    .locals 3
    .param p1, "seq"    # Lgnu/lists/CharSeq;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 91
    invoke-direct {p0}, Lgnu/lists/SimpleVector;-><init>()V

    .line 92
    new-array v0, p3, [C

    .line 93
    .local v0, "data":[C
    add-int v1, p2, p3

    const/4 v2, 0x0

    invoke-interface {p1, p2, v1, v0, v2}, Lgnu/lists/CharSeq;->getChars(II[CI)V

    .line 94
    iput-object v0, p0, Lgnu/lists/FString;->data:[C

    .line 95
    iput p3, p0, Lgnu/lists/FString;->size:I

    .line 96
    return-void
.end method

.method public constructor <init>(Lgnu/lists/Sequence;)V
    .locals 1
    .param p1, "seq"    # Lgnu/lists/Sequence;

    .line 80
    invoke-direct {p0}, Lgnu/lists/SimpleVector;-><init>()V

    .line 81
    invoke-interface {p1}, Lgnu/lists/Sequence;->size()I

    move-result v0

    new-array v0, v0, [C

    iput-object v0, p0, Lgnu/lists/FString;->data:[C

    .line 82
    invoke-virtual {p0, p1}, Lgnu/lists/FString;->addAll(Ljava/util/Collection;)Z

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "seq"    # Ljava/lang/CharSequence;

    .line 101
    const/4 v0, 0x0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Lgnu/lists/FString;-><init>(Ljava/lang/CharSequence;II)V

    .line 102
    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;II)V
    .locals 3
    .param p1, "seq"    # Ljava/lang/CharSequence;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 105
    invoke-direct {p0}, Lgnu/lists/SimpleVector;-><init>()V

    .line 106
    new-array v0, p3, [C

    .line 107
    .local v0, "data":[C
    move v1, p3

    .local v1, "i":I
    :goto_0
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_0

    .line 108
    add-int v2, p2, v1

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    aput-char v2, v0, v1

    goto :goto_0

    .line 109
    .end local v1    # "i":I
    :cond_0
    iput-object v0, p0, Lgnu/lists/FString;->data:[C

    .line 110
    iput p3, p0, Lgnu/lists/FString;->size:I

    .line 111
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .line 54
    invoke-direct {p0}, Lgnu/lists/SimpleVector;-><init>()V

    .line 55
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lgnu/lists/FString;->data:[C

    .line 56
    array-length v0, v0

    iput v0, p0, Lgnu/lists/FString;->size:I

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/StringBuffer;)V
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuffer;

    .line 61
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Lgnu/lists/FString;-><init>(Ljava/lang/StringBuffer;II)V

    .line 62
    return-void
.end method

.method public constructor <init>(Ljava/lang/StringBuffer;II)V
    .locals 3
    .param p1, "buffer"    # Ljava/lang/StringBuffer;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 65
    invoke-direct {p0}, Lgnu/lists/SimpleVector;-><init>()V

    .line 66
    iput p3, p0, Lgnu/lists/FString;->size:I

    .line 67
    new-array v0, p3, [C

    iput-object v0, p0, Lgnu/lists/FString;->data:[C

    .line 68
    if-lez p3, :cond_0

    .line 69
    add-int v1, p2, p3

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, v0, v2}, Ljava/lang/StringBuffer;->getChars(II[CI)V

    .line 70
    :cond_0
    return-void
.end method

.method public constructor <init>([C)V
    .locals 1
    .param p1, "values"    # [C

    .line 48
    invoke-direct {p0}, Lgnu/lists/SimpleVector;-><init>()V

    .line 49
    array-length v0, p1

    iput v0, p0, Lgnu/lists/FString;->size:I

    .line 50
    iput-object p1, p0, Lgnu/lists/FString;->data:[C

    .line 51
    return-void
.end method

.method public constructor <init>([CII)V
    .locals 2
    .param p1, "buffer"    # [C
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 73
    invoke-direct {p0}, Lgnu/lists/SimpleVector;-><init>()V

    .line 74
    iput p3, p0, Lgnu/lists/FString;->size:I

    .line 75
    new-array v0, p3, [C

    iput-object v0, p0, Lgnu/lists/FString;->data:[C

    .line 76
    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 77
    return-void
.end method


# virtual methods
.method public addAll(Lgnu/lists/FString;)Z
    .locals 6
    .param p1, "s"    # Lgnu/lists/FString;

    .line 238
    iget v0, p0, Lgnu/lists/FString;->size:I

    iget v1, p1, Lgnu/lists/FString;->size:I

    add-int/2addr v0, v1

    .line 239
    .local v0, "newSize":I
    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    array-length v1, v1

    if-ge v1, v0, :cond_0

    .line 240
    invoke-virtual {p0, v0}, Lgnu/lists/FString;->setBufferLength(I)V

    .line 241
    :cond_0
    iget-object v1, p1, Lgnu/lists/FString;->data:[C

    iget-object v2, p0, Lgnu/lists/FString;->data:[C

    iget v3, p0, Lgnu/lists/FString;->size:I

    iget v4, p1, Lgnu/lists/FString;->size:I

    const/4 v5, 0x0

    invoke-static {v1, v5, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 242
    iput v0, p0, Lgnu/lists/FString;->size:I

    .line 243
    iget v1, p1, Lgnu/lists/FString;->size:I

    if-lez v1, :cond_1

    const/4 v5, 0x1

    :cond_1
    return v5
.end method

.method public addAll(Ljava/lang/CharSequence;)Z
    .locals 7
    .param p1, "s"    # Ljava/lang/CharSequence;

    .line 249
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 250
    .local v0, "ssize":I
    iget v1, p0, Lgnu/lists/FString;->size:I

    add-int/2addr v1, v0

    .line 251
    .local v1, "newSize":I
    iget-object v2, p0, Lgnu/lists/FString;->data:[C

    array-length v2, v2

    if-ge v2, v1, :cond_0

    .line 252
    invoke-virtual {p0, v1}, Lgnu/lists/FString;->setBufferLength(I)V

    .line 253
    :cond_0
    instance-of v2, p1, Lgnu/lists/FString;

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 254
    move-object v2, p1

    check-cast v2, Lgnu/lists/FString;

    iget-object v2, v2, Lgnu/lists/FString;->data:[C

    iget-object v4, p0, Lgnu/lists/FString;->data:[C

    iget v5, p0, Lgnu/lists/FString;->size:I

    invoke-static {v2, v3, v4, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_1

    .line 255
    :cond_1
    instance-of v2, p1, Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 256
    move-object v2, p1

    check-cast v2, Ljava/lang/String;

    iget-object v4, p0, Lgnu/lists/FString;->data:[C

    iget v5, p0, Lgnu/lists/FString;->size:I

    invoke-virtual {v2, v3, v0, v4, v5}, Ljava/lang/String;->getChars(II[CI)V

    goto :goto_1

    .line 257
    :cond_2
    instance-of v2, p1, Lgnu/lists/CharSeq;

    if-eqz v2, :cond_3

    .line 258
    move-object v2, p1

    check-cast v2, Lgnu/lists/CharSeq;

    iget-object v4, p0, Lgnu/lists/FString;->data:[C

    iget v5, p0, Lgnu/lists/FString;->size:I

    invoke-interface {v2, v3, v0, v4, v5}, Lgnu/lists/CharSeq;->getChars(II[CI)V

    goto :goto_1

    .line 260
    :cond_3
    move v2, v0

    .local v2, "i":I
    :goto_0
    add-int/lit8 v2, v2, -0x1

    if-ltz v2, :cond_4

    .line 261
    iget-object v4, p0, Lgnu/lists/FString;->data:[C

    iget v5, p0, Lgnu/lists/FString;->size:I

    add-int/2addr v5, v2

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    aput-char v6, v4, v5

    goto :goto_0

    .line 262
    .end local v2    # "i":I
    :cond_4
    :goto_1
    iput v1, p0, Lgnu/lists/FString;->size:I

    .line 263
    if-lez v0, :cond_5

    const/4 v3, 0x1

    :cond_5
    return v3
.end method

.method public addAllStrings([Ljava/lang/Object;I)V
    .locals 4
    .param p1, "args"    # [Ljava/lang/Object;
    .param p2, "startIndex"    # I

    .line 296
    iget v0, p0, Lgnu/lists/FString;->size:I

    .line 297
    .local v0, "total":I
    move v1, p2

    .local v1, "i":I
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_0

    .line 299
    aget-object v2, p1, v1

    .line 301
    .local v2, "arg":Ljava/lang/Object;
    move-object v3, v2

    check-cast v3, Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    add-int/2addr v0, v3

    .line 297
    .end local v2    # "arg":Ljava/lang/Object;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 309
    .end local v1    # "i":I
    :cond_0
    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    array-length v1, v1

    if-ge v1, v0, :cond_1

    .line 310
    invoke-virtual {p0, v0}, Lgnu/lists/FString;->setBufferLength(I)V

    .line 312
    :cond_1
    move v1, p2

    .restart local v1    # "i":I
    :goto_1
    array-length v2, p1

    if-ge v1, v2, :cond_2

    .line 314
    aget-object v2, p1, v1

    .line 316
    .restart local v2    # "arg":Ljava/lang/Object;
    move-object v3, v2

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {p0, v3}, Lgnu/lists/FString;->addAll(Ljava/lang/CharSequence;)Z

    .line 312
    .end local v2    # "arg":Ljava/lang/Object;
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 324
    .end local v1    # "i":I
    :cond_2
    return-void
.end method

.method public append(C)Lgnu/lists/FString;
    .locals 3
    .param p1, "c"    # C

    .line 470
    iget v0, p0, Lgnu/lists/FString;->size:I

    .line 471
    .local v0, "sz":I
    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 472
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Lgnu/lists/FString;->ensureBufferLength(I)V

    .line 473
    :cond_0
    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    .line 474
    .local v1, "d":[C
    aput-char p1, v1, v0

    .line 475
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lgnu/lists/FString;->size:I

    .line 476
    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;)Lgnu/lists/FString;
    .locals 2
    .param p1, "csq"    # Ljava/lang/CharSequence;

    .line 482
    if-nez p1, :cond_0

    .line 483
    const-string p1, "null"

    .line 484
    :cond_0
    const/4 v0, 0x0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lgnu/lists/FString;->append(Ljava/lang/CharSequence;II)Lgnu/lists/FString;

    move-result-object v0

    return-object v0
.end method

.method public append(Ljava/lang/CharSequence;II)Lgnu/lists/FString;
    .locals 7
    .param p1, "csq"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .line 489
    if-nez p1, :cond_0

    .line 490
    const-string p1, "null"

    .line 491
    :cond_0
    sub-int v0, p3, p2

    .line 492
    .local v0, "len":I
    iget v1, p0, Lgnu/lists/FString;->size:I

    .line 493
    .local v1, "sz":I
    add-int v2, v1, v0

    iget-object v3, p0, Lgnu/lists/FString;->data:[C

    array-length v3, v3

    if-le v2, v3, :cond_1

    .line 494
    add-int v2, v1, v0

    invoke-virtual {p0, v2}, Lgnu/lists/FString;->ensureBufferLength(I)V

    .line 495
    :cond_1
    iget-object v2, p0, Lgnu/lists/FString;->data:[C

    .line 496
    .local v2, "d":[C
    instance-of v3, p1, Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 497
    move-object v3, p1

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3, p2, p3, v2, v1}, Ljava/lang/String;->getChars(II[CI)V

    goto :goto_1

    .line 498
    :cond_2
    instance-of v3, p1, Lgnu/lists/CharSeq;

    if-eqz v3, :cond_3

    .line 499
    move-object v3, p1

    check-cast v3, Lgnu/lists/CharSeq;

    invoke-interface {v3, p2, p3, v2, v1}, Lgnu/lists/CharSeq;->getChars(II[CI)V

    goto :goto_1

    .line 502
    :cond_3
    move v3, v1

    .line 503
    .local v3, "j":I
    move v4, p2

    .local v4, "i":I
    :goto_0
    if-ge v4, p3, :cond_4

    .line 504
    add-int/lit8 v5, v3, 0x1

    .end local v3    # "j":I
    .local v5, "j":I
    invoke-interface {p1, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    aput-char v6, v2, v3

    .line 503
    add-int/lit8 v4, v4, 0x1

    move v3, v5

    goto :goto_0

    .line 506
    .end local v4    # "i":I
    .end local v5    # "j":I
    :cond_4
    :goto_1
    iput v1, p0, Lgnu/lists/FString;->size:I

    .line 507
    return-object p0
.end method

.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .locals 1
    .param p1, "x0"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    invoke-virtual {p0, p1}, Lgnu/lists/FString;->append(C)Lgnu/lists/FString;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .locals 1
    .param p1, "x0"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    invoke-virtual {p0, p1}, Lgnu/lists/FString;->append(Ljava/lang/CharSequence;)Lgnu/lists/FString;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .locals 1
    .param p1, "x0"    # Ljava/lang/CharSequence;
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    invoke-virtual {p0, p1, p2, p3}, Lgnu/lists/FString;->append(Ljava/lang/CharSequence;II)Lgnu/lists/FString;

    move-result-object v0

    return-object v0
.end method

.method public final charAt(I)C
    .locals 1
    .param p1, "index"    # I

    .line 167
    iget v0, p0, Lgnu/lists/FString;->size:I

    if-ge p1, v0, :cond_0

    .line 169
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    aget-char v0, v0, p1

    return v0

    .line 168
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public final charAtBuffer(I)C
    .locals 1
    .param p1, "index"    # I

    .line 174
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    aget-char v0, v0, p1

    return v0
.end method

.method protected clearBuffer(II)V
    .locals 3
    .param p1, "start"    # I
    .param p2, "count"    # I

    .line 374
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    .line 375
    .local v0, "d":[C
    :goto_0
    add-int/lit8 p2, p2, -0x1

    if-ltz p2, :cond_0

    .line 376
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "start":I
    .local v1, "start":I
    const/4 v2, 0x0

    aput-char v2, v0, p1

    move p1, v1

    goto :goto_0

    .line 377
    .end local v1    # "start":I
    .restart local p1    # "start":I
    :cond_0
    return-void
.end method

.method public compareTo(Ljava/lang/Object;)I
    .locals 10
    .param p1, "obj"    # Ljava/lang/Object;

    .line 420
    move-object v0, p1

    check-cast v0, Lgnu/lists/FString;

    .line 421
    .local v0, "str2":Lgnu/lists/FString;
    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    .line 422
    .local v1, "cs1":[C
    iget-object v2, v0, Lgnu/lists/FString;->data:[C

    .line 423
    .local v2, "cs2":[C
    iget v3, p0, Lgnu/lists/FString;->size:I

    .line 424
    .local v3, "n1":I
    iget v4, v0, Lgnu/lists/FString;->size:I

    .line 425
    .local v4, "n2":I
    if-le v3, v4, :cond_0

    move v5, v4

    goto :goto_0

    :cond_0
    move v5, v3

    .line 426
    .local v5, "n":I
    :goto_0
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    if-ge v6, v5, :cond_2

    .line 428
    aget-char v7, v1, v6

    .line 429
    .local v7, "c1":C
    aget-char v8, v2, v6

    .line 430
    .local v8, "c2":C
    sub-int v9, v7, v8

    .line 431
    .local v9, "d":I
    if-eqz v9, :cond_1

    .line 432
    return v9

    .line 426
    .end local v7    # "c1":C
    .end local v8    # "c2":C
    .end local v9    # "d":I
    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 434
    .end local v6    # "i":I
    :cond_2
    sub-int v6, v3, v4

    return v6
.end method

.method public consume(Lgnu/lists/Consumer;)V
    .locals 3
    .param p1, "out"    # Lgnu/lists/Consumer;

    .line 444
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    const/4 v1, 0x0

    array-length v2, v0

    invoke-interface {p1, v0, v1, v2}, Lgnu/lists/Consumer;->write([CII)V

    .line 445
    return-void
.end method

.method public consumeNext(ILgnu/lists/Consumer;)Z
    .locals 2
    .param p1, "ipos"    # I
    .param p2, "out"    # Lgnu/lists/Consumer;

    .line 449
    ushr-int/lit8 v0, p1, 0x1

    .line 450
    .local v0, "index":I
    iget v1, p0, Lgnu/lists/FString;->size:I

    if-lt v0, v1, :cond_0

    .line 451
    const/4 v1, 0x0

    return v1

    .line 452
    :cond_0
    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    aget-char v1, v1, v0

    invoke-interface {p2, v1}, Lgnu/lists/Consumer;->write(I)V

    .line 453
    const/4 v1, 0x1

    return v1
.end method

.method public consumePosRange(IILgnu/lists/Consumer;)V
    .locals 4
    .param p1, "iposStart"    # I
    .param p2, "iposEnd"    # I
    .param p3, "out"    # Lgnu/lists/Consumer;

    .line 458
    invoke-interface {p3}, Lgnu/lists/Consumer;->ignoring()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 459
    return-void

    .line 460
    :cond_0
    ushr-int/lit8 v0, p1, 0x1

    .line 461
    .local v0, "i":I
    ushr-int/lit8 v1, p2, 0x1

    .line 462
    .local v1, "end":I
    iget v2, p0, Lgnu/lists/FString;->size:I

    if-le v1, v2, :cond_1

    .line 463
    iget v1, p0, Lgnu/lists/FString;->size:I

    .line 464
    :cond_1
    if-le v1, v0, :cond_2

    .line 465
    iget-object v2, p0, Lgnu/lists/FString;->data:[C

    sub-int v3, v1, v0

    invoke-interface {p3, v2, v0, v3}, Lgnu/lists/Consumer;->write([CII)V

    .line 466
    :cond_2
    return-void
.end method

.method public copy(II)Lgnu/lists/FString;
    .locals 5
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 228
    sub-int v0, p2, p1

    new-array v0, v0, [C

    .line 229
    .local v0, "copy":[C
    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    .line 230
    .local v1, "src":[C
    move v2, p1

    .local v2, "i":I
    :goto_0
    if-ge v2, p2, :cond_0

    .line 231
    sub-int v3, v2, p1

    aget-char v4, v1, v2

    aput-char v4, v0, v3

    .line 230
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 232
    .end local v2    # "i":I
    :cond_0
    new-instance v2, Lgnu/lists/FString;

    invoke-direct {v2, v0}, Lgnu/lists/FString;-><init>([C)V

    return-object v2
.end method

.method public ensureBufferLength(I)V
    .locals 3
    .param p1, "sz"    # I

    .line 136
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    array-length v1, v0

    if-le p1, v1, :cond_1

    .line 138
    const/16 v1, 0x3c

    if-ge p1, v1, :cond_0

    const/16 v1, 0x78

    goto :goto_0

    :cond_0
    mul-int/lit8 v1, p1, 0x2

    :goto_0
    new-array v1, v1, [C

    .line 139
    .local v1, "d":[C
    const/4 v2, 0x0

    invoke-static {v0, v2, v1, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 140
    iput-object v1, p0, Lgnu/lists/FString;->data:[C

    .line 142
    .end local v1    # "d":[C
    :cond_1
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;

    .line 403
    const/4 v0, 0x0

    if-eqz p1, :cond_5

    instance-of v1, p1, Lgnu/lists/FString;

    if-nez v1, :cond_0

    goto :goto_1

    .line 405
    :cond_0
    move-object v1, p1

    check-cast v1, Lgnu/lists/FString;

    iget-object v1, v1, Lgnu/lists/FString;->data:[C

    .line 406
    .local v1, "str":[C
    iget v2, p0, Lgnu/lists/FString;->size:I

    .line 407
    .local v2, "n":I
    if-eqz v1, :cond_4

    array-length v3, v1

    if-eq v3, v2, :cond_1

    goto :goto_0

    .line 409
    :cond_1
    iget-object v3, p0, Lgnu/lists/FString;->data:[C

    .line 410
    .local v3, "d":[C
    move v4, v2

    .local v4, "i":I
    :cond_2
    add-int/lit8 v4, v4, -0x1

    if-ltz v4, :cond_3

    .line 412
    aget-char v5, v3, v4

    aget-char v6, v1, v4

    if-eq v5, v6, :cond_2

    .line 413
    return v0

    .line 415
    .end local v4    # "i":I
    :cond_3
    const/4 v0, 0x1

    return v0

    .line 408
    .end local v3    # "d":[C
    :cond_4
    :goto_0
    return v0

    .line 404
    .end local v1    # "str":[C
    .end local v2    # "n":I
    :cond_5
    :goto_1
    return v0
.end method

.method public final fill(C)V
    .locals 2
    .param p1, "ch"    # C

    .line 358
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    .line 359
    .local v0, "d":[C
    iget v1, p0, Lgnu/lists/FString;->size:I

    .local v1, "i":I
    :goto_0
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_0

    .line 360
    aput-char p1, v0, v1

    goto :goto_0

    .line 361
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method public fill(IIC)V
    .locals 2
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "value"    # C

    .line 365
    if-ltz p1, :cond_1

    iget v0, p0, Lgnu/lists/FString;->size:I

    if-gt p2, v0, :cond_1

    .line 367
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    .line 368
    .local v0, "d":[C
    move v1, p1

    .local v1, "i":I
    :goto_0
    if-ge v1, p2, :cond_0

    .line 369
    aput-char p3, v0, v1

    .line 368
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 370
    .end local v1    # "i":I
    :cond_0
    return-void

    .line 366
    .end local v0    # "d":[C
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public final get(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .line 160
    iget v0, p0, Lgnu/lists/FString;->size:I

    if-ge p1, v0, :cond_0

    .line 162
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    aget-char v0, v0, p1

    invoke-static {v0}, Lgnu/lists/Convert;->toObject(C)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 161
    :cond_0
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method protected getBuffer()Ljava/lang/Object;
    .locals 1

    .line 144
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    return-object v0
.end method

.method public final getBuffer(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .line 148
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    aget-char v0, v0, p1

    invoke-static {v0}, Lgnu/lists/Convert;->toObject(C)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getBufferLength()I
    .locals 1

    .line 119
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    array-length v0, v0

    return v0
.end method

.method public getChars(IILjava/lang/StringBuffer;)V
    .locals 2
    .param p1, "srcBegin"    # I
    .param p2, "srcEnd"    # I
    .param p3, "dst"    # Ljava/lang/StringBuffer;

    .line 191
    if-ltz p1, :cond_2

    if-gt p1, p2, :cond_2

    .line 193
    iget v0, p0, Lgnu/lists/FString;->size:I

    if-gt p2, v0, :cond_1

    .line 195
    if-ge p1, p2, :cond_0

    .line 196
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    sub-int v1, p2, p1

    invoke-virtual {p3, v0, p1, v1}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 197
    :cond_0
    return-void

    .line 194
    :cond_1
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 192
    :cond_2
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public getChars(II[CI)V
    .locals 2
    .param p1, "srcBegin"    # I
    .param p2, "srcEnd"    # I
    .param p3, "dst"    # [C
    .param p4, "dstBegin"    # I

    .line 179
    if-ltz p1, :cond_3

    if-gt p1, p2, :cond_3

    .line 181
    iget v0, p0, Lgnu/lists/FString;->size:I

    if-gt p2, v0, :cond_2

    .line 183
    add-int v0, p4, p2

    sub-int/2addr v0, p1

    array-length v1, p3

    if-gt v0, v1, :cond_1

    .line 185
    if-ge p1, p2, :cond_0

    .line 186
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    sub-int v1, p2, p1

    invoke-static {v0, p1, p3, p4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 187
    :cond_0
    return-void

    .line 184
    :cond_1
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p4}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 182
    :cond_2
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 180
    :cond_3
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public getChars(Ljava/lang/StringBuffer;)V
    .locals 3
    .param p1, "dst"    # Ljava/lang/StringBuffer;

    .line 201
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    const/4 v1, 0x0

    iget v2, p0, Lgnu/lists/FString;->size:I

    invoke-virtual {p1, v0, v1, v2}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 202
    return-void
.end method

.method public getElementKind()I
    .locals 1

    .line 439
    const/16 v0, 0x1d

    return v0
.end method

.method public hashCode()I
    .locals 6

    .line 393
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    .line 394
    .local v0, "val":[C
    iget v1, p0, Lgnu/lists/FString;->size:I

    .line 395
    .local v1, "len":I
    const/4 v2, 0x0

    .line 396
    .local v2, "hash":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 397
    mul-int/lit8 v4, v2, 0x1f

    aget-char v5, v0, v3

    add-int v2, v4, v5

    .line 396
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 398
    .end local v3    # "i":I
    :cond_0
    return v2
.end method

.method public length()I
    .locals 1

    .line 114
    iget v0, p0, Lgnu/lists/FString;->size:I

    return v0
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .locals 4
    .param p1, "in"    # Ljava/io/ObjectInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 574
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    .line 575
    .local v0, "size":I
    new-array v1, v0, [C

    .line 576
    .local v1, "data":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 577
    invoke-interface {p1}, Ljava/io/ObjectInput;->readChar()C

    move-result v3

    aput-char v3, v1, v2

    .line 576
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 578
    .end local v2    # "i":I
    :cond_0
    iput-object v1, p0, Lgnu/lists/FString;->data:[C

    .line 579
    iput v0, p0, Lgnu/lists/FString;->size:I

    .line 580
    return-void
.end method

.method public replace(ILjava/lang/String;)V
    .locals 3
    .param p1, "where"    # I
    .param p2, "string"    # Ljava/lang/String;

    .line 386
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    const/4 v2, 0x0

    invoke-virtual {p2, v2, v0, v1, p1}, Ljava/lang/String;->getChars(II[CI)V

    .line 387
    return-void
.end method

.method public replace(I[CII)V
    .locals 1
    .param p1, "where"    # I
    .param p2, "chars"    # [C
    .param p3, "start"    # I
    .param p4, "count"    # I

    .line 381
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    invoke-static {p2, p3, v0, p1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 382
    return-void
.end method

.method public final setBuffer(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 153
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    aget-char v0, v0, p1

    invoke-static {v0}, Lgnu/lists/Convert;->toObject(C)Ljava/lang/Object;

    move-result-object v0

    .line 154
    .local v0, "old":Ljava/lang/Object;
    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    invoke-static {p2}, Lgnu/lists/Convert;->toChar(Ljava/lang/Object;)C

    move-result v2

    aput-char v2, v1, p1

    .line 155
    return-object v0
.end method

.method public setBufferLength(I)V
    .locals 5
    .param p1, "length"    # I

    .line 124
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    array-length v1, v0

    .line 125
    .local v1, "oldLength":I
    if-eq v1, p1, :cond_1

    .line 127
    new-array v2, p1, [C

    .line 128
    .local v2, "tmp":[C
    if-ge v1, p1, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, p1

    :goto_0
    const/4 v4, 0x0

    invoke-static {v0, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 130
    iput-object v2, p0, Lgnu/lists/FString;->data:[C

    .line 132
    .end local v2    # "tmp":[C
    :cond_1
    return-void
.end method

.method public setCharAt(IC)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "ch"    # C

    .line 345
    if-ltz p1, :cond_0

    iget v0, p0, Lgnu/lists/FString;->size:I

    if-ge p1, v0, :cond_0

    .line 347
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    aput-char p2, v0, p1

    .line 348
    return-void

    .line 346
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public setCharAtBuffer(IC)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "ch"    # C

    .line 352
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    aput-char p2, v0, p1

    .line 353
    return-void
.end method

.method public shift(III)V
    .locals 1
    .param p1, "srcStart"    # I
    .param p2, "dstStart"    # I
    .param p3, "count"    # I

    .line 223
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    invoke-static {v0, p1, v0, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 224
    return-void
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 3
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 339
    new-instance v0, Lgnu/lists/FString;

    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    sub-int v2, p2, p1

    invoke-direct {v0, v1, p1, v2}, Lgnu/lists/FString;-><init>([CII)V

    return-object v0
.end method

.method public substring(II)Ljava/lang/String;
    .locals 3
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 333
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    sub-int v2, p2, p1

    invoke-direct {v0, v1, p1, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public toCharArray()[C
    .locals 5

    .line 209
    iget-object v0, p0, Lgnu/lists/FString;->data:[C

    array-length v0, v0

    .line 210
    .local v0, "val_length":I
    iget v1, p0, Lgnu/lists/FString;->size:I

    .line 211
    .local v1, "seq_length":I
    if-ne v1, v0, :cond_0

    .line 212
    iget-object v2, p0, Lgnu/lists/FString;->data:[C

    return-object v2

    .line 215
    :cond_0
    new-array v2, v1, [C

    .line 216
    .local v2, "tmp":[C
    iget-object v3, p0, Lgnu/lists/FString;->data:[C

    const/4 v4, 0x0

    invoke-static {v3, v4, v2, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 217
    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 328
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    const/4 v2, 0x0

    iget v3, p0, Lgnu/lists/FString;->size:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .locals 4
    .param p1, "out"    # Ljava/io/ObjectOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 564
    iget v0, p0, Lgnu/lists/FString;->size:I

    .line 565
    .local v0, "size":I
    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 566
    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    .line 567
    .local v1, "d":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 568
    aget-char v3, v1, v2

    invoke-interface {p1, v3}, Ljava/io/ObjectOutput;->writeChar(I)V

    .line 567
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 569
    .end local v2    # "i":I
    :cond_0
    return-void
.end method

.method public writeTo(IILjava/lang/Appendable;)V
    .locals 2
    .param p1, "start"    # I
    .param p2, "count"    # I
    .param p3, "dest"    # Ljava/lang/Appendable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 524
    instance-of v0, p3, Ljava/io/Writer;

    if-eqz v0, :cond_0

    .line 528
    :try_start_0
    move-object v0, p3

    check-cast v0, Ljava/io/Writer;

    iget-object v1, p0, Lgnu/lists/FString;->data:[C

    invoke-virtual {v0, v1, p1, p2}, Ljava/io/Writer;->write([CII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 533
    goto :goto_0

    .line 530
    :catch_0
    move-exception v0

    .line 532
    .local v0, "ex":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 537
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_0
    add-int v0, p1, p2

    invoke-interface {p3, p0, p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;

    .line 539
    :goto_0
    return-void
.end method

.method public writeTo(Ljava/lang/Appendable;)V
    .locals 2
    .param p1, "dest"    # Ljava/lang/Appendable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 543
    const/4 v0, 0x0

    iget v1, p0, Lgnu/lists/FString;->size:I

    invoke-virtual {p0, v0, v1, p1}, Lgnu/lists/FString;->writeTo(IILjava/lang/Appendable;)V

    .line 544
    return-void
.end method
