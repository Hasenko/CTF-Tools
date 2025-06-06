.class Landroidx/emoji2/text/MetadataRepo$Node;
.super Ljava/lang/Object;
.source "MetadataRepo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/emoji2/text/MetadataRepo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Node"
.end annotation


# instance fields
.field private final mChildren:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroidx/emoji2/text/MetadataRepo$Node;",
            ">;"
        }
    .end annotation
.end field

.field private mData:Landroidx/emoji2/text/TypefaceEmojiRasterizer;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 244
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroidx/emoji2/text/MetadataRepo$Node;-><init>(I)V

    .line 245
    return-void
.end method

.method constructor <init>(I)V
    .locals 1
    .param p1, "defaultChildrenSize"    # I

    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 249
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0, p1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Landroidx/emoji2/text/MetadataRepo$Node;->mChildren:Landroid/util/SparseArray;

    .line 250
    return-void
.end method


# virtual methods
.method get(I)Landroidx/emoji2/text/MetadataRepo$Node;
    .locals 1
    .param p1, "key"    # I

    .line 253
    iget-object v0, p0, Landroidx/emoji2/text/MetadataRepo$Node;->mChildren:Landroid/util/SparseArray;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/emoji2/text/MetadataRepo$Node;->mChildren:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/emoji2/text/MetadataRepo$Node;

    :goto_0
    return-object v0
.end method

.method final getData()Landroidx/emoji2/text/TypefaceEmojiRasterizer;
    .locals 1

    .line 257
    iget-object v0, p0, Landroidx/emoji2/text/MetadataRepo$Node;->mData:Landroidx/emoji2/text/TypefaceEmojiRasterizer;

    return-object v0
.end method

.method put(Landroidx/emoji2/text/TypefaceEmojiRasterizer;II)V
    .locals 3
    .param p1, "data"    # Landroidx/emoji2/text/TypefaceEmojiRasterizer;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .line 262
    invoke-virtual {p1, p2}, Landroidx/emoji2/text/TypefaceEmojiRasterizer;->getCodepointAt(I)I

    move-result v0

    invoke-virtual {p0, v0}, Landroidx/emoji2/text/MetadataRepo$Node;->get(I)Landroidx/emoji2/text/MetadataRepo$Node;

    move-result-object v0

    .line 263
    .local v0, "node":Landroidx/emoji2/text/MetadataRepo$Node;
    if-nez v0, :cond_0

    .line 264
    new-instance v1, Landroidx/emoji2/text/MetadataRepo$Node;

    invoke-direct {v1}, Landroidx/emoji2/text/MetadataRepo$Node;-><init>()V

    move-object v0, v1

    .line 265
    iget-object v1, p0, Landroidx/emoji2/text/MetadataRepo$Node;->mChildren:Landroid/util/SparseArray;

    invoke-virtual {p1, p2}, Landroidx/emoji2/text/TypefaceEmojiRasterizer;->getCodepointAt(I)I

    move-result v2

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 268
    :cond_0
    if-le p3, p2, :cond_1

    .line 269
    add-int/lit8 v1, p2, 0x1

    invoke-virtual {v0, p1, v1, p3}, Landroidx/emoji2/text/MetadataRepo$Node;->put(Landroidx/emoji2/text/TypefaceEmojiRasterizer;II)V

    goto :goto_0

    .line 271
    :cond_1
    iput-object p1, v0, Landroidx/emoji2/text/MetadataRepo$Node;->mData:Landroidx/emoji2/text/TypefaceEmojiRasterizer;

    .line 273
    :goto_0
    return-void
.end method
