.class public Lgnu/kawa/reflect/FieldLocation;
.super Lgnu/kawa/reflect/ClassMemberLocation;
.source "FieldLocation.java"


# static fields
.field static final CONSTANT:I = 0x4

.field static final INDIRECT_LOCATION:I = 0x2

.field public static final KIND_FLAGS_SET:I = 0x40

.field public static final PROCEDURE:I = 0x10

.field static final SETUP_DONE:I = 0x1

.field public static final SYNTAX:I = 0x20

.field static final VALUE_SET:I = 0x8


# instance fields
.field decl:Lgnu/expr/Declaration;

.field private flags:I

.field value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lgnu/bytecode/ClassType;Ljava/lang/String;)V
    .locals 0
    .param p1, "instance"    # Ljava/lang/Object;
    .param p2, "type"    # Lgnu/bytecode/ClassType;
    .param p3, "mname"    # Ljava/lang/String;

    .line 123
    invoke-direct {p0, p1, p2, p3}, Lgnu/kawa/reflect/ClassMemberLocation;-><init>(Ljava/lang/Object;Lgnu/bytecode/ClassType;Ljava/lang/String;)V

    .line 124
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "instance"    # Ljava/lang/Object;
    .param p2, "cname"    # Ljava/lang/String;
    .param p3, "fname"    # Ljava/lang/String;

    .line 118
    invoke-static {p2}, Lgnu/bytecode/ClassType;->make(Ljava/lang/String;)Lgnu/bytecode/ClassType;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3}, Lgnu/kawa/reflect/ClassMemberLocation;-><init>(Ljava/lang/Object;Lgnu/bytecode/ClassType;Ljava/lang/String;)V

    .line 119
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/reflect/Field;)V
    .locals 1
    .param p1, "instance"    # Ljava/lang/Object;
    .param p2, "field"    # Ljava/lang/reflect/Field;

    .line 128
    invoke-direct {p0, p1, p2}, Lgnu/kawa/reflect/ClassMemberLocation;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Field;)V

    .line 129
    invoke-virtual {p2}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lgnu/bytecode/Type;->make(Ljava/lang/Class;)Lgnu/bytecode/Type;

    move-result-object v0

    check-cast v0, Lgnu/bytecode/ClassType;

    iput-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->type:Lgnu/bytecode/ClassType;

    .line 130
    return-void
.end method

.method private getFieldValue()Ljava/lang/Object;
    .locals 2

    .line 233
    invoke-super {p0}, Lgnu/kawa/reflect/ClassMemberLocation;->setup()V

    .line 236
    :try_start_0
    iget-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->rfield:Ljava/lang/reflect/Field;

    iget-object v1, p0, Lgnu/kawa/reflect/FieldLocation;->instance:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 238
    :catchall_0
    move-exception v0

    .line 240
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lgnu/mapping/WrappedException;->wrapIfNeeded(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static make(Ljava/lang/Object;Lgnu/expr/Declaration;)Lgnu/kawa/reflect/FieldLocation;
    .locals 4
    .param p0, "instance"    # Ljava/lang/Object;
    .param p1, "decl"    # Lgnu/expr/Declaration;

    .line 360
    iget-object v0, p1, Lgnu/expr/Declaration;->field:Lgnu/bytecode/Field;

    .line 361
    .local v0, "fld":Lgnu/bytecode/Field;
    invoke-virtual {v0}, Lgnu/bytecode/Field;->getDeclaringClass()Lgnu/bytecode/ClassType;

    move-result-object v1

    .line 362
    .local v1, "ctype":Lgnu/bytecode/ClassType;
    new-instance v2, Lgnu/kawa/reflect/FieldLocation;

    invoke-virtual {v0}, Lgnu/bytecode/Field;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v1, v3}, Lgnu/kawa/reflect/FieldLocation;-><init>(Ljava/lang/Object;Lgnu/bytecode/ClassType;Ljava/lang/String;)V

    .line 363
    .local v2, "loc":Lgnu/kawa/reflect/FieldLocation;
    invoke-virtual {v2, p1}, Lgnu/kawa/reflect/FieldLocation;->setDeclaration(Lgnu/expr/Declaration;)V

    .line 365
    return-object v2
.end method

.method public static make(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Lgnu/kawa/reflect/FieldLocation;
    .locals 2
    .param p0, "instance"    # Ljava/lang/Object;
    .param p1, "cname"    # Ljava/lang/String;
    .param p2, "fldName"    # Ljava/lang/String;

    .line 370
    new-instance v0, Lgnu/kawa/reflect/FieldLocation;

    invoke-static {p1}, Lgnu/bytecode/ClassType;->make(Ljava/lang/String;)Lgnu/bytecode/ClassType;

    move-result-object v1

    invoke-direct {v0, p0, v1, p2}, Lgnu/kawa/reflect/FieldLocation;-><init>(Ljava/lang/Object;Lgnu/bytecode/ClassType;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .line 191
    :try_start_0
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->setup()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    nop

    .line 198
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v1, v0, 0x8

    if-eqz v1, :cond_0

    .line 200
    iget-object v1, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .line 201
    .local v1, "v":Ljava/lang/Object;
    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_2

    .line 202
    return-object v1

    .line 206
    .end local v1    # "v":Ljava/lang/Object;
    :cond_0
    invoke-direct {p0}, Lgnu/kawa/reflect/FieldLocation;->getFieldValue()Ljava/lang/Object;

    move-result-object v1

    .line 207
    .restart local v1    # "v":Ljava/lang/Object;
    iget-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->type:Lgnu/bytecode/ClassType;

    iget-object v2, p0, Lgnu/kawa/reflect/FieldLocation;->mname:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lgnu/bytecode/ClassType;->getDeclaredField(Ljava/lang/String;)Lgnu/bytecode/Field;

    move-result-object v0

    invoke-virtual {v0}, Lgnu/bytecode/Field;->getModifiers()I

    move-result v0

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_2

    .line 209
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 210
    and-int/lit8 v2, v0, 0x2

    if-nez v2, :cond_1

    .line 211
    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 212
    :cond_1
    iput-object v1, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .line 215
    :cond_2
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_4

    .line 217
    sget-object v0, Lgnu/mapping/Location;->UNBOUND:Ljava/lang/String;

    .line 218
    .local v0, "unb":Ljava/lang/Object;
    move-object v2, v1

    check-cast v2, Lgnu/mapping/Location;

    .line 219
    .local v2, "loc":Lgnu/mapping/Location;
    invoke-virtual {v2, v0}, Lgnu/mapping/Location;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 220
    if-ne v1, v0, :cond_3

    .line 221
    return-object p1

    .line 222
    :cond_3
    invoke-virtual {v2}, Lgnu/mapping/Location;->isConstant()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 224
    iget v3, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v3, v3, 0x4

    iput v3, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 225
    iput-object v1, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .line 228
    .end local v0    # "unb":Ljava/lang/Object;
    .end local v2    # "loc":Lgnu/mapping/Location;
    :cond_4
    return-object v1

    .line 193
    .end local v1    # "v":Ljava/lang/Object;
    :catchall_0
    move-exception v0

    .line 195
    .local v0, "ex":Ljava/lang/Throwable;
    return-object p1
.end method

.method public declared-synchronized getDeclaration()Lgnu/expr/Declaration;
    .locals 9

    monitor-enter p0

    .line 150
    :try_start_0
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v0, v0, 0x40

    if-nez v0, :cond_0

    .line 151
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->setKindFlags()V

    .line 152
    .end local p0    # "this":Lgnu/kawa/reflect/FieldLocation;
    :cond_0
    iget-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->decl:Lgnu/expr/Declaration;

    .line 153
    .local v0, "d":Lgnu/expr/Declaration;
    if-nez v0, :cond_5

    .line 155
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->getMemberName()Ljava/lang/String;

    move-result-object v1

    .line 156
    .local v1, "fname":Ljava/lang/String;
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->getDeclaringClass()Lgnu/bytecode/ClassType;

    move-result-object v2

    .line 157
    .local v2, "t":Lgnu/bytecode/ClassType;
    invoke-virtual {v2, v1}, Lgnu/bytecode/ClassType;->getDeclaredField(Ljava/lang/String;)Lgnu/bytecode/Field;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 158
    .local v3, "procField":Lgnu/bytecode/Field;
    if-nez v3, :cond_1

    .line 159
    monitor-exit p0

    const/4 v4, 0x0

    return-object v4

    .line 160
    :cond_1
    :try_start_1
    invoke-static {v2}, Lgnu/expr/ModuleInfo;->find(Lgnu/bytecode/ClassType;)Lgnu/expr/ModuleInfo;

    move-result-object v4

    .line 161
    .local v4, "info":Lgnu/expr/ModuleInfo;
    invoke-virtual {v4}, Lgnu/expr/ModuleInfo;->getModuleExp()Lgnu/expr/ModuleExp;

    move-result-object v5

    .line 162
    .local v5, "mexp":Lgnu/expr/ModuleExp;
    invoke-virtual {v5}, Lgnu/expr/ModuleExp;->firstDecl()Lgnu/expr/Declaration;

    move-result-object v6

    :goto_0
    move-object v0, v6

    if-eqz v0, :cond_3

    .line 164
    iget-object v6, v0, Lgnu/expr/Declaration;->field:Lgnu/bytecode/Field;

    if-eqz v6, :cond_2

    iget-object v6, v0, Lgnu/expr/Declaration;->field:Lgnu/bytecode/Field;

    invoke-virtual {v6}, Lgnu/bytecode/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 165
    goto :goto_1

    .line 162
    :cond_2
    invoke-virtual {v0}, Lgnu/expr/Declaration;->nextDecl()Lgnu/expr/Declaration;

    move-result-object v6

    goto :goto_0

    .line 167
    :cond_3
    :goto_1
    if-eqz v0, :cond_4

    .line 169
    iput-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->decl:Lgnu/expr/Declaration;

    goto :goto_2

    .line 168
    :cond_4
    new-instance v6, Ljava/lang/RuntimeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "no field found for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 171
    .end local v1    # "fname":Ljava/lang/String;
    .end local v2    # "t":Lgnu/bytecode/ClassType;
    .end local v3    # "procField":Lgnu/bytecode/Field;
    .end local v4    # "info":Lgnu/expr/ModuleInfo;
    .end local v5    # "mexp":Lgnu/expr/ModuleExp;
    :cond_5
    :goto_2
    monitor-exit p0

    return-object v0

    .line 149
    .end local v0    # "d":Lgnu/expr/Declaration;
    :catchall_0
    move-exception v0

    monitor-exit p0

    goto :goto_4

    :goto_3
    throw v0

    :goto_4
    goto :goto_3
.end method

.method public getFType()Lgnu/bytecode/Type;
    .locals 2

    .line 145
    iget-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->type:Lgnu/bytecode/ClassType;

    iget-object v1, p0, Lgnu/kawa/reflect/FieldLocation;->mname:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lgnu/bytecode/ClassType;->getDeclaredField(Ljava/lang/String;)Lgnu/bytecode/Field;

    move-result-object v0

    invoke-virtual {v0}, Lgnu/bytecode/Field;->getType()Lgnu/bytecode/Type;

    move-result-object v0

    return-object v0
.end method

.method public getField()Lgnu/bytecode/Field;
    .locals 2

    .line 139
    iget-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->type:Lgnu/bytecode/ClassType;

    iget-object v1, p0, Lgnu/kawa/reflect/FieldLocation;->mname:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lgnu/bytecode/ClassType;->getDeclaredField(Ljava/lang/String;)Lgnu/bytecode/Field;

    move-result-object v0

    return-object v0
.end method

.method public isBound()Z
    .locals 2

    .line 334
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v0, v0, 0x40

    if-nez v0, :cond_0

    .line 335
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->setKindFlags()V

    .line 336
    :cond_0
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v1, v0, 0x4

    if-nez v1, :cond_3

    and-int/lit8 v1, v0, 0x2

    if-nez v1, :cond_1

    goto :goto_1

    .line 339
    :cond_1
    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_2

    .line 340
    iget-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .local v0, "v":Ljava/lang/Object;
    goto :goto_0

    .line 345
    .end local v0    # "v":Ljava/lang/Object;
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->setup()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 350
    nop

    .line 351
    invoke-direct {p0}, Lgnu/kawa/reflect/FieldLocation;->getFieldValue()Ljava/lang/Object;

    move-result-object v0

    .line 352
    .restart local v0    # "v":Ljava/lang/Object;
    iget v1, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v1, v1, 0x8

    iput v1, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 353
    iput-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .line 355
    :goto_0
    move-object v1, v0

    check-cast v1, Lgnu/mapping/Location;

    invoke-virtual {v1}, Lgnu/mapping/Location;->isBound()Z

    move-result v1

    return v1

    .line 347
    .end local v0    # "v":Ljava/lang/Object;
    :catchall_0
    move-exception v0

    .line 349
    .local v0, "ex":Ljava/lang/Throwable;
    const/4 v1, 0x0

    return v1

    .line 337
    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_3
    :goto_1
    const/4 v0, 0x1

    return v0
.end method

.method public isConstant()Z
    .locals 2

    .line 304
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v0, v0, 0x40

    if-nez v0, :cond_0

    .line 305
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->setKindFlags()V

    .line 306
    :cond_0
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_1

    .line 307
    const/4 v0, 0x1

    return v0

    .line 308
    :cond_1
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->isIndirectLocation()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 311
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_2

    .line 312
    iget-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .local v0, "v":Ljava/lang/Object;
    goto :goto_0

    .line 317
    .end local v0    # "v":Ljava/lang/Object;
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->setup()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 322
    nop

    .line 323
    invoke-direct {p0}, Lgnu/kawa/reflect/FieldLocation;->getFieldValue()Ljava/lang/Object;

    move-result-object v0

    .line 324
    .restart local v0    # "v":Ljava/lang/Object;
    iget v1, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v1, v1, 0x8

    iput v1, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 325
    iput-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .line 327
    :goto_0
    move-object v1, v0

    check-cast v1, Lgnu/mapping/Location;

    invoke-virtual {v1}, Lgnu/mapping/Location;->isConstant()Z

    move-result v1

    return v1

    .line 319
    .end local v0    # "v":Ljava/lang/Object;
    :catchall_0
    move-exception v0

    .line 321
    .local v0, "ex":Ljava/lang/Throwable;
    return v1

    .line 329
    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_3
    return v1
.end method

.method public isIndirectLocation()Z
    .locals 1

    .line 39
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isProcedureOrSyntax()Z
    .locals 1

    .line 111
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v0, v0, 0x40

    if-nez v0, :cond_0

    .line 112
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->setKindFlags()V

    .line 113
    :cond_0
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v0, v0, 0x30

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public set(Ljava/lang/Object;)V
    .locals 2
    .param p1, "newValue"    # Ljava/lang/Object;

    .line 246
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->setup()V

    .line 247
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v1, v0, 0x2

    if-nez v1, :cond_0

    .line 251
    :try_start_0
    iget-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->rfield:Ljava/lang/reflect/Field;

    iget-object v1, p0, Lgnu/kawa/reflect/FieldLocation;->instance:Ljava/lang/Object;

    invoke-virtual {v0, v1, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 256
    goto :goto_1

    .line 253
    :catchall_0
    move-exception v0

    .line 255
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lgnu/mapping/WrappedException;->wrapIfNeeded(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 261
    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_0
    and-int/lit8 v1, v0, 0x8

    if-eqz v1, :cond_1

    .line 262
    iget-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .local v0, "v":Ljava/lang/Object;
    goto :goto_0

    .line 265
    .end local v0    # "v":Ljava/lang/Object;
    :cond_1
    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 266
    invoke-direct {p0}, Lgnu/kawa/reflect/FieldLocation;->getFieldValue()Ljava/lang/Object;

    move-result-object v0

    .line 267
    .restart local v0    # "v":Ljava/lang/Object;
    iput-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .line 269
    :goto_0
    move-object v1, v0

    check-cast v1, Lgnu/mapping/Location;

    invoke-virtual {v1, p1}, Lgnu/mapping/Location;->set(Ljava/lang/Object;)V

    .line 271
    .end local v0    # "v":Ljava/lang/Object;
    :goto_1
    return-void
.end method

.method public setDeclaration(Lgnu/expr/Declaration;)V
    .locals 0
    .param p1, "decl"    # Lgnu/expr/Declaration;

    .line 134
    iput-object p1, p0, Lgnu/kawa/reflect/FieldLocation;->decl:Lgnu/expr/Declaration;

    .line 135
    return-void
.end method

.method setKindFlags()V
    .locals 9

    .line 53
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->getMemberName()Ljava/lang/String;

    move-result-object v0

    .line 54
    .local v0, "fname":Ljava/lang/String;
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->getDeclaringClass()Lgnu/bytecode/ClassType;

    move-result-object v1

    invoke-virtual {v1, v0}, Lgnu/bytecode/ClassType;->getDeclaredField(Ljava/lang/String;)Lgnu/bytecode/Field;

    move-result-object v1

    .line 55
    .local v1, "fld":Lgnu/bytecode/Field;
    invoke-virtual {v1}, Lgnu/bytecode/Field;->getModifiers()I

    move-result v2

    .line 56
    .local v2, "fflags":I
    invoke-virtual {v1}, Lgnu/bytecode/Field;->getType()Lgnu/bytecode/Type;

    move-result-object v3

    .line 57
    .local v3, "ftype":Lgnu/bytecode/Type;
    sget-object v4, Lgnu/expr/Compilation;->typeLocation:Lgnu/bytecode/ClassType;

    invoke-virtual {v3, v4}, Lgnu/bytecode/Type;->isSubtype(Lgnu/bytecode/Type;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 58
    iget v4, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v4, v4, 0x2

    iput v4, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 59
    :cond_0
    and-int/lit8 v4, v2, 0x10

    if-eqz v4, :cond_9

    .line 61
    iget v4, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v5, v4, 0x2

    if-nez v5, :cond_2

    .line 63
    or-int/lit8 v4, v4, 0x4

    iput v4, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 64
    sget-object v4, Lgnu/expr/Compilation;->typeProcedure:Lgnu/bytecode/ClassType;

    invoke-virtual {v3, v4}, Lgnu/bytecode/Type;->isSubtype(Lgnu/bytecode/Type;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 65
    iget v4, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v4, v4, 0x10

    iput v4, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 66
    :cond_1
    instance-of v4, v3, Lgnu/bytecode/ClassType;

    if-eqz v4, :cond_9

    move-object v4, v3

    check-cast v4, Lgnu/bytecode/ClassType;

    const-string v5, "kawa.lang.Syntax"

    invoke-virtual {v4, v5}, Lgnu/bytecode/ClassType;->isSubclass(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 68
    iget v4, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v4, v4, 0x20

    iput v4, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    goto :goto_1

    .line 72
    :cond_2
    invoke-direct {p0}, Lgnu/kawa/reflect/FieldLocation;->getFieldValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lgnu/mapping/Location;

    .line 73
    .local v4, "loc":Lgnu/mapping/Location;
    instance-of v5, v4, Lgnu/kawa/reflect/FieldLocation;

    if-eqz v5, :cond_6

    .line 75
    move-object v5, v4

    check-cast v5, Lgnu/kawa/reflect/FieldLocation;

    .line 76
    .local v5, "floc":Lgnu/kawa/reflect/FieldLocation;
    iget v6, v5, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v6, v6, 0x40

    if-nez v6, :cond_3

    .line 77
    invoke-virtual {v5}, Lgnu/kawa/reflect/FieldLocation;->setKindFlags()V

    .line 78
    :cond_3
    iget v6, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    iget v7, v5, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v7, v7, 0x34

    or-int/2addr v6, v7

    iput v6, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 79
    iget v7, v5, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v8, v7, 0x4

    if-eqz v8, :cond_4

    .line 81
    and-int/lit8 v7, v7, 0x8

    if-eqz v7, :cond_5

    .line 83
    iget-object v7, v5, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    iput-object v7, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .line 84
    or-int/lit8 v6, v6, 0x8

    iput v6, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    goto :goto_0

    .line 89
    :cond_4
    iput-object v5, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .line 90
    or-int/lit8 v6, v6, 0x8

    iput v6, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 92
    .end local v5    # "floc":Lgnu/kawa/reflect/FieldLocation;
    :cond_5
    :goto_0
    goto :goto_1

    .line 93
    :cond_6
    invoke-virtual {v4}, Lgnu/mapping/Location;->isConstant()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 95
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lgnu/mapping/Location;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 97
    .local v5, "val":Ljava/lang/Object;
    instance-of v6, v5, Lgnu/mapping/Procedure;

    if-eqz v6, :cond_7

    .line 98
    iget v6, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v6, v6, 0x10

    iput v6, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 99
    :cond_7
    instance-of v6, v5, Lkawa/lang/Syntax;

    if-eqz v6, :cond_8

    .line 100
    iget v6, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v6, v6, 0x20

    iput v6, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 101
    :cond_8
    iget v6, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v6, v6, 0xc

    iput v6, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 102
    iput-object v5, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .line 106
    .end local v4    # "loc":Lgnu/mapping/Location;
    .end local v5    # "val":Ljava/lang/Object;
    :cond_9
    :goto_1
    iget v4, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v4, v4, 0x40

    iput v4, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 107
    return-void
.end method

.method public setProcedure()V
    .locals 1

    .line 43
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v0, v0, 0x54

    iput v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 44
    return-void
.end method

.method public setRestore(Ljava/lang/Object;)V
    .locals 1
    .param p1, "oldValue"    # Ljava/lang/Object;

    .line 296
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    .line 297
    invoke-super {p0, p1}, Lgnu/kawa/reflect/ClassMemberLocation;->setRestore(Ljava/lang/Object;)V

    goto :goto_0

    .line 299
    :cond_0
    iget-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    check-cast v0, Lgnu/mapping/Location;

    invoke-virtual {v0, p1}, Lgnu/mapping/Location;->setRestore(Ljava/lang/Object;)V

    .line 300
    :goto_0
    return-void
.end method

.method public setSyntax()V
    .locals 1

    .line 48
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v0, v0, 0x64

    iput v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 49
    return-void
.end method

.method public setWithSave(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "newValue"    # Ljava/lang/Object;

    .line 275
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v0, v0, 0x40

    if-nez v0, :cond_0

    .line 276
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->setKindFlags()V

    .line 277
    :cond_0
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v1, v0, 0x2

    if-nez v1, :cond_1

    .line 278
    invoke-super {p0, p1}, Lgnu/kawa/reflect/ClassMemberLocation;->setWithSave(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 282
    :cond_1
    and-int/lit8 v1, v0, 0x8

    if-eqz v1, :cond_2

    .line 283
    iget-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .local v0, "v":Ljava/lang/Object;
    goto :goto_0

    .line 286
    .end local v0    # "v":Ljava/lang/Object;
    :cond_2
    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 287
    invoke-direct {p0}, Lgnu/kawa/reflect/FieldLocation;->getFieldValue()Ljava/lang/Object;

    move-result-object v0

    .line 288
    .restart local v0    # "v":Ljava/lang/Object;
    iput-object v0, p0, Lgnu/kawa/reflect/FieldLocation;->value:Ljava/lang/Object;

    .line 290
    :goto_0
    move-object v1, v0

    check-cast v1, Lgnu/mapping/Location;

    invoke-virtual {v1, p1}, Lgnu/mapping/Location;->setWithSave(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method setup()V
    .locals 1

    .line 176
    monitor-enter p0

    .line 178
    :try_start_0
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 179
    monitor-exit p0

    return-void

    .line 180
    :cond_0
    invoke-super {p0}, Lgnu/kawa/reflect/ClassMemberLocation;->setup()V

    .line 181
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    and-int/lit8 v0, v0, 0x40

    if-nez v0, :cond_1

    .line 182
    invoke-virtual {p0}, Lgnu/kawa/reflect/FieldLocation;->setKindFlags()V

    .line 183
    :cond_1
    iget v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lgnu/kawa/reflect/FieldLocation;->flags:I

    .line 184
    monitor-exit p0

    .line 185
    return-void

    .line 184
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 375
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 376
    .local v0, "sbuf":Ljava/lang/StringBuffer;
    const-string v1, "FieldLocation["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 377
    iget-object v1, p0, Lgnu/kawa/reflect/FieldLocation;->instance:Ljava/lang/Object;

    if-eqz v1, :cond_0

    .line 379
    iget-object v1, p0, Lgnu/kawa/reflect/FieldLocation;->instance:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 380
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 382
    :cond_0
    iget-object v1, p0, Lgnu/kawa/reflect/FieldLocation;->type:Lgnu/bytecode/ClassType;

    if-nez v1, :cond_1

    const-string v1, "(null)"

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lgnu/kawa/reflect/FieldLocation;->type:Lgnu/bytecode/ClassType;

    invoke-virtual {v1}, Lgnu/bytecode/ClassType;->getName()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 383
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 384
    iget-object v1, p0, Lgnu/kawa/reflect/FieldLocation;->mname:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 389
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 390
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
