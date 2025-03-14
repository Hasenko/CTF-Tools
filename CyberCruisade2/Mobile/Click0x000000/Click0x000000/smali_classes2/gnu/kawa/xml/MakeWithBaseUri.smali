.class public Lgnu/kawa/xml/MakeWithBaseUri;
.super Lgnu/kawa/xml/NodeConstructor;
.source "MakeWithBaseUri.java"


# static fields
.field static final beginEntityMethod:Lgnu/bytecode/Method;

.field static final endEntityMethod:Lgnu/bytecode/Method;

.field public static final makeWithBaseUri:Lgnu/kawa/xml/MakeWithBaseUri;

.field static final typeXConsumer:Lgnu/bytecode/ClassType;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 18
    new-instance v0, Lgnu/kawa/xml/MakeWithBaseUri;

    invoke-direct {v0}, Lgnu/kawa/xml/MakeWithBaseUri;-><init>()V

    sput-object v0, Lgnu/kawa/xml/MakeWithBaseUri;->makeWithBaseUri:Lgnu/kawa/xml/MakeWithBaseUri;

    .line 60
    const-string v0, "gnu.lists.XConsumer"

    invoke-static {v0}, Lgnu/bytecode/ClassType;->make(Ljava/lang/String;)Lgnu/bytecode/ClassType;

    move-result-object v0

    sput-object v0, Lgnu/kawa/xml/MakeWithBaseUri;->typeXConsumer:Lgnu/bytecode/ClassType;

    .line 61
    const-string v1, "beginEntity"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v1

    sput-object v1, Lgnu/kawa/xml/MakeWithBaseUri;->beginEntityMethod:Lgnu/bytecode/Method;

    .line 63
    const-string v1, "endEntity"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v0

    sput-object v0, Lgnu/kawa/xml/MakeWithBaseUri;->endEntityMethod:Lgnu/bytecode/Method;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Lgnu/kawa/xml/NodeConstructor;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lgnu/mapping/CallContext;)V
    .locals 6
    .param p1, "ctx"    # Lgnu/mapping/CallContext;

    .line 24
    iget-object v0, p1, Lgnu/mapping/CallContext;->consumer:Lgnu/lists/Consumer;

    .line 25
    .local v0, "saved":Lgnu/lists/Consumer;
    invoke-static {p1}, Lgnu/kawa/xml/NodeConstructor;->pushNodeContext(Lgnu/mapping/CallContext;)Lgnu/xml/XMLFilter;

    move-result-object v1

    .line 26
    .local v1, "out":Lgnu/lists/Consumer;
    invoke-virtual {p1}, Lgnu/mapping/CallContext;->getNextArg()Ljava/lang/Object;

    move-result-object v2

    .line 27
    .local v2, "baseUri":Ljava/lang/Object;
    invoke-virtual {p1}, Lgnu/mapping/CallContext;->getNextArg()Ljava/lang/Object;

    move-result-object v3

    .line 28
    .local v3, "node":Ljava/lang/Object;
    instance-of v4, v1, Lgnu/lists/XConsumer;

    if-eqz v4, :cond_0

    .line 29
    move-object v4, v1

    check-cast v4, Lgnu/lists/XConsumer;

    invoke-interface {v4, v2}, Lgnu/lists/XConsumer;->beginEntity(Ljava/lang/Object;)V

    .line 32
    :cond_0
    :try_start_0
    invoke-static {v3, v1}, Lgnu/mapping/Values;->writeValues(Ljava/lang/Object;Lgnu/lists/Consumer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    instance-of v4, v1, Lgnu/lists/XConsumer;

    if-eqz v4, :cond_1

    .line 37
    move-object v4, v1

    check-cast v4, Lgnu/lists/XConsumer;

    invoke-interface {v4}, Lgnu/lists/XConsumer;->endEntity()V

    .line 38
    :cond_1
    instance-of v4, v1, Lgnu/lists/TreeList;

    if-eqz v4, :cond_2

    .line 39
    move-object v4, v1

    check-cast v4, Lgnu/lists/TreeList;

    invoke-virtual {v4}, Lgnu/lists/TreeList;->dump()V

    .line 40
    :cond_2
    invoke-static {v0, p1}, Lgnu/kawa/xml/NodeConstructor;->popNodeContext(Lgnu/lists/Consumer;Lgnu/mapping/CallContext;)V

    .line 41
    nop

    .line 42
    return-void

    .line 36
    :catchall_0
    move-exception v4

    instance-of v5, v1, Lgnu/lists/XConsumer;

    if-eqz v5, :cond_3

    .line 37
    move-object v5, v1

    check-cast v5, Lgnu/lists/XConsumer;

    invoke-interface {v5}, Lgnu/lists/XConsumer;->endEntity()V

    .line 38
    :cond_3
    instance-of v5, v1, Lgnu/lists/TreeList;

    if-eqz v5, :cond_4

    .line 39
    move-object v5, v1

    check-cast v5, Lgnu/lists/TreeList;

    invoke-virtual {v5}, Lgnu/lists/TreeList;->dump()V

    .line 40
    :cond_4
    invoke-static {v0, p1}, Lgnu/kawa/xml/NodeConstructor;->popNodeContext(Lgnu/lists/Consumer;Lgnu/mapping/CallContext;)V

    throw v4
.end method

.method public compileToNode(Lgnu/expr/ApplyExp;Lgnu/expr/Compilation;Lgnu/expr/ConsumerTarget;)V
    .locals 6
    .param p1, "exp"    # Lgnu/expr/ApplyExp;
    .param p2, "comp"    # Lgnu/expr/Compilation;
    .param p3, "target"    # Lgnu/expr/ConsumerTarget;

    .line 48
    invoke-virtual {p3}, Lgnu/expr/ConsumerTarget;->getConsumerVariable()Lgnu/bytecode/Variable;

    move-result-object v0

    .line 49
    .local v0, "consumer":Lgnu/bytecode/Variable;
    invoke-virtual {p1}, Lgnu/expr/ApplyExp;->getArgs()[Lgnu/expr/Expression;

    move-result-object v1

    .line 50
    .local v1, "args":[Lgnu/expr/Expression;
    array-length v2, v1

    .line 51
    .local v2, "nargs":I
    invoke-virtual {p2}, Lgnu/expr/Compilation;->getCode()Lgnu/bytecode/CodeAttr;

    move-result-object v3

    .line 52
    .local v3, "code":Lgnu/bytecode/CodeAttr;
    invoke-virtual {v3, v0}, Lgnu/bytecode/CodeAttr;->emitLoad(Lgnu/bytecode/Variable;)V

    .line 53
    const/4 v4, 0x0

    aget-object v4, v1, v4

    sget-object v5, Lgnu/expr/Target;->pushObject:Lgnu/expr/Target;

    invoke-virtual {v4, p2, v5}, Lgnu/expr/Expression;->compile(Lgnu/expr/Compilation;Lgnu/expr/Target;)V

    .line 54
    sget-object v4, Lgnu/kawa/xml/MakeWithBaseUri;->beginEntityMethod:Lgnu/bytecode/Method;

    invoke-virtual {v3, v4}, Lgnu/bytecode/CodeAttr;->emitInvokeInterface(Lgnu/bytecode/Method;)V

    .line 55
    const/4 v4, 0x1

    aget-object v4, v1, v4

    invoke-static {v4, p2, p3}, Lgnu/kawa/xml/MakeWithBaseUri;->compileChild(Lgnu/expr/Expression;Lgnu/expr/Compilation;Lgnu/expr/ConsumerTarget;)V

    .line 56
    invoke-virtual {v3, v0}, Lgnu/bytecode/CodeAttr;->emitLoad(Lgnu/bytecode/Variable;)V

    .line 57
    sget-object v4, Lgnu/kawa/xml/MakeWithBaseUri;->endEntityMethod:Lgnu/bytecode/Method;

    invoke-virtual {v3, v4}, Lgnu/bytecode/CodeAttr;->emitInvokeInterface(Lgnu/bytecode/Method;)V

    .line 58
    return-void
.end method

.method public numArgs()I
    .locals 1

    .line 20
    const/16 v0, 0x2002

    return v0
.end method
