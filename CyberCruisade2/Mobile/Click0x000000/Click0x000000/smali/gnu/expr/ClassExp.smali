.class public Lgnu/expr/ClassExp;
.super Lgnu/expr/LambdaExp;
.source "ClassExp.java"


# static fields
.field public static final CLASS_SPECIFIED:I = 0x10000

.field public static final HAS_SUBCLASS:I = 0x20000

.field public static final INTERFACE_SPECIFIED:I = 0x8000

.field public static final IS_ABSTRACT:I = 0x4000


# instance fields
.field public classNameSpecifier:Ljava/lang/String;

.field public clinitMethod:Lgnu/expr/LambdaExp;

.field explicitInit:Z

.field public initMethod:Lgnu/expr/LambdaExp;

.field instanceType:Lgnu/bytecode/ClassType;

.field partsDeclared:Z

.field simple:Z

.field public superClassIndex:I

.field public supers:[Lgnu/expr/Expression;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 65
    invoke-direct {p0}, Lgnu/expr/LambdaExp;-><init>()V

    .line 53
    const/4 v0, -0x1

    iput v0, p0, Lgnu/expr/ClassExp;->superClassIndex:I

    .line 66
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .param p1, "simple"    # Z

    .line 69
    invoke-direct {p0}, Lgnu/expr/LambdaExp;-><init>()V

    .line 53
    const/4 v0, -0x1

    iput v0, p0, Lgnu/expr/ClassExp;->superClassIndex:I

    .line 70
    iput-boolean p1, p0, Lgnu/expr/ClassExp;->simple:Z

    .line 71
    new-instance v0, Lgnu/bytecode/ClassType;

    invoke-direct {v0}, Lgnu/bytecode/ClassType;-><init>()V

    iput-object v0, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    iput-object v0, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    .line 72
    return-void
.end method

.method static getImplMethods(Lgnu/bytecode/ClassType;Ljava/lang/String;[Lgnu/bytecode/Type;Ljava/util/Vector;)V
    .locals 7
    .param p0, "interfaceType"    # Lgnu/bytecode/ClassType;
    .param p1, "mname"    # Ljava/lang/String;
    .param p2, "paramTypes"    # [Lgnu/bytecode/Type;
    .param p3, "vec"    # Ljava/util/Vector;

    .line 371
    instance-of v0, p0, Lgnu/expr/PairClassType;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 372
    move-object v0, p0

    check-cast v0, Lgnu/expr/PairClassType;

    iget-object v0, v0, Lgnu/expr/PairClassType;->instanceType:Lgnu/bytecode/ClassType;

    .local v0, "implType":Lgnu/bytecode/ClassType;
    goto :goto_0

    .line 373
    .end local v0    # "implType":Lgnu/bytecode/ClassType;
    :cond_0
    invoke-virtual {p0}, Lgnu/bytecode/ClassType;->isInterface()Z

    move-result v0

    if-nez v0, :cond_1

    .line 374
    return-void

    .line 379
    :cond_1
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Lgnu/bytecode/ClassType;->getReflectClass()Ljava/lang/Class;

    move-result-object v2

    .line 380
    .local v2, "reflectClass":Ljava/lang/Class;
    if-nez v2, :cond_2

    .line 381
    return-void

    .line 382
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lgnu/bytecode/ClassType;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "$class"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 383
    .local v3, "implTypeName":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    .line 385
    .local v4, "loader":Ljava/lang/ClassLoader;
    invoke-static {v3, v1, v4}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v5

    .line 389
    .local v5, "implClass":Ljava/lang/Class;
    invoke-static {v5}, Lgnu/bytecode/Type;->make(Ljava/lang/Class;)Lgnu/bytecode/Type;

    move-result-object v6

    check-cast v6, Lgnu/bytecode/ClassType;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v6

    .line 394
    .end local v2    # "reflectClass":Ljava/lang/Class;
    .end local v3    # "implTypeName":Ljava/lang/String;
    .end local v4    # "loader":Ljava/lang/ClassLoader;
    .end local v5    # "implClass":Ljava/lang/Class;
    .restart local v0    # "implType":Lgnu/bytecode/ClassType;
    nop

    .line 396
    :goto_0
    array-length v2, p2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    new-array v2, v2, [Lgnu/bytecode/Type;

    .line 397
    .local v2, "itypes":[Lgnu/bytecode/Type;
    aput-object p0, v2, v1

    .line 398
    array-length v4, p2

    invoke-static {p2, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 399
    invoke-virtual {v0, p1, v2}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;[Lgnu/bytecode/Type;)Lgnu/bytecode/Method;

    move-result-object v1

    .line 400
    .local v1, "implMethod":Lgnu/bytecode/Method;
    if-eqz v1, :cond_5

    .line 402
    invoke-virtual {p3}, Ljava/util/Vector;->size()I

    move-result v3

    .line 403
    .local v3, "count":I
    if-eqz v3, :cond_3

    add-int/lit8 v4, v3, -0x1

    invoke-virtual {p3, v4}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 404
    :cond_3
    invoke-virtual {p3, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 405
    .end local v3    # "count":I
    :cond_4
    goto :goto_2

    .line 408
    :cond_5
    invoke-virtual {p0}, Lgnu/bytecode/ClassType;->getInterfaces()[Lgnu/bytecode/ClassType;

    move-result-object v3

    .line 409
    .local v3, "superInterfaces":[Lgnu/bytecode/ClassType;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v5, v3

    if-ge v4, v5, :cond_6

    .line 410
    aget-object v5, v3, v4

    invoke-static {v5, p1, p2, p3}, Lgnu/expr/ClassExp;->getImplMethods(Lgnu/bytecode/ClassType;Ljava/lang/String;[Lgnu/bytecode/Type;Ljava/util/Vector;)V

    .line 409
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 412
    .end local v3    # "superInterfaces":[Lgnu/bytecode/ClassType;
    .end local v4    # "i":I
    :cond_6
    :goto_2
    return-void

    .line 391
    .end local v0    # "implType":Lgnu/bytecode/ClassType;
    .end local v1    # "implMethod":Lgnu/bytecode/Method;
    .end local v2    # "itypes":[Lgnu/bytecode/Type;
    :catchall_0
    move-exception v1

    .line 393
    .restart local v0    # "implType":Lgnu/bytecode/ClassType;
    .local v1, "ex":Ljava/lang/Throwable;
    return-void
.end method

.method static invokeDefaultSuperConstructor(Lgnu/bytecode/ClassType;Lgnu/expr/Compilation;Lgnu/expr/LambdaExp;)V
    .locals 5
    .param p0, "superClass"    # Lgnu/bytecode/ClassType;
    .param p1, "comp"    # Lgnu/expr/Compilation;
    .param p2, "lexp"    # Lgnu/expr/LambdaExp;

    .line 718
    invoke-virtual {p1}, Lgnu/expr/Compilation;->getCode()Lgnu/bytecode/CodeAttr;

    move-result-object v0

    .line 719
    .local v0, "code":Lgnu/bytecode/CodeAttr;
    const-string v1, "<init>"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v1

    .line 721
    .local v1, "superConstructor":Lgnu/bytecode/Method;
    if-nez v1, :cond_0

    .line 722
    const/16 v2, 0x65

    const-string v3, "super class does not have a default constructor"

    invoke-virtual {p1, v2, v3}, Lgnu/expr/Compilation;->error(CLjava/lang/String;)V

    goto :goto_0

    .line 725
    :cond_0
    invoke-virtual {v0}, Lgnu/bytecode/CodeAttr;->emitPushThis()V

    .line 726
    invoke-virtual {p0}, Lgnu/bytecode/ClassType;->hasOuterLink()Z

    move-result v2

    if-eqz v2, :cond_1

    instance-of v2, p2, Lgnu/expr/ClassExp;

    if-eqz v2, :cond_1

    .line 728
    move-object v2, p2

    check-cast v2, Lgnu/expr/ClassExp;

    .line 729
    .local v2, "clExp":Lgnu/expr/ClassExp;
    iget-object v3, v2, Lgnu/expr/ClassExp;->supers:[Lgnu/expr/Expression;

    iget v4, v2, Lgnu/expr/ClassExp;->superClassIndex:I

    aget-object v3, v3, v4

    .line 730
    .local v3, "superExp":Lgnu/expr/Expression;
    invoke-static {v3, p0, p1}, Lgnu/expr/ClassExp;->loadSuperStaticLink(Lgnu/expr/Expression;Lgnu/bytecode/ClassType;Lgnu/expr/Compilation;)V

    .line 732
    .end local v2    # "clExp":Lgnu/expr/ClassExp;
    .end local v3    # "superExp":Lgnu/expr/Expression;
    :cond_1
    invoke-virtual {v0, v1}, Lgnu/bytecode/CodeAttr;->emitInvokeSpecial(Lgnu/bytecode/Method;)V

    .line 734
    :goto_0
    return-void
.end method

.method static loadSuperStaticLink(Lgnu/expr/Expression;Lgnu/bytecode/ClassType;Lgnu/expr/Compilation;)V
    .locals 4
    .param p0, "superExp"    # Lgnu/expr/Expression;
    .param p1, "superClass"    # Lgnu/bytecode/ClassType;
    .param p2, "comp"    # Lgnu/expr/Compilation;

    .line 707
    invoke-virtual {p2}, Lgnu/expr/Compilation;->getCode()Lgnu/bytecode/CodeAttr;

    move-result-object v0

    .line 709
    .local v0, "code":Lgnu/bytecode/CodeAttr;
    sget-object v1, Lgnu/expr/Compilation;->typeClassType:Lgnu/bytecode/ClassType;

    invoke-static {v1}, Lgnu/expr/Target;->pushValue(Lgnu/bytecode/Type;)Lgnu/expr/Target;

    move-result-object v1

    invoke-virtual {p0, p2, v1}, Lgnu/expr/Expression;->compile(Lgnu/expr/Compilation;Lgnu/expr/Target;)V

    .line 710
    const-string v1, "gnu.expr.PairClassType"

    invoke-static {v1}, Lgnu/bytecode/ClassType;->make(Ljava/lang/String;)Lgnu/bytecode/ClassType;

    move-result-object v1

    const-string v2, "extractStaticLink"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v1

    invoke-virtual {v0, v1}, Lgnu/bytecode/CodeAttr;->emitInvokeStatic(Lgnu/bytecode/Method;)V

    .line 711
    invoke-virtual {p1}, Lgnu/bytecode/ClassType;->getOuterLinkType()Lgnu/bytecode/ClassType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lgnu/bytecode/CodeAttr;->emitCheckcast(Lgnu/bytecode/Type;)V

    .line 712
    return-void
.end method

.method public static slotToMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "sname"    # Ljava/lang/String;

    .line 797
    invoke-static {p1}, Lgnu/expr/Compilation;->isValidJavaName(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 798
    invoke-static {p1, v1}, Lgnu/expr/Compilation;->mangleName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    .line 799
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 800
    .local v0, "slen":I
    new-instance v2, Ljava/lang/StringBuffer;

    add-int/lit8 v3, v0, 0x3

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 801
    .local v2, "sbuf":Ljava/lang/StringBuffer;
    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 802
    if-lez v0, :cond_1

    .line 804
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toTitleCase(C)C

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 805
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 807
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static usedSuperClasses(Lgnu/bytecode/ClassType;Lgnu/expr/Compilation;)V
    .locals 3
    .param p0, "clas"    # Lgnu/bytecode/ClassType;
    .param p1, "comp"    # Lgnu/expr/Compilation;

    .line 417
    invoke-virtual {p0}, Lgnu/bytecode/ClassType;->getSuperclass()Lgnu/bytecode/ClassType;

    move-result-object v0

    invoke-virtual {p1, v0}, Lgnu/expr/Compilation;->usedClass(Lgnu/bytecode/Type;)V

    .line 418
    invoke-virtual {p0}, Lgnu/bytecode/ClassType;->getInterfaces()[Lgnu/bytecode/ClassType;

    move-result-object v0

    .line 419
    .local v0, "interfaces":[Lgnu/bytecode/ClassType;
    if-eqz v0, :cond_0

    .line 421
    array-length v1, v0

    .local v1, "i":I
    :goto_0
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_0

    .line 422
    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Lgnu/expr/Compilation;->usedClass(Lgnu/bytecode/Type;)V

    goto :goto_0

    .line 424
    .end local v1    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public addMethod(Lgnu/expr/LambdaExp;Ljava/lang/Object;)Lgnu/expr/Declaration;
    .locals 4
    .param p1, "lexp"    # Lgnu/expr/LambdaExp;
    .param p2, "mname"    # Ljava/lang/Object;

    .line 812
    sget-object v0, Lgnu/expr/Compilation;->typeProcedure:Lgnu/bytecode/ClassType;

    invoke-virtual {p0, p2, v0}, Lgnu/expr/ClassExp;->addDeclaration(Ljava/lang/Object;Lgnu/bytecode/Type;)Lgnu/expr/Declaration;

    move-result-object v0

    .line 813
    .local v0, "mdecl":Lgnu/expr/Declaration;
    iput-object p0, p1, Lgnu/expr/LambdaExp;->outer:Lgnu/expr/ScopeExp;

    .line 814
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lgnu/expr/LambdaExp;->setClassMethod(Z)V

    .line 815
    invoke-virtual {v0, p1}, Lgnu/expr/Declaration;->noteValue(Lgnu/expr/Expression;)V

    .line 816
    const-wide/32 v2, 0x100000

    invoke-virtual {v0, v2, v3}, Lgnu/expr/Declaration;->setFlag(J)V

    .line 817
    invoke-virtual {v0, v1}, Lgnu/expr/Declaration;->setProcedureDecl(Z)V

    .line 818
    invoke-virtual {p1, p2}, Lgnu/expr/LambdaExp;->setSymbol(Ljava/lang/Object;)V

    .line 819
    return-object v0
.end method

.method public compile(Lgnu/expr/Compilation;Lgnu/expr/Target;)V
    .locals 1
    .param p1, "comp"    # Lgnu/expr/Compilation;
    .param p2, "target"    # Lgnu/expr/Target;

    .line 78
    instance-of v0, p2, Lgnu/expr/IgnoreTarget;

    if-eqz v0, :cond_0

    .line 79
    return-void

    .line 80
    :cond_0
    invoke-virtual {p0, p1}, Lgnu/expr/ClassExp;->compileMembers(Lgnu/expr/Compilation;)Lgnu/bytecode/ClassType;

    .line 81
    invoke-virtual {p0, p1, p2}, Lgnu/expr/ClassExp;->compilePushClass(Lgnu/expr/Compilation;Lgnu/expr/Target;)V

    .line 82
    return-void
.end method

.method public compileMembers(Lgnu/expr/Compilation;)Lgnu/bytecode/ClassType;
    .locals 28
    .param p1, "comp"    # Lgnu/expr/Compilation;

    .line 428
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    iget-object v3, v2, Lgnu/expr/Compilation;->curClass:Lgnu/bytecode/ClassType;

    .line 429
    .local v3, "saveClass":Lgnu/bytecode/ClassType;
    iget-object v4, v2, Lgnu/expr/Compilation;->method:Lgnu/bytecode/Method;

    .line 432
    .local v4, "saveMethod":Lgnu/bytecode/Method;
    :try_start_0
    invoke-virtual/range {p0 .. p1}, Lgnu/expr/ClassExp;->getCompiledClassType(Lgnu/expr/Compilation;)Lgnu/bytecode/ClassType;

    move-result-object v0

    .line 433
    .local v0, "new_class":Lgnu/bytecode/ClassType;
    iput-object v0, v2, Lgnu/expr/Compilation;->curClass:Lgnu/bytecode/ClassType;

    .line 435
    invoke-virtual/range {p0 .. p0}, Lgnu/expr/ClassExp;->outerLambda()Lgnu/expr/LambdaExp;

    move-result-object v5

    .line 436
    .local v5, "outer":Lgnu/expr/LambdaExp;
    const/4 v6, 0x0

    .line 437
    .local v6, "enclosing":Lgnu/bytecode/Member;
    instance-of v7, v5, Lgnu/expr/ClassExp;

    if-eqz v7, :cond_0

    .line 438
    iget-object v7, v5, Lgnu/expr/LambdaExp;->type:Lgnu/bytecode/ClassType;

    move-object v6, v7

    goto :goto_0

    .line 439
    :cond_0
    if-eqz v5, :cond_1

    instance-of v7, v5, Lgnu/expr/ModuleExp;

    if-nez v7, :cond_1

    .line 440
    move-object v6, v4

    goto :goto_0

    .line 441
    :cond_1
    instance-of v7, v5, Lgnu/expr/ModuleExp;

    if-eqz v7, :cond_2

    iget-object v7, v1, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    invoke-virtual {v7}, Lgnu/bytecode/ClassType;->getName()Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x24

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-lez v7, :cond_2

    .line 442
    iget-object v7, v5, Lgnu/expr/LambdaExp;->type:Lgnu/bytecode/ClassType;

    move-object v6, v7

    .line 443
    :cond_2
    :goto_0
    if-eqz v6, :cond_3

    .line 445
    invoke-virtual {v0, v6}, Lgnu/bytecode/ClassType;->setEnclosingMember(Lgnu/bytecode/Member;)V

    .line 446
    instance-of v7, v6, Lgnu/bytecode/ClassType;

    if-eqz v7, :cond_3

    .line 447
    move-object v7, v6

    check-cast v7, Lgnu/bytecode/ClassType;

    invoke-virtual {v7, v0}, Lgnu/bytecode/ClassType;->addMemberClass(Lgnu/bytecode/ClassType;)V

    .line 449
    :cond_3
    iget-object v7, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    if-eq v7, v0, :cond_4

    .line 451
    iget-object v8, v1, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    invoke-virtual {v7, v8}, Lgnu/bytecode/ClassType;->setEnclosingMember(Lgnu/bytecode/Member;)V

    .line 452
    iget-object v7, v1, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    iget-object v8, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-virtual {v7, v8}, Lgnu/bytecode/ClassType;->addMemberClass(Lgnu/bytecode/ClassType;)V

    .line 455
    :cond_4
    iget-object v7, v1, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    invoke-static {v7, v2}, Lgnu/expr/ClassExp;->usedSuperClasses(Lgnu/bytecode/ClassType;Lgnu/expr/Compilation;)V

    .line 456
    iget-object v7, v1, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    iget-object v8, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    if-eq v7, v8, :cond_5

    .line 457
    invoke-static {v8, v2}, Lgnu/expr/ClassExp;->usedSuperClasses(Lgnu/bytecode/ClassType;Lgnu/expr/Compilation;)V

    .line 459
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lgnu/expr/ClassExp;->getFileName()Ljava/lang/String;

    move-result-object v7

    .line 460
    .local v7, "filename":Ljava/lang/String;
    if-eqz v7, :cond_6

    .line 461
    invoke-virtual {v0, v7}, Lgnu/bytecode/ClassType;->setSourceFile(Ljava/lang/String;)V

    .line 463
    :cond_6
    iget-object v8, v2, Lgnu/expr/Compilation;->curLambda:Lgnu/expr/LambdaExp;

    .line 464
    .local v8, "saveLambda":Lgnu/expr/LambdaExp;
    iput-object v1, v2, Lgnu/expr/Compilation;->curLambda:Lgnu/expr/LambdaExp;

    .line 466
    invoke-virtual/range {p0 .. p1}, Lgnu/expr/ClassExp;->allocFrame(Lgnu/expr/Compilation;)V

    .line 469
    iget-object v9, v1, Lgnu/expr/ClassExp;->firstChild:Lgnu/expr/LambdaExp;

    .local v9, "child":Lgnu/expr/LambdaExp;
    :goto_1
    if-eqz v9, :cond_18

    .line 472
    invoke-virtual {v9}, Lgnu/expr/LambdaExp;->isAbstract()Z

    move-result v13

    if-eqz v13, :cond_7

    .line 473
    move-object/from16 v21, v5

    move-object/from16 v22, v6

    move-object/from16 v24, v7

    goto/16 :goto_b

    .line 474
    :cond_7
    iget-object v13, v2, Lgnu/expr/Compilation;->method:Lgnu/bytecode/Method;

    .line 475
    .local v13, "save_method":Lgnu/bytecode/Method;
    iget-object v14, v2, Lgnu/expr/Compilation;->curLambda:Lgnu/expr/LambdaExp;

    .line 476
    .local v14, "save_lambda":Lgnu/expr/LambdaExp;
    invoke-virtual/range {p1 .. p1}, Lgnu/expr/Compilation;->getFileName()Ljava/lang/String;

    move-result-object v15

    .line 477
    .local v15, "saveFilename":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lgnu/expr/Compilation;->getLineNumber()I

    move-result v16

    move/from16 v17, v16

    .line 478
    .local v17, "saveLine":I
    invoke-virtual/range {p1 .. p1}, Lgnu/expr/Compilation;->getColumnNumber()I

    move-result v16

    move/from16 v18, v16

    .line 479
    .local v18, "saveColumn":I
    invoke-virtual {v2, v9}, Lgnu/expr/Compilation;->setLine(Lgnu/expr/Expression;)V

    .line 480
    invoke-virtual {v9}, Lgnu/expr/LambdaExp;->getMainMethod()Lgnu/bytecode/Method;

    move-result-object v10

    iput-object v10, v2, Lgnu/expr/Compilation;->method:Lgnu/bytecode/Method;

    .line 482
    iget-object v10, v9, Lgnu/expr/LambdaExp;->nameDecl:Lgnu/expr/Declaration;

    .line 483
    .local v10, "childDecl":Lgnu/expr/Declaration;
    if-eqz v10, :cond_8

    const-wide/16 v11, 0x800

    invoke-virtual {v10, v11, v12}, Lgnu/expr/Declaration;->getFlag(J)Z

    move-result v11

    if-nez v11, :cond_9

    .line 485
    :cond_8
    iget-object v11, v2, Lgnu/expr/Compilation;->curClass:Lgnu/bytecode/ClassType;

    invoke-virtual {v9, v11}, Lgnu/expr/LambdaExp;->declareThis(Lgnu/bytecode/ClassType;)Lgnu/bytecode/Variable;

    .line 486
    :cond_9
    iget-object v11, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    iput-object v11, v2, Lgnu/expr/Compilation;->curClass:Lgnu/bytecode/ClassType;

    .line 487
    iput-object v9, v2, Lgnu/expr/Compilation;->curLambda:Lgnu/expr/LambdaExp;

    .line 488
    iget-object v11, v2, Lgnu/expr/Compilation;->method:Lgnu/bytecode/Method;

    invoke-virtual {v11}, Lgnu/bytecode/Method;->initCode()V

    .line 489
    invoke-virtual {v9, v2}, Lgnu/expr/LambdaExp;->allocChildClasses(Lgnu/expr/Compilation;)V

    .line 490
    invoke-virtual {v9, v2}, Lgnu/expr/LambdaExp;->allocParameters(Lgnu/expr/Compilation;)V

    .line 491
    const-string v11, "*init*"

    invoke-virtual {v9}, Lgnu/expr/LambdaExp;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_17

    .line 493
    invoke-virtual/range {p1 .. p1}, Lgnu/expr/Compilation;->getCode()Lgnu/bytecode/CodeAttr;

    move-result-object v11

    .line 495
    .local v11, "code":Lgnu/bytecode/CodeAttr;
    iget-object v12, v1, Lgnu/expr/ClassExp;->staticLinkField:Lgnu/bytecode/Field;

    if-eqz v12, :cond_a

    .line 497
    invoke-virtual {v11}, Lgnu/bytecode/CodeAttr;->emitPushThis()V

    .line 498
    invoke-virtual {v11}, Lgnu/bytecode/CodeAttr;->getCurrentScope()Lgnu/bytecode/Scope;

    move-result-object v12

    move-object/from16 v21, v5

    const/4 v5, 0x1

    .end local v5    # "outer":Lgnu/expr/LambdaExp;
    .local v21, "outer":Lgnu/expr/LambdaExp;
    invoke-virtual {v12, v5}, Lgnu/bytecode/Scope;->getVariable(I)Lgnu/bytecode/Variable;

    move-result-object v5

    invoke-virtual {v11, v5}, Lgnu/bytecode/CodeAttr;->emitLoad(Lgnu/bytecode/Variable;)V

    .line 499
    iget-object v5, v1, Lgnu/expr/ClassExp;->staticLinkField:Lgnu/bytecode/Field;

    invoke-virtual {v11, v5}, Lgnu/bytecode/CodeAttr;->emitPutField(Lgnu/bytecode/Field;)V

    goto :goto_2

    .line 495
    .end local v21    # "outer":Lgnu/expr/LambdaExp;
    .restart local v5    # "outer":Lgnu/expr/LambdaExp;
    :cond_a
    move-object/from16 v21, v5

    .line 503
    .end local v5    # "outer":Lgnu/expr/LambdaExp;
    .restart local v21    # "outer":Lgnu/expr/LambdaExp;
    :goto_2
    iget-object v5, v9, Lgnu/expr/LambdaExp;->body:Lgnu/expr/Expression;

    .line 504
    .local v5, "bodyFirst":Lgnu/expr/Expression;
    :goto_3
    instance-of v12, v5, Lgnu/expr/BeginExp;

    if-eqz v12, :cond_c

    .line 506
    move-object v12, v5

    check-cast v12, Lgnu/expr/BeginExp;

    .line 507
    .local v12, "bbody":Lgnu/expr/BeginExp;
    move-object/from16 v22, v6

    .end local v6    # "enclosing":Lgnu/bytecode/Member;
    .local v22, "enclosing":Lgnu/bytecode/Member;
    iget v6, v12, Lgnu/expr/BeginExp;->length:I

    if-nez v6, :cond_b

    .line 508
    const/4 v5, 0x0

    goto :goto_4

    .line 510
    :cond_b
    iget-object v6, v12, Lgnu/expr/BeginExp;->exps:[Lgnu/expr/Expression;

    const/16 v19, 0x0

    aget-object v6, v6, v19

    move-object v5, v6

    .line 511
    .end local v12    # "bbody":Lgnu/expr/BeginExp;
    :goto_4
    move-object/from16 v6, v22

    goto :goto_3

    .line 514
    .end local v22    # "enclosing":Lgnu/bytecode/Member;
    .restart local v6    # "enclosing":Lgnu/bytecode/Member;
    :cond_c
    move-object/from16 v22, v6

    .end local v6    # "enclosing":Lgnu/bytecode/Member;
    .restart local v22    # "enclosing":Lgnu/bytecode/Member;
    const/4 v6, 0x0

    .line 516
    .local v6, "calledInit":Lgnu/bytecode/ClassType;
    instance-of v12, v5, Lgnu/expr/ApplyExp;

    if-eqz v12, :cond_10

    move-object v12, v5

    check-cast v12, Lgnu/expr/ApplyExp;

    iget-object v12, v12, Lgnu/expr/ApplyExp;->func:Lgnu/expr/Expression;

    move-object/from16 v19, v12

    .local v19, "exp":Lgnu/expr/Expression;
    instance-of v12, v12, Lgnu/expr/QuoteExp;

    if-eqz v12, :cond_f

    move-object/from16 v12, v19

    check-cast v12, Lgnu/expr/QuoteExp;

    invoke-virtual {v12}, Lgnu/expr/QuoteExp;->getValue()Ljava/lang/Object;

    move-result-object v12

    move-object/from16 v20, v12

    .local v20, "value":Ljava/lang/Object;
    instance-of v12, v12, Lgnu/expr/PrimProcedure;

    if-eqz v12, :cond_e

    .line 520
    move-object/from16 v12, v20

    check-cast v12, Lgnu/expr/PrimProcedure;

    .line 521
    .local v12, "pproc":Lgnu/expr/PrimProcedure;
    invoke-virtual {v12}, Lgnu/expr/PrimProcedure;->isSpecial()Z

    move-result v23

    if-eqz v23, :cond_d

    move-object/from16 v23, v6

    .end local v6    # "calledInit":Lgnu/bytecode/ClassType;
    .local v23, "calledInit":Lgnu/bytecode/ClassType;
    const-string v6, "<init>"

    move-object/from16 v24, v7

    .end local v7    # "filename":Ljava/lang/String;
    .local v24, "filename":Ljava/lang/String;
    iget-object v7, v12, Lgnu/expr/PrimProcedure;->method:Lgnu/bytecode/Method;

    invoke-virtual {v7}, Lgnu/bytecode/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11

    .line 523
    iget-object v6, v12, Lgnu/expr/PrimProcedure;->method:Lgnu/bytecode/Method;

    invoke-virtual {v6}, Lgnu/bytecode/Method;->getDeclaringClass()Lgnu/bytecode/ClassType;

    move-result-object v6

    .end local v23    # "calledInit":Lgnu/bytecode/ClassType;
    .restart local v6    # "calledInit":Lgnu/bytecode/ClassType;
    goto :goto_6

    .line 521
    .end local v24    # "filename":Ljava/lang/String;
    .restart local v7    # "filename":Ljava/lang/String;
    :cond_d
    move-object/from16 v23, v6

    move-object/from16 v24, v7

    .end local v6    # "calledInit":Lgnu/bytecode/ClassType;
    .end local v7    # "filename":Ljava/lang/String;
    .restart local v23    # "calledInit":Lgnu/bytecode/ClassType;
    .restart local v24    # "filename":Ljava/lang/String;
    goto :goto_5

    .line 516
    .end local v12    # "pproc":Lgnu/expr/PrimProcedure;
    .end local v23    # "calledInit":Lgnu/bytecode/ClassType;
    .end local v24    # "filename":Ljava/lang/String;
    .restart local v6    # "calledInit":Lgnu/bytecode/ClassType;
    .restart local v7    # "filename":Ljava/lang/String;
    :cond_e
    move-object/from16 v23, v6

    move-object/from16 v24, v7

    .end local v6    # "calledInit":Lgnu/bytecode/ClassType;
    .end local v7    # "filename":Ljava/lang/String;
    .restart local v23    # "calledInit":Lgnu/bytecode/ClassType;
    .restart local v24    # "filename":Ljava/lang/String;
    goto :goto_5

    .end local v20    # "value":Ljava/lang/Object;
    .end local v23    # "calledInit":Lgnu/bytecode/ClassType;
    .end local v24    # "filename":Ljava/lang/String;
    .restart local v6    # "calledInit":Lgnu/bytecode/ClassType;
    .restart local v7    # "filename":Ljava/lang/String;
    :cond_f
    move-object/from16 v23, v6

    move-object/from16 v24, v7

    .end local v6    # "calledInit":Lgnu/bytecode/ClassType;
    .end local v7    # "filename":Ljava/lang/String;
    .restart local v23    # "calledInit":Lgnu/bytecode/ClassType;
    .restart local v24    # "filename":Ljava/lang/String;
    goto :goto_5

    .end local v19    # "exp":Lgnu/expr/Expression;
    .end local v23    # "calledInit":Lgnu/bytecode/ClassType;
    .end local v24    # "filename":Ljava/lang/String;
    .restart local v6    # "calledInit":Lgnu/bytecode/ClassType;
    .restart local v7    # "filename":Ljava/lang/String;
    :cond_10
    move-object/from16 v23, v6

    move-object/from16 v24, v7

    .line 525
    .end local v6    # "calledInit":Lgnu/bytecode/ClassType;
    .end local v7    # "filename":Ljava/lang/String;
    .restart local v23    # "calledInit":Lgnu/bytecode/ClassType;
    .restart local v24    # "filename":Ljava/lang/String;
    :cond_11
    :goto_5
    move-object/from16 v6, v23

    .end local v23    # "calledInit":Lgnu/bytecode/ClassType;
    .restart local v6    # "calledInit":Lgnu/bytecode/ClassType;
    :goto_6
    iget-object v7, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-virtual {v7}, Lgnu/bytecode/ClassType;->getSuperclass()Lgnu/bytecode/ClassType;

    move-result-object v7

    .line 526
    .local v7, "superClass":Lgnu/bytecode/ClassType;
    if-eqz v6, :cond_13

    .line 528
    sget-object v12, Lgnu/expr/Target;->Ignore:Lgnu/expr/Target;

    invoke-virtual {v5, v2, v12}, Lgnu/expr/Expression;->compileWithPosition(Lgnu/expr/Compilation;Lgnu/expr/Target;)V

    .line 529
    iget-object v12, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    if-eq v6, v12, :cond_12

    if-eq v6, v7, :cond_12

    .line 530
    const-string v12, "call to <init> for not this or super class"

    move-object/from16 v20, v5

    const/16 v5, 0x65

    .end local v5    # "bodyFirst":Lgnu/expr/Expression;
    .local v20, "bodyFirst":Lgnu/expr/Expression;
    invoke-virtual {v2, v5, v12}, Lgnu/expr/Compilation;->error(CLjava/lang/String;)V

    goto :goto_7

    .line 529
    .end local v20    # "bodyFirst":Lgnu/expr/Expression;
    .restart local v5    # "bodyFirst":Lgnu/expr/Expression;
    :cond_12
    move-object/from16 v20, v5

    .end local v5    # "bodyFirst":Lgnu/expr/Expression;
    .restart local v20    # "bodyFirst":Lgnu/expr/Expression;
    goto :goto_7

    .line 532
    .end local v20    # "bodyFirst":Lgnu/expr/Expression;
    .restart local v5    # "bodyFirst":Lgnu/expr/Expression;
    :cond_13
    move-object/from16 v20, v5

    .end local v5    # "bodyFirst":Lgnu/expr/Expression;
    .restart local v20    # "bodyFirst":Lgnu/expr/Expression;
    if-eqz v7, :cond_14

    .line 536
    invoke-static {v7, v2, v1}, Lgnu/expr/ClassExp;->invokeDefaultSuperConstructor(Lgnu/bytecode/ClassType;Lgnu/expr/Compilation;Lgnu/expr/LambdaExp;)V

    .line 538
    :cond_14
    :goto_7
    invoke-virtual {v9, v2}, Lgnu/expr/LambdaExp;->enterFunction(Lgnu/expr/Compilation;)V

    .line 539
    iget-object v5, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    if-eq v6, v5, :cond_15

    .line 540
    invoke-virtual/range {p0 .. p1}, Lgnu/expr/ClassExp;->getCompiledClassType(Lgnu/expr/Compilation;)Lgnu/bytecode/ClassType;

    move-result-object v5

    new-instance v12, Ljava/util/Vector;

    move-object/from16 v16, v7

    .end local v7    # "superClass":Lgnu/bytecode/ClassType;
    .local v16, "superClass":Lgnu/bytecode/ClassType;
    const/16 v7, 0xa

    invoke-direct {v12, v7}, Ljava/util/Vector;-><init>(I)V

    invoke-virtual {v2, v5, v12}, Lgnu/expr/Compilation;->callInitMethods(Lgnu/bytecode/ClassType;Ljava/util/Vector;)V

    goto :goto_8

    .line 539
    .end local v16    # "superClass":Lgnu/bytecode/ClassType;
    .restart local v7    # "superClass":Lgnu/bytecode/ClassType;
    :cond_15
    move-object/from16 v16, v7

    .line 542
    .end local v7    # "superClass":Lgnu/bytecode/ClassType;
    .restart local v16    # "superClass":Lgnu/bytecode/ClassType;
    :goto_8
    if-eqz v6, :cond_16

    .line 544
    iget-object v5, v9, Lgnu/expr/LambdaExp;->body:Lgnu/expr/Expression;

    invoke-static {v5, v2}, Lgnu/expr/Expression;->compileButFirst(Lgnu/expr/Expression;Lgnu/expr/Compilation;)V

    goto :goto_9

    .line 546
    :cond_16
    invoke-virtual {v9, v2}, Lgnu/expr/LambdaExp;->compileBody(Lgnu/expr/Compilation;)V

    .line 547
    .end local v6    # "calledInit":Lgnu/bytecode/ClassType;
    .end local v16    # "superClass":Lgnu/bytecode/ClassType;
    .end local v20    # "bodyFirst":Lgnu/expr/Expression;
    :goto_9
    goto :goto_a

    .line 550
    .end local v11    # "code":Lgnu/bytecode/CodeAttr;
    .end local v21    # "outer":Lgnu/expr/LambdaExp;
    .end local v22    # "enclosing":Lgnu/bytecode/Member;
    .end local v24    # "filename":Ljava/lang/String;
    .local v5, "outer":Lgnu/expr/LambdaExp;
    .local v6, "enclosing":Lgnu/bytecode/Member;
    .local v7, "filename":Ljava/lang/String;
    :cond_17
    move-object/from16 v21, v5

    move-object/from16 v22, v6

    move-object/from16 v24, v7

    .end local v5    # "outer":Lgnu/expr/LambdaExp;
    .end local v6    # "enclosing":Lgnu/bytecode/Member;
    .end local v7    # "filename":Ljava/lang/String;
    .restart local v21    # "outer":Lgnu/expr/LambdaExp;
    .restart local v22    # "enclosing":Lgnu/bytecode/Member;
    .restart local v24    # "filename":Ljava/lang/String;
    invoke-virtual {v9, v2}, Lgnu/expr/LambdaExp;->enterFunction(Lgnu/expr/Compilation;)V

    .line 551
    invoke-virtual {v9, v2}, Lgnu/expr/LambdaExp;->compileBody(Lgnu/expr/Compilation;)V

    .line 553
    :goto_a
    invoke-virtual {v9, v2}, Lgnu/expr/LambdaExp;->compileEnd(Lgnu/expr/Compilation;)V

    .line 554
    invoke-virtual {v9, v2}, Lgnu/expr/LambdaExp;->generateApplyMethods(Lgnu/expr/Compilation;)V

    .line 555
    iput-object v13, v2, Lgnu/expr/Compilation;->method:Lgnu/bytecode/Method;

    .line 556
    iput-object v0, v2, Lgnu/expr/Compilation;->curClass:Lgnu/bytecode/ClassType;

    .line 557
    iput-object v14, v2, Lgnu/expr/Compilation;->curLambda:Lgnu/expr/LambdaExp;

    .line 558
    move/from16 v5, v17

    move/from16 v6, v18

    .end local v17    # "saveLine":I
    .end local v18    # "saveColumn":I
    .local v5, "saveLine":I
    .local v6, "saveColumn":I
    invoke-virtual {v2, v15, v5, v6}, Lgnu/expr/Compilation;->setLine(Ljava/lang/String;II)V

    .line 470
    .end local v5    # "saveLine":I
    .end local v6    # "saveColumn":I
    .end local v10    # "childDecl":Lgnu/expr/Declaration;
    .end local v13    # "save_method":Lgnu/bytecode/Method;
    .end local v14    # "save_lambda":Lgnu/expr/LambdaExp;
    .end local v15    # "saveFilename":Ljava/lang/String;
    :goto_b
    iget-object v5, v9, Lgnu/expr/LambdaExp;->nextSibling:Lgnu/expr/LambdaExp;

    move-object v9, v5

    move-object/from16 v5, v21

    move-object/from16 v6, v22

    move-object/from16 v7, v24

    goto/16 :goto_1

    .line 469
    .end local v21    # "outer":Lgnu/expr/LambdaExp;
    .end local v22    # "enclosing":Lgnu/bytecode/Member;
    .end local v24    # "filename":Ljava/lang/String;
    .local v5, "outer":Lgnu/expr/LambdaExp;
    .local v6, "enclosing":Lgnu/bytecode/Member;
    .restart local v7    # "filename":Ljava/lang/String;
    :cond_18
    move-object/from16 v21, v5

    move-object/from16 v22, v6

    move-object/from16 v24, v7

    .line 560
    .end local v5    # "outer":Lgnu/expr/LambdaExp;
    .end local v6    # "enclosing":Lgnu/bytecode/Member;
    .end local v7    # "filename":Ljava/lang/String;
    .end local v9    # "child":Lgnu/expr/LambdaExp;
    .restart local v21    # "outer":Lgnu/expr/LambdaExp;
    .restart local v22    # "enclosing":Lgnu/bytecode/Member;
    .restart local v24    # "filename":Ljava/lang/String;
    iget-boolean v5, v1, Lgnu/expr/ClassExp;->explicitInit:Z

    if-nez v5, :cond_19

    iget-object v5, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-virtual {v5}, Lgnu/bytecode/ClassType;->isInterface()Z

    move-result v5

    if-nez v5, :cond_19

    .line 561
    iget-object v5, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-virtual {v2, v5, v1}, Lgnu/expr/Compilation;->generateConstructor(Lgnu/bytecode/ClassType;Lgnu/expr/LambdaExp;)V

    goto :goto_c

    .line 562
    :cond_19
    iget-object v5, v1, Lgnu/expr/ClassExp;->initChain:Lgnu/expr/Initializer;

    if-eqz v5, :cond_1a

    .line 563
    iget-object v5, v1, Lgnu/expr/ClassExp;->initChain:Lgnu/expr/Initializer;

    const-string v6, "unimplemented: explicit constructor cannot initialize "

    invoke-virtual {v5, v6, v2}, Lgnu/expr/Initializer;->reportError(Ljava/lang/String;Lgnu/expr/Compilation;)V

    .line 567
    :cond_1a
    :goto_c
    invoke-virtual/range {p0 .. p0}, Lgnu/expr/ClassExp;->isAbstract()Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 569
    const/4 v5, 0x0

    .line 570
    .local v5, "methods":[Lgnu/bytecode/Method;
    const/4 v6, 0x0

    .local v6, "nmethods":I
    goto :goto_d

    .line 574
    .end local v5    # "methods":[Lgnu/bytecode/Method;
    .end local v6    # "nmethods":I
    :cond_1b
    iget-object v5, v1, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    invoke-virtual {v5}, Lgnu/bytecode/ClassType;->getAbstractMethods()[Lgnu/bytecode/Method;

    move-result-object v5

    .line 575
    .restart local v5    # "methods":[Lgnu/bytecode/Method;
    array-length v6, v5

    .line 577
    .restart local v6    # "nmethods":I
    :goto_d
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_e
    if-ge v7, v6, :cond_27

    .line 579
    aget-object v9, v5, v7

    .line 580
    .local v9, "meth":Lgnu/bytecode/Method;
    invoke-virtual {v9}, Lgnu/bytecode/Method;->getName()Ljava/lang/String;

    move-result-object v10

    .line 581
    .local v10, "mname":Ljava/lang/String;
    invoke-virtual {v9}, Lgnu/bytecode/Method;->getParameterTypes()[Lgnu/bytecode/Type;

    move-result-object v11

    .line 582
    .local v11, "ptypes":[Lgnu/bytecode/Type;
    invoke-virtual {v9}, Lgnu/bytecode/Method;->getReturnType()Lgnu/bytecode/Type;

    move-result-object v12

    .line 584
    .local v12, "rtype":Lgnu/bytecode/Type;
    iget-object v13, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-virtual {v13, v10, v11}, Lgnu/bytecode/ClassType;->getMethod(Ljava/lang/String;[Lgnu/bytecode/Type;)Lgnu/bytecode/Method;

    move-result-object v13

    .line 585
    .local v13, "mimpl":Lgnu/bytecode/Method;
    if-eqz v13, :cond_1c

    invoke-virtual {v13}, Lgnu/bytecode/Method;->isAbstract()Z

    move-result v14

    if-nez v14, :cond_1c

    .line 586
    move-object/from16 v18, v5

    move/from16 v25, v6

    const/16 v14, 0x65

    goto/16 :goto_16

    .line 589
    :cond_1c
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v14

    const/4 v15, 0x3

    if-le v14, v15, :cond_23

    const/4 v14, 0x2

    invoke-virtual {v10, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    const/16 v15, 0x74

    if-ne v14, v15, :cond_23

    const/4 v14, 0x1

    invoke-virtual {v10, v14}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v14, 0x65

    if-ne v15, v14, :cond_23

    const/4 v14, 0x0

    invoke-virtual {v10, v14}, Ljava/lang/String;->charAt(I)C

    move-result v15

    move v14, v15

    move-object/from16 v18, v5

    .end local v5    # "methods":[Lgnu/bytecode/Method;
    .local v14, "ch":C
    .local v18, "methods":[Lgnu/bytecode/Method;
    const/16 v5, 0x67

    if-eq v15, v5, :cond_1e

    const/16 v15, 0x73

    if-ne v14, v15, :cond_1d

    goto :goto_f

    :cond_1d
    move/from16 v25, v6

    move-object/from16 v17, v13

    goto/16 :goto_13

    :cond_1e
    const/16 v15, 0x73

    .line 595
    :goto_f
    if-ne v14, v15, :cond_1f

    invoke-virtual {v12}, Lgnu/bytecode/Type;->isVoid()Z

    move-result v15

    if-eqz v15, :cond_1f

    array-length v15, v11

    const/4 v5, 0x1

    if-ne v15, v5, :cond_1f

    .line 596
    const/4 v5, 0x0

    aget-object v15, v11, v5

    move-object v5, v15

    .local v5, "ftype":Lgnu/bytecode/Type;
    goto :goto_10

    .line 597
    .end local v5    # "ftype":Lgnu/bytecode/Type;
    :cond_1f
    const/16 v5, 0x67

    if-ne v14, v5, :cond_22

    array-length v5, v11

    if-nez v5, :cond_22

    .line 598
    move-object v5, v12

    .line 601
    .restart local v5    # "ftype":Lgnu/bytecode/Type;
    :goto_10
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v25, v6

    const/4 v6, 0x3

    .end local v6    # "nmethods":I
    .local v25, "nmethods":I
    invoke-virtual {v10, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v6

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v15, 0x4

    invoke-virtual {v10, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 603
    .local v6, "fname":Ljava/lang/String;
    iget-object v15, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-virtual {v15, v6}, Lgnu/bytecode/ClassType;->getField(Ljava/lang/String;)Lgnu/bytecode/Field;

    move-result-object v15

    .line 604
    .local v15, "fld":Lgnu/bytecode/Field;
    if-nez v15, :cond_20

    .line 605
    move-object/from16 v17, v13

    .end local v13    # "mimpl":Lgnu/bytecode/Method;
    .local v17, "mimpl":Lgnu/bytecode/Method;
    iget-object v13, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    move-object/from16 v26, v15

    const/4 v15, 0x1

    .end local v15    # "fld":Lgnu/bytecode/Field;
    .local v26, "fld":Lgnu/bytecode/Field;
    invoke-virtual {v13, v6, v5, v15}, Lgnu/bytecode/ClassType;->addField(Ljava/lang/String;Lgnu/bytecode/Type;I)Lgnu/bytecode/Field;

    move-result-object v13

    move-object v15, v13

    .end local v26    # "fld":Lgnu/bytecode/Field;
    .restart local v15    # "fld":Lgnu/bytecode/Field;
    goto :goto_11

    .line 604
    .end local v17    # "mimpl":Lgnu/bytecode/Method;
    .restart local v13    # "mimpl":Lgnu/bytecode/Method;
    :cond_20
    move-object/from16 v17, v13

    move-object/from16 v26, v15

    .line 606
    .end local v13    # "mimpl":Lgnu/bytecode/Method;
    .restart local v17    # "mimpl":Lgnu/bytecode/Method;
    :goto_11
    iget-object v13, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    move-object/from16 v26, v5

    const/4 v5, 0x1

    .end local v5    # "ftype":Lgnu/bytecode/Type;
    .local v26, "ftype":Lgnu/bytecode/Type;
    invoke-virtual {v13, v10, v5, v11, v12}, Lgnu/bytecode/ClassType;->addMethod(Ljava/lang/String;I[Lgnu/bytecode/Type;Lgnu/bytecode/Type;)Lgnu/bytecode/Method;

    move-result-object v13

    move-object v5, v13

    .line 608
    .local v5, "impl":Lgnu/bytecode/Method;
    invoke-virtual {v5}, Lgnu/bytecode/Method;->startCode()Lgnu/bytecode/CodeAttr;

    move-result-object v13

    .line 609
    .local v13, "code":Lgnu/bytecode/CodeAttr;
    invoke-virtual {v13}, Lgnu/bytecode/CodeAttr;->emitPushThis()V

    .line 610
    move-object/from16 v27, v5

    const/16 v5, 0x67

    .end local v5    # "impl":Lgnu/bytecode/Method;
    .local v27, "impl":Lgnu/bytecode/Method;
    if-ne v14, v5, :cond_21

    .line 612
    invoke-virtual {v13, v15}, Lgnu/bytecode/CodeAttr;->emitGetField(Lgnu/bytecode/Field;)V

    move-object/from16 v23, v6

    goto :goto_12

    .line 616
    :cond_21
    move-object/from16 v23, v6

    const/4 v5, 0x1

    .end local v6    # "fname":Ljava/lang/String;
    .local v23, "fname":Ljava/lang/String;
    invoke-virtual {v13, v5}, Lgnu/bytecode/CodeAttr;->getArg(I)Lgnu/bytecode/Variable;

    move-result-object v6

    invoke-virtual {v13, v6}, Lgnu/bytecode/CodeAttr;->emitLoad(Lgnu/bytecode/Variable;)V

    .line 617
    invoke-virtual {v13, v15}, Lgnu/bytecode/CodeAttr;->emitPutField(Lgnu/bytecode/Field;)V

    .line 619
    :goto_12
    invoke-virtual {v13}, Lgnu/bytecode/CodeAttr;->emitReturn()V

    .line 620
    .end local v15    # "fld":Lgnu/bytecode/Field;
    .end local v23    # "fname":Ljava/lang/String;
    .end local v26    # "ftype":Lgnu/bytecode/Type;
    .end local v27    # "impl":Lgnu/bytecode/Method;
    const/16 v14, 0x65

    goto/16 :goto_16

    .line 597
    .end local v17    # "mimpl":Lgnu/bytecode/Method;
    .end local v25    # "nmethods":I
    .local v6, "nmethods":I
    .local v13, "mimpl":Lgnu/bytecode/Method;
    :cond_22
    move/from16 v25, v6

    move-object/from16 v17, v13

    .end local v6    # "nmethods":I
    .end local v13    # "mimpl":Lgnu/bytecode/Method;
    .restart local v17    # "mimpl":Lgnu/bytecode/Method;
    .restart local v25    # "nmethods":I
    const/16 v14, 0x65

    goto/16 :goto_16

    .line 589
    .end local v14    # "ch":C
    .end local v17    # "mimpl":Lgnu/bytecode/Method;
    .end local v18    # "methods":[Lgnu/bytecode/Method;
    .end local v25    # "nmethods":I
    .local v5, "methods":[Lgnu/bytecode/Method;
    .restart local v6    # "nmethods":I
    .restart local v13    # "mimpl":Lgnu/bytecode/Method;
    :cond_23
    move-object/from16 v18, v5

    move/from16 v25, v6

    move-object/from16 v17, v13

    .line 623
    .end local v5    # "methods":[Lgnu/bytecode/Method;
    .end local v6    # "nmethods":I
    .end local v13    # "mimpl":Lgnu/bytecode/Method;
    .restart local v17    # "mimpl":Lgnu/bytecode/Method;
    .restart local v18    # "methods":[Lgnu/bytecode/Method;
    .restart local v25    # "nmethods":I
    :goto_13
    new-instance v5, Ljava/util/Vector;

    invoke-direct {v5}, Ljava/util/Vector;-><init>()V

    .line 624
    .local v5, "vec":Ljava/util/Vector;
    iget-object v6, v1, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    invoke-static {v6, v10, v11, v5}, Lgnu/expr/ClassExp;->getImplMethods(Lgnu/bytecode/ClassType;Ljava/lang/String;[Lgnu/bytecode/Type;Ljava/util/Vector;)V

    .line 625
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v6

    const/4 v13, 0x1

    if-eq v6, v13, :cond_25

    .line 628
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v6

    if-nez v6, :cond_24

    const-string v6, "missing implementation for "

    goto :goto_14

    :cond_24
    const-string v6, "ambiguous implementation for "

    .line 631
    .local v6, "msg":Ljava/lang/String;
    :goto_14
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/16 v14, 0x65

    invoke-virtual {v2, v14, v13}, Lgnu/expr/Compilation;->error(CLjava/lang/String;)V

    .line 632
    .end local v6    # "msg":Ljava/lang/String;
    goto :goto_16

    .line 635
    :cond_25
    const/16 v14, 0x65

    iget-object v6, v1, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    const/4 v13, 0x1

    invoke-virtual {v6, v10, v13, v11, v12}, Lgnu/bytecode/ClassType;->addMethod(Ljava/lang/String;I[Lgnu/bytecode/Type;Lgnu/bytecode/Type;)Lgnu/bytecode/Method;

    move-result-object v6

    .line 637
    .local v6, "impl":Lgnu/bytecode/Method;
    invoke-virtual {v6}, Lgnu/bytecode/Method;->startCode()Lgnu/bytecode/CodeAttr;

    move-result-object v15

    .line 638
    .local v15, "code":Lgnu/bytecode/CodeAttr;
    invoke-virtual {v15}, Lgnu/bytecode/CodeAttr;->getCurrentScope()Lgnu/bytecode/Scope;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lgnu/bytecode/Scope;->firstVar()Lgnu/bytecode/Variable;

    move-result-object v16

    move-object/from16 v13, v16

    .line 639
    .local v13, "var":Lgnu/bytecode/Variable;
    :goto_15
    if-eqz v13, :cond_26

    .line 640
    invoke-virtual {v15, v13}, Lgnu/bytecode/CodeAttr;->emitLoad(Lgnu/bytecode/Variable;)V

    .line 639
    invoke-virtual {v13}, Lgnu/bytecode/Variable;->nextVar()Lgnu/bytecode/Variable;

    move-result-object v16

    move-object/from16 v13, v16

    goto :goto_15

    .line 641
    .end local v13    # "var":Lgnu/bytecode/Variable;
    :cond_26
    const/4 v13, 0x0

    invoke-virtual {v5, v13}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lgnu/bytecode/Method;

    move-object/from16 v19, v16

    .line 642
    .local v19, "imethod":Lgnu/bytecode/Method;
    move-object/from16 v13, v19

    .end local v19    # "imethod":Lgnu/bytecode/Method;
    .local v13, "imethod":Lgnu/bytecode/Method;
    invoke-virtual {v15, v13}, Lgnu/bytecode/CodeAttr;->emitInvokeStatic(Lgnu/bytecode/Method;)V

    .line 643
    invoke-virtual {v15}, Lgnu/bytecode/CodeAttr;->emitReturn()V

    .line 577
    .end local v5    # "vec":Ljava/util/Vector;
    .end local v6    # "impl":Lgnu/bytecode/Method;
    .end local v9    # "meth":Lgnu/bytecode/Method;
    .end local v10    # "mname":Ljava/lang/String;
    .end local v11    # "ptypes":[Lgnu/bytecode/Type;
    .end local v12    # "rtype":Lgnu/bytecode/Type;
    .end local v13    # "imethod":Lgnu/bytecode/Method;
    .end local v15    # "code":Lgnu/bytecode/CodeAttr;
    .end local v17    # "mimpl":Lgnu/bytecode/Method;
    :goto_16
    add-int/lit8 v7, v7, 0x1

    move-object/from16 v5, v18

    move/from16 v6, v25

    goto/16 :goto_e

    .end local v18    # "methods":[Lgnu/bytecode/Method;
    .end local v25    # "nmethods":I
    .local v5, "methods":[Lgnu/bytecode/Method;
    .local v6, "nmethods":I
    :cond_27
    move-object/from16 v18, v5

    move/from16 v25, v6

    .line 648
    .end local v5    # "methods":[Lgnu/bytecode/Method;
    .end local v6    # "nmethods":I
    .end local v7    # "i":I
    .restart local v18    # "methods":[Lgnu/bytecode/Method;
    .restart local v25    # "nmethods":I
    invoke-virtual/range {p0 .. p1}, Lgnu/expr/ClassExp;->generateApplyMethods(Lgnu/expr/Compilation;)V

    .line 649
    iput-object v8, v2, Lgnu/expr/Compilation;->curLambda:Lgnu/expr/LambdaExp;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 651
    nop

    .line 655
    iput-object v3, v2, Lgnu/expr/Compilation;->curClass:Lgnu/bytecode/ClassType;

    .line 656
    iput-object v4, v2, Lgnu/expr/Compilation;->method:Lgnu/bytecode/Method;

    return-object v0

    .line 655
    .end local v0    # "new_class":Lgnu/bytecode/ClassType;
    .end local v8    # "saveLambda":Lgnu/expr/LambdaExp;
    .end local v18    # "methods":[Lgnu/bytecode/Method;
    .end local v21    # "outer":Lgnu/expr/LambdaExp;
    .end local v22    # "enclosing":Lgnu/bytecode/Member;
    .end local v24    # "filename":Ljava/lang/String;
    .end local v25    # "nmethods":I
    :catchall_0
    move-exception v0

    iput-object v3, v2, Lgnu/expr/Compilation;->curClass:Lgnu/bytecode/ClassType;

    .line 656
    iput-object v4, v2, Lgnu/expr/Compilation;->method:Lgnu/bytecode/Method;

    goto :goto_18

    :goto_17
    throw v0

    :goto_18
    goto :goto_17
.end method

.method public compilePushClass(Lgnu/expr/Compilation;Lgnu/expr/Target;)V
    .locals 9
    .param p1, "comp"    # Lgnu/expr/Compilation;
    .param p2, "target"    # Lgnu/expr/Target;

    .line 86
    iget-object v0, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    .line 88
    .local v0, "new_class":Lgnu/bytecode/ClassType;
    invoke-virtual {p1}, Lgnu/expr/Compilation;->getCode()Lgnu/bytecode/CodeAttr;

    move-result-object v1

    .line 89
    .local v1, "code":Lgnu/bytecode/CodeAttr;
    invoke-virtual {p1, v0}, Lgnu/expr/Compilation;->loadClassRef(Lgnu/bytecode/ObjectType;)V

    .line 92
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->getNeedsClosureEnv()Z

    move-result v2

    .line 93
    .local v2, "needsLink":Z
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->isSimple()Z

    move-result v3

    if-eqz v3, :cond_0

    if-nez v2, :cond_0

    .line 94
    return-void

    .line 95
    :cond_0
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->isMakingClassPair()Z

    move-result v3

    if-nez v3, :cond_2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 106
    :cond_1
    const-string v3, "gnu.bytecode.Type"

    invoke-static {v3}, Lgnu/bytecode/ClassType;->make(Ljava/lang/String;)Lgnu/bytecode/ClassType;

    move-result-object v3

    .line 107
    .local v3, "typeType":Lgnu/bytecode/ClassType;
    const/4 v4, 0x1

    .local v4, "nargs":I
    goto :goto_2

    .line 97
    .end local v3    # "typeType":Lgnu/bytecode/ClassType;
    .end local v4    # "nargs":I
    :cond_2
    :goto_0
    iget-object v3, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    if-ne v0, v3, :cond_3

    .line 98
    invoke-virtual {v1, v3}, Lgnu/bytecode/CodeAttr;->emitDup(Lgnu/bytecode/Type;)V

    goto :goto_1

    .line 100
    :cond_3
    invoke-virtual {p1, v3}, Lgnu/expr/Compilation;->loadClassRef(Lgnu/bytecode/ObjectType;)V

    .line 101
    :goto_1
    const-string v3, "gnu.expr.PairClassType"

    invoke-static {v3}, Lgnu/bytecode/ClassType;->make(Ljava/lang/String;)Lgnu/bytecode/ClassType;

    move-result-object v3

    .line 102
    .restart local v3    # "typeType":Lgnu/bytecode/ClassType;
    if-eqz v2, :cond_4

    const/4 v4, 0x3

    goto :goto_2

    :cond_4
    const/4 v4, 0x2

    .line 109
    .restart local v4    # "nargs":I
    :goto_2
    new-array v5, v4, [Lgnu/bytecode/Type;

    .line 110
    .local v5, "argsClass":[Lgnu/bytecode/Type;
    if-eqz v2, :cond_5

    .line 112
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->getOwningLambda()Lgnu/expr/LambdaExp;

    move-result-object v6

    invoke-virtual {v6, p1}, Lgnu/expr/LambdaExp;->loadHeapFrame(Lgnu/expr/Compilation;)V

    .line 113
    add-int/lit8 v4, v4, -0x1

    sget-object v6, Lgnu/bytecode/Type;->pointer_type:Lgnu/bytecode/ClassType;

    aput-object v6, v5, v4

    .line 115
    :cond_5
    const-string v6, "java.lang.Class"

    invoke-static {v6}, Lgnu/bytecode/ClassType;->make(Ljava/lang/String;)Lgnu/bytecode/ClassType;

    move-result-object v6

    .line 116
    .local v6, "typeClass":Lgnu/bytecode/ClassType;
    :goto_3
    add-int/lit8 v4, v4, -0x1

    if-ltz v4, :cond_6

    aput-object v6, v5, v4

    goto :goto_3

    .line 117
    :cond_6
    const-string v7, "make"

    const/16 v8, 0x9

    invoke-virtual {v3, v7, v5, v3, v8}, Lgnu/bytecode/ClassType;->addMethod(Ljava/lang/String;[Lgnu/bytecode/Type;Lgnu/bytecode/Type;I)Lgnu/bytecode/Method;

    move-result-object v7

    .line 120
    .local v7, "makeMethod":Lgnu/bytecode/Method;
    invoke-virtual {v1, v7}, Lgnu/bytecode/CodeAttr;->emitInvokeStatic(Lgnu/bytecode/Method;)V

    .line 122
    invoke-virtual {p2, p1, v3}, Lgnu/expr/Target;->compileFromStack(Lgnu/expr/Compilation;Lgnu/bytecode/Type;)V

    .line 123
    return-void
.end method

.method public compileSetField(Lgnu/expr/Compilation;)Lgnu/bytecode/Field;
    .locals 1
    .param p1, "comp"    # Lgnu/expr/Compilation;

    .line 788
    new-instance v0, Lgnu/expr/ClassInitializer;

    invoke-direct {v0, p0, p1}, Lgnu/expr/ClassInitializer;-><init>(Lgnu/expr/ClassExp;Lgnu/expr/Compilation;)V

    iget-object v0, v0, Lgnu/expr/ClassInitializer;->field:Lgnu/bytecode/Field;

    return-object v0
.end method

.method public declareParts(Lgnu/expr/Compilation;)V
    .locals 9
    .param p1, "comp"    # Lgnu/expr/Compilation;

    .line 280
    iget-boolean v0, p0, Lgnu/expr/ClassExp;->partsDeclared:Z

    if-eqz v0, :cond_0

    .line 281
    return-void

    .line 282
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lgnu/expr/ClassExp;->partsDeclared:Z

    .line 283
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    .line 285
    .local v1, "seenFields":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Lgnu/expr/Declaration;>;"
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->firstDecl()Lgnu/expr/Declaration;

    move-result-object v2

    .line 286
    .local v2, "decl":Lgnu/expr/Declaration;
    :goto_0
    const-wide/16 v3, 0x800

    if-eqz v2, :cond_5

    .line 289
    invoke-virtual {v2}, Lgnu/expr/Declaration;->getCanRead()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 291
    invoke-virtual {v2, v0}, Lgnu/expr/Declaration;->getAccessFlags(S)S

    move-result v5

    .line 292
    .local v5, "flags":I
    invoke-virtual {v2, v3, v4}, Lgnu/expr/Declaration;->getFlag(J)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 293
    or-int/lit8 v5, v5, 0x8

    .line 294
    :cond_1
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->isMakingClassPair()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_2

    .line 296
    or-int/lit16 v3, v5, 0x400

    .line 297
    .end local v5    # "flags":I
    .local v3, "flags":I
    invoke-virtual {v2}, Lgnu/expr/Declaration;->getType()Lgnu/bytecode/Type;

    move-result-object v5

    invoke-virtual {v5}, Lgnu/bytecode/Type;->getImplementationType()Lgnu/bytecode/Type;

    move-result-object v5

    .line 298
    .local v5, "ftype":Lgnu/bytecode/Type;
    iget-object v6, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    const-string v7, "get"

    invoke-virtual {v2}, Lgnu/expr/Declaration;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lgnu/expr/ClassExp;->slotToMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    sget-object v8, Lgnu/bytecode/Type;->typeArray0:[Lgnu/bytecode/Type;

    invoke-virtual {v6, v7, v3, v8, v5}, Lgnu/bytecode/ClassType;->addMethod(Ljava/lang/String;I[Lgnu/bytecode/Type;Lgnu/bytecode/Type;)Lgnu/bytecode/Method;

    .line 300
    new-array v6, v0, [Lgnu/bytecode/Type;

    aput-object v5, v6, v4

    move-object v4, v6

    .line 301
    .local v4, "stypes":[Lgnu/bytecode/Type;
    iget-object v6, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    const-string v7, "set"

    invoke-virtual {v2}, Lgnu/expr/Declaration;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lgnu/expr/ClassExp;->slotToMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    sget-object v8, Lgnu/bytecode/Type;->voidType:Lgnu/bytecode/PrimType;

    invoke-virtual {v6, v7, v3, v4, v8}, Lgnu/bytecode/ClassType;->addMethod(Ljava/lang/String;I[Lgnu/bytecode/Type;Lgnu/bytecode/Type;)Lgnu/bytecode/Method;

    .line 303
    .end local v4    # "stypes":[Lgnu/bytecode/Type;
    .end local v5    # "ftype":Lgnu/bytecode/Type;
    goto :goto_1

    .line 306
    .end local v3    # "flags":I
    .local v5, "flags":I
    :cond_2
    invoke-virtual {v2}, Lgnu/expr/Declaration;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lgnu/expr/Compilation;->mangleNameIfNeeded(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 308
    .local v3, "fname":Ljava/lang/String;
    iget-object v6, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-virtual {v2}, Lgnu/expr/Declaration;->getType()Lgnu/bytecode/Type;

    move-result-object v7

    invoke-virtual {v6, v3, v7, v5}, Lgnu/bytecode/ClassType;->addField(Ljava/lang/String;Lgnu/bytecode/Type;I)Lgnu/bytecode/Field;

    move-result-object v6

    iput-object v6, v2, Lgnu/expr/Declaration;->field:Lgnu/bytecode/Field;

    .line 310
    invoke-virtual {v2, v4}, Lgnu/expr/Declaration;->setSimple(Z)V

    .line 311
    invoke-virtual {v1, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lgnu/expr/Declaration;

    .line 312
    .local v4, "old":Lgnu/expr/Declaration;
    if-eqz v4, :cond_3

    .line 313
    invoke-static {v4, v2, p1}, Lgnu/expr/ClassExp;->duplicateDeclarationError(Lgnu/expr/Declaration;Lgnu/expr/Declaration;Lgnu/expr/Compilation;)V

    .line 314
    :cond_3
    invoke-virtual {v1, v3, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    .end local v3    # "fname":Ljava/lang/String;
    .end local v4    # "old":Lgnu/expr/Declaration;
    .end local v5    # "flags":I
    :cond_4
    :goto_1
    invoke-virtual {v2}, Lgnu/expr/Declaration;->nextDecl()Lgnu/expr/Declaration;

    move-result-object v2

    goto :goto_0

    .line 319
    .end local v2    # "decl":Lgnu/expr/Declaration;
    :cond_5
    iget-object v2, p0, Lgnu/expr/ClassExp;->firstChild:Lgnu/expr/LambdaExp;

    .local v2, "child":Lgnu/expr/LambdaExp;
    :goto_2
    if-eqz v2, :cond_d

    .line 322
    invoke-virtual {v2}, Lgnu/expr/LambdaExp;->isAbstract()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 323
    const/16 v5, 0x4000

    invoke-virtual {p0, v5}, Lgnu/expr/ClassExp;->setFlag(I)V

    .line 324
    :cond_6
    const-string v5, "*init*"

    invoke-virtual {v2}, Lgnu/expr/LambdaExp;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 326
    iput-boolean v0, p0, Lgnu/expr/ClassExp;->explicitInit:Z

    .line 327
    invoke-virtual {v2}, Lgnu/expr/LambdaExp;->isAbstract()Z

    move-result v5

    const/16 v6, 0x65

    if-eqz v5, :cond_7

    .line 328
    const-string v5, "*init* method cannot be abstract"

    invoke-virtual {p1, v6, v5, v2}, Lgnu/expr/Compilation;->error(CLjava/lang/String;Lgnu/text/SourceLocator;)V

    .line 329
    :cond_7
    iget-object v5, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    instance-of v5, v5, Lgnu/expr/PairClassType;

    if-eqz v5, :cond_8

    .line 330
    const-string v5, "\'*init*\' methods only supported for simple classes"

    invoke-virtual {p1, v6, v5}, Lgnu/expr/Compilation;->error(CLjava/lang/String;)V

    .line 336
    :cond_8
    iput-object p0, v2, Lgnu/expr/LambdaExp;->outer:Lgnu/expr/ScopeExp;

    .line 337
    iget-object v5, p0, Lgnu/expr/ClassExp;->initMethod:Lgnu/expr/LambdaExp;

    if-eq v2, v5, :cond_9

    iget-object v5, p0, Lgnu/expr/ClassExp;->clinitMethod:Lgnu/expr/LambdaExp;

    if-eq v2, v5, :cond_9

    iget-object v5, v2, Lgnu/expr/LambdaExp;->nameDecl:Lgnu/expr/Declaration;

    if-eqz v5, :cond_9

    iget-object v5, v2, Lgnu/expr/LambdaExp;->nameDecl:Lgnu/expr/Declaration;

    invoke-virtual {v5, v3, v4}, Lgnu/expr/Declaration;->getFlag(J)Z

    move-result v5

    if-eqz v5, :cond_a

    :cond_9
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->isMakingClassPair()Z

    move-result v5

    if-nez v5, :cond_b

    .line 341
    :cond_a
    iget-object v5, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    const/4 v6, 0x0

    invoke-virtual {v2, v5, p1, v6}, Lgnu/expr/LambdaExp;->addMethodFor(Lgnu/bytecode/ClassType;Lgnu/expr/Compilation;Lgnu/bytecode/ObjectType;)V

    .line 342
    :cond_b
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->isMakingClassPair()Z

    move-result v5

    if-eqz v5, :cond_c

    .line 343
    iget-object v5, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    iget-object v6, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    invoke-virtual {v2, v5, p1, v6}, Lgnu/expr/LambdaExp;->addMethodFor(Lgnu/bytecode/ClassType;Lgnu/expr/Compilation;Lgnu/bytecode/ObjectType;)V

    .line 320
    :cond_c
    iget-object v2, v2, Lgnu/expr/LambdaExp;->nextSibling:Lgnu/expr/LambdaExp;

    goto :goto_2

    .line 345
    .end local v2    # "child":Lgnu/expr/LambdaExp;
    :cond_d
    iget-boolean v2, p0, Lgnu/expr/ClassExp;->explicitInit:Z

    if-nez v2, :cond_e

    iget-object v2, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-virtual {v2}, Lgnu/bytecode/ClassType;->isInterface()Z

    move-result v2

    if-nez v2, :cond_e

    .line 346
    iget-object v2, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-static {v2, p0}, Lgnu/expr/Compilation;->getConstructor(Lgnu/bytecode/ClassType;Lgnu/expr/LambdaExp;)Lgnu/bytecode/Method;

    .line 347
    :cond_e
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->isAbstract()Z

    move-result v2

    if-eqz v2, :cond_f

    .line 348
    iget-object v2, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-virtual {v2}, Lgnu/bytecode/ClassType;->getModifiers()I

    move-result v3

    or-int/lit16 v3, v3, 0x400

    invoke-virtual {v2, v3}, Lgnu/bytecode/ClassType;->setModifiers(I)V

    .line 349
    :cond_f
    iget-object v2, p0, Lgnu/expr/ClassExp;->nameDecl:Lgnu/expr/Declaration;

    if-eqz v2, :cond_10

    .line 350
    iget-object v2, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-virtual {v2}, Lgnu/bytecode/ClassType;->getModifiers()I

    move-result v3

    and-int/lit8 v3, v3, -0x2

    iget-object v4, p0, Lgnu/expr/ClassExp;->nameDecl:Lgnu/expr/Declaration;

    invoke-virtual {v4, v0}, Lgnu/expr/Declaration;->getAccessFlags(S)S

    move-result v0

    or-int/2addr v0, v3

    invoke-virtual {v2, v0}, Lgnu/bytecode/ClassType;->setModifiers(I)V

    .line 353
    :cond_10
    return-void
.end method

.method public getClassType()Lgnu/bytecode/ClassType;
    .locals 1

    .line 48
    iget-object v0, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    return-object v0
.end method

.method protected getCompiledClassType(Lgnu/expr/Compilation;)Lgnu/bytecode/ClassType;
    .locals 1
    .param p1, "comp"    # Lgnu/expr/Compilation;

    .line 127
    iget-object v0, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    return-object v0
.end method

.method public getType()Lgnu/bytecode/Type;
    .locals 1

    .line 44
    iget-boolean v0, p0, Lgnu/expr/ClassExp;->simple:Z

    if-eqz v0, :cond_0

    sget-object v0, Lgnu/expr/Compilation;->typeClass:Lgnu/bytecode/ClassType;

    goto :goto_0

    :cond_0
    sget-object v0, Lgnu/expr/Compilation;->typeClassType:Lgnu/bytecode/ClassType;

    :goto_0
    return-object v0
.end method

.method public final isAbstract()Z
    .locals 1

    .line 15
    const/16 v0, 0x4000

    invoke-virtual {p0, v0}, Lgnu/expr/ClassExp;->getFlag(I)Z

    move-result v0

    return v0
.end method

.method public isMakingClassPair()Z
    .locals 2

    .line 35
    iget-object v0, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    iget-object v1, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSimple()Z
    .locals 1

    .line 12
    iget-boolean v0, p0, Lgnu/expr/ClassExp;->simple:Z

    return v0
.end method

.method protected mustCompile()Z
    .locals 1

    .line 74
    const/4 v0, 0x1

    return v0
.end method

.method public print(Lgnu/mapping/OutPort;)V
    .locals 7
    .param p1, "out"    # Lgnu/mapping/OutPort;

    .line 738
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lgnu/expr/ClassExp;->getExpClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ")"

    const/4 v2, 0x2

    invoke-virtual {p1, v0, v1, v2}, Lgnu/mapping/OutPort;->startLogicalBlock(Ljava/lang/String;Ljava/lang/String;I)V

    .line 739
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->getSymbol()Ljava/lang/Object;

    move-result-object v0

    .line 740
    .local v0, "name":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 742
    invoke-virtual {p1, v0}, Lgnu/mapping/OutPort;->print(Ljava/lang/Object;)V

    .line 743
    const/16 v3, 0x2f

    invoke-virtual {p1, v3}, Lgnu/mapping/OutPort;->print(C)V

    .line 745
    :cond_0
    iget v3, p0, Lgnu/expr/ClassExp;->id:I

    invoke-virtual {p1, v3}, Lgnu/mapping/OutPort;->print(I)V

    .line 746
    const-string v3, "/fl:"

    invoke-virtual {p1, v3}, Lgnu/mapping/OutPort;->print(Ljava/lang/String;)V

    iget v3, p0, Lgnu/expr/ClassExp;->flags:I

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lgnu/mapping/OutPort;->print(Ljava/lang/String;)V

    .line 747
    iget-object v3, p0, Lgnu/expr/ClassExp;->supers:[Lgnu/expr/Expression;

    array-length v3, v3

    if-lez v3, :cond_2

    .line 750
    invoke-virtual {p1}, Lgnu/mapping/OutPort;->writeSpaceFill()V

    .line 751
    const-string v3, "supers:"

    const-string v4, ""

    invoke-virtual {p1, v3, v4, v2}, Lgnu/mapping/OutPort;->startLogicalBlock(Ljava/lang/String;Ljava/lang/String;I)V

    .line 752
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Lgnu/expr/ClassExp;->supers:[Lgnu/expr/Expression;

    array-length v5, v3

    if-ge v2, v5, :cond_1

    .line 754
    aget-object v3, v3, v2

    invoke-virtual {v3, p1}, Lgnu/expr/Expression;->print(Lgnu/mapping/OutPort;)V

    .line 755
    invoke-virtual {p1}, Lgnu/mapping/OutPort;->writeSpaceFill()V

    .line 752
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 757
    .end local v2    # "i":I
    :cond_1
    invoke-virtual {p1, v4}, Lgnu/mapping/OutPort;->endLogicalBlock(Ljava/lang/String;)V

    .line 759
    :cond_2
    const/16 v2, 0x28

    invoke-virtual {p1, v2}, Lgnu/mapping/OutPort;->print(C)V

    .line 760
    const/4 v2, 0x0

    .line 761
    .local v2, "prevMode":Lgnu/expr/Special;
    const/4 v3, 0x0

    .line 762
    .local v3, "i":I
    iget-object v4, p0, Lgnu/expr/ClassExp;->keywords:[Lgnu/expr/Keyword;

    if-nez v4, :cond_3

    const/4 v4, 0x0

    goto :goto_1

    :cond_3
    iget-object v4, p0, Lgnu/expr/ClassExp;->keywords:[Lgnu/expr/Keyword;

    array-length v4, v4

    .line 764
    .local v4, "key_args":I
    :goto_1
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->firstDecl()Lgnu/expr/Declaration;

    move-result-object v5

    .local v5, "decl":Lgnu/expr/Declaration;
    :goto_2
    if-eqz v5, :cond_5

    .line 766
    if-lez v3, :cond_4

    .line 767
    const/16 v6, 0x20

    invoke-virtual {p1, v6}, Lgnu/mapping/OutPort;->print(C)V

    .line 768
    :cond_4
    invoke-virtual {v5, p1}, Lgnu/expr/Declaration;->printInfo(Lgnu/mapping/OutPort;)V

    .line 769
    add-int/lit8 v3, v3, 0x1

    .line 764
    invoke-virtual {v5}, Lgnu/expr/Declaration;->nextDecl()Lgnu/expr/Declaration;

    move-result-object v5

    goto :goto_2

    .line 771
    .end local v5    # "decl":Lgnu/expr/Declaration;
    :cond_5
    const-string v5, ") "

    invoke-virtual {p1, v5}, Lgnu/mapping/OutPort;->print(Ljava/lang/String;)V

    .line 772
    iget-object v5, p0, Lgnu/expr/ClassExp;->firstChild:Lgnu/expr/LambdaExp;

    .local v5, "child":Lgnu/expr/LambdaExp;
    :goto_3
    if-eqz v5, :cond_6

    .line 775
    invoke-virtual {p1}, Lgnu/mapping/OutPort;->writeBreakLinear()V

    .line 776
    invoke-virtual {v5, p1}, Lgnu/expr/LambdaExp;->print(Lgnu/mapping/OutPort;)V

    .line 773
    iget-object v5, v5, Lgnu/expr/LambdaExp;->nextSibling:Lgnu/expr/LambdaExp;

    goto :goto_3

    .line 778
    .end local v5    # "child":Lgnu/expr/LambdaExp;
    :cond_6
    iget-object v5, p0, Lgnu/expr/ClassExp;->body:Lgnu/expr/Expression;

    if-eqz v5, :cond_7

    .line 780
    invoke-virtual {p1}, Lgnu/mapping/OutPort;->writeBreakLinear()V

    .line 781
    iget-object v5, p0, Lgnu/expr/ClassExp;->body:Lgnu/expr/Expression;

    invoke-virtual {v5, p1}, Lgnu/expr/Expression;->print(Lgnu/mapping/OutPort;)V

    .line 783
    :cond_7
    invoke-virtual {p1, v1}, Lgnu/mapping/OutPort;->endLogicalBlock(Ljava/lang/String;)V

    .line 784
    return-void
.end method

.method public setSimple(Z)V
    .locals 0
    .param p1, "value"    # Z

    .line 13
    iput-boolean p1, p0, Lgnu/expr/ClassExp;->simple:Z

    return-void
.end method

.method public setTypes(Lgnu/expr/Compilation;)V
    .locals 11

    .line 132
    iget-object v0, p0, Lgnu/expr/ClassExp;->supers:[Lgnu/expr/Expression;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    array-length v0, v0

    .line 133
    :goto_0
    new-array v2, v0, [Lgnu/bytecode/ClassType;

    .line 134
    nop

    .line 135
    nop

    .line 136
    const/4 v3, 0x0

    move-object v5, v3

    const/4 v4, 0x0

    const/4 v6, 0x0

    :goto_1
    const/16 v7, 0x65

    if-ge v4, v0, :cond_5

    .line 138
    invoke-static {}, Lgnu/expr/Language;->getDefaultLanguage()Lgnu/expr/Language;

    move-result-object v8

    iget-object v9, p0, Lgnu/expr/ClassExp;->supers:[Lgnu/expr/Expression;

    aget-object v9, v9, v4

    invoke-virtual {v8, v9}, Lgnu/expr/Language;->getTypeFor(Lgnu/expr/Expression;)Lgnu/bytecode/Type;

    move-result-object v8

    .line 139
    instance-of v9, v8, Lgnu/bytecode/ClassType;

    if-nez v9, :cond_1

    .line 141
    iget-object v8, p0, Lgnu/expr/ClassExp;->supers:[Lgnu/expr/Expression;

    aget-object v8, v8, v4

    invoke-virtual {p1, v8}, Lgnu/expr/Compilation;->setLine(Lgnu/expr/Expression;)V

    .line 142
    const-string v8, "invalid super type"

    invoke-virtual {p1, v7, v8}, Lgnu/expr/Compilation;->error(CLjava/lang/String;)V

    .line 143
    goto :goto_3

    .line 145
    :cond_1
    check-cast v8, Lgnu/bytecode/ClassType;

    .line 149
    :try_start_0
    invoke-virtual {v8}, Lgnu/bytecode/ClassType;->getModifiers()I

    move-result v9
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    goto :goto_2

    .line 151
    :catch_0
    move-exception v9

    .line 153
    nop

    .line 154
    if-eqz p1, :cond_2

    .line 155
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "unknown super-type "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v8}, Lgnu/bytecode/ClassType;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v7, v9}, Lgnu/expr/Compilation;->error(CLjava/lang/String;)V

    .line 157
    :cond_2
    const/4 v9, 0x0

    :goto_2
    and-int/lit16 v9, v9, 0x200

    if-nez v9, :cond_4

    .line 159
    if-ge v6, v4, :cond_3

    .line 160
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "duplicate superclass for "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v7, v5}, Lgnu/expr/Compilation;->error(CLjava/lang/String;)V

    .line 161
    :cond_3
    nop

    .line 162
    iput v4, p0, Lgnu/expr/ClassExp;->superClassIndex:I

    move-object v5, v8

    goto :goto_3

    .line 165
    :cond_4
    add-int/lit8 v7, v6, 0x1

    aput-object v8, v2, v6

    move v6, v7

    .line 136
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 167
    :cond_5
    const v4, 0x8000

    if-eqz v5, :cond_6

    iget v8, p0, Lgnu/expr/ClassExp;->flags:I

    and-int/2addr v8, v4

    if-eqz v8, :cond_6

    .line 168
    const-string v8, "cannot be interface since has superclass"

    invoke-virtual {p1, v7, v8}, Lgnu/expr/Compilation;->error(CLjava/lang/String;)V

    .line 169
    :cond_6
    iget-boolean v7, p0, Lgnu/expr/ClassExp;->simple:Z

    const/4 v8, 0x1

    if-nez v7, :cond_8

    if-nez v5, :cond_8

    iget v7, p0, Lgnu/expr/ClassExp;->flags:I

    const/high16 v9, 0x10000

    and-int/2addr v7, v9

    if-nez v7, :cond_8

    const/high16 v7, 0x20000

    invoke-virtual {p0, v7}, Lgnu/expr/ClassExp;->getFlag(I)Z

    move-result v7

    if-nez v7, :cond_7

    iget-object v7, p0, Lgnu/expr/ClassExp;->nameDecl:Lgnu/expr/Declaration;

    if-eqz v7, :cond_8

    iget-object v7, p0, Lgnu/expr/ClassExp;->nameDecl:Lgnu/expr/Declaration;

    invoke-virtual {v7}, Lgnu/expr/Declaration;->isPublic()Z

    move-result v7

    if-eqz v7, :cond_8

    .line 173
    :cond_7
    new-instance v4, Lgnu/expr/PairClassType;

    invoke-direct {v4}, Lgnu/expr/PairClassType;-><init>()V

    .line 174
    iput-object v4, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    .line 175
    invoke-virtual {v4, v8}, Lgnu/expr/PairClassType;->setInterface(Z)V

    .line 176
    iget-object v7, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    iput-object v7, v4, Lgnu/expr/PairClassType;->instanceType:Lgnu/bytecode/ClassType;

    .line 177
    new-array v4, v8, [Lgnu/bytecode/ClassType;

    iget-object v7, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    aput-object v7, v4, v1

    .line 179
    iget-object v7, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    sget-object v9, Lgnu/bytecode/Type;->pointer_type:Lgnu/bytecode/ClassType;

    invoke-virtual {v7, v9}, Lgnu/bytecode/ClassType;->setSuper(Lgnu/bytecode/ClassType;)V

    .line 180
    iget-object v7, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-virtual {v7, v4}, Lgnu/bytecode/ClassType;->setInterfaces([Lgnu/bytecode/ClassType;)V

    .line 181
    goto :goto_4

    .line 182
    :cond_8
    invoke-virtual {p0, v4}, Lgnu/expr/ClassExp;->getFlag(I)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 183
    iget-object v4, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-virtual {v4, v8}, Lgnu/bytecode/ClassType;->setInterface(Z)V

    .line 184
    :cond_9
    :goto_4
    iget-object v4, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    if-nez v5, :cond_a

    sget-object v5, Lgnu/bytecode/Type;->pointer_type:Lgnu/bytecode/ClassType;

    :cond_a
    invoke-virtual {v4, v5}, Lgnu/bytecode/ClassType;->setSuper(Lgnu/bytecode/ClassType;)V

    .line 187
    if-ne v6, v0, :cond_b

    .line 188
    goto :goto_5

    .line 191
    :cond_b
    new-array v0, v6, [Lgnu/bytecode/ClassType;

    .line 192
    invoke-static {v2, v1, v0, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v2, v0

    .line 194
    :goto_5
    iget-object v0, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    invoke-virtual {v0, v2}, Lgnu/bytecode/ClassType;->setInterfaces([Lgnu/bytecode/ClassType;)V

    .line 196
    iget-object v0, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    invoke-virtual {v0}, Lgnu/bytecode/ClassType;->getName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1b

    .line 199
    iget-object v0, p0, Lgnu/expr/ClassExp;->classNameSpecifier:Ljava/lang/String;

    if-eqz v0, :cond_c

    .line 200
    goto :goto_6

    .line 203
    :cond_c
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->getName()Ljava/lang/String;

    move-result-object v0

    .line 204
    if-eqz v0, :cond_d

    .line 206
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    .line 207
    const/4 v4, 0x2

    if-le v2, v4, :cond_d

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x3c

    if-ne v4, v5, :cond_d

    sub-int/2addr v2, v8

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x3e

    if-ne v4, v5, :cond_d

    .line 209
    invoke-virtual {v0, v8, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 212
    :cond_d
    :goto_6
    const/16 v2, 0x24

    const/16 v4, 0x64

    if-nez v0, :cond_f

    .line 214
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5, v4}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 215
    invoke-virtual {p1}, Lgnu/expr/Compilation;->getModule()Lgnu/expr/ModuleExp;

    move-result-object v0

    invoke-virtual {v0, p1}, Lgnu/expr/ModuleExp;->classFor(Lgnu/expr/Compilation;)Lgnu/bytecode/ClassType;

    .line 216
    iget-object v0, p1, Lgnu/expr/Compilation;->mainClass:Lgnu/bytecode/ClassType;

    invoke-virtual {v0}, Lgnu/bytecode/ClassType;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 217
    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 218
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v6

    .line 219
    nop

    .line 221
    :goto_7
    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 222
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 223
    invoke-virtual {p1, v0}, Lgnu/expr/Compilation;->findNamedClass(Ljava/lang/String;)Lgnu/bytecode/ClassType;

    move-result-object v2

    if-nez v2, :cond_e

    .line 224
    nop

    .line 227
    goto/16 :goto_e

    .line 225
    :cond_e
    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 219
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 228
    :cond_f
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->isSimple()Z

    move-result v5

    if-eqz v5, :cond_1a

    instance-of v5, p0, Lgnu/expr/ObjectExp;

    if-eqz v5, :cond_10

    goto/16 :goto_d

    .line 232
    :cond_10
    nop

    .line 233
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5, v4}, Ljava/lang/StringBuffer;-><init>(I)V

    const/4 v4, 0x0

    .line 236
    :goto_8
    const/16 v6, 0x2e

    invoke-virtual {v0, v6, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v7

    .line 237
    if-gez v7, :cond_18

    .line 238
    nop

    .line 245
    if-nez v4, :cond_15

    .line 247
    iget-object v2, p1, Lgnu/expr/Compilation;->mainClass:Lgnu/bytecode/ClassType;

    if-nez v2, :cond_11

    goto :goto_9

    :cond_11
    iget-object v2, p1, Lgnu/expr/Compilation;->mainClass:Lgnu/bytecode/ClassType;

    invoke-virtual {v2}, Lgnu/bytecode/ClassType;->getName()Ljava/lang/String;

    move-result-object v3

    .line 249
    :goto_9
    if-nez v3, :cond_12

    const/4 v2, -0x1

    goto :goto_a

    :cond_12
    invoke-virtual {v3, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 250
    :goto_a
    if-lez v2, :cond_13

    .line 251
    add-int/2addr v2, v8

    invoke-virtual {v3, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_b

    .line 252
    :cond_13
    iget-object v1, p1, Lgnu/expr/Compilation;->classPrefix:Ljava/lang/String;

    if-eqz v1, :cond_14

    .line 253
    iget-object v1, p1, Lgnu/expr/Compilation;->classPrefix:Ljava/lang/String;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 254
    :cond_14
    :goto_b
    goto :goto_c

    .line 255
    :cond_15
    if-ne v4, v8, :cond_16

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v4, v3, :cond_16

    .line 257
    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 258
    iget-object v1, p1, Lgnu/expr/Compilation;->mainClass:Lgnu/bytecode/ClassType;

    invoke-virtual {v1}, Lgnu/bytecode/ClassType;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 259
    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 261
    :cond_16
    :goto_c
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v4, v1, :cond_17

    .line 262
    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lgnu/expr/Compilation;->mangleNameIfNeeded(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 264
    :cond_17
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 239
    :cond_18
    invoke-virtual {v0, v4, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lgnu/expr/Compilation;->mangleNameIfNeeded(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 241
    add-int/lit8 v4, v7, 0x1

    .line 242
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v4, v7, :cond_19

    .line 243
    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 244
    :cond_19
    goto :goto_8

    .line 229
    :cond_1a
    :goto_d
    invoke-virtual {p1, v0}, Lgnu/expr/Compilation;->generateClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 266
    :goto_e
    iget-object v1, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    invoke-virtual {v1, v0}, Lgnu/bytecode/ClassType;->setName(Ljava/lang/String;)V

    .line 267
    iget-object v0, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    invoke-virtual {p1, v0}, Lgnu/expr/Compilation;->addClass(Lgnu/bytecode/ClassType;)V

    .line 268
    invoke-virtual {p0}, Lgnu/expr/ClassExp;->isMakingClassPair()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 270
    iget-object v0, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    invoke-virtual {v2}, Lgnu/bytecode/ClassType;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "$class"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lgnu/bytecode/ClassType;->setName(Ljava/lang/String;)V

    .line 271
    iget-object v0, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    invoke-virtual {p1, v0}, Lgnu/expr/Compilation;->addClass(Lgnu/bytecode/ClassType;)V

    .line 274
    :cond_1b
    return-void
.end method

.method protected visit(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            "D:",
            "Ljava/lang/Object;",
            ">(",
            "Lgnu/expr/ExpVisitor<",
            "TR;TD;>;TD;)TR;"
        }
    .end annotation

    .line 662
    .local p1, "visitor":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    invoke-virtual {p1}, Lgnu/expr/ExpVisitor;->getCompilation()Lgnu/expr/Compilation;

    move-result-object v0

    .line 663
    .local v0, "comp":Lgnu/expr/Compilation;
    if-nez v0, :cond_0

    .line 664
    invoke-virtual {p1, p0, p2}, Lgnu/expr/ExpVisitor;->visitClassExp(Lgnu/expr/ClassExp;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 665
    :cond_0
    iget-object v1, v0, Lgnu/expr/Compilation;->curClass:Lgnu/bytecode/ClassType;

    .line 669
    .local v1, "saveClass":Lgnu/bytecode/ClassType;
    :try_start_0
    iget-object v2, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    iput-object v2, v0, Lgnu/expr/Compilation;->curClass:Lgnu/bytecode/ClassType;

    .line 670
    invoke-virtual {p1, p0, p2}, Lgnu/expr/ExpVisitor;->visitClassExp(Lgnu/expr/ClassExp;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 674
    iput-object v1, v0, Lgnu/expr/Compilation;->curClass:Lgnu/bytecode/ClassType;

    return-object v2

    :catchall_0
    move-exception v2

    iput-object v1, v0, Lgnu/expr/Compilation;->curClass:Lgnu/bytecode/ClassType;

    throw v2
.end method

.method protected visitChildren(Lgnu/expr/ExpVisitor;Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            "D:",
            "Ljava/lang/Object;",
            ">(",
            "Lgnu/expr/ExpVisitor<",
            "TR;TD;>;TD;)V"
        }
    .end annotation

    .line 680
    .local p1, "visitor":Lgnu/expr/ExpVisitor;, "Lgnu/expr/ExpVisitor<TR;TD;>;"
    .local p2, "d":Ljava/lang/Object;, "TD;"
    iget-object v0, p1, Lgnu/expr/ExpVisitor;->currentLambda:Lgnu/expr/LambdaExp;

    .line 681
    .local v0, "save":Lgnu/expr/LambdaExp;
    iput-object p0, p1, Lgnu/expr/ExpVisitor;->currentLambda:Lgnu/expr/LambdaExp;

    .line 682
    iget-object v1, p0, Lgnu/expr/ClassExp;->supers:[Lgnu/expr/Expression;

    array-length v2, v1

    invoke-virtual {p1, v1, v2, p2}, Lgnu/expr/ExpVisitor;->visitExps([Lgnu/expr/Expression;ILjava/lang/Object;)[Lgnu/expr/Expression;

    move-result-object v1

    iput-object v1, p0, Lgnu/expr/ClassExp;->supers:[Lgnu/expr/Expression;

    .line 685
    :try_start_0
    iget-object v1, p0, Lgnu/expr/ClassExp;->firstChild:Lgnu/expr/LambdaExp;

    .line 686
    .local v1, "child":Lgnu/expr/LambdaExp;
    :goto_0
    if-eqz v1, :cond_1

    iget-object v2, p1, Lgnu/expr/ExpVisitor;->exitValue:Ljava/lang/Object;

    if-nez v2, :cond_1

    .line 689
    iget-object v2, p0, Lgnu/expr/ClassExp;->instanceType:Lgnu/bytecode/ClassType;

    if-eqz v2, :cond_0

    .line 691
    invoke-virtual {v1}, Lgnu/expr/LambdaExp;->firstDecl()Lgnu/expr/Declaration;

    move-result-object v2

    .line 692
    .local v2, "firstParam":Lgnu/expr/Declaration;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lgnu/expr/Declaration;->isThisParameter()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 693
    iget-object v3, p0, Lgnu/expr/ClassExp;->type:Lgnu/bytecode/ClassType;

    invoke-virtual {v2, v3}, Lgnu/expr/Declaration;->setType(Lgnu/bytecode/Type;)V

    .line 695
    .end local v2    # "firstParam":Lgnu/expr/Declaration;
    :cond_0
    invoke-virtual {p1, v1, p2}, Lgnu/expr/ExpVisitor;->visitLambdaExp(Lgnu/expr/LambdaExp;Ljava/lang/Object;)Ljava/lang/Object;

    .line 687
    iget-object v2, v1, Lgnu/expr/LambdaExp;->nextSibling:Lgnu/expr/LambdaExp;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v1, v2

    goto :goto_0

    .line 700
    .end local v1    # "child":Lgnu/expr/LambdaExp;
    :cond_1
    iput-object v0, p1, Lgnu/expr/ExpVisitor;->currentLambda:Lgnu/expr/LambdaExp;

    .line 701
    nop

    .line 702
    return-void

    .line 700
    :catchall_0
    move-exception v1

    iput-object v0, p1, Lgnu/expr/ExpVisitor;->currentLambda:Lgnu/expr/LambdaExp;

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method
