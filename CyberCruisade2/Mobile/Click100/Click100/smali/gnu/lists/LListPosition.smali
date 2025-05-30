.class Lgnu/lists/LListPosition;
.super Lgnu/lists/ExtPosition;
.source "LListPosition.java"


# instance fields
.field xpos:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lgnu/lists/LList;IZ)V
    .locals 0
    .param p1, "seq"    # Lgnu/lists/LList;
    .param p2, "index"    # I
    .param p3, "isAfter"    # Z

    .line 42
    invoke-direct {p0}, Lgnu/lists/ExtPosition;-><init>()V

    .line 43
    invoke-virtual {p0, p1, p2, p3}, Lgnu/lists/LListPosition;->set(Lgnu/lists/LList;IZ)V

    .line 44
    return-void
.end method

.method public constructor <init>(Lgnu/lists/LListPosition;)V
    .locals 1
    .param p1, "old"    # Lgnu/lists/LListPosition;

    .line 30
    invoke-direct {p0}, Lgnu/lists/ExtPosition;-><init>()V

    .line 31
    iget-object v0, p1, Lgnu/lists/LListPosition;->sequence:Lgnu/lists/AbstractSequence;

    iput-object v0, p0, Lgnu/lists/LListPosition;->sequence:Lgnu/lists/AbstractSequence;

    .line 32
    iget v0, p1, Lgnu/lists/LListPosition;->ipos:I

    iput v0, p0, Lgnu/lists/LListPosition;->ipos:I

    .line 33
    iget-object v0, p1, Lgnu/lists/LListPosition;->xpos:Ljava/lang/Object;

    iput-object v0, p0, Lgnu/lists/LListPosition;->xpos:Ljava/lang/Object;

    .line 34
    return-void
.end method


# virtual methods
.method public copy()Lgnu/lists/SeqPosition;
    .locals 1

    .line 38
    new-instance v0, Lgnu/lists/LListPosition;

    invoke-direct {v0, p0}, Lgnu/lists/LListPosition;-><init>(Lgnu/lists/LListPosition;)V

    return-object v0
.end method

.method public getNext()Ljava/lang/Object;
    .locals 2

    .line 128
    invoke-virtual {p0}, Lgnu/lists/LListPosition;->getNextPair()Lgnu/lists/Pair;

    move-result-object v0

    .line 129
    .local v0, "pair":Lgnu/lists/Pair;
    if-nez v0, :cond_0

    sget-object v1, Lgnu/lists/LList;->eofValue:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iget-object v1, v0, Lgnu/lists/Pair;->car:Ljava/lang/Object;

    :goto_0
    return-object v1
.end method

.method public getNextPair()Lgnu/lists/Pair;
    .locals 3

    .line 101
    iget v0, p0, Lgnu/lists/LListPosition;->ipos:I

    and-int/lit8 v0, v0, 0x1

    .line 103
    .local v0, "isAfter":I
    if-lez v0, :cond_1

    .line 105
    iget-object v1, p0, Lgnu/lists/LListPosition;->xpos:Ljava/lang/Object;

    if-nez v1, :cond_0

    .line 107
    iget-object v1, p0, Lgnu/lists/LListPosition;->sequence:Lgnu/lists/AbstractSequence;

    .line 108
    .local v1, "next":Ljava/lang/Object;
    iget v2, p0, Lgnu/lists/LListPosition;->ipos:I

    shr-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_3

    .line 109
    move-object v2, v1

    check-cast v2, Lgnu/lists/Pair;

    iget-object v1, v2, Lgnu/lists/Pair;->cdr:Ljava/lang/Object;

    goto :goto_0

    .line 112
    .end local v1    # "next":Ljava/lang/Object;
    :cond_0
    check-cast v1, Lgnu/lists/Pair;

    iget-object v1, v1, Lgnu/lists/Pair;->cdr:Ljava/lang/Object;

    check-cast v1, Lgnu/lists/Pair;

    move-object v2, v1

    check-cast v2, Lgnu/lists/Pair;

    iget-object v1, v1, Lgnu/lists/Pair;->cdr:Ljava/lang/Object;

    .restart local v1    # "next":Ljava/lang/Object;
    goto :goto_0

    .line 116
    .end local v1    # "next":Ljava/lang/Object;
    :cond_1
    iget-object v1, p0, Lgnu/lists/LListPosition;->xpos:Ljava/lang/Object;

    if-nez v1, :cond_2

    .line 117
    iget-object v1, p0, Lgnu/lists/LListPosition;->sequence:Lgnu/lists/AbstractSequence;

    .restart local v1    # "next":Ljava/lang/Object;
    goto :goto_0

    .line 119
    .end local v1    # "next":Ljava/lang/Object;
    :cond_2
    check-cast v1, Lgnu/lists/Pair;

    iget-object v1, v1, Lgnu/lists/Pair;->cdr:Ljava/lang/Object;

    .line 121
    .restart local v1    # "next":Ljava/lang/Object;
    :cond_3
    :goto_0
    sget-object v2, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    if-ne v1, v2, :cond_4

    .line 122
    const/4 v2, 0x0

    return-object v2

    .line 123
    :cond_4
    move-object v2, v1

    check-cast v2, Lgnu/lists/Pair;

    return-object v2
.end method

.method public getPrevious()Ljava/lang/Object;
    .locals 2

    .line 154
    invoke-virtual {p0}, Lgnu/lists/LListPosition;->getPreviousPair()Lgnu/lists/Pair;

    move-result-object v0

    .line 155
    .local v0, "pair":Lgnu/lists/Pair;
    if-nez v0, :cond_0

    sget-object v1, Lgnu/lists/LList;->eofValue:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iget-object v1, v0, Lgnu/lists/Pair;->car:Ljava/lang/Object;

    :goto_0
    return-object v1
.end method

.method public getPreviousPair()Lgnu/lists/Pair;
    .locals 4

    .line 141
    iget v0, p0, Lgnu/lists/LListPosition;->ipos:I

    and-int/lit8 v0, v0, 0x1

    .line 142
    .local v0, "isAfter":I
    iget-object v1, p0, Lgnu/lists/LListPosition;->xpos:Ljava/lang/Object;

    .line 143
    .local v1, "p":Ljava/lang/Object;
    const/4 v2, 0x0

    if-lez v0, :cond_1

    .line 144
    if-nez v1, :cond_0

    iget-object v3, p0, Lgnu/lists/LListPosition;->sequence:Lgnu/lists/AbstractSequence;

    goto :goto_0

    :cond_0
    move-object v3, v1

    check-cast v3, Lgnu/lists/Pair;

    iget-object v3, v3, Lgnu/lists/Pair;->cdr:Ljava/lang/Object;

    :goto_0
    move-object v1, v3

    goto :goto_1

    .line 145
    :cond_1
    if-nez v1, :cond_2

    .line 146
    return-object v2

    .line 147
    :cond_2
    :goto_1
    sget-object v3, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    if-ne v1, v3, :cond_3

    .line 148
    return-object v2

    .line 149
    :cond_3
    move-object v2, v1

    check-cast v2, Lgnu/lists/Pair;

    return-object v2
.end method

.method public gotoNext()Z
    .locals 7

    .line 171
    iget v0, p0, Lgnu/lists/LListPosition;->ipos:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 172
    .local v0, "isAfter":Z
    :goto_0
    iget v3, p0, Lgnu/lists/LListPosition;->ipos:I

    .line 173
    .local v3, "old_i":I
    iget-object v4, p0, Lgnu/lists/LListPosition;->xpos:Ljava/lang/Object;

    .line 174
    .local v4, "xp":Ljava/lang/Object;
    if-eqz v4, :cond_3

    .line 176
    if-eqz v0, :cond_1

    .line 177
    move-object v5, v4

    check-cast v5, Lgnu/lists/Pair;

    iget-object v4, v5, Lgnu/lists/Pair;->cdr:Ljava/lang/Object;

    .line 178
    :cond_1
    move-object v5, v4

    check-cast v5, Lgnu/lists/Pair;

    iget-object v5, v5, Lgnu/lists/Pair;->cdr:Ljava/lang/Object;

    sget-object v6, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    if-ne v5, v6, :cond_2

    .line 179
    return v2

    .line 180
    :cond_2
    iput-object v4, p0, Lgnu/lists/LListPosition;->xpos:Ljava/lang/Object;

    .line 181
    iget v2, p0, Lgnu/lists/LListPosition;->ipos:I

    or-int/2addr v2, v1

    add-int/lit8 v2, v2, 0x2

    iput v2, p0, Lgnu/lists/LListPosition;->ipos:I

    goto :goto_1

    .line 183
    :cond_3
    iget v5, p0, Lgnu/lists/LListPosition;->ipos:I

    shr-int/2addr v5, v1

    if-nez v5, :cond_5

    .line 185
    iget-object v5, p0, Lgnu/lists/LListPosition;->sequence:Lgnu/lists/AbstractSequence;

    sget-object v6, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    if-ne v5, v6, :cond_4

    .line 186
    return v2

    .line 187
    :cond_4
    const/4 v2, 0x3

    iput v2, p0, Lgnu/lists/LListPosition;->ipos:I

    goto :goto_1

    .line 191
    :cond_5
    iget-object v4, p0, Lgnu/lists/LListPosition;->sequence:Lgnu/lists/AbstractSequence;

    .line 192
    move-object v5, v4

    check-cast v5, Lgnu/lists/Pair;

    iget-object v5, v5, Lgnu/lists/Pair;->cdr:Ljava/lang/Object;

    sget-object v6, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    if-ne v5, v6, :cond_6

    .line 193
    return v2

    .line 194
    :cond_6
    const/4 v2, 0x5

    iput v2, p0, Lgnu/lists/LListPosition;->ipos:I

    .line 195
    iput-object v4, p0, Lgnu/lists/LListPosition;->xpos:Ljava/lang/Object;

    .line 197
    :goto_1
    return v1
.end method

.method public gotoPrevious()Z
    .locals 5

    .line 202
    iget v0, p0, Lgnu/lists/LListPosition;->ipos:I

    const/4 v1, 0x1

    ushr-int/2addr v0, v1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 203
    return v2

    .line 204
    :cond_0
    iget v0, p0, Lgnu/lists/LListPosition;->ipos:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_1

    .line 207
    iget v0, p0, Lgnu/lists/LListPosition;->ipos:I

    add-int/lit8 v0, v0, -0x3

    iput v0, p0, Lgnu/lists/LListPosition;->ipos:I

    .line 208
    return v1

    .line 210
    :cond_1
    invoke-virtual {p0}, Lgnu/lists/LListPosition;->nextIndex()I

    move-result v0

    .line 211
    .local v0, "index":I
    iget-object v3, p0, Lgnu/lists/LListPosition;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v3, Lgnu/lists/LList;

    add-int/lit8 v4, v0, -0x1

    invoke-virtual {p0, v3, v4, v2}, Lgnu/lists/LListPosition;->set(Lgnu/lists/LList;IZ)V

    .line 212
    return v1
.end method

.method public hasNext()Z
    .locals 4

    .line 80
    iget-object v0, p0, Lgnu/lists/LListPosition;->xpos:Ljava/lang/Object;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_3

    .line 82
    iget v0, p0, Lgnu/lists/LListPosition;->ipos:I

    shr-int/2addr v0, v2

    if-nez v0, :cond_1

    .line 83
    iget-object v0, p0, Lgnu/lists/LListPosition;->sequence:Lgnu/lists/AbstractSequence;

    sget-object v3, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    if-eq v0, v3, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    .line 84
    :cond_1
    iget-object v0, p0, Lgnu/lists/LListPosition;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/lists/Pair;

    iget-object v0, v0, Lgnu/lists/Pair;->cdr:Ljava/lang/Object;

    sget-object v3, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    if-eq v0, v3, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1

    .line 87
    :cond_3
    check-cast v0, Lgnu/lists/Pair;

    iget-object v0, v0, Lgnu/lists/Pair;->cdr:Ljava/lang/Object;

    .line 88
    .local v0, "next":Ljava/lang/Object;
    iget v3, p0, Lgnu/lists/LListPosition;->ipos:I

    and-int/2addr v3, v2

    if-lez v3, :cond_4

    .line 89
    move-object v3, v0

    check-cast v3, Lgnu/lists/Pair;

    iget-object v0, v3, Lgnu/lists/Pair;->cdr:Ljava/lang/Object;

    .line 90
    :cond_4
    sget-object v3, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    if-eq v0, v3, :cond_5

    const/4 v1, 0x1

    :cond_5
    return v1
.end method

.method public hasPrevious()Z
    .locals 2

    .line 95
    iget v0, p0, Lgnu/lists/LListPosition;->ipos:I

    const/4 v1, 0x1

    ushr-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public nextIndex()I
    .locals 1

    .line 166
    iget v0, p0, Lgnu/lists/LListPosition;->ipos:I

    shr-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public set(Lgnu/lists/AbstractSequence;IZ)V
    .locals 1
    .param p1, "seq"    # Lgnu/lists/AbstractSequence;
    .param p2, "index"    # I
    .param p3, "isAfter"    # Z

    .line 74
    move-object v0, p1

    check-cast v0, Lgnu/lists/LList;

    invoke-virtual {p0, v0, p2, p3}, Lgnu/lists/LListPosition;->set(Lgnu/lists/LList;IZ)V

    .line 75
    return-void
.end method

.method public set(Lgnu/lists/LList;IZ)V
    .locals 3
    .param p1, "seq"    # Lgnu/lists/LList;
    .param p2, "index"    # I
    .param p3, "isAfter"    # Z

    .line 48
    iput-object p1, p0, Lgnu/lists/LListPosition;->sequence:Lgnu/lists/AbstractSequence;

    .line 49
    shl-int/lit8 v0, p2, 0x1

    or-int/2addr v0, p3

    iput v0, p0, Lgnu/lists/LListPosition;->ipos:I

    .line 50
    move v0, p2

    .line 51
    .local v0, "skip":I
    if-eqz p3, :cond_0

    .line 53
    add-int/lit8 v0, v0, -0x2

    goto :goto_0

    .line 57
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 59
    :goto_0
    if-ltz v0, :cond_2

    .line 61
    move-object v1, p1

    .line 62
    .local v1, "p":Ljava/lang/Object;
    :goto_1
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_1

    .line 64
    move-object v2, v1

    check-cast v2, Lgnu/lists/Pair;

    iget-object v1, v2, Lgnu/lists/Pair;->cdr:Ljava/lang/Object;

    goto :goto_1

    .line 66
    :cond_1
    iput-object v1, p0, Lgnu/lists/LListPosition;->xpos:Ljava/lang/Object;

    .line 67
    .end local v1    # "p":Ljava/lang/Object;
    goto :goto_2

    .line 69
    :cond_2
    const/4 v1, 0x0

    iput-object v1, p0, Lgnu/lists/LListPosition;->xpos:Ljava/lang/Object;

    .line 70
    :goto_2
    return-void
.end method

.method public setNext(Ljava/lang/Object;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .line 134
    invoke-virtual {p0}, Lgnu/lists/LListPosition;->getNextPair()Lgnu/lists/Pair;

    move-result-object v0

    .line 135
    .local v0, "pair":Lgnu/lists/Pair;
    iput-object p1, v0, Lgnu/lists/Pair;->car:Ljava/lang/Object;

    .line 136
    return-void
.end method

.method public setPrevious(Ljava/lang/Object;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .line 160
    invoke-virtual {p0}, Lgnu/lists/LListPosition;->getPreviousPair()Lgnu/lists/Pair;

    move-result-object v0

    .line 161
    .local v0, "pair":Lgnu/lists/Pair;
    iput-object p1, v0, Lgnu/lists/Pair;->car:Ljava/lang/Object;

    .line 162
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 217
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 218
    .local v0, "sbuf":Ljava/lang/StringBuffer;
    const-string v1, "LListPos["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 220
    const-string v1, "index:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 221
    iget v1, p0, Lgnu/lists/LListPosition;->ipos:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 222
    invoke-virtual {p0}, Lgnu/lists/LListPosition;->isAfter()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 223
    const-string v1, " after"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 224
    :cond_0
    iget v1, p0, Lgnu/lists/LListPosition;->position:I

    if-ltz v1, :cond_1

    .line 226
    const-string v1, " position:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 227
    iget v1, p0, Lgnu/lists/LListPosition;->position:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 229
    :cond_1
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 230
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
