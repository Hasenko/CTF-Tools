.class public Lkawa/lib/parameters;
.super Lgnu/expr/ModuleBody;
.source "parameters.scm"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nparameters.scm\nScheme\n*S Scheme\n*F\n+ 1 parameters.scm\n/u2/home/jis/ai2-kawa/kawa/lib/parameters.scm\n*L\n2#1,18:2\n*E\n"
.end annotation


# static fields
.field public static final $Prvt$as$Mnlocation$Pc:Lgnu/expr/ModuleMethod;

.field public static final $Prvt$parameterize$Pc:Lkawa/lang/Macro;

.field public static final $instance:Lkawa/lib/parameters;

.field static final Lit0:Lgnu/mapping/SimpleSymbol;

.field static final Lit1:Lgnu/mapping/SimpleSymbol;

.field static final Lit10:Lgnu/mapping/SimpleSymbol;

.field static final Lit11:Lgnu/mapping/SimpleSymbol;

.field static final Lit12:Lgnu/mapping/SimpleSymbol;

.field static final Lit2:Lgnu/mapping/SimpleSymbol;

.field static final Lit3:Lkawa/lang/SyntaxRules;

.field static final Lit4:Lgnu/mapping/SimpleSymbol;

.field static final Lit5:Lkawa/lang/SyntaxRules;

.field static final Lit6:Lgnu/mapping/SimpleSymbol;

.field static final Lit7:Lgnu/mapping/SimpleSymbol;

.field static final Lit8:Lgnu/mapping/SimpleSymbol;

.field static final Lit9:Lgnu/mapping/SimpleSymbol;

.field public static final make$Mnparameter:Lgnu/expr/ModuleMethod;

.field public static final parameterize:Lkawa/lang/Macro;


# direct methods
.method public static constructor <clinit>()V
    .locals 34

    new-instance v0, Lgnu/mapping/SimpleSymbol;

    const-string v1, "save"

    invoke-direct {v0, v1}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgnu/mapping/SimpleSymbol;

    sput-object v0, Lkawa/lib/parameters;->Lit12:Lgnu/mapping/SimpleSymbol;

    new-instance v1, Lgnu/mapping/SimpleSymbol;

    const-string v2, "quasiquote"

    invoke-direct {v1, v2}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgnu/mapping/SimpleSymbol;

    sput-object v1, Lkawa/lib/parameters;->Lit11:Lgnu/mapping/SimpleSymbol;

    new-instance v2, Lgnu/mapping/SimpleSymbol;

    const-string v3, "gnu.mapping.Location"

    invoke-direct {v2, v3}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lgnu/mapping/SimpleSymbol;

    sput-object v2, Lkawa/lib/parameters;->Lit10:Lgnu/mapping/SimpleSymbol;

    new-instance v3, Lgnu/mapping/SimpleSymbol;

    const-string v4, "$lookup$"

    invoke-direct {v3, v4}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgnu/mapping/SimpleSymbol;

    sput-object v3, Lkawa/lib/parameters;->Lit9:Lgnu/mapping/SimpleSymbol;

    new-instance v4, Lgnu/mapping/SimpleSymbol;

    const-string v5, "v"

    invoke-direct {v4, v5}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lgnu/mapping/SimpleSymbol;

    sput-object v4, Lkawa/lib/parameters;->Lit8:Lgnu/mapping/SimpleSymbol;

    new-instance v5, Lgnu/mapping/SimpleSymbol;

    const-string v6, "p"

    invoke-direct {v5, v6}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lgnu/mapping/SimpleSymbol;

    sput-object v5, Lkawa/lib/parameters;->Lit7:Lgnu/mapping/SimpleSymbol;

    new-instance v6, Lgnu/mapping/SimpleSymbol;

    const-string v7, "begin"

    invoke-direct {v6, v7}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lgnu/mapping/SimpleSymbol;

    sput-object v6, Lkawa/lib/parameters;->Lit6:Lgnu/mapping/SimpleSymbol;

    new-instance v7, Lkawa/lang/SyntaxRules;

    const/4 v8, 0x1

    new-array v9, v8, [Ljava/lang/Object;

    new-instance v10, Lgnu/mapping/SimpleSymbol;

    const-string v11, "parameterize"

    invoke-direct {v10, v11}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lgnu/mapping/SimpleSymbol;

    sput-object v10, Lkawa/lib/parameters;->Lit4:Lgnu/mapping/SimpleSymbol;

    const/4 v11, 0x0

    aput-object v10, v9, v11

    const/4 v12, 0x2

    new-array v13, v12, [Lkawa/lang/SyntaxRule;

    new-instance v20, Lkawa/lang/SyntaxRule;

    new-instance v15, Lkawa/lang/SyntaxPattern;

    const-string v14, "\u000c\u0018\u000c\u0008\u0003"

    new-array v12, v11, [Ljava/lang/Object;

    invoke-direct {v15, v14, v12, v8}, Lkawa/lang/SyntaxPattern;-><init>(Ljava/lang/String;[Ljava/lang/Object;I)V

    const-string v16, "\u0000"

    const-string v17, "\u0011\u0018\u0004\u0002"

    new-array v12, v8, [Ljava/lang/Object;

    aput-object v6, v12, v11

    const/16 v19, 0x0

    move-object/from16 v14, v20

    move-object/from16 v18, v12

    invoke-direct/range {v14 .. v19}, Lkawa/lang/SyntaxRule;-><init>(Lkawa/lang/SyntaxPattern;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;I)V

    aput-object v20, v13, v11

    new-instance v12, Lkawa/lang/SyntaxRule;

    new-instance v14, Lkawa/lang/SyntaxPattern;

    new-array v15, v11, [Ljava/lang/Object;

    const-string v11, "\u000c\u0018<,\u000c\u0007\u000c\u000f\u0008\u0013\u001b"

    const/4 v8, 0x4

    invoke-direct {v14, v11, v15, v8}, Lkawa/lang/SyntaxPattern;-><init>(Ljava/lang/String;[Ljava/lang/Object;I)V

    const-string v24, "\u0001\u0001\u0000\u0000"

    const-string v25, "\u0011\u0018\u00041!\t\u0003\u0008\u000b\u0012\t\u0010\u001a"

    const/4 v11, 0x1

    new-array v15, v11, [Ljava/lang/Object;

    new-instance v11, Lgnu/mapping/SimpleSymbol;

    const-string v8, "parameterize%"

    invoke-direct {v11, v8}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lgnu/mapping/SimpleSymbol;

    sput-object v8, Lkawa/lib/parameters;->Lit2:Lgnu/mapping/SimpleSymbol;

    const/4 v11, 0x0

    aput-object v8, v15, v11

    const/16 v27, 0x0

    move-object/from16 v22, v12

    move-object/from16 v23, v14

    move-object/from16 v26, v15

    invoke-direct/range {v22 .. v27}, Lkawa/lang/SyntaxRule;-><init>(Lkawa/lang/SyntaxPattern;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;I)V

    const/4 v11, 0x1

    aput-object v12, v13, v11

    const/4 v12, 0x4

    invoke-direct {v7, v9, v13, v12}, Lkawa/lang/SyntaxRules;-><init>([Ljava/lang/Object;[Lkawa/lang/SyntaxRule;I)V

    sput-object v7, Lkawa/lib/parameters;->Lit5:Lkawa/lang/SyntaxRules;

    new-instance v9, Lkawa/lang/SyntaxRules;

    new-array v12, v11, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v8, v12, v11

    const/4 v13, 0x2

    new-array v14, v13, [Lkawa/lang/SyntaxRule;

    new-instance v15, Lkawa/lang/SyntaxRule;

    new-instance v13, Lkawa/lang/SyntaxPattern;

    move-object/from16 v19, v7

    const-string v7, "\u000c\u0018\u000c\u0008\u000c\u0007\u000b"

    move-object/from16 v20, v10

    new-array v10, v11, [Ljava/lang/Object;

    const/4 v11, 0x2

    invoke-direct {v13, v7, v10, v11}, Lkawa/lang/SyntaxPattern;-><init>(Ljava/lang/String;[Ljava/lang/Object;I)V

    const-string v24, "\u0001\u0000"

    const-string v25, "\u0011\u0018\u0004!\u0011\u0018\u000c\n\u0008\u0011\u0018\u000c\u0003"

    new-array v7, v11, [Ljava/lang/Object;

    new-instance v10, Lgnu/mapping/SimpleSymbol;

    const-string v11, "try-finally"

    invoke-direct {v10, v11}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lgnu/mapping/SimpleSymbol;

    const/4 v11, 0x0

    aput-object v10, v7, v11

    const/4 v10, 0x1

    aput-object v6, v7, v10

    move-object/from16 v22, v15

    move-object/from16 v23, v13

    move-object/from16 v26, v7

    invoke-direct/range {v22 .. v27}, Lkawa/lang/SyntaxRule;-><init>(Lkawa/lang/SyntaxPattern;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;I)V

    aput-object v15, v14, v11

    new-instance v6, Lkawa/lang/SyntaxRule;

    new-instance v7, Lkawa/lang/SyntaxPattern;

    new-array v10, v11, [Ljava/lang/Object;

    const-string v11, "\u000c\u0018<,\u000c\u0007\u000c\u000f\u0008\u0013\u000c\u001f#"

    const/4 v13, 0x5

    invoke-direct {v7, v11, v10, v13}, Lkawa/lang/SyntaxPattern;-><init>(Ljava/lang/String;[Ljava/lang/Object;I)V

    const-string v30, "\u0001\u0001\u0000\u0001\u0000"

    const-string v31, "\u0011\u0018\u0004\u00c1y\u0011\u0018\u000c\u0011\u0018\u0014\u0011\u0018\u001c\u0008\u0011\u0018$\u0008\u0003)\u0011\u0018,\u0008\u000b\u00184\u0008\u0011\u0018<\t\u0012!\u0011\u0018D\u001b\""

    const/16 v10, 0x9

    new-array v10, v10, [Ljava/lang/Object;

    new-instance v11, Lgnu/mapping/SimpleSymbol;

    const-string v15, "let*"

    invoke-direct {v11, v15}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lgnu/mapping/SimpleSymbol;

    const/4 v15, 0x0

    aput-object v11, v10, v15

    const/4 v11, 0x1

    aput-object v5, v10, v11

    new-instance v11, Lgnu/mapping/SimpleSymbol;

    const-string v15, "::"

    invoke-direct {v11, v15}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lgnu/mapping/SimpleSymbol;

    const/4 v15, 0x2

    aput-object v11, v10, v15

    new-instance v11, Lgnu/mapping/SimpleSymbol;

    const-string v15, "<gnu.mapping.Location>"

    invoke-direct {v11, v15}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lgnu/mapping/SimpleSymbol;

    const/4 v15, 0x3

    aput-object v11, v10, v15

    new-instance v11, Lgnu/mapping/SimpleSymbol;

    const-string v15, "as-location%"

    invoke-direct {v11, v15}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lgnu/mapping/SimpleSymbol;

    sput-object v11, Lkawa/lib/parameters;->Lit1:Lgnu/mapping/SimpleSymbol;

    const/4 v15, 0x4

    aput-object v11, v10, v15

    aput-object v4, v10, v13

    new-instance v15, Lgnu/mapping/SimpleSymbol;

    const-string v13, "setWithSave"

    invoke-direct {v15, v13}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lgnu/mapping/SimpleSymbol;

    sget-object v15, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    invoke-static {v13, v15}, Lgnu/lists/Pair;->make(Ljava/lang/Object;Ljava/lang/Object;)Lgnu/lists/Pair;

    move-result-object v13

    invoke-static {v1, v13}, Lgnu/lists/Pair;->make(Ljava/lang/Object;Ljava/lang/Object;)Lgnu/lists/Pair;

    move-result-object v13

    sget-object v15, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    invoke-static {v13, v15}, Lgnu/lists/Pair;->make(Ljava/lang/Object;Ljava/lang/Object;)Lgnu/lists/Pair;

    move-result-object v13

    invoke-static {v2, v13}, Lgnu/lists/Pair;->make(Ljava/lang/Object;Ljava/lang/Object;)Lgnu/lists/Pair;

    move-result-object v13

    const v15, 0x1e00d

    move-object/from16 v21, v11

    const-string v11, "/u2/home/jis/ai2-kawa/kawa/lib/parameters.scm"

    invoke-static {v3, v13, v11, v15}, Lgnu/lists/PairWithPosition;->make(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)Lgnu/lists/PairWithPosition;

    move-result-object v13

    sget-object v15, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    move-object/from16 v22, v9

    const v9, 0x1e030

    invoke-static {v4, v15, v11, v9}, Lgnu/lists/PairWithPosition;->make(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)Lgnu/lists/PairWithPosition;

    move-result-object v4

    const v9, 0x1e02e

    invoke-static {v5, v4, v11, v9}, Lgnu/lists/PairWithPosition;->make(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)Lgnu/lists/PairWithPosition;

    move-result-object v4

    const v9, 0x1e00c

    invoke-static {v13, v4, v11, v9}, Lgnu/lists/PairWithPosition;->make(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)Lgnu/lists/PairWithPosition;

    move-result-object v4

    sget-object v13, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    invoke-static {v4, v13, v11, v9}, Lgnu/lists/PairWithPosition;->make(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)Lgnu/lists/PairWithPosition;

    move-result-object v4

    const v9, 0x1e006

    invoke-static {v0, v4, v11, v9}, Lgnu/lists/PairWithPosition;->make(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)Lgnu/lists/PairWithPosition;

    move-result-object v4

    sget-object v13, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    invoke-static {v4, v13, v11, v9}, Lgnu/lists/PairWithPosition;->make(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)Lgnu/lists/PairWithPosition;

    move-result-object v4

    const/4 v9, 0x6

    aput-object v4, v10, v9

    const/4 v4, 0x7

    aput-object v8, v10, v4

    new-instance v4, Lgnu/mapping/SimpleSymbol;

    const-string v9, "setRestore"

    invoke-direct {v4, v9}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lgnu/mapping/SimpleSymbol;

    sget-object v9, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    invoke-static {v4, v9}, Lgnu/lists/Pair;->make(Ljava/lang/Object;Ljava/lang/Object;)Lgnu/lists/Pair;

    move-result-object v4

    invoke-static {v1, v4}, Lgnu/lists/Pair;->make(Ljava/lang/Object;Ljava/lang/Object;)Lgnu/lists/Pair;

    move-result-object v1

    sget-object v4, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    invoke-static {v1, v4}, Lgnu/lists/Pair;->make(Ljava/lang/Object;Ljava/lang/Object;)Lgnu/lists/Pair;

    move-result-object v1

    invoke-static {v2, v1}, Lgnu/lists/Pair;->make(Ljava/lang/Object;Ljava/lang/Object;)Lgnu/lists/Pair;

    move-result-object v1

    const v2, 0x2000b

    invoke-static {v3, v1, v11, v2}, Lgnu/lists/PairWithPosition;->make(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)Lgnu/lists/PairWithPosition;

    move-result-object v1

    sget-object v2, Lgnu/lists/LList;->Empty:Lgnu/lists/LList;

    const v3, 0x2002d

    invoke-static {v0, v2, v11, v3}, Lgnu/lists/PairWithPosition;->make(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)Lgnu/lists/PairWithPosition;

    move-result-object v0

    const v2, 0x2002b

    invoke-static {v5, v0, v11, v2}, Lgnu/lists/PairWithPosition;->make(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)Lgnu/lists/PairWithPosition;

    move-result-object v0

    const v2, 0x2000a

    invoke-static {v1, v0, v11, v2}, Lgnu/lists/PairWithPosition;->make(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)Lgnu/lists/PairWithPosition;

    move-result-object v0

    const/16 v1, 0x8

    aput-object v0, v10, v1

    const/16 v33, 0x0

    move-object/from16 v28, v6

    move-object/from16 v29, v7

    move-object/from16 v32, v10

    invoke-direct/range {v28 .. v33}, Lkawa/lang/SyntaxRule;-><init>(Lkawa/lang/SyntaxPattern;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;I)V

    const/4 v0, 0x1

    aput-object v6, v14, v0

    move-object/from16 v0, v22

    const/4 v1, 0x5

    invoke-direct {v0, v12, v14, v1}, Lkawa/lang/SyntaxRules;-><init>([Ljava/lang/Object;[Lkawa/lang/SyntaxRule;I)V

    sput-object v0, Lkawa/lib/parameters;->Lit3:Lkawa/lang/SyntaxRules;

    new-instance v1, Lgnu/mapping/SimpleSymbol;

    const-string v2, "make-parameter"

    invoke-direct {v1, v2}, Lgnu/mapping/SimpleSymbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lgnu/mapping/SimpleSymbol;->readResolve()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgnu/mapping/SimpleSymbol;

    sput-object v1, Lkawa/lib/parameters;->Lit0:Lgnu/mapping/SimpleSymbol;

    new-instance v2, Lkawa/lib/parameters;

    invoke-direct {v2}, Lkawa/lib/parameters;-><init>()V

    sput-object v2, Lkawa/lib/parameters;->$instance:Lkawa/lib/parameters;

    new-instance v3, Lgnu/expr/ModuleMethod;

    const/16 v4, 0x2001

    const/4 v5, 0x1

    invoke-direct {v3, v2, v5, v1, v4}, Lgnu/expr/ModuleMethod;-><init>(Lgnu/expr/ModuleBody;ILjava/lang/Object;I)V

    sput-object v3, Lkawa/lib/parameters;->make$Mnparameter:Lgnu/expr/ModuleMethod;

    new-instance v1, Lgnu/expr/ModuleMethod;

    const/16 v3, 0x1001

    move-object/from16 v11, v21

    const/4 v4, 0x3

    invoke-direct {v1, v2, v4, v11, v3}, Lgnu/expr/ModuleMethod;-><init>(Lgnu/expr/ModuleBody;ILjava/lang/Object;I)V

    sput-object v1, Lkawa/lib/parameters;->$Prvt$as$Mnlocation$Pc:Lgnu/expr/ModuleMethod;

    invoke-static {v8, v0, v2}, Lkawa/lang/Macro;->make(Ljava/lang/Object;Lgnu/mapping/Procedure;Ljava/lang/Object;)Lkawa/lang/Macro;

    move-result-object v0

    sput-object v0, Lkawa/lib/parameters;->$Prvt$parameterize$Pc:Lkawa/lang/Macro;

    .line 2
    move-object/from16 v0, v19

    move-object/from16 v10, v20

    invoke-static {v10, v0, v2}, Lkawa/lang/Macro;->make(Ljava/lang/Object;Lgnu/mapping/Procedure;Ljava/lang/Object;)Lkawa/lang/Macro;

    move-result-object v0

    sput-object v0, Lkawa/lib/parameters;->parameterize:Lkawa/lang/Macro;

    invoke-virtual {v2}, Lgnu/expr/ModuleBody;->run()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lgnu/expr/ModuleBody;-><init>()V

    invoke-static {p0}, Lgnu/expr/ModuleInfo;->register(Ljava/lang/Object;)V

    return-void
.end method

.method public static asLocation$Pc(Ljava/lang/Object;)Lgnu/mapping/Location;
    .locals 4
    .param p0, "param"    # Ljava/lang/Object;

    .line 13
    nop

    .line 14
    instance-of v0, p0, Lgnu/mapping/LocationProc;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 15
    :try_start_0
    move-object v0, p0

    check-cast v0, Lgnu/mapping/LocationProc;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {v0}, Lgnu/mapping/LocationProc;->getLocation()Lgnu/mapping/Location;

    move-result-object v0

    .local v2, "loc":Ljava/lang/Object;
    goto :goto_0

    .end local v2    # "loc":Ljava/lang/Object;
    .end local p0    # "param":Ljava/lang/Object;
    :catch_0
    move-exception v0

    new-instance v2, Lgnu/mapping/WrongType;

    const-string v3, "gnu.mapping.LocationProc.getLocation()"

    invoke-direct {v2, v0, v3, v1, p0}, Lgnu/mapping/WrongType;-><init>(Ljava/lang/ClassCastException;Ljava/lang/String;ILjava/lang/Object;)V

    throw v2

    .line 16
    .restart local p0    # "param":Ljava/lang/Object;
    :cond_0
    move-object v0, p0

    check-cast v0, Lgnu/mapping/Location;

    .restart local v2    # "loc":Ljava/lang/Object;
    :goto_0
    nop

    .line 17
    .end local v2    # "loc":Ljava/lang/Object;
    .local v0, "loc":Ljava/lang/Object;
    instance-of v2, v0, Lgnu/mapping/ThreadLocation;

    if-eqz v2, :cond_1

    .line 18
    :try_start_1
    move-object v2, v0

    check-cast v2, Lgnu/mapping/ThreadLocation;
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_1

    invoke-virtual {v2}, Lgnu/mapping/ThreadLocation;->getLocation()Lgnu/mapping/NamedLocation;

    move-result-object v0

    goto :goto_1

    .end local v0    # "loc":Ljava/lang/Object;
    .end local p0    # "param":Ljava/lang/Object;
    :catch_1
    move-exception p0

    new-instance v2, Lgnu/mapping/WrongType;

    const-string v3, "gnu.mapping.ThreadLocation.getLocation()"

    invoke-direct {v2, p0, v3, v1, v0}, Lgnu/mapping/WrongType;-><init>(Ljava/lang/ClassCastException;Ljava/lang/String;ILjava/lang/Object;)V

    throw v2

    .line 19
    .restart local v0    # "loc":Ljava/lang/Object;
    .restart local p0    # "param":Ljava/lang/Object;
    :cond_1
    :goto_1
    check-cast v0, Lgnu/mapping/Location;

    .end local v0    # "loc":Ljava/lang/Object;
    return-object v0
.end method

.method public static makeParameter(Ljava/lang/Object;)Lgnu/mapping/LocationProc;
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lkawa/lib/parameters;->makeParameter(Ljava/lang/Object;Ljava/lang/Object;)Lgnu/mapping/LocationProc;

    move-result-object p0

    return-object p0
.end method

.method public static makeParameter(Ljava/lang/Object;Ljava/lang/Object;)Lgnu/mapping/LocationProc;
    .locals 3
    .param p0, "init"    # Ljava/lang/Object;
    .param p1, "converter"    # Ljava/lang/Object;

    .line 6
    nop

    .line 7
    if-eqz p1, :cond_0

    .line 8
    sget-object v0, Lkawa/standard/Scheme;->applyToArgs:Lgnu/kawa/functions/ApplyToArgs;

    invoke-virtual {v0, p1, p0}, Lgnu/mapping/Procedure;->apply2(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 9
    :cond_0
    new-instance v0, Lgnu/mapping/ThreadLocation;

    invoke-direct {v0}, Lgnu/mapping/ThreadLocation;-><init>()V

    const/4 v1, 0x0

    .line 10
    .local v0, "loc":Lgnu/mapping/ThreadLocation;
    invoke-virtual {v0, p0}, Lgnu/mapping/ThreadLocation;->setGlobal(Ljava/lang/Object;)V

    .line 11
    new-instance v1, Lgnu/mapping/LocationProc;

    :try_start_0
    move-object v2, p1

    check-cast v2, Lgnu/mapping/Procedure;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-direct {v1, v0, v2}, Lgnu/mapping/LocationProc;-><init>(Lgnu/mapping/Location;Lgnu/mapping/Procedure;)V

    .end local v0    # "loc":Lgnu/mapping/ThreadLocation;
    return-object v1

    .end local p0    # "init":Ljava/lang/Object;
    .end local p1    # "converter":Ljava/lang/Object;
    :catch_0
    move-exception p0

    new-instance v0, Lgnu/mapping/WrongType;

    const-string v1, "gnu.mapping.LocationProc.<init>(gnu.mapping.Location,gnu.mapping.Procedure)"

    const/4 v2, 0x2

    invoke-direct {v0, p0, v1, v2, p1}, Lgnu/mapping/WrongType;-><init>(Ljava/lang/ClassCastException;Ljava/lang/String;ILjava/lang/Object;)V

    throw v0
.end method


# virtual methods
.method public apply1(Lgnu/expr/ModuleMethod;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iget v0, p1, Lgnu/expr/ModuleMethod;->selector:I

    packed-switch v0, :pswitch_data_0

    .line 13
    :pswitch_0
    invoke-super {p0, p1, p2}, Lgnu/expr/ModuleBody;->apply1(Lgnu/expr/ModuleMethod;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :pswitch_1
    invoke-static {p2}, Lkawa/lib/parameters;->asLocation$Pc(Ljava/lang/Object;)Lgnu/mapping/Location;

    move-result-object p1

    return-object p1

    .line 6
    :pswitch_2
    invoke-static {p2}, Lkawa/lib/parameters;->makeParameter(Ljava/lang/Object;)Lgnu/mapping/LocationProc;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public apply2(Lgnu/expr/ModuleMethod;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    iget v0, p1, Lgnu/expr/ModuleMethod;->selector:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 6
    invoke-static {p2, p3}, Lkawa/lib/parameters;->makeParameter(Ljava/lang/Object;Ljava/lang/Object;)Lgnu/mapping/LocationProc;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lgnu/expr/ModuleBody;->apply2(Lgnu/expr/ModuleMethod;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public match1(Lgnu/expr/ModuleMethod;Ljava/lang/Object;Lgnu/mapping/CallContext;)I
    .locals 3

    iget v0, p1, Lgnu/expr/ModuleMethod;->selector:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    .line 6
    :pswitch_0
    invoke-super {p0, p1, p2, p3}, Lgnu/expr/ModuleBody;->match1(Lgnu/expr/ModuleMethod;Ljava/lang/Object;Lgnu/mapping/CallContext;)I

    move-result p1

    return p1

    .line 13
    :pswitch_1
    iput-object p2, p3, Lgnu/mapping/CallContext;->value1:Ljava/lang/Object;

    iput-object p1, p3, Lgnu/mapping/CallContext;->proc:Lgnu/mapping/Procedure;

    iput v2, p3, Lgnu/mapping/CallContext;->pc:I

    return v1

    .line 6
    :pswitch_2
    iput-object p2, p3, Lgnu/mapping/CallContext;->value1:Ljava/lang/Object;

    iput-object p1, p3, Lgnu/mapping/CallContext;->proc:Lgnu/mapping/Procedure;

    iput v2, p3, Lgnu/mapping/CallContext;->pc:I

    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public match2(Lgnu/expr/ModuleMethod;Ljava/lang/Object;Ljava/lang/Object;Lgnu/mapping/CallContext;)I
    .locals 2

    iget v0, p1, Lgnu/expr/ModuleMethod;->selector:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 6
    iput-object p2, p4, Lgnu/mapping/CallContext;->value1:Ljava/lang/Object;

    iput-object p3, p4, Lgnu/mapping/CallContext;->value2:Ljava/lang/Object;

    iput-object p1, p4, Lgnu/mapping/CallContext;->proc:Lgnu/mapping/Procedure;

    const/4 p1, 0x2

    iput p1, p4, Lgnu/mapping/CallContext;->pc:I

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lgnu/expr/ModuleBody;->match2(Lgnu/expr/ModuleMethod;Ljava/lang/Object;Ljava/lang/Object;Lgnu/mapping/CallContext;)I

    move-result p1

    return p1
.end method

.method public final run(Lgnu/mapping/CallContext;)V
    .locals 1
    .param p1, "$ctx"    # Lgnu/mapping/CallContext;

    const/4 v0, 0x0

    .line 2
    .local v0, "$result":Lgnu/lists/Consumer;
    iget-object v0, p1, Lgnu/mapping/CallContext;->consumer:Lgnu/lists/Consumer;

    .line 6
    nop

    .line 13
    return-void
.end method
