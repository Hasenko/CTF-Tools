.class public Lgnu/bytecode/CpoolRef;
.super Lgnu/bytecode/CpoolEntry;
.source "CpoolRef.java"


# instance fields
.field clas:Lgnu/bytecode/CpoolClass;

.field nameAndType:Lgnu/bytecode/CpoolNameAndType;

.field tag:I


# direct methods
.method constructor <init>(I)V
    .locals 0
    .param p1, "tag"    # I

    .line 33
    invoke-direct {p0}, Lgnu/bytecode/CpoolEntry;-><init>()V

    iput p1, p0, Lgnu/bytecode/CpoolRef;->tag:I

    return-void
.end method

.method constructor <init>(Lgnu/bytecode/ConstantPool;IILgnu/bytecode/CpoolClass;Lgnu/bytecode/CpoolNameAndType;)V
    .locals 0
    .param p1, "cpool"    # Lgnu/bytecode/ConstantPool;
    .param p2, "hash"    # I
    .param p3, "tag"    # I
    .param p4, "clas"    # Lgnu/bytecode/CpoolClass;
    .param p5, "nameAndType"    # Lgnu/bytecode/CpoolNameAndType;

    .line 38
    invoke-direct {p0, p1, p2}, Lgnu/bytecode/CpoolEntry;-><init>(Lgnu/bytecode/ConstantPool;I)V

    .line 39
    iput p3, p0, Lgnu/bytecode/CpoolRef;->tag:I

    .line 40
    iput-object p4, p0, Lgnu/bytecode/CpoolRef;->clas:Lgnu/bytecode/CpoolClass;

    .line 41
    iput-object p5, p0, Lgnu/bytecode/CpoolRef;->nameAndType:Lgnu/bytecode/CpoolNameAndType;

    .line 42
    return-void
.end method

.method static final hashCode(Lgnu/bytecode/CpoolClass;Lgnu/bytecode/CpoolNameAndType;)I
    .locals 2
    .param p0, "clas"    # Lgnu/bytecode/CpoolClass;
    .param p1, "nameAndType"    # Lgnu/bytecode/CpoolNameAndType;

    .line 46
    invoke-virtual {p0}, Lgnu/bytecode/CpoolClass;->hashCode()I

    move-result v0

    invoke-virtual {p1}, Lgnu/bytecode/CpoolNameAndType;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method


# virtual methods
.method public final getCpoolClass()Lgnu/bytecode/CpoolClass;
    .locals 1

    .line 25
    iget-object v0, p0, Lgnu/bytecode/CpoolRef;->clas:Lgnu/bytecode/CpoolClass;

    return-object v0
.end method

.method public final getNameAndType()Lgnu/bytecode/CpoolNameAndType;
    .locals 1

    .line 30
    iget-object v0, p0, Lgnu/bytecode/CpoolRef;->nameAndType:Lgnu/bytecode/CpoolNameAndType;

    return-object v0
.end method

.method public getTag()I
    .locals 1

    .line 21
    iget v0, p0, Lgnu/bytecode/CpoolRef;->tag:I

    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 51
    iget v0, p0, Lgnu/bytecode/CpoolRef;->hash:I

    if-nez v0, :cond_0

    .line 52
    iget-object v0, p0, Lgnu/bytecode/CpoolRef;->clas:Lgnu/bytecode/CpoolClass;

    iget-object v1, p0, Lgnu/bytecode/CpoolRef;->nameAndType:Lgnu/bytecode/CpoolNameAndType;

    invoke-static {v0, v1}, Lgnu/bytecode/CpoolRef;->hashCode(Lgnu/bytecode/CpoolClass;Lgnu/bytecode/CpoolNameAndType;)I

    move-result v0

    iput v0, p0, Lgnu/bytecode/CpoolRef;->hash:I

    .line 53
    :cond_0
    iget v0, p0, Lgnu/bytecode/CpoolRef;->hash:I

    return v0
.end method

.method public print(Lgnu/bytecode/ClassTypeWriter;I)V
    .locals 4
    .param p1, "dst"    # Lgnu/bytecode/ClassTypeWriter;
    .param p2, "verbosity"    # I

    .line 66
    iget v0, p0, Lgnu/bytecode/CpoolRef;->tag:I

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    move-object v0, v1

    .line 71
    .local v0, "str":Ljava/lang/String;
    const-string v0, "<Unknown>Ref"

    goto :goto_0

    .line 66
    .end local v0    # "str":Ljava/lang/String;
    :pswitch_0
    move-object v0, v1

    .line 70
    .restart local v0    # "str":Ljava/lang/String;
    const-string v0, "InterfaceMethod"

    goto :goto_0

    .line 66
    .end local v0    # "str":Ljava/lang/String;
    :pswitch_1
    move-object v0, v1

    .line 69
    .restart local v0    # "str":Ljava/lang/String;
    const-string v0, "Method"

    goto :goto_0

    .line 68
    .end local v0    # "str":Ljava/lang/String;
    :pswitch_2
    const-string v0, "Field"

    .line 73
    .restart local v0    # "str":Ljava/lang/String;
    :goto_0
    const/4 v1, 0x2

    if-lez p2, :cond_1

    .line 75
    invoke-virtual {p1, v0}, Lgnu/bytecode/ClassTypeWriter;->print(Ljava/lang/String;)V

    .line 76
    if-ne p2, v1, :cond_0

    .line 78
    const-string v2, " class: "

    invoke-virtual {p1, v2}, Lgnu/bytecode/ClassTypeWriter;->print(Ljava/lang/String;)V

    .line 79
    iget-object v2, p0, Lgnu/bytecode/CpoolRef;->clas:Lgnu/bytecode/CpoolClass;

    invoke-virtual {p1, v2}, Lgnu/bytecode/ClassTypeWriter;->printOptionalIndex(Lgnu/bytecode/CpoolEntry;)V

    goto :goto_1

    .line 82
    :cond_0
    const/16 v2, 0x20

    invoke-virtual {p1, v2}, Lgnu/bytecode/ClassTypeWriter;->print(C)V

    .line 84
    :cond_1
    :goto_1
    iget-object v2, p0, Lgnu/bytecode/CpoolRef;->clas:Lgnu/bytecode/CpoolClass;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Lgnu/bytecode/CpoolClass;->print(Lgnu/bytecode/ClassTypeWriter;I)V

    .line 85
    if-ge p2, v1, :cond_2

    .line 86
    const/16 v2, 0x2e

    invoke-virtual {p1, v2}, Lgnu/bytecode/ClassTypeWriter;->print(C)V

    goto :goto_2

    .line 89
    :cond_2
    const-string v2, " name_and_type: "

    invoke-virtual {p1, v2}, Lgnu/bytecode/ClassTypeWriter;->print(Ljava/lang/String;)V

    .line 90
    iget-object v2, p0, Lgnu/bytecode/CpoolRef;->nameAndType:Lgnu/bytecode/CpoolNameAndType;

    invoke-virtual {p1, v2}, Lgnu/bytecode/ClassTypeWriter;->printOptionalIndex(Lgnu/bytecode/CpoolEntry;)V

    .line 91
    const/16 v2, 0x3c

    invoke-virtual {p1, v2}, Lgnu/bytecode/ClassTypeWriter;->print(C)V

    .line 93
    :goto_2
    iget-object v2, p0, Lgnu/bytecode/CpoolRef;->nameAndType:Lgnu/bytecode/CpoolNameAndType;

    invoke-virtual {v2, p1, v3}, Lgnu/bytecode/CpoolNameAndType;->print(Lgnu/bytecode/ClassTypeWriter;I)V

    .line 94
    if-ne p2, v1, :cond_3

    .line 95
    const/16 v1, 0x3e

    invoke-virtual {p1, v1}, Lgnu/bytecode/ClassTypeWriter;->print(C)V

    .line 96
    :cond_3
    return-void

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method write(Ljava/io/DataOutputStream;)V
    .locals 1
    .param p1, "dstr"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 58
    iget v0, p0, Lgnu/bytecode/CpoolRef;->tag:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 59
    iget-object v0, p0, Lgnu/bytecode/CpoolRef;->clas:Lgnu/bytecode/CpoolClass;

    iget v0, v0, Lgnu/bytecode/CpoolClass;->index:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 60
    iget-object v0, p0, Lgnu/bytecode/CpoolRef;->nameAndType:Lgnu/bytecode/CpoolNameAndType;

    iget v0, v0, Lgnu/bytecode/CpoolNameAndType;->index:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 61
    return-void
.end method
