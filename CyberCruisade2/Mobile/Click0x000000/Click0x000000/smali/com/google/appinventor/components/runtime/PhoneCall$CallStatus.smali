.class final enum Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;
.super Ljava/lang/Enum;
.source "PhoneCall.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/appinventor/components/runtime/PhoneCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "CallStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

.field public static final enum INCOMING_ANSWERED:Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

.field public static final enum INCOMING_WAITING:Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

.field public static final enum OUTGOING_WAITING:Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 299
    new-instance v0, Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

    const-string v1, "INCOMING_WAITING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;->INCOMING_WAITING:Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

    .line 300
    new-instance v1, Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

    const-string v3, "INCOMING_ANSWERED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;->INCOMING_ANSWERED:Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

    .line 301
    new-instance v3, Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

    const-string v5, "OUTGOING_WAITING"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;->OUTGOING_WAITING:Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

    .line 298
    const/4 v5, 0x3

    new-array v5, v5, [Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;->$VALUES:[Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 298
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 298
    const-class v0, Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

    return-object v0
.end method

.method public static values()[Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;
    .locals 1

    .line 298
    sget-object v0, Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;->$VALUES:[Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

    invoke-virtual {v0}, [Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/appinventor/components/runtime/PhoneCall$CallStatus;

    return-object v0
.end method
