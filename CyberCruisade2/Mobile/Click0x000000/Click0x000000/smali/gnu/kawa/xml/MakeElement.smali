.class public Lgnu/kawa/xml/MakeElement;
.super Lgnu/kawa/xml/NodeConstructor;
.source "MakeElement.java"


# static fields
.field static final endElementMethod:Lgnu/bytecode/Method;

.field public static final makeElement:Lgnu/kawa/xml/MakeElement;

.field static final startElementMethod3:Lgnu/bytecode/Method;

.field static final startElementMethod4:Lgnu/bytecode/Method;

.field static final typeMakeElement:Lgnu/bytecode/ClassType;


# instance fields
.field public copyNamespacesMode:I

.field private handlingKeywordParameters:Z

.field namespaceNodes:Lgnu/xml/NamespaceBinding;

.field public tag:Lgnu/mapping/Symbol;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 13
    new-instance v0, Lgnu/kawa/xml/MakeElement;

    invoke-direct {v0}, Lgnu/kawa/xml/MakeElement;-><init>()V

    sput-object v0, Lgnu/kawa/xml/MakeElement;->makeElement:Lgnu/kawa/xml/MakeElement;

    .line 179
    const-string v0, "gnu.kawa.xml.MakeElement"

    invoke-static {v0}, Lgnu/bytecode/ClassType;->make(Ljava/lang/String;)Lgnu/bytecode/ClassType;

    move-result-object v0

    sput-object v0, Lgnu/kawa/xml/MakeElement;->typeMakeElement:Lgnu/bytecode/ClassType;

    .line 181
    const/4 v1, 0x3

    const-string v2, "startElement"

    invoke-virtual {v0, v2, v1}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v1

    sput-object v1, Lgnu/kawa/xml/MakeElement;->startElementMethod3:Lgnu/bytecode/Method;

    .line 183
    const/4 v1, 0x4

    invoke-virtual {v0, v2, v1}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v1

    sput-object v1, Lgnu/kawa/xml/MakeElement;->startElementMethod4:Lgnu/bytecode/Method;

    .line 185
    const-string v1, "endElement"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v0

    sput-object v0, Lgnu/kawa/xml/MakeElement;->endElementMethod:Lgnu/bytecode/Method;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Lgnu/kawa/xml/NodeConstructor;-><init>()V

    .line 23
    const/4 v0, 0x1

    iput v0, p0, Lgnu/kawa/xml/MakeElement;->copyNamespacesMode:I

    return-void
.end method

.method public static endElement(Lgnu/lists/Consumer;Ljava/lang/Object;)V
    .locals 0
    .param p0, "out"    # Lgnu/lists/Consumer;
    .param p1, "type"    # Ljava/lang/Object;

    .line 96
    invoke-interface {p0}, Lgnu/lists/Consumer;->endElement()V

    .line 97
    return-void
.end method

.method public static getTagName(Lgnu/expr/ApplyExp;)Lgnu/mapping/Symbol;
    .locals 4
    .param p0, "exp"    # Lgnu/expr/ApplyExp;

    .line 53
    invoke-virtual {p0}, Lgnu/expr/ApplyExp;->getArgs()[Lgnu/expr/Expression;

    move-result-object v0

    .line 54
    .local v0, "args":[Lgnu/expr/Expression;
    array-length v1, v0

    if-lez v1, :cond_0

    .line 56
    const/4 v1, 0x0

    aget-object v1, v0, v1

    .line 57
    .local v1, "arg0":Lgnu/expr/Expression;
    instance-of v2, v1, Lgnu/expr/QuoteExp;

    if-eqz v2, :cond_0

    .line 59
    move-object v2, v1

    check-cast v2, Lgnu/expr/QuoteExp;

    invoke-virtual {v2}, Lgnu/expr/QuoteExp;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 60
    .local v2, "val":Ljava/lang/Object;
    instance-of v3, v2, Lgnu/mapping/Symbol;

    if-eqz v3, :cond_0

    .line 61
    move-object v3, v2

    check-cast v3, Lgnu/mapping/Symbol;

    return-object v3

    .line 64
    .end local v1    # "arg0":Lgnu/expr/Expression;
    .end local v2    # "val":Ljava/lang/Object;
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public static startElement(Lgnu/lists/Consumer;Ljava/lang/Object;I)V
    .locals 2
    .param p0, "out"    # Lgnu/lists/Consumer;
    .param p1, "qname"    # Ljava/lang/Object;
    .param p2, "copyNamespacesMode"    # I

    .line 85
    instance-of v0, p1, Lgnu/mapping/Symbol;

    if-eqz v0, :cond_0

    .line 86
    move-object v0, p1

    check-cast v0, Lgnu/mapping/Symbol;

    .local v0, "type":Lgnu/mapping/Symbol;
    goto :goto_0

    .line 88
    .end local v0    # "type":Lgnu/mapping/Symbol;
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-static {v1, v0, v1}, Lgnu/mapping/Symbol;->make(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lgnu/mapping/Symbol;

    move-result-object v0

    .line 89
    .restart local v0    # "type":Lgnu/mapping/Symbol;
    :goto_0
    instance-of v1, p0, Lgnu/xml/XMLFilter;

    if-eqz v1, :cond_1

    .line 90
    move-object v1, p0

    check-cast v1, Lgnu/xml/XMLFilter;

    iput p2, v1, Lgnu/xml/XMLFilter;->copyNamespacesMode:I

    .line 91
    :cond_1
    invoke-interface {p0, v0}, Lgnu/lists/Consumer;->startElement(Ljava/lang/Object;)V

    .line 92
    return-void
.end method

.method public static startElement(Lgnu/lists/Consumer;Ljava/lang/Object;ILgnu/xml/NamespaceBinding;)V
    .locals 3
    .param p0, "out"    # Lgnu/lists/Consumer;
    .param p1, "qname"    # Ljava/lang/Object;
    .param p2, "copyNamespacesMode"    # I
    .param p3, "namespaceNodes"    # Lgnu/xml/NamespaceBinding;

    .line 72
    instance-of v0, p1, Lgnu/mapping/Symbol;

    if-eqz v0, :cond_0

    .line 73
    new-instance v0, Lgnu/xml/XName;

    move-object v1, p1

    check-cast v1, Lgnu/mapping/Symbol;

    invoke-direct {v0, v1, p3}, Lgnu/xml/XName;-><init>(Lgnu/mapping/Symbol;Lgnu/xml/NamespaceBinding;)V

    .local v0, "type":Lgnu/xml/XName;
    goto :goto_0

    .line 75
    .end local v0    # "type":Lgnu/xml/XName;
    :cond_0
    new-instance v0, Lgnu/xml/XName;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-static {v2, v1, v2}, Lgnu/mapping/Symbol;->make(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lgnu/mapping/Symbol;

    move-result-object v1

    invoke-direct {v0, v1, p3}, Lgnu/xml/XName;-><init>(Lgnu/mapping/Symbol;Lgnu/xml/NamespaceBinding;)V

    .line 76
    .restart local v0    # "type":Lgnu/xml/XName;
    :goto_0
    instance-of v1, p0, Lgnu/xml/XMLFilter;

    if-eqz v1, :cond_1

    .line 77
    move-object v1, p0

    check-cast v1, Lgnu/xml/XMLFilter;

    iput p2, v1, Lgnu/xml/XMLFilter;->copyNamespacesMode:I

    .line 78
    :cond_1
    invoke-interface {p0, v0}, Lgnu/lists/Consumer;->startElement(Ljava/lang/Object;)V

    .line 79
    return-void
.end method


# virtual methods
.method public apply(Lgnu/mapping/CallContext;)V
    .locals 6
    .param p1, "ctx"    # Lgnu/mapping/CallContext;

    .line 101
    iget-object v0, p1, Lgnu/mapping/CallContext;->consumer:Lgnu/lists/Consumer;

    .line 102
    .local v0, "saved":Lgnu/lists/Consumer;
    invoke-static {p1}, Lgnu/kawa/xml/MakeElement;->pushNodeContext(Lgnu/mapping/CallContext;)Lgnu/xml/XMLFilter;

    move-result-object v1

    .line 105
    .local v1, "out":Lgnu/lists/Consumer;
    :try_start_0
    iget-object v2, p0, Lgnu/kawa/xml/MakeElement;->tag:Lgnu/mapping/Symbol;

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lgnu/mapping/CallContext;->getNextArg()Ljava/lang/Object;

    move-result-object v2

    .line 106
    .local v2, "type":Ljava/lang/Object;
    :goto_0
    iget-object v3, p0, Lgnu/kawa/xml/MakeElement;->namespaceNodes:Lgnu/xml/NamespaceBinding;

    if-eqz v3, :cond_1

    .line 107
    iget v4, p0, Lgnu/kawa/xml/MakeElement;->copyNamespacesMode:I

    invoke-static {v1, v2, v4, v3}, Lgnu/kawa/xml/MakeElement;->startElement(Lgnu/lists/Consumer;Ljava/lang/Object;ILgnu/xml/NamespaceBinding;)V

    goto :goto_1

    .line 109
    :cond_1
    iget v3, p0, Lgnu/kawa/xml/MakeElement;->copyNamespacesMode:I

    invoke-static {v1, v2, v3}, Lgnu/kawa/xml/MakeElement;->startElement(Lgnu/lists/Consumer;Ljava/lang/Object;I)V

    .line 110
    :goto_1
    sget-object v3, Lgnu/expr/Special;->dfault:Lgnu/expr/Special;

    .line 113
    .local v3, "endMarker":Ljava/lang/Object;
    :goto_2
    invoke-virtual {p1, v3}, Lgnu/mapping/CallContext;->getNextArg(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 114
    .local v4, "arg":Ljava/lang/Object;
    if-ne v4, v3, :cond_2

    .line 115
    nop

    .line 124
    .end local v4    # "arg":Ljava/lang/Object;
    invoke-static {v1, v2}, Lgnu/kawa/xml/MakeElement;->endElement(Lgnu/lists/Consumer;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    .end local v2    # "type":Ljava/lang/Object;
    .end local v3    # "endMarker":Ljava/lang/Object;
    invoke-static {v0, p1}, Lgnu/kawa/xml/MakeElement;->popNodeContext(Lgnu/lists/Consumer;Lgnu/mapping/CallContext;)V

    .line 129
    nop

    .line 130
    return-void

    .line 116
    .restart local v2    # "type":Ljava/lang/Object;
    .restart local v3    # "endMarker":Ljava/lang/Object;
    .restart local v4    # "arg":Ljava/lang/Object;
    :cond_2
    :try_start_1
    instance-of v5, v4, Lgnu/lists/Consumable;

    if-eqz v5, :cond_3

    .line 117
    move-object v5, v4

    check-cast v5, Lgnu/lists/Consumable;

    invoke-interface {v5, v1}, Lgnu/lists/Consumable;->consume(Lgnu/lists/Consumer;)V

    goto :goto_3

    .line 119
    :cond_3
    invoke-virtual {p1, v4}, Lgnu/mapping/CallContext;->writeValue(Ljava/lang/Object;)V

    .line 121
    :goto_3
    invoke-virtual {p0}, Lgnu/kawa/xml/MakeElement;->isHandlingKeywordParameters()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 122
    invoke-interface {v1}, Lgnu/lists/Consumer;->endAttribute()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 123
    .end local v4    # "arg":Ljava/lang/Object;
    :cond_4
    goto :goto_2

    .line 128
    .end local v2    # "type":Ljava/lang/Object;
    .end local v3    # "endMarker":Ljava/lang/Object;
    :catchall_0
    move-exception v2

    invoke-static {v0, p1}, Lgnu/kawa/xml/MakeElement;->popNodeContext(Lgnu/lists/Consumer;Lgnu/mapping/CallContext;)V

    goto :goto_5

    :goto_4
    throw v2

    :goto_5
    goto :goto_4
.end method

.method public compileToNode(Lgnu/expr/ApplyExp;Lgnu/expr/Compilation;Lgnu/expr/ConsumerTarget;)V
    .locals 7
    .param p1, "exp"    # Lgnu/expr/ApplyExp;
    .param p2, "comp"    # Lgnu/expr/Compilation;
    .param p3, "target"    # Lgnu/expr/ConsumerTarget;

    .line 135
    invoke-virtual {p3}, Lgnu/expr/ConsumerTarget;->getConsumerVariable()Lgnu/bytecode/Variable;

    move-result-object v0

    .line 136
    .local v0, "consumer":Lgnu/bytecode/Variable;
    invoke-virtual {p1}, Lgnu/expr/ApplyExp;->getArgs()[Lgnu/expr/Expression;

    move-result-object v1

    .line 137
    .local v1, "args":[Lgnu/expr/Expression;
    array-length v2, v1

    .line 138
    .local v2, "nargs":I
    invoke-virtual {p2}, Lgnu/expr/Compilation;->getCode()Lgnu/bytecode/CodeAttr;

    move-result-object v3

    .line 139
    .local v3, "code":Lgnu/bytecode/CodeAttr;
    invoke-virtual {v3, v0}, Lgnu/bytecode/CodeAttr;->emitLoad(Lgnu/bytecode/Variable;)V

    .line 140
    invoke-virtual {v3}, Lgnu/bytecode/CodeAttr;->emitDup()V

    .line 142
    iget-object v4, p0, Lgnu/kawa/xml/MakeElement;->tag:Lgnu/mapping/Symbol;

    if-nez v4, :cond_0

    .line 144
    const/4 v4, 0x0

    aget-object v4, v1, v4

    sget-object v5, Lgnu/expr/Target;->pushObject:Lgnu/expr/Target;

    invoke-virtual {v4, p2, v5}, Lgnu/expr/Expression;->compile(Lgnu/expr/Compilation;Lgnu/expr/Target;)V

    .line 145
    const/4 v4, 0x1

    .local v4, "i":I
    goto :goto_0

    .line 149
    .end local v4    # "i":I
    :cond_0
    sget-object v5, Lgnu/expr/Target;->pushObject:Lgnu/expr/Target;

    invoke-virtual {p2, v4, v5}, Lgnu/expr/Compilation;->compileConstant(Ljava/lang/Object;Lgnu/expr/Target;)V

    .line 150
    const/4 v4, 0x0

    .line 152
    .restart local v4    # "i":I
    :goto_0
    const/4 v5, 0x1

    invoke-virtual {v3, v5, v5}, Lgnu/bytecode/CodeAttr;->emitDup(II)V

    .line 154
    iget v5, p0, Lgnu/kawa/xml/MakeElement;->copyNamespacesMode:I

    invoke-virtual {v3, v5}, Lgnu/bytecode/CodeAttr;->emitPushInt(I)V

    .line 155
    iget-object v5, p0, Lgnu/kawa/xml/MakeElement;->namespaceNodes:Lgnu/xml/NamespaceBinding;

    if-eqz v5, :cond_1

    .line 157
    sget-object v6, Lgnu/expr/Target;->pushObject:Lgnu/expr/Target;

    invoke-virtual {p2, v5, v6}, Lgnu/expr/Compilation;->compileConstant(Ljava/lang/Object;Lgnu/expr/Target;)V

    .line 158
    sget-object v5, Lgnu/kawa/xml/MakeElement;->startElementMethod4:Lgnu/bytecode/Method;

    invoke-virtual {v3, v5}, Lgnu/bytecode/CodeAttr;->emitInvokeStatic(Lgnu/bytecode/Method;)V

    goto :goto_1

    .line 161
    :cond_1
    sget-object v5, Lgnu/kawa/xml/MakeElement;->startElementMethod3:Lgnu/bytecode/Method;

    invoke-virtual {v3, v5}, Lgnu/bytecode/CodeAttr;->emitInvokeStatic(Lgnu/bytecode/Method;)V

    .line 162
    :goto_1
    if-ge v4, v2, :cond_3

    .line 164
    aget-object v5, v1, v4

    invoke-static {v5, p2, p3}, Lgnu/kawa/xml/MakeElement;->compileChild(Lgnu/expr/Expression;Lgnu/expr/Compilation;Lgnu/expr/ConsumerTarget;)V

    .line 165
    invoke-virtual {p0}, Lgnu/kawa/xml/MakeElement;->isHandlingKeywordParameters()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 167
    invoke-virtual {v3, v0}, Lgnu/bytecode/CodeAttr;->emitLoad(Lgnu/bytecode/Variable;)V

    .line 168
    sget-object v5, Lgnu/kawa/xml/MakeAttribute;->endAttributeMethod:Lgnu/bytecode/Method;

    invoke-virtual {v3, v5}, Lgnu/bytecode/CodeAttr;->emitInvokeInterface(Lgnu/bytecode/Method;)V

    .line 162
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 171
    :cond_3
    sget-object v5, Lgnu/kawa/xml/MakeElement;->endElementMethod:Lgnu/bytecode/Method;

    invoke-virtual {v3, v5}, Lgnu/bytecode/CodeAttr;->emitInvokeStatic(Lgnu/bytecode/Method;)V

    .line 172
    return-void
.end method

.method public getNamespaceNodes()Lgnu/xml/NamespaceBinding;
    .locals 1

    .line 43
    iget-object v0, p0, Lgnu/kawa/xml/MakeElement;->namespaceNodes:Lgnu/xml/NamespaceBinding;

    return-object v0
.end method

.method public getReturnType([Lgnu/expr/Expression;)Lgnu/bytecode/Type;
    .locals 1
    .param p1, "args"    # [Lgnu/expr/Expression;

    .line 176
    sget-object v0, Lgnu/expr/Compilation;->typeObject:Lgnu/bytecode/ClassType;

    return-object v0
.end method

.method public isHandlingKeywordParameters()Z
    .locals 1

    .line 31
    iget-boolean v0, p0, Lgnu/kawa/xml/MakeElement;->handlingKeywordParameters:Z

    return v0
.end method

.method public numArgs()I
    .locals 1

    .line 15
    iget-object v0, p0, Lgnu/kawa/xml/MakeElement;->tag:Lgnu/mapping/Symbol;

    if-nez v0, :cond_0

    const/16 v0, -0xfff

    goto :goto_0

    :cond_0
    const/16 v0, -0x1000

    :goto_0
    return v0
.end method

.method public setHandlingKeywordParameters(Z)V
    .locals 0
    .param p1, "value"    # Z

    .line 36
    iput-boolean p1, p0, Lgnu/kawa/xml/MakeElement;->handlingKeywordParameters:Z

    .line 37
    return-void
.end method

.method public setNamespaceNodes(Lgnu/xml/NamespaceBinding;)V
    .locals 0
    .param p1, "bindings"    # Lgnu/xml/NamespaceBinding;

    .line 48
    iput-object p1, p0, Lgnu/kawa/xml/MakeElement;->namespaceNodes:Lgnu/xml/NamespaceBinding;

    .line 49
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "makeElement["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lgnu/kawa/xml/MakeElement;->tag:Lgnu/mapping/Symbol;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
