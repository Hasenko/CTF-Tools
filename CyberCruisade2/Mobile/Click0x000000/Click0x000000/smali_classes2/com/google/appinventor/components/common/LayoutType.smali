.class public final enum Lcom/google/appinventor/components/common/LayoutType;
.super Ljava/lang/Enum;
.source "LayoutType.java"

# interfaces
.implements Lcom/google/appinventor/components/common/OptionList;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/appinventor/components/common/LayoutType;",
        ">;",
        "Lcom/google/appinventor/components/common/OptionList<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/appinventor/components/common/LayoutType;

.field public static final enum Image_MainText:Lcom/google/appinventor/components/common/LayoutType;

.field public static final enum Image_MainText_DetailText_Vertical:Lcom/google/appinventor/components/common/LayoutType;

.field public static final enum MainText:Lcom/google/appinventor/components/common/LayoutType;
    .annotation runtime Lcom/google/appinventor/components/common/Default;
    .end annotation
.end field

.field public static final enum MainText_DetailText_Horizontal:Lcom/google/appinventor/components/common/LayoutType;

.field public static final enum MainText_DetailText_Vertical:Lcom/google/appinventor/components/common/LayoutType;

.field private static final lookup:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/google/appinventor/components/common/LayoutType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final layout:I


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 15
    new-instance v0, Lcom/google/appinventor/components/common/LayoutType;

    const-string v1, "MainText"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/google/appinventor/components/common/LayoutType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/appinventor/components/common/LayoutType;->MainText:Lcom/google/appinventor/components/common/LayoutType;

    .line 17
    new-instance v1, Lcom/google/appinventor/components/common/LayoutType;

    const-string v3, "MainText_DetailText_Vertical"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/google/appinventor/components/common/LayoutType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/appinventor/components/common/LayoutType;->MainText_DetailText_Vertical:Lcom/google/appinventor/components/common/LayoutType;

    .line 18
    new-instance v3, Lcom/google/appinventor/components/common/LayoutType;

    const-string v5, "MainText_DetailText_Horizontal"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/google/appinventor/components/common/LayoutType;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/google/appinventor/components/common/LayoutType;->MainText_DetailText_Horizontal:Lcom/google/appinventor/components/common/LayoutType;

    .line 19
    new-instance v5, Lcom/google/appinventor/components/common/LayoutType;

    const-string v7, "Image_MainText"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lcom/google/appinventor/components/common/LayoutType;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/google/appinventor/components/common/LayoutType;->Image_MainText:Lcom/google/appinventor/components/common/LayoutType;

    .line 20
    new-instance v7, Lcom/google/appinventor/components/common/LayoutType;

    const-string v9, "Image_MainText_DetailText_Vertical"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v10}, Lcom/google/appinventor/components/common/LayoutType;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/google/appinventor/components/common/LayoutType;->Image_MainText_DetailText_Vertical:Lcom/google/appinventor/components/common/LayoutType;

    .line 14
    const/4 v9, 0x5

    new-array v9, v9, [Lcom/google/appinventor/components/common/LayoutType;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Lcom/google/appinventor/components/common/LayoutType;->$VALUES:[Lcom/google/appinventor/components/common/LayoutType;

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/appinventor/components/common/LayoutType;->lookup:Ljava/util/Map;

    .line 35
    invoke-static {}, Lcom/google/appinventor/components/common/LayoutType;->values()[Lcom/google/appinventor/components/common/LayoutType;

    move-result-object v0

    array-length v1, v0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 36
    .local v3, "value":Lcom/google/appinventor/components/common/LayoutType;
    sget-object v4, Lcom/google/appinventor/components/common/LayoutType;->lookup:Ljava/util/Map;

    invoke-virtual {v3}, Lcom/google/appinventor/components/common/LayoutType;->toUnderlyingValue()Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .end local v3    # "value":Lcom/google/appinventor/components/common/LayoutType;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 38
    :cond_0
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 25
    iput p3, p0, Lcom/google/appinventor/components/common/LayoutType;->layout:I

    .line 26
    return-void
.end method

.method public static fromUnderlyingValue(Ljava/lang/Integer;)Lcom/google/appinventor/components/common/LayoutType;
    .locals 1
    .param p0, "value"    # Ljava/lang/Integer;

    .line 41
    sget-object v0, Lcom/google/appinventor/components/common/LayoutType;->lookup:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/common/LayoutType;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/appinventor/components/common/LayoutType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 14
    const-class v0, Lcom/google/appinventor/components/common/LayoutType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/common/LayoutType;

    return-object v0
.end method

.method public static values()[Lcom/google/appinventor/components/common/LayoutType;
    .locals 1

    .line 14
    sget-object v0, Lcom/google/appinventor/components/common/LayoutType;->$VALUES:[Lcom/google/appinventor/components/common/LayoutType;

    invoke-virtual {v0}, [Lcom/google/appinventor/components/common/LayoutType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/appinventor/components/common/LayoutType;

    return-object v0
.end method


# virtual methods
.method public toUnderlyingValue()Ljava/lang/Integer;
    .locals 1

    .line 29
    iget v0, p0, Lcom/google/appinventor/components/common/LayoutType;->layout:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toUnderlyingValue()Ljava/lang/Object;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/appinventor/components/common/LayoutType;->toUnderlyingValue()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
