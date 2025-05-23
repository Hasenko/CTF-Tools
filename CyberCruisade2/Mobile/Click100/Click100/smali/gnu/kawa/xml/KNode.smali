.class public abstract Lgnu/kawa/xml/KNode;
.super Lgnu/lists/SeqPosition;
.source "KNode.java"

# interfaces
.implements Lorg/w3c/dom/Node;
.implements Lgnu/lists/Consumable;


# direct methods
.method public constructor <init>(Lgnu/xml/NodeTree;I)V
    .locals 0
    .param p1, "seq"    # Lgnu/xml/NodeTree;
    .param p2, "ipos"    # I

    .line 23
    invoke-direct {p0, p1, p2}, Lgnu/lists/SeqPosition;-><init>(Lgnu/lists/AbstractSequence;I)V

    .line 24
    return-void
.end method

.method public static atomicValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;

    .line 28
    instance-of v0, p0, Lgnu/kawa/xml/KNode;

    if-eqz v0, :cond_0

    .line 30
    move-object v0, p0

    check-cast v0, Lgnu/kawa/xml/KNode;

    .line 31
    .local v0, "node":Lgnu/kawa/xml/KNode;
    iget-object v1, v0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v1, Lgnu/xml/NodeTree;

    iget v2, v0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v1, v2}, Lgnu/xml/NodeTree;->typedValue(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 33
    .end local v0    # "node":Lgnu/kawa/xml/KNode;
    :cond_0
    return-object p0
.end method

.method public static coerce(Ljava/lang/Object;)Lgnu/kawa/xml/KNode;
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;

    .line 39
    instance-of v0, p0, Lgnu/kawa/xml/KNode;

    if-eqz v0, :cond_0

    .line 40
    move-object v0, p0

    check-cast v0, Lgnu/kawa/xml/KNode;

    return-object v0

    .line 41
    :cond_0
    instance-of v0, p0, Lgnu/xml/NodeTree;

    if-eqz v0, :cond_1

    .line 43
    move-object v0, p0

    check-cast v0, Lgnu/xml/NodeTree;

    .line 44
    .local v0, "ntree":Lgnu/xml/NodeTree;
    invoke-virtual {v0}, Lgnu/xml/NodeTree;->startPos()I

    move-result v1

    invoke-static {v0, v1}, Lgnu/kawa/xml/KNode;->make(Lgnu/xml/NodeTree;I)Lgnu/kawa/xml/KNode;

    move-result-object v1

    return-object v1

    .line 46
    .end local v0    # "ntree":Lgnu/xml/NodeTree;
    :cond_1
    instance-of v0, p0, Lgnu/lists/SeqPosition;

    if-eqz v0, :cond_2

    instance-of v0, p0, Lgnu/lists/TreePosition;

    if-nez v0, :cond_2

    .line 49
    move-object v0, p0

    check-cast v0, Lgnu/lists/SeqPosition;

    .line 50
    .local v0, "seqp":Lgnu/lists/SeqPosition;
    iget-object v1, v0, Lgnu/lists/SeqPosition;->sequence:Lgnu/lists/AbstractSequence;

    instance-of v1, v1, Lgnu/xml/NodeTree;

    if-eqz v1, :cond_2

    .line 51
    iget-object v1, v0, Lgnu/lists/SeqPosition;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v1, Lgnu/xml/NodeTree;

    iget v2, v0, Lgnu/lists/SeqPosition;->ipos:I

    invoke-static {v1, v2}, Lgnu/kawa/xml/KNode;->make(Lgnu/xml/NodeTree;I)Lgnu/kawa/xml/KNode;

    move-result-object v1

    return-object v1

    .line 53
    .end local v0    # "seqp":Lgnu/lists/SeqPosition;
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getNodeValue(Lgnu/xml/NodeTree;I)Ljava/lang/String;
    .locals 2
    .param p0, "seq"    # Lgnu/xml/NodeTree;
    .param p1, "ipos"    # I

    .line 159
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 160
    .local v0, "sbuf":Ljava/lang/StringBuffer;
    invoke-static {p0, p1, v0}, Lgnu/kawa/xml/KNode;->getNodeValue(Lgnu/xml/NodeTree;ILjava/lang/StringBuffer;)V

    .line 161
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getNodeValue(Lgnu/xml/NodeTree;ILjava/lang/StringBuffer;)V
    .locals 1
    .param p0, "seq"    # Lgnu/xml/NodeTree;
    .param p1, "ipos"    # I
    .param p2, "sbuf"    # Ljava/lang/StringBuffer;

    .line 166
    invoke-virtual {p0, p1}, Lgnu/xml/NodeTree;->posToDataIndex(I)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lgnu/xml/NodeTree;->stringValue(ILjava/lang/StringBuffer;)I

    .line 167
    return-void
.end method

.method public static make(Lgnu/xml/NodeTree;)Lgnu/kawa/xml/KNode;
    .locals 1
    .param p0, "seq"    # Lgnu/xml/NodeTree;

    .line 105
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lgnu/kawa/xml/KNode;->make(Lgnu/xml/NodeTree;I)Lgnu/kawa/xml/KNode;

    move-result-object v0

    return-object v0
.end method

.method public static make(Lgnu/xml/NodeTree;I)Lgnu/kawa/xml/KNode;
    .locals 3
    .param p0, "seq"    # Lgnu/xml/NodeTree;
    .param p1, "ipos"    # I

    .line 58
    invoke-virtual {p0, p1}, Lgnu/xml/NodeTree;->posToDataIndex(I)I

    move-result v0

    .line 60
    .local v0, "index":I
    :goto_0
    iget-object v1, p0, Lgnu/xml/NodeTree;->data:[C

    array-length v1, v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lgnu/xml/NodeTree;->data:[C

    aget-char v1, v1, v0

    const v2, 0xf112

    if-ne v1, v2, :cond_1

    .line 62
    add-int/lit8 v0, v0, 0x5

    .line 63
    iget v1, p0, Lgnu/xml/NodeTree;->gapStart:I

    if-ne v0, v1, :cond_0

    .line 64
    iget v0, p0, Lgnu/xml/NodeTree;->gapEnd:I

    .line 65
    :cond_0
    shl-int/lit8 p1, v0, 0x1

    goto :goto_0

    .line 67
    :cond_1
    invoke-virtual {p0, p1}, Lgnu/xml/NodeTree;->posToDataIndex(I)I

    move-result v1

    invoke-virtual {p0, v1}, Lgnu/xml/NodeTree;->getNextKindI(I)I

    move-result v1

    .line 68
    .local v1, "kind":I
    sparse-switch v1, :sswitch_data_0

    goto :goto_1

    .line 81
    :sswitch_0
    new-instance v2, Lgnu/kawa/xml/KProcessingInstruction;

    invoke-direct {v2, p0, p1}, Lgnu/kawa/xml/KProcessingInstruction;-><init>(Lgnu/xml/NodeTree;I)V

    return-object v2

    .line 79
    :sswitch_1
    new-instance v2, Lgnu/kawa/xml/KComment;

    invoke-direct {v2, p0, p1}, Lgnu/kawa/xml/KComment;-><init>(Lgnu/xml/NodeTree;I)V

    return-object v2

    .line 73
    :sswitch_2
    new-instance v2, Lgnu/kawa/xml/KAttr;

    invoke-direct {v2, p0, p1}, Lgnu/kawa/xml/KAttr;-><init>(Lgnu/xml/NodeTree;I)V

    return-object v2

    .line 75
    :sswitch_3
    new-instance v2, Lgnu/kawa/xml/KDocument;

    invoke-direct {v2, p0, p1}, Lgnu/kawa/xml/KDocument;-><init>(Lgnu/xml/NodeTree;I)V

    return-object v2

    .line 71
    :sswitch_4
    new-instance v2, Lgnu/kawa/xml/KElement;

    invoke-direct {v2, p0, p1}, Lgnu/kawa/xml/KElement;-><init>(Lgnu/xml/NodeTree;I)V

    return-object v2

    .line 77
    :sswitch_5
    new-instance v2, Lgnu/kawa/xml/KCDATASection;

    invoke-direct {v2, p0, p1}, Lgnu/kawa/xml/KCDATASection;-><init>(Lgnu/xml/NodeTree;I)V

    return-object v2

    .line 83
    :sswitch_6
    invoke-virtual {p0}, Lgnu/xml/NodeTree;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 84
    const/4 v2, 0x0

    return-object v2

    .line 87
    :cond_2
    :goto_1
    new-instance v2, Lgnu/kawa/xml/KText;

    invoke-direct {v2, p0, p1}, Lgnu/kawa/xml/KText;-><init>(Lgnu/xml/NodeTree;I)V

    return-object v2

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_6
        0x1f -> :sswitch_5
        0x21 -> :sswitch_4
        0x22 -> :sswitch_3
        0x23 -> :sswitch_2
        0x24 -> :sswitch_1
        0x25 -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    .locals 3
    .param p1, "newChild"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/w3c/dom/DOMException;
        }
    .end annotation

    .line 329
    new-instance v0, Lorg/w3c/dom/DOMException;

    const/4 v1, 0x7

    const-string v2, "appendChild not supported"

    invoke-direct {v0, v1, v2}, Lorg/w3c/dom/DOMException;-><init>(SLjava/lang/String;)V

    throw v0
.end method

.method public baseURI()Lgnu/text/Path;
    .locals 3

    .line 397
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lgnu/xml/NodeTree;->baseUriOfPos(IZ)Lgnu/text/Path;

    move-result-object v0

    return-object v0
.end method

.method public cloneNode(Z)Lorg/w3c/dom/Node;
    .locals 3
    .param p1, "deep"    # Z

    .line 344
    if-eqz p1, :cond_0

    .line 346
    new-instance v0, Lgnu/xml/NodeTree;

    invoke-direct {v0}, Lgnu/xml/NodeTree;-><init>()V

    .line 347
    .local v0, "tree":Lgnu/xml/NodeTree;
    iget-object v1, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v1, Lgnu/xml/NodeTree;

    iget v2, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v1, v2, v0}, Lgnu/xml/NodeTree;->consumeNext(ILgnu/lists/Consumer;)Z

    .line 348
    invoke-static {v0}, Lgnu/kawa/xml/KNode;->make(Lgnu/xml/NodeTree;)Lgnu/kawa/xml/KNode;

    move-result-object v1

    return-object v1

    .line 345
    .end local v0    # "tree":Lgnu/xml/NodeTree;
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "shallow cloneNode not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public compareDocumentPosition(Lorg/w3c/dom/Node;)S
    .locals 4
    .param p1, "other"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/w3c/dom/DOMException;
        }
    .end annotation

    .line 404
    instance-of v0, p1, Lgnu/kawa/xml/KNode;

    if-eqz v0, :cond_1

    .line 407
    move-object v0, p1

    check-cast v0, Lgnu/kawa/xml/KNode;

    .line 408
    .local v0, "n":Lgnu/kawa/xml/KNode;
    iget-object v1, v0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    .line 409
    .local v1, "nseq":Lgnu/lists/AbstractSequence;
    iget-object v2, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    if-ne v2, v1, :cond_0

    iget v2, p0, Lgnu/kawa/xml/KNode;->ipos:I

    iget v3, v0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v1, v2, v3}, Lgnu/lists/AbstractSequence;->compare(II)I

    move-result v2

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    invoke-virtual {v2, v1}, Lgnu/lists/AbstractSequence;->stableCompare(Lgnu/lists/AbstractSequence;)I

    move-result v2

    :goto_0
    int-to-short v2, v2

    return v2

    .line 405
    .end local v0    # "n":Lgnu/kawa/xml/KNode;
    .end local v1    # "nseq":Lgnu/lists/AbstractSequence;
    :cond_1
    new-instance v0, Lorg/w3c/dom/DOMException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "other Node is a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x9

    invoke-direct {v0, v2, v1}, Lorg/w3c/dom/DOMException;-><init>(SLjava/lang/String;)V

    throw v0
.end method

.method public consume(Lgnu/lists/Consumer;)V
    .locals 2
    .param p1, "out"    # Lgnu/lists/Consumer;

    .line 446
    instance-of v0, p1, Lgnu/lists/PositionConsumer;

    if-eqz v0, :cond_0

    .line 447
    move-object v0, p1

    check-cast v0, Lgnu/lists/PositionConsumer;

    invoke-interface {v0, p0}, Lgnu/lists/PositionConsumer;->consume(Lgnu/lists/SeqPosition;)V

    goto :goto_0

    .line 449
    :cond_0
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1, p1}, Lgnu/xml/NodeTree;->consumeNext(ILgnu/lists/Consumer;)Z

    .line 450
    :goto_0
    return-void
.end method

.method public copy()Lgnu/kawa/xml/KNode;
    .locals 3

    .line 94
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget-object v1, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    invoke-virtual {p0}, Lgnu/kawa/xml/KNode;->getPos()I

    move-result v2

    invoke-virtual {v1, v2}, Lgnu/lists/AbstractSequence;->copyPos(I)I

    move-result v1

    invoke-static {v0, v1}, Lgnu/kawa/xml/KNode;->make(Lgnu/xml/NodeTree;I)Lgnu/kawa/xml/KNode;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic copy()Lgnu/lists/SeqPosition;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lgnu/kawa/xml/KNode;->copy()Lgnu/kawa/xml/KNode;

    move-result-object v0

    return-object v0
.end method

.method public getAttributes()Lorg/w3c/dom/NamedNodeMap;
    .locals 2

    .line 361
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "getAttributes not implemented yet"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBaseURI()Ljava/lang/String;
    .locals 3

    .line 391
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lgnu/xml/NodeTree;->baseUriOfPos(IZ)Lgnu/text/Path;

    move-result-object v0

    .line 392
    .local v0, "uri":Ljava/lang/Object;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public getChildNodes()Lorg/w3c/dom/NodeList;
    .locals 3

    .line 258
    new-instance v0, Lgnu/kawa/xml/SortedNodes;

    invoke-direct {v0}, Lgnu/kawa/xml/SortedNodes;-><init>()V

    .line 259
    .local v0, "nodes":Lgnu/kawa/xml/Nodes;
    iget-object v1, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    iget v2, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v1, v2}, Lgnu/lists/AbstractSequence;->firstChildPos(I)I

    move-result v1

    .line 260
    .local v1, "child":I
    :goto_0
    if-eqz v1, :cond_0

    .line 262
    iget-object v2, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    invoke-virtual {v0, v2, v1}, Lgnu/kawa/xml/Nodes;->writePosition(Lgnu/lists/AbstractSequence;I)V

    .line 263
    iget-object v2, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    invoke-virtual {v2, v1}, Lgnu/lists/AbstractSequence;->nextPos(I)I

    move-result v1

    goto :goto_0

    .line 265
    :cond_0
    return-object v0
.end method

.method public getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;
    .locals 2
    .param p1, "tagname"    # Ljava/lang/String;

    .line 271
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "getElementsByTagName not implemented yet"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFeature(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "feature"    # Ljava/lang/String;
    .param p2, "version"    # Ljava/lang/String;

    .line 441
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFirstChild()Lorg/w3c/dom/Node;
    .locals 2

    .line 240
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1}, Lgnu/xml/NodeTree;->posFirstChild(I)I

    move-result v0

    .line 241
    .local v0, "child":I
    iget-object v1, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v1, Lgnu/xml/NodeTree;

    invoke-static {v1, v0}, Lgnu/kawa/xml/KNode;->make(Lgnu/xml/NodeTree;I)Lgnu/kawa/xml/KNode;

    move-result-object v1

    return-object v1
.end method

.method public getLastChild()Lorg/w3c/dom/Node;
    .locals 3

    .line 246
    const/4 v0, 0x0

    .line 247
    .local v0, "last":I
    iget-object v1, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    iget v2, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v1, v2}, Lgnu/lists/AbstractSequence;->firstChildPos(I)I

    move-result v1

    .line 248
    .local v1, "child":I
    :goto_0
    if-eqz v1, :cond_0

    .line 250
    move v0, v1

    .line 251
    iget-object v2, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    invoke-virtual {v2, v1}, Lgnu/lists/AbstractSequence;->nextPos(I)I

    move-result v1

    goto :goto_0

    .line 253
    :cond_0
    if-nez v0, :cond_1

    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v2, Lgnu/xml/NodeTree;

    invoke-static {v2, v0}, Lgnu/kawa/xml/KNode;->make(Lgnu/xml/NodeTree;I)Lgnu/kawa/xml/KNode;

    move-result-object v2

    :goto_1
    return-object v2
.end method

.method public getLocalName()Ljava/lang/String;
    .locals 2

    .line 154
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1}, Lgnu/xml/NodeTree;->posLocalName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNamespaceURI()Ljava/lang/String;
    .locals 2

    .line 144
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1}, Lgnu/xml/NodeTree;->posNamespaceURI(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNextSibling()Lorg/w3c/dom/Node;
    .locals 2

    .line 233
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1}, Lgnu/xml/NodeTree;->nextPos(I)I

    move-result v0

    .line 234
    .local v0, "next":I
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v1, Lgnu/xml/NodeTree;

    invoke-static {v1, v0}, Lgnu/kawa/xml/KNode;->make(Lgnu/xml/NodeTree;I)Lgnu/kawa/xml/KNode;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public getNodeName()Ljava/lang/String;
    .locals 2

    .line 119
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1}, Lgnu/lists/AbstractSequence;->getNextTypeName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNodeNameObject()Ljava/lang/Object;
    .locals 2

    .line 139
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1}, Lgnu/xml/NodeTree;->getNextTypeObject(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getNodeSymbol()Lgnu/mapping/Symbol;
    .locals 3

    .line 127
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1}, Lgnu/xml/NodeTree;->getNextTypeObject(I)Ljava/lang/Object;

    move-result-object v0

    .line 128
    .local v0, "type":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 129
    const/4 v1, 0x0

    return-object v1

    .line 130
    :cond_0
    instance-of v1, v0, Lgnu/mapping/Symbol;

    if-eqz v1, :cond_1

    .line 131
    move-object v1, v0

    check-cast v1, Lgnu/mapping/Symbol;

    return-object v1

    .line 132
    :cond_1
    sget-object v1, Lgnu/mapping/Namespace;->EmptyNamespace:Lgnu/mapping/Namespace;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lgnu/mapping/Namespace;->getSymbol(Ljava/lang/String;)Lgnu/mapping/Symbol;

    move-result-object v1

    return-object v1
.end method

.method public abstract getNodeType()S
.end method

.method public getNodeValue()Ljava/lang/String;
    .locals 2

    .line 171
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 172
    .local v0, "sbuf":Ljava/lang/StringBuffer;
    invoke-virtual {p0, v0}, Lgnu/kawa/xml/KNode;->getNodeValue(Ljava/lang/StringBuffer;)V

    .line 173
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getNodeValue(Ljava/lang/StringBuffer;)V
    .locals 2
    .param p1, "sbuf"    # Ljava/lang/StringBuffer;

    .line 178
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-static {v0, v1, p1}, Lgnu/kawa/xml/KNode;->getNodeValue(Lgnu/xml/NodeTree;ILjava/lang/StringBuffer;)V

    .line 179
    return-void
.end method

.method public getOwnerDocument()Lorg/w3c/dom/Document;
    .locals 4

    .line 353
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1}, Lgnu/lists/AbstractSequence;->getNextKind(I)I

    move-result v0

    .line 354
    .local v0, "kind":I
    const/16 v1, 0x22

    if-ne v0, v1, :cond_0

    .line 355
    new-instance v1, Lgnu/kawa/xml/KDocument;

    iget-object v2, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v2, Lgnu/xml/NodeTree;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lgnu/kawa/xml/KDocument;-><init>(Lgnu/xml/NodeTree;I)V

    return-object v1

    .line 356
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getParentNode()Lorg/w3c/dom/Node;
    .locals 2

    .line 202
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1}, Lgnu/lists/AbstractSequence;->parentPos(I)I

    move-result v0

    .line 203
    .local v0, "parent":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 204
    const/4 v1, 0x0

    return-object v1

    .line 205
    :cond_0
    iget-object v1, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v1, Lgnu/xml/NodeTree;

    invoke-static {v1, v0}, Lgnu/kawa/xml/KNode;->make(Lgnu/xml/NodeTree;I)Lgnu/kawa/xml/KNode;

    move-result-object v1

    return-object v1
.end method

.method public getPrefix()Ljava/lang/String;
    .locals 2

    .line 149
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1}, Lgnu/xml/NodeTree;->posPrefix(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPreviousSibling()Lorg/w3c/dom/Node;
    .locals 5

    .line 210
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1}, Lgnu/lists/AbstractSequence;->parentPos(I)I

    move-result v0

    .line 211
    .local v0, "parent":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 212
    const/4 v0, 0x0

    .line 213
    :cond_0
    iget-object v1, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v1, Lgnu/xml/NodeTree;

    iget v2, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v1, v2}, Lgnu/xml/NodeTree;->posToDataIndex(I)I

    move-result v1

    .line 214
    .local v1, "index":I
    iget-object v2, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    invoke-virtual {v2, v0}, Lgnu/lists/AbstractSequence;->firstChildPos(I)I

    move-result v2

    .line 215
    .local v2, "child":I
    const/4 v3, 0x0

    .line 218
    .local v3, "previous":I
    :cond_1
    move v3, v2

    .line 219
    iget-object v4, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    invoke-virtual {v4, v2}, Lgnu/lists/AbstractSequence;->nextPos(I)I

    move-result v2

    .line 220
    if-nez v2, :cond_2

    .line 221
    goto :goto_0

    .line 222
    :cond_2
    iget-object v4, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v4, Lgnu/xml/NodeTree;

    invoke-virtual {v4, v2}, Lgnu/xml/NodeTree;->posToDataIndex(I)I

    move-result v4

    if-ne v4, v1, :cond_1

    .line 223
    nop

    .line 225
    :goto_0
    if-nez v3, :cond_3

    const/4 v4, 0x0

    goto :goto_1

    :cond_3
    iget-object v4, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v4, Lgnu/xml/NodeTree;

    invoke-static {v4, v3}, Lgnu/kawa/xml/KNode;->make(Lgnu/xml/NodeTree;I)Lgnu/kawa/xml/KNode;

    move-result-object v4

    :goto_1
    return-object v4
.end method

.method public getTextContent()Ljava/lang/String;
    .locals 2

    .line 188
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 189
    .local v0, "sbuf":Ljava/lang/StringBuffer;
    invoke-virtual {p0, v0}, Lgnu/kawa/xml/KNode;->getTextContent(Ljava/lang/StringBuffer;)V

    .line 190
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected getTextContent(Ljava/lang/StringBuffer;)V
    .locals 0
    .param p1, "sbuf"    # Ljava/lang/StringBuffer;

    .line 196
    invoke-virtual {p0, p1}, Lgnu/kawa/xml/KNode;->getNodeValue(Ljava/lang/StringBuffer;)V

    .line 197
    return-void
.end method

.method public getUserData(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 460
    const/4 v0, 0x0

    return-object v0
.end method

.method public hasAttributes()Z
    .locals 1

    .line 371
    const/4 v0, 0x0

    return v0
.end method

.method public hasChildNodes()Z
    .locals 2

    .line 183
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1}, Lgnu/xml/NodeTree;->posFirstChild(I)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    .locals 3
    .param p1, "newChild"    # Lorg/w3c/dom/Node;
    .param p2, "refChild"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/w3c/dom/DOMException;
        }
    .end annotation

    .line 305
    new-instance v0, Lorg/w3c/dom/DOMException;

    const/4 v1, 0x7

    const-string v2, "insertBefore not supported"

    invoke-direct {v0, v1, v2}, Lorg/w3c/dom/DOMException;-><init>(SLjava/lang/String;)V

    throw v0
.end method

.method public isDefaultNamespace(Ljava/lang/String;)Z
    .locals 2
    .param p1, "namespaceURI"    # Ljava/lang/String;

    .line 376
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1, p1}, Lgnu/xml/NodeTree;->posIsDefaultNamespace(ILjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isEqualNode(Lorg/w3c/dom/Node;)Z
    .locals 2
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .line 425
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "getAttributesisEqualNode not implemented yet"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isSameNode(Lorg/w3c/dom/Node;)Z
    .locals 4
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .line 415
    instance-of v0, p1, Lgnu/kawa/xml/KNode;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 416
    return v1

    .line 417
    :cond_0
    move-object v0, p1

    check-cast v0, Lgnu/kawa/xml/KNode;

    .line 418
    .local v0, "n":Lgnu/kawa/xml/KNode;
    iget-object v2, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    iget-object v3, v0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    if-eq v2, v3, :cond_1

    .line 419
    return v1

    .line 420
    :cond_1
    iget-object v1, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    iget v2, p0, Lgnu/kawa/xml/KNode;->ipos:I

    iget v3, v0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v1, v2, v3}, Lgnu/lists/AbstractSequence;->equals(II)Z

    move-result v1

    return v1
.end method

.method public isSupported(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "feature"    # Ljava/lang/String;
    .param p2, "version"    # Ljava/lang/String;

    .line 110
    const/4 v0, 0x0

    return v0
.end method

.method public lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "prefix"    # Ljava/lang/String;

    .line 381
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1, p1}, Lgnu/xml/NodeTree;->posLookupNamespaceURI(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public lookupPrefix(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "namespaceURI"    # Ljava/lang/String;

    .line 386
    iget-object v0, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v0, Lgnu/xml/NodeTree;

    iget v1, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v0, v1, p1}, Lgnu/xml/NodeTree;->posLookupPrefix(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public normalize()V
    .locals 0

    .line 367
    return-void
.end method

.method public removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    .locals 3
    .param p1, "oldChild"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/w3c/dom/DOMException;
        }
    .end annotation

    .line 321
    new-instance v0, Lorg/w3c/dom/DOMException;

    const/4 v1, 0x7

    const-string v2, "removeChild not supported"

    invoke-direct {v0, v1, v2}, Lorg/w3c/dom/DOMException;-><init>(SLjava/lang/String;)V

    throw v0
.end method

.method public replaceChild(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    .locals 3
    .param p1, "newChild"    # Lorg/w3c/dom/Node;
    .param p2, "oldChild"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/w3c/dom/DOMException;
        }
    .end annotation

    .line 313
    new-instance v0, Lorg/w3c/dom/DOMException;

    const/4 v1, 0x7

    const-string v2, "replaceChild not supported"

    invoke-direct {v0, v1, v2}, Lorg/w3c/dom/DOMException;-><init>(SLjava/lang/String;)V

    throw v0
.end method

.method public setNodeValue(Ljava/lang/String;)V
    .locals 3
    .param p1, "nodeValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/w3c/dom/DOMException;
        }
    .end annotation

    .line 290
    new-instance v0, Lorg/w3c/dom/DOMException;

    const/4 v1, 0x7

    const-string v2, "setNodeValue not supported"

    invoke-direct {v0, v1, v2}, Lorg/w3c/dom/DOMException;-><init>(SLjava/lang/String;)V

    throw v0
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 3
    .param p1, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/w3c/dom/DOMException;
        }
    .end annotation

    .line 297
    new-instance v0, Lorg/w3c/dom/DOMException;

    const/4 v1, 0x7

    const-string v2, "setPrefix not supported"

    invoke-direct {v0, v1, v2}, Lorg/w3c/dom/DOMException;-><init>(SLjava/lang/String;)V

    throw v0
.end method

.method public setTextContent(Ljava/lang/String;)V
    .locals 3
    .param p1, "textContent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/w3c/dom/DOMException;
        }
    .end annotation

    .line 337
    new-instance v0, Lorg/w3c/dom/DOMException;

    const/4 v1, 0x7

    const-string v2, "setTextContent not supported"

    invoke-direct {v0, v1, v2}, Lorg/w3c/dom/DOMException;-><init>(SLjava/lang/String;)V

    throw v0
.end method

.method public setUserData(Ljava/lang/String;Ljava/lang/Object;Lorg/w3c/dom/UserDataHandler;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;
    .param p3, "handler"    # Lorg/w3c/dom/UserDataHandler;

    .line 455
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "setUserData not implemented yet"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 431
    new-instance v0, Lgnu/mapping/CharArrayOutPort;

    invoke-direct {v0}, Lgnu/mapping/CharArrayOutPort;-><init>()V

    .line 432
    .local v0, "wr":Lgnu/mapping/CharArrayOutPort;
    new-instance v1, Lgnu/xml/XMLPrinter;

    invoke-direct {v1, v0}, Lgnu/xml/XMLPrinter;-><init>(Ljava/io/Writer;)V

    .line 433
    .local v1, "xp":Lgnu/xml/XMLPrinter;
    iget-object v2, p0, Lgnu/kawa/xml/KNode;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v2, Lgnu/xml/NodeTree;

    iget v3, p0, Lgnu/kawa/xml/KNode;->ipos:I

    invoke-virtual {v2, v3, v1}, Lgnu/xml/NodeTree;->consumeNext(ILgnu/lists/Consumer;)Z

    .line 434
    invoke-virtual {v1}, Lgnu/xml/XMLPrinter;->close()V

    .line 435
    invoke-virtual {v0}, Lgnu/mapping/CharArrayOutPort;->close()V

    .line 436
    invoke-virtual {v0}, Lgnu/mapping/CharArrayOutPort;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
