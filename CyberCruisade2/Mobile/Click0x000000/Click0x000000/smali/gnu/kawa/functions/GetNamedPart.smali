.class public Lgnu/kawa/functions/GetNamedPart;
.super Lgnu/mapping/Procedure2;
.source "GetNamedPart.java"

# interfaces
.implements Lgnu/mapping/HasSetter;


# static fields
.field public static final CAST_METHOD_NAME:Ljava/lang/String; = "@"

.field public static final CLASSTYPE_FOR:Ljava/lang/String; = "<>"

.field public static final INSTANCEOF_METHOD_NAME:Ljava/lang/String; = "instance?"

.field public static final getNamedPart:Lgnu/kawa/functions/GetNamedPart;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 13
    new-instance v0, Lgnu/kawa/functions/GetNamedPart;

    invoke-direct {v0}, Lgnu/kawa/functions/GetNamedPart;-><init>()V

    sput-object v0, Lgnu/kawa/functions/GetNamedPart;->getNamedPart:Lgnu/kawa/functions/GetNamedPart;

    .line 15
    sget-object v1, Lgnu/mapping/Procedure;->validateApplyKey:Lgnu/mapping/Symbol;

    const-string v2, "gnu.kawa.functions.CompileNamedPart:validateGetNamedPart"

    invoke-virtual {v0, v1, v2}, Lgnu/kawa/functions/GetNamedPart;->setProperty(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Lgnu/mapping/Procedure2;-><init>()V

    return-void
.end method

.method public static getMemberPart(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p0, "container"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 114
    :try_start_0
    invoke-static {p0, p1}, Lgnu/kawa/reflect/SlotGet;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 116
    :catchall_0
    move-exception v0

    .line 120
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lgnu/bytecode/ClassType;->make(Ljava/lang/Class;)Lgnu/bytecode/Type;

    move-result-object v0

    check-cast v0, Lgnu/bytecode/ClassType;

    invoke-static {p1}, Lgnu/expr/Compilation;->mangleName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {}, Lgnu/expr/Language;->getDefaultLanguage()Lgnu/expr/Language;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lgnu/kawa/reflect/ClassMethods;->apply(Lgnu/bytecode/ObjectType;Ljava/lang/String;CLgnu/expr/Language;)Lgnu/mapping/MethodProc;

    move-result-object v0

    .line 123
    .local v0, "methods":Lgnu/mapping/MethodProc;
    if-eqz v0, :cond_0

    .line 124
    new-instance v1, Lgnu/kawa/functions/NamedPart;

    const/16 v2, 0x4d

    invoke-direct {v1, p0, p1, v2, v0}, Lgnu/kawa/functions/NamedPart;-><init>(Ljava/lang/Object;Ljava/lang/String;CLgnu/mapping/MethodProc;)V

    return-object v1

    .line 125
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "no part \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getNamedPart(Ljava/lang/Object;Lgnu/mapping/Symbol;)Ljava/lang/Object;
    .locals 4
    .param p0, "container"    # Ljava/lang/Object;
    .param p1, "part"    # Lgnu/mapping/Symbol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 88
    invoke-virtual {p1}, Lgnu/mapping/Symbol;->getName()Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "name":Ljava/lang/String;
    instance-of v1, p0, Lgnu/mapping/HasNamedParts;

    if-eqz v1, :cond_0

    .line 90
    move-object v1, p0

    check-cast v1, Lgnu/mapping/HasNamedParts;

    invoke-interface {v1, v0}, Lgnu/mapping/HasNamedParts;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 91
    :cond_0
    instance-of v1, p0, Ljava/lang/Class;

    if-eqz v1, :cond_1

    .line 92
    move-object v1, p0

    check-cast v1, Ljava/lang/Class;

    invoke-static {v1}, Lgnu/bytecode/Type;->make(Ljava/lang/Class;)Lgnu/bytecode/Type;

    move-result-object p0

    .line 93
    :cond_1
    instance-of v1, p0, Ljava/lang/Package;

    if-eqz v1, :cond_2

    .line 97
    :try_start_0
    move-object v1, p0

    check-cast v1, Ljava/lang/Package;

    invoke-virtual {v1}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v1

    .line 98
    .local v1, "pname":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x2e

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lgnu/bytecode/ClassType;->getContextClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v2

    .line 100
    .end local v1    # "pname":Ljava/lang/String;
    :catchall_0
    move-exception v1

    .line 104
    :cond_2
    instance-of v1, p0, Lgnu/bytecode/Type;

    if-eqz v1, :cond_3

    .line 105
    move-object v1, p0

    check-cast v1, Lgnu/bytecode/Type;

    invoke-static {v1, v0}, Lgnu/kawa/functions/GetNamedPart;->getTypePart(Lgnu/bytecode/Type;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 106
    :cond_3
    invoke-virtual {p1}, Lgnu/mapping/Symbol;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lgnu/kawa/functions/GetNamedPart;->getMemberPart(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static getTypePart(Lgnu/bytecode/Type;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p0, "type"    # Lgnu/bytecode/Type;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 53
    const-string v0, "<>"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 54
    return-object p0

    .line 56
    :cond_0
    instance-of v0, p0, Lgnu/bytecode/ObjectType;

    if-eqz v0, :cond_5

    .line 58
    const-string v0, "instance?"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 59
    new-instance v0, Lgnu/kawa/functions/NamedPart;

    const/16 v1, 0x49

    invoke-direct {v0, p0, p1, v1}, Lgnu/kawa/functions/NamedPart;-><init>(Ljava/lang/Object;Ljava/lang/Object;C)V

    return-object v0

    .line 60
    :cond_1
    const-string v0, "@"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 61
    new-instance v0, Lgnu/kawa/functions/NamedPart;

    const/16 v1, 0x43

    invoke-direct {v0, p0, p1, v1}, Lgnu/kawa/functions/NamedPart;-><init>(Ljava/lang/Object;Ljava/lang/Object;C)V

    return-object v0

    .line 62
    :cond_2
    const-string v0, "new"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 63
    new-instance v0, Lgnu/kawa/functions/NamedPart;

    const/16 v1, 0x4e

    invoke-direct {v0, p0, p1, v1}, Lgnu/kawa/functions/NamedPart;-><init>(Ljava/lang/Object;Ljava/lang/Object;C)V

    return-object v0

    .line 64
    :cond_3
    const-string v0, ".length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_5

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2e

    if-ne v0, v1, :cond_5

    instance-of v0, p0, Lgnu/bytecode/ClassType;

    if-eqz v0, :cond_5

    .line 67
    :cond_4
    new-instance v0, Lgnu/kawa/functions/NamedPart;

    const/16 v1, 0x44

    invoke-direct {v0, p0, p1, v1}, Lgnu/kawa/functions/NamedPart;-><init>(Ljava/lang/Object;Ljava/lang/Object;C)V

    return-object v0

    .line 70
    :cond_5
    instance-of v0, p0, Lgnu/bytecode/ClassType;

    if-eqz v0, :cond_6

    .line 74
    :try_start_0
    invoke-static {p0, p1}, Lgnu/kawa/reflect/SlotGet;->staticField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 76
    :catchall_0
    move-exception v0

    .line 80
    sget-object v0, Lgnu/kawa/reflect/ClassMethods;->classMethods:Lgnu/kawa/reflect/ClassMethods;

    invoke-static {v0, p0, p1}, Lgnu/kawa/reflect/ClassMethods;->apply(Lgnu/mapping/Procedure;Ljava/lang/Object;Ljava/lang/Object;)Lgnu/mapping/MethodProc;

    move-result-object v0

    return-object v0

    .line 82
    :cond_6
    invoke-static {p0, p1}, Lgnu/kawa/functions/GetNamedPart;->getMemberPart(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public apply2(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "container"    # Ljava/lang/Object;
    .param p2, "part"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 32
    instance-of v0, p1, Lgnu/mapping/Values;

    if-eqz v0, :cond_1

    .line 34
    move-object v0, p1

    check-cast v0, Lgnu/mapping/Values;

    invoke-virtual {v0}, Lgnu/mapping/Values;->getValues()[Ljava/lang/Object;

    move-result-object v0

    .line 35
    .local v0, "values":[Ljava/lang/Object;
    new-instance v1, Lgnu/mapping/Values;

    invoke-direct {v1}, Lgnu/mapping/Values;-><init>()V

    .line 36
    .local v1, "result":Lgnu/mapping/Values;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 38
    aget-object v3, v0, v2

    invoke-virtual {p0, v3, p2}, Lgnu/kawa/functions/GetNamedPart;->apply2(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3, v1}, Lgnu/mapping/Values;->writeValues(Ljava/lang/Object;Lgnu/lists/Consumer;)V

    .line 36
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 40
    .end local v2    # "i":I
    :cond_0
    invoke-virtual {v1}, Lgnu/mapping/Values;->canonicalize()Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 43
    .end local v0    # "values":[Ljava/lang/Object;
    .end local v1    # "result":Lgnu/mapping/Values;
    :cond_1
    instance-of v0, p2, Lgnu/mapping/Symbol;

    if-eqz v0, :cond_2

    .line 44
    move-object v0, p2

    check-cast v0, Lgnu/mapping/Symbol;

    .local v0, "sym":Lgnu/mapping/Symbol;
    goto :goto_1

    .line 46
    .end local v0    # "sym":Lgnu/mapping/Symbol;
    :cond_2
    sget-object v0, Lgnu/mapping/Namespace;->EmptyNamespace:Lgnu/mapping/Namespace;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lgnu/mapping/Namespace;->getSymbol(Ljava/lang/String;)Lgnu/mapping/Symbol;

    move-result-object v0

    .line 47
    .restart local v0    # "sym":Lgnu/mapping/Symbol;
    :goto_1
    invoke-static {p1, v0}, Lgnu/kawa/functions/GetNamedPart;->getNamedPart(Ljava/lang/Object;Lgnu/mapping/Symbol;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getSetter()Lgnu/mapping/Procedure;
    .locals 1

    .line 130
    sget-object v0, Lgnu/kawa/functions/SetNamedPart;->setNamedPart:Lgnu/kawa/functions/SetNamedPart;

    return-object v0
.end method
