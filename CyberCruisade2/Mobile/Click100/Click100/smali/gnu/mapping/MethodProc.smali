.class public abstract Lgnu/mapping/MethodProc;
.super Lgnu/mapping/ProcedureN;
.source "MethodProc.java"


# static fields
.field public static final NO_MATCH:I = -0x1

.field public static final NO_MATCH_AMBIGUOUS:I = -0xd0000

.field public static final NO_MATCH_BAD_TYPE:I = -0xc0000

.field public static final NO_MATCH_TOO_FEW_ARGS:I = -0xf0000

.field public static final NO_MATCH_TOO_MANY_ARGS:I = -0xe0000

.field static final unknownArgTypes:[Lgnu/bytecode/Type;


# instance fields
.field protected argTypes:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 51
    const/4 v0, 0x1

    new-array v0, v0, [Lgnu/bytecode/Type;

    const/4 v1, 0x0

    sget-object v2, Lgnu/bytecode/Type;->pointer_type:Lgnu/bytecode/ClassType;

    aput-object v2, v0, v1

    sput-object v0, Lgnu/mapping/MethodProc;->unknownArgTypes:[Lgnu/bytecode/Type;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Lgnu/mapping/ProcedureN;-><init>()V

    return-void
.end method

.method public static matchFailAsException(ILgnu/mapping/Procedure;[Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 3
    .param p0, "code"    # I
    .param p1, "proc"    # Lgnu/mapping/Procedure;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 101
    int-to-short v0, p0

    .line 102
    .local v0, "arg":I
    const/high16 v1, -0x10000

    and-int/2addr p0, v1

    .line 103
    const/high16 v1, -0xc0000

    if-eq p0, v1, :cond_0

    .line 104
    new-instance v1, Lgnu/mapping/WrongArguments;

    array-length v2, p2

    invoke-direct {v1, p1, v2}, Lgnu/mapping/WrongArguments;-><init>(Lgnu/mapping/Procedure;I)V

    return-object v1

    .line 105
    :cond_0
    new-instance v1, Lgnu/mapping/WrongType;

    if-lez v0, :cond_1

    add-int/lit8 v2, v0, -0x1

    aget-object v2, p2, v2

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    invoke-direct {v1, p1, v0, v2}, Lgnu/mapping/WrongType;-><init>(Lgnu/mapping/Procedure;ILjava/lang/Object;)V

    return-object v1
.end method

.method public static mostSpecific([Lgnu/mapping/MethodProc;I)I
    .locals 11
    .param p0, "procs"    # [Lgnu/mapping/MethodProc;
    .param p1, "length"    # I

    .line 170
    const/4 v0, 0x1

    if-gt p1, v0, :cond_0

    .line 171
    add-int/lit8 v0, p1, -0x1

    return v0

    .line 173
    :cond_0
    const/4 v1, 0x0

    aget-object v2, p0, v1

    .line 176
    .local v2, "best":Lgnu/mapping/MethodProc;
    const/4 v3, 0x0

    .line 179
    .local v3, "bests":[Lgnu/mapping/MethodProc;
    const/4 v4, 0x0

    .line 181
    .local v4, "bestn":I
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_0
    if-ge v5, p1, :cond_8

    .line 183
    aget-object v6, p0, v5

    .line 184
    .local v6, "method":Lgnu/mapping/MethodProc;
    if-eqz v2, :cond_4

    .line 186
    invoke-static {v2, v6}, Lgnu/mapping/MethodProc;->mostSpecific(Lgnu/mapping/MethodProc;Lgnu/mapping/MethodProc;)Lgnu/mapping/MethodProc;

    move-result-object v7

    .line 187
    .local v7, "winner":Lgnu/mapping/MethodProc;
    if-nez v7, :cond_2

    .line 189
    if-nez v3, :cond_1

    .line 190
    new-array v3, p1, [Lgnu/mapping/MethodProc;

    .line 191
    :cond_1
    aput-object v2, v3, v1

    .line 192
    aput-object v6, v3, v0

    .line 193
    const/4 v4, 0x2

    .line 194
    const/4 v2, 0x0

    goto :goto_1

    .line 196
    :cond_2
    if-ne v7, v6, :cond_3

    .line 198
    move-object v2, v6

    .line 199
    move v4, v5

    .line 201
    .end local v7    # "winner":Lgnu/mapping/MethodProc;
    :cond_3
    :goto_1
    goto :goto_3

    .line 204
    :cond_4
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_2
    if-ge v7, v4, :cond_7

    .line 206
    aget-object v8, v3, v7

    .line 207
    .local v8, "old":Lgnu/mapping/MethodProc;
    invoke-static {v8, v6}, Lgnu/mapping/MethodProc;->mostSpecific(Lgnu/mapping/MethodProc;Lgnu/mapping/MethodProc;)Lgnu/mapping/MethodProc;

    move-result-object v9

    .line 208
    .local v9, "winner":Lgnu/mapping/MethodProc;
    if-ne v9, v8, :cond_5

    .line 209
    goto :goto_3

    .line 210
    :cond_5
    if-nez v9, :cond_6

    .line 212
    add-int/lit8 v10, v4, 0x1

    .end local v4    # "bestn":I
    .local v10, "bestn":I
    aput-object v6, v3, v4

    .line 213
    move v4, v10

    goto :goto_3

    .line 204
    .end local v8    # "old":Lgnu/mapping/MethodProc;
    .end local v9    # "winner":Lgnu/mapping/MethodProc;
    .end local v10    # "bestn":I
    .restart local v4    # "bestn":I
    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 217
    .end local v7    # "j":I
    :cond_7
    move-object v2, v6

    .line 218
    move v4, v5

    .line 181
    .end local v6    # "method":Lgnu/mapping/MethodProc;
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 221
    .end local v5    # "i":I
    :cond_8
    if-nez v2, :cond_9

    const/4 v0, -0x1

    goto :goto_4

    :cond_9
    move v0, v4

    :goto_4
    return v0
.end method

.method public static mostSpecific(Lgnu/mapping/MethodProc;Lgnu/mapping/MethodProc;)Lgnu/mapping/MethodProc;
    .locals 16
    .param p0, "proc1"    # Lgnu/mapping/MethodProc;
    .param p1, "proc2"    # Lgnu/mapping/MethodProc;

    .line 122
    const/4 v0, 0x0

    .line 124
    .local v0, "not1":Z
    const/4 v1, 0x0

    .line 125
    .local v1, "not2":Z
    invoke-virtual/range {p0 .. p0}, Lgnu/mapping/MethodProc;->minArgs()I

    move-result v2

    .line 126
    .local v2, "min1":I
    invoke-virtual/range {p1 .. p1}, Lgnu/mapping/MethodProc;->minArgs()I

    move-result v3

    .line 127
    .local v3, "min2":I
    invoke-virtual/range {p0 .. p0}, Lgnu/mapping/MethodProc;->maxArgs()I

    move-result v4

    .line 128
    .local v4, "max1":I
    invoke-virtual/range {p1 .. p1}, Lgnu/mapping/MethodProc;->maxArgs()I

    move-result v5

    .line 129
    .local v5, "max2":I
    const/4 v6, 0x0

    if-ltz v4, :cond_0

    if-lt v4, v3, :cond_1

    :cond_0
    if-ltz v5, :cond_2

    if-ge v5, v2, :cond_2

    .line 131
    :cond_1
    return-object v6

    .line 132
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lgnu/mapping/MethodProc;->numParameters()I

    move-result v7

    .line 133
    .local v7, "num1":I
    invoke-virtual/range {p1 .. p1}, Lgnu/mapping/MethodProc;->numParameters()I

    move-result v8

    .line 134
    .local v8, "num2":I
    if-le v7, v8, :cond_3

    move v9, v7

    goto :goto_0

    :cond_3
    move v9, v8

    .line 135
    .local v9, "limit":I
    :goto_0
    if-eq v4, v5, :cond_5

    .line 137
    if-gez v4, :cond_4

    .line 138
    const/4 v0, 0x1

    .line 139
    :cond_4
    if-gez v5, :cond_5

    .line 140
    const/4 v1, 0x1

    .line 142
    :cond_5
    if-ge v2, v3, :cond_6

    .line 143
    const/4 v0, 0x1

    goto :goto_1

    .line 144
    :cond_6
    if-le v2, v3, :cond_7

    .line 145
    const/4 v1, 0x1

    .line 146
    :cond_7
    :goto_1
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_2
    if-ge v10, v9, :cond_b

    .line 148
    move-object/from16 v11, p0

    invoke-virtual {v11, v10}, Lgnu/mapping/MethodProc;->getParameterType(I)Lgnu/bytecode/Type;

    move-result-object v12

    .line 149
    .local v12, "t1":Lgnu/bytecode/Type;
    move-object/from16 v13, p1

    invoke-virtual {v13, v10}, Lgnu/mapping/MethodProc;->getParameterType(I)Lgnu/bytecode/Type;

    move-result-object v14

    .line 150
    .local v14, "t2":Lgnu/bytecode/Type;
    invoke-virtual {v12, v14}, Lgnu/bytecode/Type;->compare(Lgnu/bytecode/Type;)I

    move-result v15

    .line 151
    .local v15, "comp":I
    const/4 v6, -0x1

    if-ne v15, v6, :cond_8

    .line 153
    const/4 v1, 0x1

    .line 154
    if-eqz v0, :cond_8

    .line 155
    const/4 v6, 0x0

    return-object v6

    .line 157
    :cond_8
    const/4 v6, 0x1

    if-ne v15, v6, :cond_a

    .line 159
    const/4 v0, 0x1

    .line 160
    if-eqz v1, :cond_9

    .line 161
    const/4 v6, 0x0

    return-object v6

    .line 160
    :cond_9
    const/4 v6, 0x0

    goto :goto_3

    .line 157
    :cond_a
    const/4 v6, 0x0

    .line 146
    .end local v12    # "t1":Lgnu/bytecode/Type;
    .end local v14    # "t2":Lgnu/bytecode/Type;
    .end local v15    # "comp":I
    :goto_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    :cond_b
    move-object/from16 v11, p0

    move-object/from16 v13, p1

    .line 164
    .end local v10    # "i":I
    if-eqz v1, :cond_c

    move-object v6, v11

    goto :goto_4

    :cond_c
    if-eqz v0, :cond_d

    move-object v6, v13

    :cond_d
    :goto_4
    return-object v6
.end method


# virtual methods
.method public applyN([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 110
    array-length v0, p1

    invoke-static {p0, v0}, Lgnu/mapping/MethodProc;->checkArgCount(Lgnu/mapping/Procedure;I)V

    .line 111
    invoke-static {}, Lgnu/mapping/CallContext;->getInstance()Lgnu/mapping/CallContext;

    move-result-object v0

    .line 112
    .local v0, "ctx":Lgnu/mapping/CallContext;
    invoke-virtual {p0, p1, v0}, Lgnu/mapping/MethodProc;->checkN([Ljava/lang/Object;Lgnu/mapping/CallContext;)V

    .line 113
    invoke-virtual {v0}, Lgnu/mapping/CallContext;->runUntilValue()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getParameterType(I)Lgnu/bytecode/Type;
    .locals 3
    .param p1, "index"    # I

    .line 61
    iget-object v0, p0, Lgnu/mapping/MethodProc;->argTypes:Ljava/lang/Object;

    instance-of v0, v0, [Lgnu/bytecode/Type;

    if-nez v0, :cond_0

    .line 62
    invoke-virtual {p0}, Lgnu/mapping/MethodProc;->resolveParameterTypes()V

    .line 64
    :cond_0
    iget-object v0, p0, Lgnu/mapping/MethodProc;->argTypes:Ljava/lang/Object;

    check-cast v0, [Lgnu/bytecode/Type;

    check-cast v0, [Lgnu/bytecode/Type;

    .line 65
    .local v0, "atypes":[Lgnu/bytecode/Type;
    array-length v1, v0

    if-ge p1, v1, :cond_2

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-lt p1, v1, :cond_1

    invoke-virtual {p0}, Lgnu/mapping/MethodProc;->maxArgs()I

    move-result v1

    if-ltz v1, :cond_2

    .line 67
    :cond_1
    aget-object v1, v0, p1

    return-object v1

    .line 68
    :cond_2
    invoke-virtual {p0}, Lgnu/mapping/MethodProc;->maxArgs()I

    move-result v1

    if-gez v1, :cond_3

    .line 70
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v1, v0, v1

    .line 71
    .local v1, "rtype":Lgnu/bytecode/Type;
    instance-of v2, v1, Lgnu/bytecode/ArrayType;

    if-eqz v2, :cond_3

    .line 72
    move-object v2, v1

    check-cast v2, Lgnu/bytecode/ArrayType;

    invoke-virtual {v2}, Lgnu/bytecode/ArrayType;->getComponentType()Lgnu/bytecode/Type;

    move-result-object v2

    return-object v2

    .line 74
    .end local v1    # "rtype":Lgnu/bytecode/Type;
    :cond_3
    sget-object v1, Lgnu/bytecode/Type;->objectType:Lgnu/bytecode/ClassType;

    return-object v1
.end method

.method public isApplicable([Lgnu/bytecode/Type;)I
    .locals 8
    .param p1, "argTypes"    # [Lgnu/bytecode/Type;

    .line 21
    array-length v0, p1

    .line 22
    .local v0, "argCount":I
    invoke-virtual {p0}, Lgnu/mapping/MethodProc;->numArgs()I

    move-result v1

    .line 23
    .local v1, "num":I
    and-int/lit16 v2, v1, 0xfff

    const/4 v3, -0x1

    if-lt v0, v2, :cond_4

    if-ltz v1, :cond_0

    shr-int/lit8 v2, v1, 0xc

    if-le v0, v2, :cond_0

    goto :goto_1

    .line 26
    :cond_0
    const/4 v2, 0x1

    .line 27
    .local v2, "result":I
    move v4, v0

    .local v4, "i":I
    :goto_0
    add-int/2addr v4, v3

    if-ltz v4, :cond_3

    .line 29
    invoke-virtual {p0, v4}, Lgnu/mapping/MethodProc;->getParameterType(I)Lgnu/bytecode/Type;

    move-result-object v5

    .line 30
    .local v5, "ptype":Lgnu/bytecode/Type;
    aget-object v6, p1, v4

    invoke-virtual {v5, v6}, Lgnu/bytecode/Type;->compare(Lgnu/bytecode/Type;)I

    move-result v6

    .line 31
    .local v6, "code":I
    const/4 v7, -0x3

    if-ne v6, v7, :cond_1

    .line 32
    return v3

    .line 33
    :cond_1
    if-gez v6, :cond_2

    .line 34
    const/4 v2, 0x0

    .line 35
    .end local v5    # "ptype":Lgnu/bytecode/Type;
    .end local v6    # "code":I
    :cond_2
    goto :goto_0

    .line 36
    .end local v4    # "i":I
    :cond_3
    return v2

    .line 25
    .end local v2    # "result":I
    :cond_4
    :goto_1
    return v3
.end method

.method public numParameters()I
    .locals 4

    .line 42
    invoke-virtual {p0}, Lgnu/mapping/MethodProc;->numArgs()I

    move-result v0

    .line 43
    .local v0, "num":I
    shr-int/lit8 v1, v0, 0xc

    .line 44
    .local v1, "max":I
    if-ltz v1, :cond_0

    .line 45
    return v1

    .line 47
    :cond_0
    and-int/lit16 v2, v0, 0xfff

    .line 48
    .local v2, "min":I
    add-int/lit8 v3, v2, 0x1

    return v3
.end method

.method protected resolveParameterTypes()V
    .locals 1

    .line 56
    sget-object v0, Lgnu/mapping/MethodProc;->unknownArgTypes:[Lgnu/bytecode/Type;

    iput-object v0, p0, Lgnu/mapping/MethodProc;->argTypes:Ljava/lang/Object;

    .line 57
    return-void
.end method
