.class public final enum Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;
.super Ljava/lang/Enum;
.source "DataModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/appinventor/components/runtime/DataModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EntryCriterion"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

.field public static final enum All:Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

.field public static final enum XValue:Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

.field public static final enum YValue:Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 37
    new-instance v0, Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

    const-string v1, "All"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;->All:Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

    .line 38
    new-instance v1, Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

    const-string v3, "XValue"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;->XValue:Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

    .line 39
    new-instance v3, Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

    const-string v5, "YValue"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;->YValue:Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

    .line 36
    const/4 v5, 0x3

    new-array v5, v5, [Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;->$VALUES:[Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 36
    const-class v0, Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

    return-object v0
.end method

.method public static values()[Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;
    .locals 1

    .line 36
    sget-object v0, Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;->$VALUES:[Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

    invoke-virtual {v0}, [Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/appinventor/components/runtime/DataModel$EntryCriterion;

    return-object v0
.end method
