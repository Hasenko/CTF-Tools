.class public Lgnu/bytecode/ObjectType;
.super Lgnu/bytecode/Type;
.source "ObjectType.java"


# static fields
.field static final ADD_ENCLOSING_DONE:I = 0x8

.field static final ADD_FIELDS_DONE:I = 0x1

.field static final ADD_MEMBERCLASSES_DONE:I = 0x4

.field static final ADD_METHODS_DONE:I = 0x2

.field static final EXISTING_CLASS:I = 0x10

.field static final HAS_OUTER_LINK:I = 0x20


# instance fields
.field public flags:I


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Lgnu/bytecode/Type;-><init>()V

    .line 16
    const/4 v0, 0x4

    iput v0, p0, Lgnu/bytecode/ObjectType;->size:I

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 20
    invoke-direct {p0}, Lgnu/bytecode/Type;-><init>()V

    .line 21
    iput-object p1, p0, Lgnu/bytecode/ObjectType;->this_name:Ljava/lang/String;

    .line 22
    const/4 v0, 0x4

    iput v0, p0, Lgnu/bytecode/ObjectType;->size:I

    .line 23
    return-void
.end method

.method public static getContextClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 4
    .param p0, "cname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 97
    const/4 v0, 0x0

    :try_start_0
    const-class v1, Lgnu/bytecode/ObjectType;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {p0, v0, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 99
    :catch_0
    move-exception v1

    .line 104
    .local v1, "ex":Ljava/lang/ClassNotFoundException;
    :try_start_1
    invoke-static {}, Lgnu/bytecode/ObjectType;->getThreadContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-static {p0, v0, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    return-object v0

    .line 106
    :catch_1
    move-exception v2

    .line 108
    .local v2, "ex2":Ljava/lang/ClassNotFoundException;
    invoke-static {}, Lgnu/bytecode/ObjectType;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-static {p0, v0, v3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public static getContextClassLoader()Ljava/lang/ClassLoader;
    .locals 2

    .line 148
    :try_start_0
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 153
    :catch_0
    move-exception v0

    .line 158
    .local v0, "ex":Ljava/lang/SecurityException;
    const-class v1, Lgnu/bytecode/ObjectType;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    return-object v1
.end method

.method public static getThreadContextClassLoader()Ljava/lang/ClassLoader;
    .locals 2

    .line 127
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 129
    :catch_0
    move-exception v0

    .line 134
    .local v0, "ex":Ljava/lang/SecurityException;
    const-class v1, Lgnu/bytecode/ObjectType;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public coerceFromObject(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .line 255
    if-eqz p1, :cond_2

    .line 257
    sget-object v0, Lgnu/bytecode/Type;->toStringType:Lgnu/bytecode/ClassType;

    if-ne p0, v0, :cond_0

    .line 258
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 259
    :cond_0
    invoke-virtual {p0}, Lgnu/bytecode/ObjectType;->getReflectClass()Ljava/lang/Class;

    move-result-object v0

    .line 260
    .local v0, "clas":Ljava/lang/Class;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 261
    .local v1, "objClass":Ljava/lang/Class;
    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 262
    :cond_1
    new-instance v2, Ljava/lang/ClassCastException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "don\'t know how to coerce "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lgnu/bytecode/ObjectType;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 266
    .end local v0    # "clas":Ljava/lang/Class;
    .end local v1    # "objClass":Ljava/lang/Class;
    :cond_2
    :goto_0
    return-object p1
.end method

.method public compare(Lgnu/bytecode/Type;)I
    .locals 1
    .param p1, "other"    # Lgnu/bytecode/Type;

    .line 245
    sget-object v0, Lgnu/bytecode/ObjectType;->nullType:Lgnu/bytecode/ObjectType;

    if-ne p1, v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method public emitCoerceFromObject(Lgnu/bytecode/CodeAttr;)V
    .locals 1
    .param p1, "code"    # Lgnu/bytecode/CodeAttr;

    .line 272
    sget-object v0, Lgnu/bytecode/Type;->toStringType:Lgnu/bytecode/ClassType;

    if-ne p0, v0, :cond_0

    .line 280
    invoke-virtual {p1}, Lgnu/bytecode/CodeAttr;->emitDup()V

    .line 281
    invoke-virtual {p1}, Lgnu/bytecode/CodeAttr;->emitIfNull()V

    .line 282
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lgnu/bytecode/CodeAttr;->emitPop(I)V

    .line 283
    invoke-virtual {p1}, Lgnu/bytecode/CodeAttr;->emitPushNull()V

    .line 284
    invoke-virtual {p1}, Lgnu/bytecode/CodeAttr;->emitElse()V

    .line 285
    sget-object v0, Lgnu/bytecode/Type;->toString_method:Lgnu/bytecode/Method;

    invoke-virtual {p1, v0}, Lgnu/bytecode/CodeAttr;->emitInvokeVirtual(Lgnu/bytecode/Method;)V

    .line 286
    invoke-virtual {p1}, Lgnu/bytecode/CodeAttr;->emitFi()V

    goto :goto_0

    .line 288
    :cond_0
    sget-object v0, Lgnu/bytecode/Type;->objectType:Lgnu/bytecode/ClassType;

    if-eq p0, v0, :cond_1

    .line 289
    invoke-virtual {p1, p0}, Lgnu/bytecode/CodeAttr;->emitCheckcast(Lgnu/bytecode/Type;)V

    .line 290
    :cond_1
    :goto_0
    return-void
.end method

.method public getField(Ljava/lang/String;I)Lgnu/bytecode/Field;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "mask"    # I

    .line 210
    const/4 v0, 0x0

    return-object v0
.end method

.method public getImplementationType()Lgnu/bytecode/Type;
    .locals 1

    .line 192
    sget-object v0, Lgnu/bytecode/ObjectType;->nullType:Lgnu/bytecode/ObjectType;

    if-ne p0, v0, :cond_0

    sget-object v0, Lgnu/bytecode/ObjectType;->objectType:Lgnu/bytecode/ClassType;

    goto :goto_0

    :cond_0
    sget-object v0, Lgnu/bytecode/ObjectType;->toStringType:Lgnu/bytecode/ClassType;

    if-ne p0, v0, :cond_1

    sget-object v0, Lgnu/bytecode/ObjectType;->javalangStringType:Lgnu/bytecode/ClassType;

    goto :goto_0

    :cond_1
    move-object v0, p0

    :goto_0
    return-object v0
.end method

.method public getInternalName()Ljava/lang/String;
    .locals 3

    .line 66
    invoke-virtual {p0}, Lgnu/bytecode/ObjectType;->getName()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2e

    const/16 v2, 0x2f

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMethod(Ljava/lang/String;[Lgnu/bytecode/Type;)Lgnu/bytecode/Method;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "arg_types"    # [Lgnu/bytecode/Type;

    .line 215
    sget-object v0, Lgnu/bytecode/Type;->objectType:Lgnu/bytecode/ClassType;

    invoke-virtual {v0, p1, p2}, Lgnu/bytecode/ClassType;->getMethod(Ljava/lang/String;[Lgnu/bytecode/Type;)Lgnu/bytecode/Method;

    move-result-object v0

    return-object v0
.end method

.method public getMethods(Lgnu/bytecode/Filter;ILjava/util/List;)I
    .locals 1
    .param p1, "filter"    # Lgnu/bytecode/Filter;
    .param p2, "searchSupers"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/bytecode/Filter;",
            "I",
            "Ljava/util/List<",
            "Lgnu/bytecode/Method;",
            ">;)I"
        }
    .end annotation

    .line 239
    .local p3, "result":Ljava/util/List;, "Ljava/util/List<Lgnu/bytecode/Method;>;"
    sget-object v0, Lgnu/bytecode/Type;->objectType:Lgnu/bytecode/ClassType;

    invoke-virtual {v0, p1, p2, p3}, Lgnu/bytecode/ClassType;->getMethods(Lgnu/bytecode/Filter;ILjava/util/List;)I

    move-result v0

    return v0
.end method

.method public final getMethods(Lgnu/bytecode/Filter;ILjava/util/Vector;Ljava/lang/String;)I
    .locals 1
    .param p1, "filter"    # Lgnu/bytecode/Filter;
    .param p2, "searchSupers"    # I
    .param p3, "result"    # Ljava/util/Vector;
    .param p4, "context"    # Ljava/lang/String;

    .line 225
    sget-object v0, Lgnu/bytecode/Type;->objectType:Lgnu/bytecode/ClassType;

    invoke-virtual {v0, p1, p2, p3, p4}, Lgnu/bytecode/ClassType;->getMethods(Lgnu/bytecode/Filter;ILjava/util/Vector;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getReflectClass()Ljava/lang/Class;
    .locals 4

    .line 171
    :try_start_0
    iget-object v0, p0, Lgnu/bytecode/ObjectType;->reflectClass:Ljava/lang/Class;

    if-nez v0, :cond_0

    .line 172
    invoke-virtual {p0}, Lgnu/bytecode/ObjectType;->getInternalName()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2f

    const/16 v2, 0x2e

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lgnu/bytecode/ObjectType;->getContextClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lgnu/bytecode/ObjectType;->reflectClass:Ljava/lang/Class;

    .line 173
    :cond_0
    iget v0, p0, Lgnu/bytecode/ObjectType;->flags:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lgnu/bytecode/ObjectType;->flags:I
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    goto :goto_0

    .line 175
    :catch_0
    move-exception v0

    .line 177
    .local v0, "ex":Ljava/lang/ClassNotFoundException;
    iget v1, p0, Lgnu/bytecode/ObjectType;->flags:I

    and-int/lit8 v1, v1, 0x10

    if-nez v1, :cond_1

    .line 187
    .end local v0    # "ex":Ljava/lang/ClassNotFoundException;
    :goto_0
    iget-object v0, p0, Lgnu/bytecode/ObjectType;->reflectClass:Ljava/lang/Class;

    return-object v0

    .line 179
    .restart local v0    # "ex":Ljava/lang/ClassNotFoundException;
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "no such class: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lgnu/bytecode/ObjectType;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 182
    .local v1, "rex":Ljava/lang/RuntimeException;
    invoke-virtual {v1, v0}, Ljava/lang/RuntimeException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 184
    throw v1
.end method

.method public final isExisting()Z
    .locals 4

    .line 39
    invoke-virtual {p0}, Lgnu/bytecode/ObjectType;->getImplementationType()Lgnu/bytecode/Type;

    move-result-object v0

    .line 40
    .local v0, "t":Lgnu/bytecode/Type;
    instance-of v1, v0, Lgnu/bytecode/ArrayType;

    if-eqz v1, :cond_0

    .line 41
    move-object v1, v0

    check-cast v1, Lgnu/bytecode/ArrayType;

    invoke-virtual {v1}, Lgnu/bytecode/ArrayType;->getComponentType()Lgnu/bytecode/Type;

    move-result-object v0

    .line 42
    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, p0, :cond_2

    .line 43
    iget v3, p0, Lgnu/bytecode/ObjectType;->flags:I

    and-int/lit8 v3, v3, 0x10

    if-eqz v3, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    .line 46
    :cond_2
    instance-of v3, v0, Lgnu/bytecode/ObjectType;

    if-eqz v3, :cond_3

    move-object v3, v0

    check-cast v3, Lgnu/bytecode/ObjectType;

    invoke-virtual {v3}, Lgnu/bytecode/ObjectType;->isExisting()Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_3
    const/4 v1, 0x1

    :cond_4
    return v1
.end method

.method public isInstance(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .line 203
    sget-object v0, Lgnu/bytecode/ObjectType;->nullType:Lgnu/bytecode/ObjectType;

    if-ne p0, v0, :cond_1

    .line 204
    if-nez p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 205
    :cond_1
    invoke-super {p0, p1}, Lgnu/bytecode/Type;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public promote()Lgnu/bytecode/Type;
    .locals 1

    .line 198
    sget-object v0, Lgnu/bytecode/ObjectType;->nullType:Lgnu/bytecode/ObjectType;

    if-ne p0, v0, :cond_0

    sget-object v0, Lgnu/bytecode/ObjectType;->objectType:Lgnu/bytecode/ClassType;

    goto :goto_0

    :cond_0
    move-object v0, p0

    :goto_0
    return-object v0
.end method

.method public final setExisting(Z)V
    .locals 1
    .param p1, "existing"    # Z

    .line 54
    if-eqz p1, :cond_0

    iget v0, p0, Lgnu/bytecode/ObjectType;->flags:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lgnu/bytecode/ObjectType;->flags:I

    goto :goto_0

    .line 55
    :cond_0
    iget v0, p0, Lgnu/bytecode/ObjectType;->flags:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lgnu/bytecode/ObjectType;->flags:I

    .line 56
    :goto_0
    return-void
.end method
