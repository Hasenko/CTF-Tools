.class public final Lkotlinx/coroutines/JobSupportKt;
.super Ljava/lang/Object;
.source "JobSupport.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u0000\n\u0002\u0008\u0002\u001a\u0010\u0010\r\u001a\u0004\u0018\u00010\u000e*\u0004\u0018\u00010\u000eH\u0000\u001a\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u000e*\u0004\u0018\u00010\u000eH\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u0010\u0010\u0003\u001a\u00020\u00018\u0000X\u0081\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0006\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0007\u001a\u00020\u0008X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\t\u001a\u00020\u0008X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\n\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u000b\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u000c\u001a\u00020\u0008X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "COMPLETING_ALREADY",
        "Lkotlinx/coroutines/internal/Symbol;",
        "COMPLETING_RETRY",
        "COMPLETING_WAITING_CHILDREN",
        "EMPTY_ACTIVE",
        "Lkotlinx/coroutines/Empty;",
        "EMPTY_NEW",
        "FALSE",
        "",
        "RETRY",
        "SEALED",
        "TOO_LATE_TO_CANCEL",
        "TRUE",
        "boxIncomplete",
        "",
        "unboxState",
        "kotlinx-coroutines-core"
    }
    k = 0x2
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final COMPLETING_ALREADY:Lkotlinx/coroutines/internal/Symbol;

.field private static final COMPLETING_RETRY:Lkotlinx/coroutines/internal/Symbol;

.field public static final COMPLETING_WAITING_CHILDREN:Lkotlinx/coroutines/internal/Symbol;

.field private static final EMPTY_ACTIVE:Lkotlinx/coroutines/Empty;

.field private static final EMPTY_NEW:Lkotlinx/coroutines/Empty;

.field private static final FALSE:I = 0x0

.field private static final RETRY:I = -0x1

.field private static final SEALED:Lkotlinx/coroutines/internal/Symbol;

.field private static final TOO_LATE_TO_CANCEL:Lkotlinx/coroutines/internal/Symbol;

.field private static final TRUE:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1289
    new-instance v0, Lkotlinx/coroutines/internal/Symbol;

    const-string v1, "COMPLETING_ALREADY"

    invoke-direct {v0, v1}, Lkotlinx/coroutines/internal/Symbol;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkotlinx/coroutines/JobSupportKt;->COMPLETING_ALREADY:Lkotlinx/coroutines/internal/Symbol;

    .line 1291
    new-instance v0, Lkotlinx/coroutines/internal/Symbol;

    const-string v1, "COMPLETING_WAITING_CHILDREN"

    invoke-direct {v0, v1}, Lkotlinx/coroutines/internal/Symbol;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkotlinx/coroutines/JobSupportKt;->COMPLETING_WAITING_CHILDREN:Lkotlinx/coroutines/internal/Symbol;

    .line 1292
    new-instance v0, Lkotlinx/coroutines/internal/Symbol;

    const-string v1, "COMPLETING_RETRY"

    invoke-direct {v0, v1}, Lkotlinx/coroutines/internal/Symbol;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkotlinx/coroutines/JobSupportKt;->COMPLETING_RETRY:Lkotlinx/coroutines/internal/Symbol;

    .line 1293
    new-instance v0, Lkotlinx/coroutines/internal/Symbol;

    const-string v1, "TOO_LATE_TO_CANCEL"

    invoke-direct {v0, v1}, Lkotlinx/coroutines/internal/Symbol;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkotlinx/coroutines/JobSupportKt;->TOO_LATE_TO_CANCEL:Lkotlinx/coroutines/internal/Symbol;

    .line 1299
    new-instance v0, Lkotlinx/coroutines/internal/Symbol;

    const-string v1, "SEALED"

    invoke-direct {v0, v1}, Lkotlinx/coroutines/internal/Symbol;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkotlinx/coroutines/JobSupportKt;->SEALED:Lkotlinx/coroutines/internal/Symbol;

    .line 1300
    new-instance v0, Lkotlinx/coroutines/Empty;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlinx/coroutines/Empty;-><init>(Z)V

    sput-object v0, Lkotlinx/coroutines/JobSupportKt;->EMPTY_NEW:Lkotlinx/coroutines/Empty;

    .line 1301
    new-instance v0, Lkotlinx/coroutines/Empty;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lkotlinx/coroutines/Empty;-><init>(Z)V

    sput-object v0, Lkotlinx/coroutines/JobSupportKt;->EMPTY_ACTIVE:Lkotlinx/coroutines/Empty;

    return-void
.end method

.method public static final synthetic access$getCOMPLETING_ALREADY$p()Lkotlinx/coroutines/internal/Symbol;
    .locals 1

    .line 1
    sget-object v0, Lkotlinx/coroutines/JobSupportKt;->COMPLETING_ALREADY:Lkotlinx/coroutines/internal/Symbol;

    return-object v0
.end method

.method public static final synthetic access$getCOMPLETING_RETRY$p()Lkotlinx/coroutines/internal/Symbol;
    .locals 1

    .line 1
    sget-object v0, Lkotlinx/coroutines/JobSupportKt;->COMPLETING_RETRY:Lkotlinx/coroutines/internal/Symbol;

    return-object v0
.end method

.method public static final synthetic access$getEMPTY_ACTIVE$p()Lkotlinx/coroutines/Empty;
    .locals 1

    .line 1
    sget-object v0, Lkotlinx/coroutines/JobSupportKt;->EMPTY_ACTIVE:Lkotlinx/coroutines/Empty;

    return-object v0
.end method

.method public static final synthetic access$getEMPTY_NEW$p()Lkotlinx/coroutines/Empty;
    .locals 1

    .line 1
    sget-object v0, Lkotlinx/coroutines/JobSupportKt;->EMPTY_NEW:Lkotlinx/coroutines/Empty;

    return-object v0
.end method

.method public static final synthetic access$getSEALED$p()Lkotlinx/coroutines/internal/Symbol;
    .locals 1

    .line 1
    sget-object v0, Lkotlinx/coroutines/JobSupportKt;->SEALED:Lkotlinx/coroutines/internal/Symbol;

    return-object v0
.end method

.method public static final synthetic access$getTOO_LATE_TO_CANCEL$p()Lkotlinx/coroutines/internal/Symbol;
    .locals 1

    .line 1
    sget-object v0, Lkotlinx/coroutines/JobSupportKt;->TOO_LATE_TO_CANCEL:Lkotlinx/coroutines/internal/Symbol;

    return-object v0
.end method

.method public static final boxIncomplete(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1284
    instance-of v0, p0, Lkotlinx/coroutines/Incomplete;

    if-eqz v0, :cond_0

    new-instance v0, Lkotlinx/coroutines/IncompleteStateBox;

    check-cast p0, Lkotlinx/coroutines/Incomplete;

    invoke-direct {v0, p0}, Lkotlinx/coroutines/IncompleteStateBox;-><init>(Lkotlinx/coroutines/Incomplete;)V

    move-object p0, v0

    :cond_0
    return-object p0
.end method

.method public static final unboxState(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1285
    instance-of v0, p0, Lkotlinx/coroutines/IncompleteStateBox;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Lkotlinx/coroutines/IncompleteStateBox;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    iget-object v0, v0, Lkotlinx/coroutines/IncompleteStateBox;->state:Lkotlinx/coroutines/Incomplete;

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    move-object p0, v0

    :cond_2
    :goto_1
    return-object p0
.end method
