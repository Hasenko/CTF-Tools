.class public Lgnu/kawa/xslt/XSLT;
.super Lgnu/xquery/lang/XQuery;
.source "XSLT.java"


# static fields
.field public static instance:Lgnu/kawa/xslt/XSLT;

.field public static nullMode:Lgnu/mapping/Symbol;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 71
    const/4 v0, 0x0

    const-string v1, ""

    invoke-static {v0, v1}, Lgnu/mapping/Symbol;->make(Ljava/lang/Object;Ljava/lang/String;)Lgnu/mapping/Symbol;

    move-result-object v0

    sput-object v0, Lgnu/kawa/xslt/XSLT;->nullMode:Lgnu/mapping/Symbol;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lgnu/xquery/lang/XQuery;-><init>()V

    .line 27
    sput-object p0, Lgnu/kawa/xslt/XSLT;->instance:Lgnu/kawa/xslt/XSLT;

    .line 28
    const/4 v0, 0x1

    invoke-static {v0}, Lgnu/expr/ModuleBody;->setMainPrintValues(Z)V

    .line 29
    return-void
.end method

.method public static applyTemplates(Ljava/lang/String;Lgnu/mapping/Symbol;)V
    .locals 5
    .param p0, "select"    # Ljava/lang/String;
    .param p1, "mode"    # Lgnu/mapping/Symbol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 184
    if-nez p1, :cond_0

    .line 185
    sget-object p1, Lgnu/kawa/xslt/XSLT;->nullMode:Lgnu/mapping/Symbol;

    .line 186
    :cond_0
    invoke-static {p1}, Lgnu/kawa/xslt/TemplateTable;->getTemplateTable(Lgnu/mapping/Symbol;)Lgnu/kawa/xslt/TemplateTable;

    move-result-object v0

    .line 187
    .local v0, "table":Lgnu/kawa/xslt/TemplateTable;
    invoke-static {}, Lgnu/mapping/CallContext;->getInstance()Lgnu/mapping/CallContext;

    move-result-object v1

    .line 188
    .local v1, "ctx":Lgnu/mapping/CallContext;
    invoke-static {}, Lgnu/kawa/xml/Focus;->getCurrent()Lgnu/kawa/xml/Focus;

    move-result-object v2

    .line 189
    .local v2, "pos":Lgnu/kawa/xml/Focus;
    iget-object v3, v2, Lgnu/kawa/xml/Focus;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v3, Lgnu/lists/TreeList;

    .line 190
    .local v3, "doc":Lgnu/lists/TreeList;
    iget v4, v2, Lgnu/kawa/xml/Focus;->ipos:I

    invoke-virtual {v3, v4}, Lgnu/lists/TreeList;->firstChildPos(I)I

    move-result v4

    invoke-virtual {v2, v3, v4}, Lgnu/kawa/xml/Focus;->push(Lgnu/lists/AbstractSequence;I)V

    .line 191
    invoke-static {v3, v2, v1}, Lgnu/kawa/xslt/XSLT;->process(Lgnu/lists/TreeList;Lgnu/kawa/xml/Focus;Lgnu/mapping/CallContext;)V

    .line 192
    invoke-virtual {v2}, Lgnu/kawa/xml/Focus;->pop()V

    .line 193
    return-void
.end method

.method public static defineApplyTemplate(Ljava/lang/String;DLgnu/mapping/Symbol;Lgnu/mapping/Procedure;)V
    .locals 1
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "priority"    # D
    .param p3, "mode"    # Lgnu/mapping/Symbol;
    .param p4, "template"    # Lgnu/mapping/Procedure;

    .line 78
    if-nez p3, :cond_0

    .line 79
    sget-object p3, Lgnu/kawa/xslt/XSLT;->nullMode:Lgnu/mapping/Symbol;

    .line 80
    :cond_0
    invoke-static {p3}, Lgnu/kawa/xslt/TemplateTable;->getTemplateTable(Lgnu/mapping/Symbol;)Lgnu/kawa/xslt/TemplateTable;

    move-result-object v0

    .line 81
    .local v0, "table":Lgnu/kawa/xslt/TemplateTable;
    invoke-virtual {v0, p0, p1, p2, p4}, Lgnu/kawa/xslt/TemplateTable;->enter(Ljava/lang/String;DLgnu/mapping/Procedure;)V

    .line 82
    return-void
.end method

.method public static defineCallTemplate(Lgnu/mapping/Symbol;DLgnu/mapping/Procedure;)V
    .locals 0
    .param p0, "name"    # Lgnu/mapping/Symbol;
    .param p1, "priority"    # D
    .param p3, "template"    # Lgnu/mapping/Procedure;

    .line 69
    return-void
.end method

.method public static defineTemplate(Lgnu/mapping/Symbol;Ljava/lang/String;DLgnu/mapping/Symbol;Lgnu/mapping/Procedure;)V
    .locals 0
    .param p0, "name"    # Lgnu/mapping/Symbol;
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "priority"    # D
    .param p4, "mode"    # Lgnu/mapping/Symbol;
    .param p5, "template"    # Lgnu/mapping/Procedure;

    .line 88
    if-eqz p0, :cond_0

    .line 89
    invoke-static {p0, p2, p3, p5}, Lgnu/kawa/xslt/XSLT;->defineCallTemplate(Lgnu/mapping/Symbol;DLgnu/mapping/Procedure;)V

    .line 90
    :cond_0
    if-eqz p1, :cond_1

    .line 91
    invoke-static {p1, p2, p3, p4, p5}, Lgnu/kawa/xslt/XSLT;->defineApplyTemplate(Ljava/lang/String;DLgnu/mapping/Symbol;Lgnu/mapping/Procedure;)V

    .line 92
    :cond_1
    return-void
.end method

.method public static getXsltInstance()Lgnu/kawa/xslt/XSLT;
    .locals 1

    .line 33
    sget-object v0, Lgnu/kawa/xslt/XSLT;->instance:Lgnu/kawa/xslt/XSLT;

    if-nez v0, :cond_0

    .line 34
    new-instance v0, Lgnu/kawa/xslt/XSLT;

    invoke-direct {v0}, Lgnu/kawa/xslt/XSLT;-><init>()V

    .line 35
    :cond_0
    sget-object v0, Lgnu/kawa/xslt/XSLT;->instance:Lgnu/kawa/xslt/XSLT;

    return-object v0
.end method

.method public static process(Lgnu/lists/TreeList;Lgnu/kawa/xml/Focus;Lgnu/mapping/CallContext;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 97
    iget-object v0, p2, Lgnu/mapping/CallContext;->consumer:Lgnu/lists/Consumer;

    .line 100
    :goto_0
    iget v1, p1, Lgnu/kawa/xml/Focus;->ipos:I

    .line 101
    invoke-virtual {p0, v1}, Lgnu/lists/TreeList;->getNextKind(I)I

    move-result v2

    .line 105
    packed-switch v2, :pswitch_data_0

    .line 159
    :pswitch_0
    return-void

    .line 154
    :pswitch_1
    ushr-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Lgnu/lists/TreeList;->nextDataIndex(I)I

    move-result v1

    shl-int/lit8 v1, v1, 0x1

    .line 155
    goto/16 :goto_2

    .line 134
    :pswitch_2
    invoke-virtual {p1}, Lgnu/kawa/xml/Focus;->getNextTypeObject()Ljava/lang/Object;

    .line 135
    invoke-virtual {p1}, Lgnu/kawa/xml/Focus;->getNextTypeName()Ljava/lang/String;

    move-result-object v2

    .line 136
    sget-object v3, Lgnu/kawa/xslt/TemplateTable;->nullModeTable:Lgnu/kawa/xslt/TemplateTable;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "@"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lgnu/kawa/xslt/TemplateTable;->find(Ljava/lang/String;)Lgnu/mapping/Procedure;

    move-result-object v2

    .line 137
    if-eqz v2, :cond_2

    .line 139
    invoke-virtual {v2, p2}, Lgnu/mapping/Procedure;->check0(Lgnu/mapping/CallContext;)V

    .line 140
    invoke-virtual {p2}, Lgnu/mapping/CallContext;->runUntilDone()V

    .line 141
    goto :goto_2

    .line 108
    :pswitch_3
    invoke-virtual {p0, v1}, Lgnu/lists/TreeList;->firstChildPos(I)I

    move-result v1

    .line 109
    goto :goto_2

    .line 111
    :pswitch_4
    invoke-virtual {p1}, Lgnu/kawa/xml/Focus;->getNextTypeObject()Ljava/lang/Object;

    move-result-object v2

    .line 112
    invoke-virtual {p1}, Lgnu/kawa/xml/Focus;->getNextTypeName()Ljava/lang/String;

    move-result-object v3

    .line 113
    sget-object v4, Lgnu/kawa/xslt/TemplateTable;->nullModeTable:Lgnu/kawa/xslt/TemplateTable;

    invoke-virtual {v4, v3}, Lgnu/kawa/xslt/TemplateTable;->find(Ljava/lang/String;)Lgnu/mapping/Procedure;

    move-result-object v3

    .line 114
    if-eqz v3, :cond_0

    .line 116
    invoke-virtual {v3, p2}, Lgnu/mapping/Procedure;->check0(Lgnu/mapping/CallContext;)V

    .line 117
    invoke-virtual {p2}, Lgnu/mapping/CallContext;->runUntilDone()V

    goto :goto_1

    .line 121
    :cond_0
    invoke-interface {v0, v2}, Lgnu/lists/Consumer;->startElement(Ljava/lang/Object;)V

    .line 122
    invoke-virtual {p0, v1}, Lgnu/lists/TreeList;->firstAttributePos(I)I

    move-result v2

    .line 123
    if-nez v2, :cond_1

    .line 124
    invoke-virtual {p0, v1}, Lgnu/lists/TreeList;->firstChildPos(I)I

    move-result v2

    .line 125
    :cond_1
    invoke-virtual {p1, p0, v2}, Lgnu/kawa/xml/Focus;->push(Lgnu/lists/AbstractSequence;I)V

    .line 126
    invoke-static {p0, p1, p2}, Lgnu/kawa/xslt/XSLT;->process(Lgnu/lists/TreeList;Lgnu/kawa/xml/Focus;Lgnu/mapping/CallContext;)V

    .line 127
    invoke-virtual {p1}, Lgnu/kawa/xml/Focus;->pop()V

    .line 128
    invoke-interface {v0}, Lgnu/lists/Consumer;->endElement()V

    .line 130
    :goto_1
    ushr-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Lgnu/lists/TreeList;->nextDataIndex(I)I

    move-result v1

    shl-int/lit8 v1, v1, 0x1

    .line 131
    invoke-virtual {p1}, Lgnu/kawa/xml/Focus;->gotoNext()Z

    .line 132
    goto :goto_2

    .line 145
    :cond_2
    :pswitch_5
    ushr-int/lit8 v1, v1, 0x1

    .line 146
    const v2, 0x7fffffff

    invoke-virtual {p0, v1, v2}, Lgnu/lists/TreeList;->nextNodeIndex(II)I

    move-result v2

    .line 147
    if-ne v1, v2, :cond_3

    .line 148
    invoke-virtual {p0, v1}, Lgnu/lists/TreeList;->nextDataIndex(I)I

    move-result v2

    .line 149
    :cond_3
    invoke-virtual {p0, v1, v2, v0}, Lgnu/lists/TreeList;->consumeIRange(IILgnu/lists/Consumer;)I

    .line 150
    shl-int/lit8 v1, v2, 0x1

    .line 151
    nop

    .line 161
    :goto_2
    iput v1, p1, Lgnu/kawa/xml/Focus;->ipos:I

    .line 162
    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1d
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static registerEnvironment()V
    .locals 1

    .line 62
    new-instance v0, Lgnu/kawa/xslt/XSLT;

    invoke-direct {v0}, Lgnu/kawa/xslt/XSLT;-><init>()V

    invoke-static {v0}, Lgnu/expr/Language;->setDefaults(Lgnu/expr/Language;)V

    .line 63
    return-void
.end method

.method public static runStylesheet()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 168
    invoke-static {}, Lgnu/mapping/CallContext;->getInstance()Lgnu/mapping/CallContext;

    move-result-object v0

    .line 169
    .local v0, "ctx":Lgnu/mapping/CallContext;
    invoke-static {}, Lgnu/expr/ApplicationMainSupport;->processSetProperties()V

    .line 170
    sget-object v1, Lgnu/expr/ApplicationMainSupport;->commandLineArgArray:[Ljava/lang/String;

    .line 171
    .local v1, "args":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    .line 173
    aget-object v3, v1, v2

    .line 174
    .local v3, "arg":Ljava/lang/String;
    invoke-static {v3}, Lgnu/kawa/xml/Document;->parse(Ljava/lang/Object;)Lgnu/kawa/xml/KDocument;

    move-result-object v4

    .line 175
    .local v4, "doc":Lgnu/kawa/xml/KDocument;
    invoke-static {}, Lgnu/kawa/xml/Focus;->getCurrent()Lgnu/kawa/xml/Focus;

    move-result-object v5

    .line 176
    .local v5, "pos":Lgnu/kawa/xml/Focus;
    iget-object v6, v4, Lgnu/kawa/xml/KDocument;->sequence:Lgnu/lists/AbstractSequence;

    iget v7, v4, Lgnu/kawa/xml/KDocument;->ipos:I

    invoke-virtual {v5, v6, v7}, Lgnu/kawa/xml/Focus;->push(Lgnu/lists/AbstractSequence;I)V

    .line 177
    iget-object v6, v4, Lgnu/kawa/xml/KDocument;->sequence:Lgnu/lists/AbstractSequence;

    check-cast v6, Lgnu/lists/TreeList;

    invoke-static {v6, v5, v0}, Lgnu/kawa/xslt/XSLT;->process(Lgnu/lists/TreeList;Lgnu/kawa/xml/Focus;Lgnu/mapping/CallContext;)V

    .line 171
    .end local v3    # "arg":Ljava/lang/String;
    .end local v4    # "doc":Lgnu/kawa/xml/KDocument;
    .end local v5    # "pos":Lgnu/kawa/xml/Focus;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 179
    .end local v2    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public getLexer(Lgnu/mapping/InPort;Lgnu/text/SourceMessages;)Lgnu/text/Lexer;
    .locals 1
    .param p1, "inp"    # Lgnu/mapping/InPort;
    .param p2, "messages"    # Lgnu/text/SourceMessages;

    .line 40
    new-instance v0, Lgnu/kawa/xslt/XslTranslator;

    invoke-direct {v0, p1, p2, p0}, Lgnu/kawa/xslt/XslTranslator;-><init>(Lgnu/mapping/InPort;Lgnu/text/SourceMessages;Lgnu/kawa/xslt/XSLT;)V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 22
    const-string v0, "XSLT"

    return-object v0
.end method

.method public parse(Lgnu/expr/Compilation;I)Z
    .locals 3
    .param p1, "comp"    # Lgnu/expr/Compilation;
    .param p2, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lgnu/text/SyntaxException;
        }
    .end annotation

    .line 46
    const/4 v0, 0x2

    sput v0, Lgnu/expr/Compilation;->defaultCallConvention:I

    .line 47
    iget-object v0, p1, Lgnu/expr/Compilation;->lexer:Lgnu/text/Lexer;

    check-cast v0, Lgnu/kawa/xslt/XslTranslator;

    invoke-virtual {v0, p1}, Lgnu/kawa/xslt/XslTranslator;->parse(Lgnu/expr/Compilation;)V

    .line 48
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lgnu/expr/Compilation;->setState(I)V

    .line 50
    new-instance v0, Lgnu/xquery/lang/XQParser;

    const/4 v1, 0x0

    invoke-virtual {p1}, Lgnu/expr/Compilation;->getMessages()Lgnu/text/SourceMessages;

    move-result-object v2

    invoke-direct {v0, v1, v2, p0}, Lgnu/xquery/lang/XQParser;-><init>(Lgnu/mapping/InPort;Lgnu/text/SourceMessages;Lgnu/xquery/lang/XQuery;)V

    .line 51
    .local v0, "xqparser":Lgnu/xquery/lang/XQParser;
    new-instance v1, Lgnu/xquery/lang/XQResolveNames;

    invoke-direct {v1, p1}, Lgnu/xquery/lang/XQResolveNames;-><init>(Lgnu/expr/Compilation;)V

    .line 52
    .local v1, "resolver":Lgnu/xquery/lang/XQResolveNames;
    iget-object v2, v0, Lgnu/xquery/lang/XQParser;->functionNamespacePath:[Lgnu/mapping/Namespace;

    iput-object v2, v1, Lgnu/xquery/lang/XQResolveNames;->functionNamespacePath:[Lgnu/mapping/Namespace;

    .line 53
    iput-object v0, v1, Lgnu/xquery/lang/XQResolveNames;->parser:Lgnu/xquery/lang/XQParser;

    .line 54
    iget-object v2, p1, Lgnu/expr/Compilation;->mainLambda:Lgnu/expr/ModuleExp;

    invoke-virtual {v1, v2}, Lgnu/xquery/lang/XQResolveNames;->resolveModule(Lgnu/expr/ModuleExp;)V

    .line 56
    const/4 v2, 0x1

    return v2
.end method
