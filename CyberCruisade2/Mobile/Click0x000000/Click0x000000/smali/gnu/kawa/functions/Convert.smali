.class public Lgnu/kawa/functions/Convert;
.super Lgnu/mapping/Procedure2;
.source "Convert.java"


# static fields
.field public static final as:Lgnu/kawa/functions/Convert;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 7
    new-instance v0, Lgnu/kawa/functions/Convert;

    invoke-direct {v0}, Lgnu/kawa/functions/Convert;-><init>()V

    sput-object v0, Lgnu/kawa/functions/Convert;->as:Lgnu/kawa/functions/Convert;

    .line 9
    const-string v1, "as"

    invoke-virtual {v0, v1}, Lgnu/kawa/functions/Convert;->setName(Ljava/lang/String;)V

    .line 10
    sget-object v1, Lgnu/mapping/Procedure;->validateApplyKey:Lgnu/mapping/Symbol;

    const-string v2, "gnu.kawa.functions.CompileMisc:validateApplyConvert"

    invoke-virtual {v0, v1, v2}, Lgnu/kawa/functions/Convert;->setProperty(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    sget-object v1, Lgnu/mapping/Procedure;->compilerKey:Lgnu/mapping/LazyPropertyKey;

    const-string v2, "*gnu.kawa.functions.CompileMisc:forConvert"

    invoke-virtual {v1, v0, v2}, Lgnu/mapping/LazyPropertyKey;->set(Lgnu/mapping/PropertySet;Ljava/lang/String;)V

    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Lgnu/mapping/Procedure2;-><init>()V

    return-void
.end method

.method public static getInstance()Lgnu/kawa/functions/Convert;
    .locals 1

    .line 17
    sget-object v0, Lgnu/kawa/functions/Convert;->as:Lgnu/kawa/functions/Convert;

    return-object v0
.end method


# virtual methods
.method public apply2(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;

    .line 23
    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_0

    .line 24
    move-object v0, p1

    check-cast v0, Ljava/lang/Class;

    invoke-static {v0}, Lgnu/bytecode/Type;->make(Ljava/lang/Class;)Lgnu/bytecode/Type;

    move-result-object v0

    .local v0, "type":Lgnu/bytecode/Type;
    goto :goto_0

    .line 26
    .end local v0    # "type":Lgnu/bytecode/Type;
    :cond_0
    move-object v0, p1

    check-cast v0, Lgnu/bytecode/Type;

    .line 27
    .restart local v0    # "type":Lgnu/bytecode/Type;
    :goto_0
    invoke-virtual {v0, p2}, Lgnu/bytecode/Type;->coerceFromObject(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method
