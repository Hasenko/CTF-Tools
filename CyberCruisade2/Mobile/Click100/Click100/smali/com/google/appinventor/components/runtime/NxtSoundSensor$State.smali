.class final enum Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;
.super Ljava/lang/Enum;
.source "NxtSoundSensor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/appinventor/components/runtime/NxtSoundSensor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

.field public static final enum ABOVE_RANGE:Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

.field public static final enum BELOW_RANGE:Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

.field public static final enum UNKNOWN:Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

.field public static final enum WITHIN_RANGE:Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 40
    new-instance v0, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;->UNKNOWN:Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    new-instance v1, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    const-string v3, "BELOW_RANGE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;->BELOW_RANGE:Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    new-instance v3, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    const-string v5, "WITHIN_RANGE"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;->WITHIN_RANGE:Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    new-instance v5, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    const-string v7, "ABOVE_RANGE"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;->ABOVE_RANGE:Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;->$VALUES:[Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 40
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 40
    const-class v0, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    return-object v0
.end method

.method public static values()[Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;
    .locals 1

    .line 40
    sget-object v0, Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;->$VALUES:[Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    invoke-virtual {v0}, [Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/appinventor/components/runtime/NxtSoundSensor$State;

    return-object v0
.end method
