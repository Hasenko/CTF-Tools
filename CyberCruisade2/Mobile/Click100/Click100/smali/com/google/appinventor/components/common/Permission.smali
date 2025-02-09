.class public final enum Lcom/google/appinventor/components/common/Permission;
.super Ljava/lang/Enum;
.source "Permission.java"

# interfaces
.implements Lcom/google/appinventor/components/common/OptionList;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/appinventor/components/common/Permission;",
        ">;",
        "Lcom/google/appinventor/components/common/OptionList<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/appinventor/components/common/Permission;

.field public static final enum AccountManager:Lcom/google/appinventor/components/common/Permission;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum Audio:Lcom/google/appinventor/components/common/Permission;

.field public static final enum Bluetooth:Lcom/google/appinventor/components/common/Permission;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum BluetoothAdmin:Lcom/google/appinventor/components/common/Permission;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum BluetoothAdvertise:Lcom/google/appinventor/components/common/Permission;

.field public static final enum BluetoothConnect:Lcom/google/appinventor/components/common/Permission;

.field public static final enum BluetoothScan:Lcom/google/appinventor/components/common/Permission;

.field public static final enum Camera:Lcom/google/appinventor/components/common/Permission;

.field public static final enum CoarseLocation:Lcom/google/appinventor/components/common/Permission;

.field public static final enum FineLocation:Lcom/google/appinventor/components/common/Permission;

.field public static final enum GetAccounts:Lcom/google/appinventor/components/common/Permission;

.field public static final enum Internet:Lcom/google/appinventor/components/common/Permission;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum LocationExtraCommands:Lcom/google/appinventor/components/common/Permission;

.field public static final enum ManageAccounts:Lcom/google/appinventor/components/common/Permission;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum MockLocation:Lcom/google/appinventor/components/common/Permission;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum NearFieldCommunication:Lcom/google/appinventor/components/common/Permission;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum NetworkState:Lcom/google/appinventor/components/common/Permission;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum ReadContacts:Lcom/google/appinventor/components/common/Permission;

.field public static final enum ReadExternalStorage:Lcom/google/appinventor/components/common/Permission;

.field public static final enum ReadMediaAudio:Lcom/google/appinventor/components/common/Permission;

.field public static final enum ReadMediaImages:Lcom/google/appinventor/components/common/Permission;

.field public static final enum ReadMediaVideo:Lcom/google/appinventor/components/common/Permission;

.field public static final enum UseCredentials:Lcom/google/appinventor/components/common/Permission;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum Vibrate:Lcom/google/appinventor/components/common/Permission;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum WifiState:Lcom/google/appinventor/components/common/Permission;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum WriteExternalStorage:Lcom/google/appinventor/components/common/Permission;

.field private static final lookup:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/appinventor/components/common/Permission;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 29

    .line 15
    new-instance v0, Lcom/google/appinventor/components/common/Permission;

    const-string v1, "ACCESS_COARSE_LOCATION"

    const-string v2, "CoarseLocation"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/google/appinventor/components/common/Permission;->CoarseLocation:Lcom/google/appinventor/components/common/Permission;

    .line 16
    new-instance v1, Lcom/google/appinventor/components/common/Permission;

    const-string v2, "ACCESS_FINE_LOCATION"

    const-string v4, "FineLocation"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/google/appinventor/components/common/Permission;->FineLocation:Lcom/google/appinventor/components/common/Permission;

    .line 17
    new-instance v2, Lcom/google/appinventor/components/common/Permission;

    const-string v4, "ACCESS_MOCK_LOCATION"

    const-string v6, "MockLocation"

    const/4 v7, 0x2

    invoke-direct {v2, v6, v7, v4}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lcom/google/appinventor/components/common/Permission;->MockLocation:Lcom/google/appinventor/components/common/Permission;

    .line 19
    new-instance v4, Lcom/google/appinventor/components/common/Permission;

    const-string v6, "ACCESS_LOCATION_EXTRA_COMMANDS"

    const-string v8, "LocationExtraCommands"

    const/4 v9, 0x3

    invoke-direct {v4, v8, v9, v6}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Lcom/google/appinventor/components/common/Permission;->LocationExtraCommands:Lcom/google/appinventor/components/common/Permission;

    .line 20
    new-instance v6, Lcom/google/appinventor/components/common/Permission;

    const-string v8, "READ_EXTERNAL_STORAGE"

    const-string v10, "ReadExternalStorage"

    const/4 v11, 0x4

    invoke-direct {v6, v10, v11, v8}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v6, Lcom/google/appinventor/components/common/Permission;->ReadExternalStorage:Lcom/google/appinventor/components/common/Permission;

    .line 21
    new-instance v8, Lcom/google/appinventor/components/common/Permission;

    const-string v10, "WRITE_EXTERNAL_STORAGE"

    const-string v12, "WriteExternalStorage"

    const/4 v13, 0x5

    invoke-direct {v8, v12, v13, v10}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v8, Lcom/google/appinventor/components/common/Permission;->WriteExternalStorage:Lcom/google/appinventor/components/common/Permission;

    .line 22
    new-instance v10, Lcom/google/appinventor/components/common/Permission;

    const-string v12, "CAMERA"

    const-string v14, "Camera"

    const/4 v15, 0x6

    invoke-direct {v10, v14, v15, v12}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v10, Lcom/google/appinventor/components/common/Permission;->Camera:Lcom/google/appinventor/components/common/Permission;

    .line 23
    new-instance v12, Lcom/google/appinventor/components/common/Permission;

    const-string v14, "RECORD_AUDIO"

    const-string v15, "Audio"

    const/4 v13, 0x7

    invoke-direct {v12, v15, v13, v14}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v12, Lcom/google/appinventor/components/common/Permission;->Audio:Lcom/google/appinventor/components/common/Permission;

    .line 24
    new-instance v14, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "VIBRATE"

    const-string v13, "Vibrate"

    const/16 v11, 0x8

    invoke-direct {v14, v13, v11, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v14, Lcom/google/appinventor/components/common/Permission;->Vibrate:Lcom/google/appinventor/components/common/Permission;

    .line 26
    new-instance v13, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "INTERNET"

    const-string v11, "Internet"

    const/16 v9, 0x9

    invoke-direct {v13, v11, v9, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v13, Lcom/google/appinventor/components/common/Permission;->Internet:Lcom/google/appinventor/components/common/Permission;

    .line 28
    new-instance v11, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "NFC"

    const-string v9, "NearFieldCommunication"

    const/16 v7, 0xa

    invoke-direct {v11, v9, v7, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v11, Lcom/google/appinventor/components/common/Permission;->NearFieldCommunication:Lcom/google/appinventor/components/common/Permission;

    .line 30
    new-instance v9, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "BLUETOOTH"

    const-string v7, "Bluetooth"

    const/16 v5, 0xb

    invoke-direct {v9, v7, v5, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v9, Lcom/google/appinventor/components/common/Permission;->Bluetooth:Lcom/google/appinventor/components/common/Permission;

    .line 32
    new-instance v7, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "BLUETOOTH_ADMIN"

    const-string v5, "BluetoothAdmin"

    const/16 v3, 0xc

    invoke-direct {v7, v5, v3, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v7, Lcom/google/appinventor/components/common/Permission;->BluetoothAdmin:Lcom/google/appinventor/components/common/Permission;

    .line 34
    new-instance v5, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "ACCESS_WIFI_STATE"

    const-string v3, "WifiState"

    move-object/from16 v16, v7

    const/16 v7, 0xd

    invoke-direct {v5, v3, v7, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lcom/google/appinventor/components/common/Permission;->WifiState:Lcom/google/appinventor/components/common/Permission;

    .line 36
    new-instance v3, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "ACCESS_NETWORK_STATE"

    const-string v7, "NetworkState"

    move-object/from16 v17, v5

    const/16 v5, 0xe

    invoke-direct {v3, v7, v5, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lcom/google/appinventor/components/common/Permission;->NetworkState:Lcom/google/appinventor/components/common/Permission;

    .line 38
    new-instance v7, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "ACCOUNT_MANAGER"

    const-string v5, "AccountManager"

    move-object/from16 v18, v3

    const/16 v3, 0xf

    invoke-direct {v7, v5, v3, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v7, Lcom/google/appinventor/components/common/Permission;->AccountManager:Lcom/google/appinventor/components/common/Permission;

    .line 40
    new-instance v5, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "MANAGE_ACCOUNTS"

    const-string v3, "ManageAccounts"

    move-object/from16 v19, v7

    const/16 v7, 0x10

    invoke-direct {v5, v3, v7, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lcom/google/appinventor/components/common/Permission;->ManageAccounts:Lcom/google/appinventor/components/common/Permission;

    .line 42
    new-instance v3, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "GET_ACCOUNTS"

    const-string v7, "GetAccounts"

    move-object/from16 v20, v5

    const/16 v5, 0x11

    invoke-direct {v3, v7, v5, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lcom/google/appinventor/components/common/Permission;->GetAccounts:Lcom/google/appinventor/components/common/Permission;

    .line 43
    new-instance v7, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "READ_CONTACTS"

    const-string v5, "ReadContacts"

    move-object/from16 v21, v3

    const/16 v3, 0x12

    invoke-direct {v7, v5, v3, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v7, Lcom/google/appinventor/components/common/Permission;->ReadContacts:Lcom/google/appinventor/components/common/Permission;

    .line 44
    new-instance v5, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "USE_CREDENTIALS"

    const-string v3, "UseCredentials"

    move-object/from16 v22, v7

    const/16 v7, 0x13

    invoke-direct {v5, v3, v7, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lcom/google/appinventor/components/common/Permission;->UseCredentials:Lcom/google/appinventor/components/common/Permission;

    .line 47
    new-instance v3, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "BLUETOOTH_ADVERTISE"

    const-string v7, "BluetoothAdvertise"

    move-object/from16 v23, v5

    const/16 v5, 0x14

    invoke-direct {v3, v7, v5, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lcom/google/appinventor/components/common/Permission;->BluetoothAdvertise:Lcom/google/appinventor/components/common/Permission;

    .line 48
    new-instance v7, Lcom/google/appinventor/components/common/Permission;

    const-string v15, "BLUETOOTH_CONNECT"

    const-string v5, "BluetoothConnect"

    move-object/from16 v24, v3

    const/16 v3, 0x15

    invoke-direct {v7, v5, v3, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v7, Lcom/google/appinventor/components/common/Permission;->BluetoothConnect:Lcom/google/appinventor/components/common/Permission;

    .line 49
    new-instance v5, Lcom/google/appinventor/components/common/Permission;

    const/16 v15, 0x16

    const-string v3, "BLUETOOTH_SCAN"

    move-object/from16 v25, v7

    const-string v7, "BluetoothScan"

    invoke-direct {v5, v7, v15, v3}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lcom/google/appinventor/components/common/Permission;->BluetoothScan:Lcom/google/appinventor/components/common/Permission;

    .line 51
    new-instance v3, Lcom/google/appinventor/components/common/Permission;

    const/16 v7, 0x17

    const-string v15, "READ_MEDIA_IMAGES"

    move-object/from16 v26, v5

    const-string v5, "ReadMediaImages"

    invoke-direct {v3, v5, v7, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lcom/google/appinventor/components/common/Permission;->ReadMediaImages:Lcom/google/appinventor/components/common/Permission;

    .line 52
    new-instance v5, Lcom/google/appinventor/components/common/Permission;

    const/16 v7, 0x18

    const-string v15, "READ_MEDIA_VIDEO"

    move-object/from16 v27, v3

    const-string v3, "ReadMediaVideo"

    invoke-direct {v5, v3, v7, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lcom/google/appinventor/components/common/Permission;->ReadMediaVideo:Lcom/google/appinventor/components/common/Permission;

    .line 53
    new-instance v3, Lcom/google/appinventor/components/common/Permission;

    const/16 v7, 0x19

    const-string v15, "READ_MEDIA_AUDIO"

    move-object/from16 v28, v5

    const-string v5, "ReadMediaAudio"

    invoke-direct {v3, v5, v7, v15}, Lcom/google/appinventor/components/common/Permission;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lcom/google/appinventor/components/common/Permission;->ReadMediaAudio:Lcom/google/appinventor/components/common/Permission;

    .line 14
    const/16 v5, 0x1a

    new-array v5, v5, [Lcom/google/appinventor/components/common/Permission;

    const/4 v7, 0x0

    aput-object v0, v5, v7

    const/4 v0, 0x1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v2, v5, v0

    const/4 v0, 0x3

    aput-object v4, v5, v0

    const/4 v0, 0x4

    aput-object v6, v5, v0

    const/4 v0, 0x5

    aput-object v8, v5, v0

    const/4 v0, 0x6

    aput-object v10, v5, v0

    const/4 v0, 0x7

    aput-object v12, v5, v0

    const/16 v0, 0x8

    aput-object v14, v5, v0

    const/16 v0, 0x9

    aput-object v13, v5, v0

    const/16 v0, 0xa

    aput-object v11, v5, v0

    const/16 v0, 0xb

    aput-object v9, v5, v0

    const/16 v0, 0xc

    aput-object v16, v5, v0

    const/16 v0, 0xd

    aput-object v17, v5, v0

    const/16 v0, 0xe

    aput-object v18, v5, v0

    const/16 v0, 0xf

    aput-object v19, v5, v0

    const/16 v0, 0x10

    aput-object v20, v5, v0

    const/16 v0, 0x11

    aput-object v21, v5, v0

    const/16 v0, 0x12

    aput-object v22, v5, v0

    const/16 v0, 0x13

    aput-object v23, v5, v0

    const/16 v0, 0x14

    aput-object v24, v5, v0

    const/16 v0, 0x15

    aput-object v25, v5, v0

    const/16 v0, 0x16

    aput-object v26, v5, v0

    const/16 v0, 0x17

    aput-object v27, v5, v0

    const/16 v0, 0x18

    aput-object v28, v5, v0

    const/16 v0, 0x19

    aput-object v3, v5, v0

    sput-object v5, Lcom/google/appinventor/components/common/Permission;->$VALUES:[Lcom/google/appinventor/components/common/Permission;

    .line 65
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/appinventor/components/common/Permission;->lookup:Ljava/util/Map;

    .line 68
    invoke-static {}, Lcom/google/appinventor/components/common/Permission;->values()[Lcom/google/appinventor/components/common/Permission;

    move-result-object v0

    array-length v1, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v2, v0, v3

    .line 69
    .local v2, "perm":Lcom/google/appinventor/components/common/Permission;
    sget-object v4, Lcom/google/appinventor/components/common/Permission;->lookup:Ljava/util/Map;

    invoke-virtual {v2}, Lcom/google/appinventor/components/common/Permission;->toUnderlyingValue()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .end local v2    # "perm":Lcom/google/appinventor/components/common/Permission;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 71
    :cond_0
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "perm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 57
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 58
    iput-object p3, p0, Lcom/google/appinventor/components/common/Permission;->value:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public static fromUnderlyingValue(Ljava/lang/String;)Lcom/google/appinventor/components/common/Permission;
    .locals 1
    .param p0, "perm"    # Ljava/lang/String;

    .line 74
    sget-object v0, Lcom/google/appinventor/components/common/Permission;->lookup:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/common/Permission;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/appinventor/components/common/Permission;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 14
    const-class v0, Lcom/google/appinventor/components/common/Permission;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/common/Permission;

    return-object v0
.end method

.method public static values()[Lcom/google/appinventor/components/common/Permission;
    .locals 1

    .line 14
    sget-object v0, Lcom/google/appinventor/components/common/Permission;->$VALUES:[Lcom/google/appinventor/components/common/Permission;

    invoke-virtual {v0}, [Lcom/google/appinventor/components/common/Permission;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/appinventor/components/common/Permission;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic toUnderlyingValue()Ljava/lang/Object;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/appinventor/components/common/Permission;->toUnderlyingValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toUnderlyingValue()Ljava/lang/String;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/google/appinventor/components/common/Permission;->value:Ljava/lang/String;

    return-object v0
.end method
