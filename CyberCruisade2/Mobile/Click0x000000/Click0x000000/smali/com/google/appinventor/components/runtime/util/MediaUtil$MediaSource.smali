.class final enum Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;
.super Ljava/lang/Enum;
.source "MediaUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/appinventor/components/runtime/util/MediaUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "MediaSource"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

.field public static final enum ASSET:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

.field public static final enum CONTACT_URI:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

.field public static final enum CONTENT_URI:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

.field public static final enum FILE_URL:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

.field public static final enum PRIVATE_DATA:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

.field public static final enum REPL_ASSET:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

.field public static final enum SDCARD:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

.field public static final enum URL:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 61
    new-instance v0, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    const-string v1, "ASSET"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;->ASSET:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    .line 62
    new-instance v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    const-string v3, "REPL_ASSET"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;->REPL_ASSET:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    .line 63
    new-instance v3, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    const-string v5, "SDCARD"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;->SDCARD:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    .line 64
    new-instance v5, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    const-string v7, "FILE_URL"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;->FILE_URL:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    .line 65
    new-instance v7, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    const-string v9, "URL"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;->URL:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    .line 66
    new-instance v9, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    const-string v11, "CONTENT_URI"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;->CONTENT_URI:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    .line 67
    new-instance v11, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    const-string v13, "CONTACT_URI"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;->CONTACT_URI:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    .line 68
    new-instance v13, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    const-string v15, "PRIVATE_DATA"

    const/4 v14, 0x7

    invoke-direct {v13, v15, v14}, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;->PRIVATE_DATA:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    .line 60
    const/16 v15, 0x8

    new-array v15, v15, [Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    aput-object v0, v15, v2

    aput-object v1, v15, v4

    aput-object v3, v15, v6

    aput-object v5, v15, v8

    aput-object v7, v15, v10

    aput-object v9, v15, v12

    const/4 v0, 0x6

    aput-object v11, v15, v0

    aput-object v13, v15, v14

    sput-object v15, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;->$VALUES:[Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 60
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 60
    const-class v0, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    return-object v0
.end method

.method public static values()[Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;
    .locals 1

    .line 60
    sget-object v0, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;->$VALUES:[Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    invoke-virtual {v0}, [Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    return-object v0
.end method
