.class public final enum Lcom/google/appinventor/components/common/NxtSensorMode;
.super Ljava/lang/Enum;
.source "NxtSensorMode.java"

# interfaces
.implements Lcom/google/appinventor/components/common/OptionList;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/appinventor/components/common/NxtSensorMode;",
        ">;",
        "Lcom/google/appinventor/components/common/OptionList<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/appinventor/components/common/NxtSensorMode;

.field public static final enum Boolean:Lcom/google/appinventor/components/common/NxtSensorMode;

.field public static final enum Percentage:Lcom/google/appinventor/components/common/NxtSensorMode;

.field public static final enum PeriodCount:Lcom/google/appinventor/components/common/NxtSensorMode;

.field public static final enum Raw:Lcom/google/appinventor/components/common/NxtSensorMode;

.field public static final enum RcxAngleSteps:Lcom/google/appinventor/components/common/NxtSensorMode;

.field public static final enum RcxCelsius:Lcom/google/appinventor/components/common/NxtSensorMode;

.field public static final enum RcxFahrenheit:Lcom/google/appinventor/components/common/NxtSensorMode;

.field public static final enum TransitionCount:Lcom/google/appinventor/components/common/NxtSensorMode;

.field private static final lookup:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/google/appinventor/components/common/NxtSensorMode;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 21
    new-instance v0, Lcom/google/appinventor/components/common/NxtSensorMode;

    const-string v1, "Raw"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/google/appinventor/components/common/NxtSensorMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/appinventor/components/common/NxtSensorMode;->Raw:Lcom/google/appinventor/components/common/NxtSensorMode;

    .line 22
    new-instance v1, Lcom/google/appinventor/components/common/NxtSensorMode;

    const/16 v3, 0x20

    const-string v4, "Boolean"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v3}, Lcom/google/appinventor/components/common/NxtSensorMode;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/appinventor/components/common/NxtSensorMode;->Boolean:Lcom/google/appinventor/components/common/NxtSensorMode;

    .line 23
    new-instance v3, Lcom/google/appinventor/components/common/NxtSensorMode;

    const-string v4, "TransitionCount"

    const/4 v6, 0x2

    const/16 v7, 0x60

    invoke-direct {v3, v4, v6, v7}, Lcom/google/appinventor/components/common/NxtSensorMode;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/google/appinventor/components/common/NxtSensorMode;->TransitionCount:Lcom/google/appinventor/components/common/NxtSensorMode;

    .line 24
    new-instance v4, Lcom/google/appinventor/components/common/NxtSensorMode;

    const-string v8, "PeriodCount"

    const/4 v9, 0x3

    invoke-direct {v4, v8, v9, v7}, Lcom/google/appinventor/components/common/NxtSensorMode;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/appinventor/components/common/NxtSensorMode;->PeriodCount:Lcom/google/appinventor/components/common/NxtSensorMode;

    .line 25
    new-instance v7, Lcom/google/appinventor/components/common/NxtSensorMode;

    const/16 v8, 0x80

    const-string v10, "Percentage"

    const/4 v11, 0x4

    invoke-direct {v7, v10, v11, v8}, Lcom/google/appinventor/components/common/NxtSensorMode;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/google/appinventor/components/common/NxtSensorMode;->Percentage:Lcom/google/appinventor/components/common/NxtSensorMode;

    .line 26
    new-instance v8, Lcom/google/appinventor/components/common/NxtSensorMode;

    const/16 v10, 0xa0

    const-string v12, "RcxCelsius"

    const/4 v13, 0x5

    invoke-direct {v8, v12, v13, v10}, Lcom/google/appinventor/components/common/NxtSensorMode;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lcom/google/appinventor/components/common/NxtSensorMode;->RcxCelsius:Lcom/google/appinventor/components/common/NxtSensorMode;

    .line 27
    new-instance v10, Lcom/google/appinventor/components/common/NxtSensorMode;

    const/16 v12, 0xc0

    const-string v14, "RcxFahrenheit"

    const/4 v15, 0x6

    invoke-direct {v10, v14, v15, v12}, Lcom/google/appinventor/components/common/NxtSensorMode;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lcom/google/appinventor/components/common/NxtSensorMode;->RcxFahrenheit:Lcom/google/appinventor/components/common/NxtSensorMode;

    .line 28
    new-instance v12, Lcom/google/appinventor/components/common/NxtSensorMode;

    const/16 v14, 0xe0

    const-string v15, "RcxAngleSteps"

    const/4 v13, 0x7

    invoke-direct {v12, v15, v13, v14}, Lcom/google/appinventor/components/common/NxtSensorMode;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lcom/google/appinventor/components/common/NxtSensorMode;->RcxAngleSteps:Lcom/google/appinventor/components/common/NxtSensorMode;

    .line 20
    const/16 v14, 0x8

    new-array v14, v14, [Lcom/google/appinventor/components/common/NxtSensorMode;

    aput-object v0, v14, v2

    aput-object v1, v14, v5

    aput-object v3, v14, v6

    aput-object v4, v14, v9

    aput-object v7, v14, v11

    const/4 v0, 0x5

    aput-object v8, v14, v0

    const/4 v0, 0x6

    aput-object v10, v14, v0

    aput-object v12, v14, v13

    sput-object v14, Lcom/google/appinventor/components/common/NxtSensorMode;->$VALUES:[Lcom/google/appinventor/components/common/NxtSensorMode;

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/appinventor/components/common/NxtSensorMode;->lookup:Ljava/util/Map;

    .line 43
    invoke-static {}, Lcom/google/appinventor/components/common/NxtSensorMode;->values()[Lcom/google/appinventor/components/common/NxtSensorMode;

    move-result-object v0

    array-length v1, v0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 44
    .local v3, "mode":Lcom/google/appinventor/components/common/NxtSensorMode;
    sget-object v4, Lcom/google/appinventor/components/common/NxtSensorMode;->lookup:Ljava/util/Map;

    invoke-virtual {v3}, Lcom/google/appinventor/components/common/NxtSensorMode;->toUnderlyingValue()Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .end local v3    # "mode":Lcom/google/appinventor/components/common/NxtSensorMode;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 46
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

    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 33
    iput p3, p0, Lcom/google/appinventor/components/common/NxtSensorMode;->value:I

    .line 34
    return-void
.end method

.method public static fromUnderlyingValue(Ljava/lang/Integer;)Lcom/google/appinventor/components/common/NxtSensorMode;
    .locals 1
    .param p0, "mode"    # Ljava/lang/Integer;

    .line 49
    sget-object v0, Lcom/google/appinventor/components/common/NxtSensorMode;->lookup:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/common/NxtSensorMode;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/appinventor/components/common/NxtSensorMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 20
    const-class v0, Lcom/google/appinventor/components/common/NxtSensorMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/common/NxtSensorMode;

    return-object v0
.end method

.method public static values()[Lcom/google/appinventor/components/common/NxtSensorMode;
    .locals 1

    .line 20
    sget-object v0, Lcom/google/appinventor/components/common/NxtSensorMode;->$VALUES:[Lcom/google/appinventor/components/common/NxtSensorMode;

    invoke-virtual {v0}, [Lcom/google/appinventor/components/common/NxtSensorMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/appinventor/components/common/NxtSensorMode;

    return-object v0
.end method


# virtual methods
.method public toUnderlyingValue()Ljava/lang/Integer;
    .locals 1

    .line 37
    iget v0, p0, Lcom/google/appinventor/components/common/NxtSensorMode;->value:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toUnderlyingValue()Ljava/lang/Object;
    .locals 1

    .line 20
    invoke-virtual {p0}, Lcom/google/appinventor/components/common/NxtSensorMode;->toUnderlyingValue()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
