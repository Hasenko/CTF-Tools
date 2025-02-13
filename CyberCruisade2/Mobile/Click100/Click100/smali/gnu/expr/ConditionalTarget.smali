.class public Lgnu/expr/ConditionalTarget;
.super Lgnu/expr/Target;
.source "ConditionalTarget.java"


# instance fields
.field public ifFalse:Lgnu/bytecode/Label;

.field public ifTrue:Lgnu/bytecode/Label;

.field language:Lgnu/expr/Language;

.field public trueBranchComesFirst:Z


# direct methods
.method public constructor <init>(Lgnu/bytecode/Label;Lgnu/bytecode/Label;Lgnu/expr/Language;)V
    .locals 1
    .param p1, "ifTrue"    # Lgnu/bytecode/Label;
    .param p2, "ifFalse"    # Lgnu/bytecode/Label;
    .param p3, "language"    # Lgnu/expr/Language;

    .line 21
    invoke-direct {p0}, Lgnu/expr/Target;-><init>()V

    .line 30
    const/4 v0, 0x1

    iput-boolean v0, p0, Lgnu/expr/ConditionalTarget;->trueBranchComesFirst:Z

    .line 22
    iput-object p1, p0, Lgnu/expr/ConditionalTarget;->ifTrue:Lgnu/bytecode/Label;

    .line 23
    iput-object p2, p0, Lgnu/expr/ConditionalTarget;->ifFalse:Lgnu/bytecode/Label;

    .line 24
    iput-object p3, p0, Lgnu/expr/ConditionalTarget;->language:Lgnu/expr/Language;

    .line 25
    return-void
.end method


# virtual methods
.method public compileFromStack(Lgnu/expr/Compilation;Lgnu/bytecode/Type;)V
    .locals 4
    .param p1, "comp"    # Lgnu/expr/Compilation;
    .param p2, "stackType"    # Lgnu/bytecode/Type;

    .line 36
    invoke-virtual {p1}, Lgnu/expr/Compilation;->getCode()Lgnu/bytecode/CodeAttr;

    move-result-object v0

    .line 37
    .local v0, "code":Lgnu/bytecode/CodeAttr;
    invoke-virtual {p2}, Lgnu/bytecode/Type;->getSignature()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 38
    .local v1, "sig":C
    sparse-switch v1, :sswitch_data_0

    .line 50
    iget-boolean v2, p0, Lgnu/expr/ConditionalTarget;->trueBranchComesFirst:Z

    if-eqz v2, :cond_2

    .line 52
    iget-object v2, p0, Lgnu/expr/ConditionalTarget;->ifFalse:Lgnu/bytecode/Label;

    invoke-virtual {v0, v2}, Lgnu/bytecode/CodeAttr;->emitGotoIfIntEqZero(Lgnu/bytecode/Label;)V

    .line 53
    iget-object v2, p0, Lgnu/expr/ConditionalTarget;->ifTrue:Lgnu/bytecode/Label;

    invoke-virtual {v0, v2}, Lgnu/bytecode/CodeAttr;->emitGoto(Lgnu/bytecode/Label;)V

    goto :goto_3

    .line 62
    :sswitch_0
    iget-object v3, p0, Lgnu/expr/ConditionalTarget;->language:Lgnu/expr/Language;

    if-nez v3, :cond_0

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    invoke-virtual {v3, v2}, Lgnu/expr/Language;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v2

    :goto_0
    invoke-virtual {p1, v2}, Lgnu/expr/Compilation;->compileConstant(Ljava/lang/Object;)V

    goto :goto_1

    .line 41
    :sswitch_1
    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lgnu/bytecode/CodeAttr;->emitPushLong(J)V

    .line 42
    goto :goto_1

    .line 47
    :sswitch_2
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lgnu/bytecode/CodeAttr;->emitPushFloat(F)V

    .line 48
    goto :goto_1

    .line 44
    :sswitch_3
    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lgnu/bytecode/CodeAttr;->emitPushDouble(D)V

    .line 45
    nop

    .line 66
    :goto_1
    iget-boolean v2, p0, Lgnu/expr/ConditionalTarget;->trueBranchComesFirst:Z

    if-eqz v2, :cond_1

    .line 67
    iget-object v2, p0, Lgnu/expr/ConditionalTarget;->ifFalse:Lgnu/bytecode/Label;

    invoke-virtual {v0, v2}, Lgnu/bytecode/CodeAttr;->emitGotoIfEq(Lgnu/bytecode/Label;)V

    goto :goto_2

    .line 69
    :cond_1
    iget-object v2, p0, Lgnu/expr/ConditionalTarget;->ifTrue:Lgnu/bytecode/Label;

    invoke-virtual {v0, v2}, Lgnu/bytecode/CodeAttr;->emitGotoIfNE(Lgnu/bytecode/Label;)V

    .line 70
    :goto_2
    invoke-virtual {p0, v0}, Lgnu/expr/ConditionalTarget;->emitGotoFirstBranch(Lgnu/bytecode/CodeAttr;)V

    .line 71
    return-void

    .line 57
    :cond_2
    iget-object v2, p0, Lgnu/expr/ConditionalTarget;->ifTrue:Lgnu/bytecode/Label;

    invoke-virtual {v0, v2}, Lgnu/bytecode/CodeAttr;->emitGotoIfIntNeZero(Lgnu/bytecode/Label;)V

    .line 58
    iget-object v2, p0, Lgnu/expr/ConditionalTarget;->ifFalse:Lgnu/bytecode/Label;

    invoke-virtual {v0, v2}, Lgnu/bytecode/CodeAttr;->emitGoto(Lgnu/bytecode/Label;)V

    .line 60
    :goto_3
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x44 -> :sswitch_3
        0x46 -> :sswitch_2
        0x4a -> :sswitch_1
        0x4c -> :sswitch_0
        0x5b -> :sswitch_0
    .end sparse-switch
.end method

.method public final emitGotoFirstBranch(Lgnu/bytecode/CodeAttr;)V
    .locals 1
    .param p1, "code"    # Lgnu/bytecode/CodeAttr;

    .line 77
    iget-boolean v0, p0, Lgnu/expr/ConditionalTarget;->trueBranchComesFirst:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lgnu/expr/ConditionalTarget;->ifTrue:Lgnu/bytecode/Label;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lgnu/expr/ConditionalTarget;->ifFalse:Lgnu/bytecode/Label;

    :goto_0
    invoke-virtual {p1, v0}, Lgnu/bytecode/CodeAttr;->emitGoto(Lgnu/bytecode/Label;)V

    .line 78
    return-void
.end method

.method public getType()Lgnu/bytecode/Type;
    .locals 1

    .line 32
    sget-object v0, Lgnu/bytecode/Type;->booleanType:Lgnu/bytecode/PrimType;

    return-object v0
.end method
