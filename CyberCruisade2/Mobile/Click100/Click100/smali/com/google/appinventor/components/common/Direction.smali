.class public final enum Lcom/google/appinventor/components/common/Direction;
.super Ljava/lang/Enum;
.source "Direction.java"

# interfaces
.implements Lcom/google/appinventor/components/common/OptionList;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/appinventor/components/common/Direction;",
        ">;",
        "Lcom/google/appinventor/components/common/OptionList<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/appinventor/components/common/Direction;

.field public static final enum East:Lcom/google/appinventor/components/common/Direction;

.field public static final enum North:Lcom/google/appinventor/components/common/Direction;

.field public static final enum Northeast:Lcom/google/appinventor/components/common/Direction;

.field public static final enum Northwest:Lcom/google/appinventor/components/common/Direction;

.field public static final enum South:Lcom/google/appinventor/components/common/Direction;

.field public static final enum Southeast:Lcom/google/appinventor/components/common/Direction;

.field public static final enum Southwest:Lcom/google/appinventor/components/common/Direction;

.field public static final enum West:Lcom/google/appinventor/components/common/Direction;

.field private static final lookup:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/google/appinventor/components/common/Direction;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 15
    new-instance v0, Lcom/google/appinventor/components/common/Direction;

    const-string v1, "North"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/appinventor/components/common/Direction;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/appinventor/components/common/Direction;->North:Lcom/google/appinventor/components/common/Direction;

    .line 16
    new-instance v1, Lcom/google/appinventor/components/common/Direction;

    const-string v4, "Northeast"

    const/4 v5, 0x2

    invoke-direct {v1, v4, v3, v5}, Lcom/google/appinventor/components/common/Direction;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/appinventor/components/common/Direction;->Northeast:Lcom/google/appinventor/components/common/Direction;

    .line 17
    new-instance v4, Lcom/google/appinventor/components/common/Direction;

    const-string v6, "East"

    const/4 v7, 0x3

    invoke-direct {v4, v6, v5, v7}, Lcom/google/appinventor/components/common/Direction;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/appinventor/components/common/Direction;->East:Lcom/google/appinventor/components/common/Direction;

    .line 18
    new-instance v6, Lcom/google/appinventor/components/common/Direction;

    const-string v8, "Southeast"

    const/4 v9, 0x4

    invoke-direct {v6, v8, v7, v9}, Lcom/google/appinventor/components/common/Direction;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/google/appinventor/components/common/Direction;->Southeast:Lcom/google/appinventor/components/common/Direction;

    .line 19
    new-instance v8, Lcom/google/appinventor/components/common/Direction;

    const-string v10, "South"

    const/4 v11, -0x1

    invoke-direct {v8, v10, v9, v11}, Lcom/google/appinventor/components/common/Direction;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lcom/google/appinventor/components/common/Direction;->South:Lcom/google/appinventor/components/common/Direction;

    .line 20
    new-instance v10, Lcom/google/appinventor/components/common/Direction;

    const/4 v11, -0x2

    const-string v12, "Southwest"

    const/4 v13, 0x5

    invoke-direct {v10, v12, v13, v11}, Lcom/google/appinventor/components/common/Direction;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lcom/google/appinventor/components/common/Direction;->Southwest:Lcom/google/appinventor/components/common/Direction;

    .line 21
    new-instance v11, Lcom/google/appinventor/components/common/Direction;

    const/4 v12, -0x3

    const-string v14, "West"

    const/4 v15, 0x6

    invoke-direct {v11, v14, v15, v12}, Lcom/google/appinventor/components/common/Direction;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lcom/google/appinventor/components/common/Direction;->West:Lcom/google/appinventor/components/common/Direction;

    .line 22
    new-instance v12, Lcom/google/appinventor/components/common/Direction;

    const/4 v14, -0x4

    const-string v15, "Northwest"

    const/4 v13, 0x7

    invoke-direct {v12, v15, v13, v14}, Lcom/google/appinventor/components/common/Direction;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lcom/google/appinventor/components/common/Direction;->Northwest:Lcom/google/appinventor/components/common/Direction;

    .line 14
    const/16 v14, 0x8

    new-array v14, v14, [Lcom/google/appinventor/components/common/Direction;

    aput-object v0, v14, v2

    aput-object v1, v14, v3

    aput-object v4, v14, v5

    aput-object v6, v14, v7

    aput-object v8, v14, v9

    const/4 v0, 0x5

    aput-object v10, v14, v0

    const/4 v0, 0x6

    aput-object v11, v14, v0

    aput-object v12, v14, v13

    sput-object v14, Lcom/google/appinventor/components/common/Direction;->$VALUES:[Lcom/google/appinventor/components/common/Direction;

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/appinventor/components/common/Direction;->lookup:Ljava/util/Map;

    .line 37
    invoke-static {}, Lcom/google/appinventor/components/common/Direction;->values()[Lcom/google/appinventor/components/common/Direction;

    move-result-object v0

    array-length v1, v0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 38
    .local v3, "dir":Lcom/google/appinventor/components/common/Direction;
    sget-object v4, Lcom/google/appinventor/components/common/Direction;->lookup:Ljava/util/Map;

    invoke-virtual {v3}, Lcom/google/appinventor/components/common/Direction;->toUnderlyingValue()Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .end local v3    # "dir":Lcom/google/appinventor/components/common/Direction;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 40
    :cond_0
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "dir"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 27
    iput p3, p0, Lcom/google/appinventor/components/common/Direction;->value:I

    .line 28
    return-void
.end method

.method public static fromUnderlyingValue(Ljava/lang/Integer;)Lcom/google/appinventor/components/common/Direction;
    .locals 1
    .param p0, "dir"    # Ljava/lang/Integer;

    .line 43
    sget-object v0, Lcom/google/appinventor/components/common/Direction;->lookup:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/common/Direction;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/appinventor/components/common/Direction;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 14
    const-class v0, Lcom/google/appinventor/components/common/Direction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/common/Direction;

    return-object v0
.end method

.method public static values()[Lcom/google/appinventor/components/common/Direction;
    .locals 1

    .line 14
    sget-object v0, Lcom/google/appinventor/components/common/Direction;->$VALUES:[Lcom/google/appinventor/components/common/Direction;

    invoke-virtual {v0}, [Lcom/google/appinventor/components/common/Direction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/appinventor/components/common/Direction;

    return-object v0
.end method


# virtual methods
.method public toUnderlyingValue()Ljava/lang/Integer;
    .locals 1

    .line 31
    iget v0, p0, Lcom/google/appinventor/components/common/Direction;->value:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toUnderlyingValue()Ljava/lang/Object;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/appinventor/components/common/Direction;->toUnderlyingValue()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
