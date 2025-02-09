.class public final enum Lcom/google/appinventor/components/common/ScreenOrientation;
.super Ljava/lang/Enum;
.source "ScreenOrientation.java"

# interfaces
.implements Lcom/google/appinventor/components/common/OptionList;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/appinventor/components/common/ScreenOrientation;",
        ">;",
        "Lcom/google/appinventor/components/common/OptionList<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/appinventor/components/common/ScreenOrientation;

.field public static final enum Behind:Lcom/google/appinventor/components/common/ScreenOrientation;

.field public static final enum FullSensor:Lcom/google/appinventor/components/common/ScreenOrientation;

.field public static final enum Landscape:Lcom/google/appinventor/components/common/ScreenOrientation;

.field public static final enum NoSensor:Lcom/google/appinventor/components/common/ScreenOrientation;

.field public static final enum Portrait:Lcom/google/appinventor/components/common/ScreenOrientation;

.field public static final enum ReverseLandscape:Lcom/google/appinventor/components/common/ScreenOrientation;

.field public static final enum ReversePortrait:Lcom/google/appinventor/components/common/ScreenOrientation;

.field public static final enum Sensor:Lcom/google/appinventor/components/common/ScreenOrientation;

.field public static final enum SensorLandscape:Lcom/google/appinventor/components/common/ScreenOrientation;

.field public static final enum SensorPortrait:Lcom/google/appinventor/components/common/ScreenOrientation;

.field public static final enum Unspecified:Lcom/google/appinventor/components/common/ScreenOrientation;

.field public static final enum User:Lcom/google/appinventor/components/common/ScreenOrientation;

.field private static final lookup:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/appinventor/components/common/ScreenOrientation;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private orientationConst:I

.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 15
    new-instance v0, Lcom/google/appinventor/components/common/ScreenOrientation;

    const-string v1, "Unspecified"

    const/4 v2, 0x0

    const-string v3, "unspecified"

    const/4 v4, 0x4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/appinventor/components/common/ScreenOrientation;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/google/appinventor/components/common/ScreenOrientation;->Unspecified:Lcom/google/appinventor/components/common/ScreenOrientation;

    .line 16
    new-instance v1, Lcom/google/appinventor/components/common/ScreenOrientation;

    const-string v3, "landscape"

    const-string v5, "Landscape"

    const/4 v6, 0x1

    invoke-direct {v1, v5, v6, v3, v2}, Lcom/google/appinventor/components/common/ScreenOrientation;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v1, Lcom/google/appinventor/components/common/ScreenOrientation;->Landscape:Lcom/google/appinventor/components/common/ScreenOrientation;

    .line 17
    new-instance v3, Lcom/google/appinventor/components/common/ScreenOrientation;

    const-string v5, "portrait"

    const-string v7, "Portrait"

    const/4 v8, 0x2

    invoke-direct {v3, v7, v8, v5, v6}, Lcom/google/appinventor/components/common/ScreenOrientation;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v3, Lcom/google/appinventor/components/common/ScreenOrientation;->Portrait:Lcom/google/appinventor/components/common/ScreenOrientation;

    .line 18
    new-instance v5, Lcom/google/appinventor/components/common/ScreenOrientation;

    const-string v7, "sensor"

    const-string v9, "Sensor"

    const/4 v10, 0x3

    invoke-direct {v5, v9, v10, v7, v4}, Lcom/google/appinventor/components/common/ScreenOrientation;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v5, Lcom/google/appinventor/components/common/ScreenOrientation;->Sensor:Lcom/google/appinventor/components/common/ScreenOrientation;

    .line 19
    new-instance v7, Lcom/google/appinventor/components/common/ScreenOrientation;

    const-string v9, "User"

    const-string v11, "user"

    invoke-direct {v7, v9, v4, v11, v8}, Lcom/google/appinventor/components/common/ScreenOrientation;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v7, Lcom/google/appinventor/components/common/ScreenOrientation;->User:Lcom/google/appinventor/components/common/ScreenOrientation;

    .line 20
    new-instance v9, Lcom/google/appinventor/components/common/ScreenOrientation;

    const-string v11, "behind"

    const-string v12, "Behind"

    const/4 v13, 0x5

    invoke-direct {v9, v12, v13, v11, v10}, Lcom/google/appinventor/components/common/ScreenOrientation;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v9, Lcom/google/appinventor/components/common/ScreenOrientation;->Behind:Lcom/google/appinventor/components/common/ScreenOrientation;

    .line 21
    new-instance v11, Lcom/google/appinventor/components/common/ScreenOrientation;

    const-string v12, "nosensor"

    const-string v14, "NoSensor"

    const/4 v15, 0x6

    invoke-direct {v11, v14, v15, v12, v13}, Lcom/google/appinventor/components/common/ScreenOrientation;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v11, Lcom/google/appinventor/components/common/ScreenOrientation;->NoSensor:Lcom/google/appinventor/components/common/ScreenOrientation;

    .line 22
    new-instance v12, Lcom/google/appinventor/components/common/ScreenOrientation;

    const-string v14, "FullSensor"

    const/4 v13, 0x7

    const-string v4, "fullSensor"

    const/16 v10, 0xa

    invoke-direct {v12, v14, v13, v4, v10}, Lcom/google/appinventor/components/common/ScreenOrientation;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v12, Lcom/google/appinventor/components/common/ScreenOrientation;->FullSensor:Lcom/google/appinventor/components/common/ScreenOrientation;

    .line 23
    new-instance v4, Lcom/google/appinventor/components/common/ScreenOrientation;

    const-string v14, "reverseLandscape"

    const-string v8, "ReverseLandscape"

    const/16 v6, 0x8

    invoke-direct {v4, v8, v6, v14, v6}, Lcom/google/appinventor/components/common/ScreenOrientation;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v4, Lcom/google/appinventor/components/common/ScreenOrientation;->ReverseLandscape:Lcom/google/appinventor/components/common/ScreenOrientation;

    .line 24
    new-instance v8, Lcom/google/appinventor/components/common/ScreenOrientation;

    const-string v14, "reversePortrait"

    const-string v6, "ReversePortrait"

    const/16 v2, 0x9

    invoke-direct {v8, v6, v2, v14, v2}, Lcom/google/appinventor/components/common/ScreenOrientation;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v8, Lcom/google/appinventor/components/common/ScreenOrientation;->ReversePortrait:Lcom/google/appinventor/components/common/ScreenOrientation;

    .line 25
    new-instance v6, Lcom/google/appinventor/components/common/ScreenOrientation;

    const-string v14, "SensorLandscape"

    const-string v2, "sensorLandscape"

    invoke-direct {v6, v14, v10, v2, v15}, Lcom/google/appinventor/components/common/ScreenOrientation;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v6, Lcom/google/appinventor/components/common/ScreenOrientation;->SensorLandscape:Lcom/google/appinventor/components/common/ScreenOrientation;

    .line 26
    new-instance v2, Lcom/google/appinventor/components/common/ScreenOrientation;

    const-string v14, "sensorPortrait"

    const-string v10, "SensorPortrait"

    const/16 v15, 0xb

    invoke-direct {v2, v10, v15, v14, v13}, Lcom/google/appinventor/components/common/ScreenOrientation;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v2, Lcom/google/appinventor/components/common/ScreenOrientation;->SensorPortrait:Lcom/google/appinventor/components/common/ScreenOrientation;

    .line 14
    const/16 v10, 0xc

    new-array v10, v10, [Lcom/google/appinventor/components/common/ScreenOrientation;

    const/4 v14, 0x0

    aput-object v0, v10, v14

    const/4 v0, 0x1

    aput-object v1, v10, v0

    const/4 v0, 0x2

    aput-object v3, v10, v0

    const/4 v0, 0x3

    aput-object v5, v10, v0

    const/4 v0, 0x4

    aput-object v7, v10, v0

    const/4 v0, 0x5

    aput-object v9, v10, v0

    const/4 v0, 0x6

    aput-object v11, v10, v0

    aput-object v12, v10, v13

    const/16 v0, 0x8

    aput-object v4, v10, v0

    const/16 v0, 0x9

    aput-object v8, v10, v0

    const/16 v0, 0xa

    aput-object v6, v10, v0

    aput-object v2, v10, v15

    sput-object v10, Lcom/google/appinventor/components/common/ScreenOrientation;->$VALUES:[Lcom/google/appinventor/components/common/ScreenOrientation;

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/appinventor/components/common/ScreenOrientation;->lookup:Ljava/util/Map;

    .line 47
    invoke-static {}, Lcom/google/appinventor/components/common/ScreenOrientation;->values()[Lcom/google/appinventor/components/common/ScreenOrientation;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 48
    .local v3, "orientation":Lcom/google/appinventor/components/common/ScreenOrientation;
    sget-object v4, Lcom/google/appinventor/components/common/ScreenOrientation;->lookup:Ljava/util/Map;

    invoke-virtual {v3}, Lcom/google/appinventor/components/common/ScreenOrientation;->toUnderlyingValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .end local v3    # "orientation":Lcom/google/appinventor/components/common/ScreenOrientation;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 50
    :cond_0
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 0
    .param p3, "val"    # Ljava/lang/String;
    .param p4, "orientation"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 31
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 32
    iput-object p3, p0, Lcom/google/appinventor/components/common/ScreenOrientation;->value:Ljava/lang/String;

    .line 33
    iput p4, p0, Lcom/google/appinventor/components/common/ScreenOrientation;->orientationConst:I

    .line 34
    return-void
.end method

.method public static fromUnderlyingValue(Ljava/lang/String;)Lcom/google/appinventor/components/common/ScreenOrientation;
    .locals 2
    .param p0, "orientation"    # Ljava/lang/String;

    .line 53
    sget-object v0, Lcom/google/appinventor/components/common/ScreenOrientation;->lookup:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/common/ScreenOrientation;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/appinventor/components/common/ScreenOrientation;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 14
    const-class v0, Lcom/google/appinventor/components/common/ScreenOrientation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/common/ScreenOrientation;

    return-object v0
.end method

.method public static values()[Lcom/google/appinventor/components/common/ScreenOrientation;
    .locals 1

    .line 14
    sget-object v0, Lcom/google/appinventor/components/common/ScreenOrientation;->$VALUES:[Lcom/google/appinventor/components/common/ScreenOrientation;

    invoke-virtual {v0}, [Lcom/google/appinventor/components/common/ScreenOrientation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/appinventor/components/common/ScreenOrientation;

    return-object v0
.end method


# virtual methods
.method public getOrientationConstant()I
    .locals 1

    .line 41
    iget v0, p0, Lcom/google/appinventor/components/common/ScreenOrientation;->orientationConst:I

    return v0
.end method

.method public bridge synthetic toUnderlyingValue()Ljava/lang/Object;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/appinventor/components/common/ScreenOrientation;->toUnderlyingValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toUnderlyingValue()Ljava/lang/String;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/google/appinventor/components/common/ScreenOrientation;->value:Ljava/lang/String;

    return-object v0
.end method
