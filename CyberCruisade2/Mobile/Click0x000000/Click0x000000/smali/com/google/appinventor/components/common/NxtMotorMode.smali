.class public final enum Lcom/google/appinventor/components/common/NxtMotorMode;
.super Ljava/lang/Enum;
.source "NxtMotorMode.java"

# interfaces
.implements Lcom/google/appinventor/components/common/OptionList;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/appinventor/components/common/NxtMotorMode;",
        ">;",
        "Lcom/google/appinventor/components/common/OptionList<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/appinventor/components/common/NxtMotorMode;

.field public static final enum Brake:Lcom/google/appinventor/components/common/NxtMotorMode;

.field public static final enum Coast:Lcom/google/appinventor/components/common/NxtMotorMode;

.field public static final enum On:Lcom/google/appinventor/components/common/NxtMotorMode;

.field public static final enum Regulated:Lcom/google/appinventor/components/common/NxtMotorMode;
    .annotation runtime Lcom/google/appinventor/components/common/Default;
    .end annotation
.end field

.field private static final lookup:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/google/appinventor/components/common/NxtMotorMode;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 21
    new-instance v0, Lcom/google/appinventor/components/common/NxtMotorMode;

    const-string v1, "On"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/appinventor/components/common/NxtMotorMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/appinventor/components/common/NxtMotorMode;->On:Lcom/google/appinventor/components/common/NxtMotorMode;

    .line 22
    new-instance v1, Lcom/google/appinventor/components/common/NxtMotorMode;

    const-string v4, "Brake"

    const/4 v5, 0x2

    invoke-direct {v1, v4, v3, v5}, Lcom/google/appinventor/components/common/NxtMotorMode;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/appinventor/components/common/NxtMotorMode;->Brake:Lcom/google/appinventor/components/common/NxtMotorMode;

    .line 23
    new-instance v4, Lcom/google/appinventor/components/common/NxtMotorMode;

    const-string v6, "Regulated"

    const/4 v7, 0x4

    invoke-direct {v4, v6, v5, v7}, Lcom/google/appinventor/components/common/NxtMotorMode;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/appinventor/components/common/NxtMotorMode;->Regulated:Lcom/google/appinventor/components/common/NxtMotorMode;

    .line 25
    new-instance v6, Lcom/google/appinventor/components/common/NxtMotorMode;

    const-string v8, "Coast"

    const/4 v9, 0x3

    invoke-direct {v6, v8, v9, v2}, Lcom/google/appinventor/components/common/NxtMotorMode;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/google/appinventor/components/common/NxtMotorMode;->Coast:Lcom/google/appinventor/components/common/NxtMotorMode;

    .line 20
    new-array v7, v7, [Lcom/google/appinventor/components/common/NxtMotorMode;

    aput-object v0, v7, v2

    aput-object v1, v7, v3

    aput-object v4, v7, v5

    aput-object v6, v7, v9

    sput-object v7, Lcom/google/appinventor/components/common/NxtMotorMode;->$VALUES:[Lcom/google/appinventor/components/common/NxtMotorMode;

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/appinventor/components/common/NxtMotorMode;->lookup:Ljava/util/Map;

    .line 40
    invoke-static {}, Lcom/google/appinventor/components/common/NxtMotorMode;->values()[Lcom/google/appinventor/components/common/NxtMotorMode;

    move-result-object v0

    array-length v1, v0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 41
    .local v3, "mode":Lcom/google/appinventor/components/common/NxtMotorMode;
    sget-object v4, Lcom/google/appinventor/components/common/NxtMotorMode;->lookup:Ljava/util/Map;

    invoke-virtual {v3}, Lcom/google/appinventor/components/common/NxtMotorMode;->toUnderlyingValue()Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .end local v3    # "mode":Lcom/google/appinventor/components/common/NxtMotorMode;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 43
    :cond_0
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "mode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 30
    iput p3, p0, Lcom/google/appinventor/components/common/NxtMotorMode;->value:I

    .line 31
    return-void
.end method

.method public static fromUnderlyingValue(Ljava/lang/Integer;)Lcom/google/appinventor/components/common/NxtMotorMode;
    .locals 1
    .param p0, "mode"    # Ljava/lang/Integer;

    .line 46
    sget-object v0, Lcom/google/appinventor/components/common/NxtMotorMode;->lookup:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/common/NxtMotorMode;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/appinventor/components/common/NxtMotorMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 20
    const-class v0, Lcom/google/appinventor/components/common/NxtMotorMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/common/NxtMotorMode;

    return-object v0
.end method

.method public static values()[Lcom/google/appinventor/components/common/NxtMotorMode;
    .locals 1

    .line 20
    sget-object v0, Lcom/google/appinventor/components/common/NxtMotorMode;->$VALUES:[Lcom/google/appinventor/components/common/NxtMotorMode;

    invoke-virtual {v0}, [Lcom/google/appinventor/components/common/NxtMotorMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/appinventor/components/common/NxtMotorMode;

    return-object v0
.end method


# virtual methods
.method public toUnderlyingValue()Ljava/lang/Integer;
    .locals 1

    .line 34
    iget v0, p0, Lcom/google/appinventor/components/common/NxtMotorMode;->value:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toUnderlyingValue()Ljava/lang/Object;
    .locals 1

    .line 20
    invoke-virtual {p0}, Lcom/google/appinventor/components/common/NxtMotorMode;->toUnderlyingValue()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
