.class public Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "ListAdapterWithRecyclerView.java"

# interfaces
.implements Landroid/widget/Filterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$ClickListener;,
        Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;",
        ">;",
        "Landroid/widget/Filterable;"
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "ListAdapterRecyclerView"


# instance fields
.field private backgroundColor:I

.field private clickListener:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$ClickListener;

.field protected final container:Lcom/google/appinventor/components/runtime/ComponentContainer;

.field protected final filter:Landroid/widget/Filter;

.field private imageHeight:I

.field private imageWidth:I

.field private items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private lastQuery:Ljava/lang/String;

.field private layoutType:I

.field private originalItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private originalPositions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private radius:F

.field private selectedItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private selectionColor:I

.field private textDetailColor:I

.field private textDetailFont:Ljava/lang/String;

.field private textDetailSize:F

.field private textMainColor:I

.field private textMainFont:Ljava/lang/String;

.field private textMainSize:F


# direct methods
.method static bridge synthetic -$$Nest$fgetclickListener(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$ClickListener;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->clickListener:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$ClickListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetlastQuery(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->lastQuery:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetoriginalItems(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->originalItems:Ljava/util/List;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetoriginalPositions(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->originalPositions:Ljava/util/List;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputitems(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->items:Ljava/util/List;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputlastQuery(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->lastQuery:Ljava/lang/String;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputoriginalPositions(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->originalPositions:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lcom/google/appinventor/components/runtime/ComponentContainer;Ljava/util/List;IIIFFLjava/lang/String;Ljava/lang/String;IIIII)V
    .locals 1
    .param p1, "container"    # Lcom/google/appinventor/components/runtime/ComponentContainer;
    .param p3, "layoutType"    # I
    .param p4, "textMainColor"    # I
    .param p5, "textDetailColor"    # I
    .param p6, "textMainSize"    # F
    .param p7, "textDetailSize"    # F
    .param p8, "textMainFont"    # Ljava/lang/String;
    .param p9, "textDetailFont"    # Ljava/lang/String;
    .param p10, "backgroundColor"    # I
    .param p11, "selectionColor"    # I
    .param p12, "imageWidth"    # I
    .param p13, "imageHeight"    # I
    .param p14, "radius"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/appinventor/components/runtime/ComponentContainer;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;IIIFF",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIIII)V"
        }
    .end annotation

    .line 116
    .local p2, "data":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->items:Ljava/util/List;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->originalItems:Ljava/util/List;

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->originalPositions:Ljava/util/List;

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->selectedItems:Ljava/util/List;

    .line 62
    const-string v0, ""

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->lastQuery:Ljava/lang/String;

    .line 64
    new-instance v0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;-><init>(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->filter:Landroid/widget/Filter;

    .line 117
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    .line 118
    iput p3, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->layoutType:I

    .line 119
    iput p4, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->textMainColor:I

    .line 120
    iput p5, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->textDetailColor:I

    .line 121
    iput p6, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->textMainSize:F

    .line 122
    iput p7, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->textDetailSize:F

    .line 123
    iput-object p8, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->textMainFont:Ljava/lang/String;

    .line 124
    iput-object p9, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->textDetailFont:Ljava/lang/String;

    .line 125
    iput p10, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->backgroundColor:I

    .line 126
    iput p11, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->selectionColor:I

    .line 127
    iput p12, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->imageWidth:I

    .line 128
    iput p13, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->imageHeight:I

    .line 129
    int-to-float v0, p14

    iput v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->radius:F

    .line 130
    invoke-virtual {p0, p2}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->updateData(Ljava/util/List;)V

    .line 131
    return-void
.end method


# virtual methods
.method public changeSelections(I)V
    .locals 2
    .param p1, "position"    # I

    .line 314
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->originalPositions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 315
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->originalPositions:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    .line 317
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->selectedItems:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 318
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->selectedItems:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 320
    :cond_1
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->selectedItems:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 322
    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyItemChanged(I)V

    .line 323
    return-void
.end method

.method public clearSelections()V
    .locals 1

    .line 326
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->selectedItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 327
    return-void
.end method

.method public getFilter()Landroid/widget/Filter;
    .locals 1

    .line 372
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->filter:Landroid/widget/Filter;

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .line 294
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 39
    check-cast p1, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->onBindViewHolder(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;I)V
    .locals 12
    .param p1, "holder"    # Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;
    .param p2, "position"    # I

    .line 235
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->items:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 236
    .local v0, "o":Ljava/lang/Object;
    new-instance v1, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    invoke-direct {v1}, Lcom/google/appinventor/components/runtime/util/YailDictionary;-><init>()V

    .line 237
    .local v1, "dictItem":Lcom/google/appinventor/components/runtime/util/YailDictionary;
    instance-of v2, v0, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    const-string v3, "Text1"

    if-eqz v2, :cond_1

    .line 238
    move-object v2, v0

    check-cast v2, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    invoke-virtual {v2, v3}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 239
    move-object v1, v0

    check-cast v1, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    goto :goto_0

    .line 241
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 244
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    :goto_0
    invoke-virtual {v1, v3}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 247
    .local v2, "first":Ljava/lang/String;
    const-string v3, ""

    .line 248
    .local v3, "second":Ljava/lang/String;
    const-string v4, "Text2"

    invoke-virtual {v1, v4}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 249
    invoke-virtual {v1, v4}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 251
    :cond_2
    const-string v4, ""

    .line 252
    .local v4, "imageName":Ljava/lang/String;
    const-string v5, "Image"

    invoke-virtual {v1, v5}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 253
    invoke-virtual {v1, v5}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 255
    :cond_3
    iget v5, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->layoutType:I

    if-nez v5, :cond_4

    .line 256
    iget-object v5, p1, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->textViewFirst:Landroid/widget/TextView;

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 257
    :cond_4
    const/4 v6, 0x1

    if-ne v5, v6, :cond_5

    .line 258
    iget-object v5, p1, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->textViewFirst:Landroid/widget/TextView;

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 259
    iget-object v5, p1, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->textViewSecond:Landroid/widget/TextView;

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 260
    :cond_5
    const/4 v6, 0x2

    if-ne v5, v6, :cond_6

    .line 261
    iget-object v5, p1, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->textViewFirst:Landroid/widget/TextView;

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 262
    iget-object v5, p1, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->textViewSecond:Landroid/widget/TextView;

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 263
    :cond_6
    const/4 v6, 0x3

    const-string v7, ": "

    const-string v8, "onBindViewHolder Unable to load image "

    const-string v9, "ListAdapterRecyclerView"

    if-ne v5, v6, :cond_7

    .line 264
    new-instance v5, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    .line 266
    .local v5, "drawable":Landroid/graphics/drawable/Drawable;
    :try_start_0
    iget-object v6, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v6}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v6

    invoke-static {v6, v4}, Lcom/google/appinventor/components/runtime/util/MediaUtil;->getBitmapDrawable(Lcom/google/appinventor/components/runtime/Form;Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v5, v6

    .line 269
    goto :goto_1

    .line 267
    :catch_0
    move-exception v6

    .line 268
    .local v6, "ioe":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v9, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    .end local v6    # "ioe":Ljava/io/IOException;
    :goto_1
    iget-object v6, p1, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->textViewFirst:Landroid/widget/TextView;

    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 271
    iget-object v6, p1, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->imageVieww:Landroid/widget/ImageView;

    invoke-static {v6, v5}, Lcom/google/appinventor/components/runtime/util/ViewUtil;->setImage(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 272
    .end local v5    # "drawable":Landroid/graphics/drawable/Drawable;
    goto :goto_3

    :cond_7
    const/4 v6, 0x4

    if-ne v5, v6, :cond_8

    .line 273
    new-instance v5, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    .line 275
    .restart local v5    # "drawable":Landroid/graphics/drawable/Drawable;
    :try_start_1
    iget-object v6, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v6}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v6

    invoke-static {v6, v4}, Lcom/google/appinventor/components/runtime/util/MediaUtil;->getBitmapDrawable(Lcom/google/appinventor/components/runtime/Form;Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v6
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v5, v6

    .line 278
    goto :goto_2

    .line 276
    :catch_1
    move-exception v6

    .line 277
    .restart local v6    # "ioe":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v9, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    .end local v6    # "ioe":Ljava/io/IOException;
    :goto_2
    iget-object v6, p1, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->textViewFirst:Landroid/widget/TextView;

    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 280
    iget-object v6, p1, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->textViewSecond:Landroid/widget/TextView;

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 281
    iget-object v6, p1, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->imageVieww:Landroid/widget/ImageView;

    invoke-static {v6, v5}, Lcom/google/appinventor/components/runtime/util/ViewUtil;->setImage(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 282
    .end local v5    # "drawable":Landroid/graphics/drawable/Drawable;
    goto :goto_3

    .line 283
    :cond_8
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onBindViewHolder Layout not recognized: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v9, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    :goto_3
    iget-object v5, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->selectedItems:Ljava/util/List;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 286
    iget-object v5, p1, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->cardView:Landroidx/cardview/widget/CardView;

    iget v6, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->selectionColor:I

    invoke-virtual {v5, v6}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    goto :goto_4

    .line 288
    :cond_9
    iget-object v5, p1, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->cardView:Landroidx/cardview/widget/CardView;

    iget v6, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->backgroundColor:I

    invoke-virtual {v5, v6}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 290
    :goto_4
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;
    .locals 19
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .line 145
    move-object/from16 v7, p0

    new-instance v0, Landroidx/cardview/widget/CardView;

    iget-object v1, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    move-object v8, v0

    .line 146
    .local v8, "cardView":Landroidx/cardview/widget/CardView;
    const/16 v0, 0xf

    invoke-virtual {v8, v0, v0, v0, v0}, Landroidx/cardview/widget/CardView;->setContentPadding(IIII)V

    .line 147
    const/4 v1, 0x0

    invoke-virtual {v8, v1}, Landroidx/cardview/widget/CardView;->setPreventCornerOverlap(Z)V

    .line 148
    const/high16 v2, 0x40400000    # 3.0f

    invoke-virtual {v8, v2}, Landroidx/cardview/widget/CardView;->setMaxCardElevation(F)V

    .line 149
    iget v2, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->backgroundColor:I

    invoke-virtual {v8, v2}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 150
    iget v2, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->radius:F

    invoke-virtual {v8, v2}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 151
    const/4 v2, 0x0

    invoke-virtual {v8, v2}, Landroidx/cardview/widget/CardView;->setCardElevation(F)V

    .line 152
    invoke-static {v8, v2}, Landroidx/core/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    .line 154
    const/4 v2, 0x1

    invoke-virtual {v8, v2}, Landroidx/cardview/widget/CardView;->setClickable(Z)V

    .line 155
    invoke-static {}, Landroidx/core/view/ViewCompat;->generateViewId()I

    move-result v9

    .line 156
    .local v9, "idCard":I
    invoke-virtual {v8, v9}, Landroidx/cardview/widget/CardView;->setId(I)V

    .line 158
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    move-object v10, v3

    .line 159
    .local v10, "params1":Landroid/widget/FrameLayout$LayoutParams;
    invoke-virtual {v10, v1, v1, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 162
    new-instance v3, Landroid/widget/TextView;

    iget-object v6, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v6}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v3, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    move-object v11, v3

    .line 163
    .local v11, "textViewFirst":Landroid/widget/TextView;
    invoke-static {}, Landroidx/core/view/ViewCompat;->generateViewId()I

    move-result v12

    .line 164
    .local v12, "idFirst":I
    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setId(I)V

    .line 165
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    move-object v13, v3

    .line 166
    .local v13, "layoutParams1":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v11, v13}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 167
    iget v3, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->textMainSize:F

    invoke-virtual {v11, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 168
    iget v3, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->textMainColor:I

    invoke-virtual {v11, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 169
    iget-object v3, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v3}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v3

    iget-object v6, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->textMainFont:Ljava/lang/String;

    invoke-static {v3, v11, v6, v1, v1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setFontTypeface(Lcom/google/appinventor/components/runtime/Form;Landroid/widget/TextView;Ljava/lang/String;ZZ)V

    .line 170
    new-instance v3, Landroid/widget/LinearLayout;

    iget-object v6, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v6}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v3, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v14, v3

    .line 171
    .local v14, "linearLayout1":Landroid/widget/LinearLayout;
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    move-object v15, v3

    .line 172
    .local v15, "layoutParamslinear1":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v14, v15}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    invoke-virtual {v14, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 176
    iget v3, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->layoutType:I

    const/4 v4, 0x3

    const/4 v6, 0x4

    if-eq v3, v6, :cond_1

    if-ne v3, v4, :cond_0

    goto :goto_0

    .line 187
    :cond_0
    const/4 v0, -0x1

    move/from16 v18, v0

    .local v0, "idImages":I
    goto :goto_1

    .line 178
    .end local v0    # "idImages":I
    :cond_1
    :goto_0
    new-instance v3, Landroid/widget/ImageView;

    iget-object v6, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v6}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v3, v6}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 179
    .local v3, "imageView":Landroid/widget/ImageView;
    invoke-static {}, Landroidx/core/view/ViewCompat;->generateViewId()I

    move-result v6

    .line 180
    .local v6, "idImages":I
    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setId(I)V

    .line 181
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    iget v5, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->imageWidth:I

    iget v4, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->imageHeight:I

    invoke-direct {v2, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 182
    .local v2, "layoutParamsImage":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v2, v1, v1, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 183
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 184
    const/16 v0, 0x10

    invoke-virtual {v14, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 185
    invoke-virtual {v14, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 186
    .end local v2    # "layoutParamsImage":Landroid/widget/LinearLayout$LayoutParams;
    .end local v3    # "imageView":Landroid/widget/ImageView;
    move/from16 v18, v6

    .line 191
    .end local v6    # "idImages":I
    .local v18, "idImages":I
    :goto_1
    iget v0, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->layoutType:I

    if-eqz v0, :cond_6

    const/4 v2, 0x3

    if-ne v0, v2, :cond_2

    goto/16 :goto_3

    .line 197
    :cond_2
    new-instance v0, Landroid/widget/TextView;

    iget-object v2, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v2}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 198
    .local v0, "textViewSecond":Landroid/widget/TextView;
    invoke-static {}, Landroidx/core/view/ViewCompat;->generateViewId()I

    move-result v2

    .line 199
    .local v2, "idSecond":I
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setId(I)V

    .line 200
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 201
    .local v3, "layoutParams2":Landroid/widget/LinearLayout$LayoutParams;
    iget v4, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->textDetailSize:F

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 202
    iget-object v4, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v4}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v4

    iget-object v5, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->textDetailFont:Ljava/lang/String;

    invoke-static {v4, v0, v5, v1, v1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setFontTypeface(Lcom/google/appinventor/components/runtime/Form;Landroid/widget/TextView;Ljava/lang/String;ZZ)V

    .line 203
    iget v4, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->textDetailColor:I

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 204
    iget v4, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->layoutType:I

    const/4 v5, 0x1

    if-eq v4, v5, :cond_5

    const/4 v5, 0x4

    if-ne v4, v5, :cond_3

    goto :goto_2

    .line 216
    :cond_3
    const/4 v5, 0x2

    if-ne v4, v5, :cond_4

    .line 218
    const/16 v4, 0x32

    invoke-virtual {v3, v4, v1, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 219
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 220
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 221
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 223
    invoke-virtual {v14, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 224
    invoke-virtual {v14, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move/from16 v16, v2

    goto :goto_4

    .line 216
    :cond_4
    move/from16 v16, v2

    goto :goto_4

    .line 205
    :cond_5
    :goto_2
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 207
    new-instance v4, Landroid/widget/LinearLayout;

    iget-object v5, v7, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v5}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 208
    .local v4, "linearLayout2":Landroid/widget/LinearLayout;
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x40000000    # 2.0f

    move/from16 v16, v2

    const/4 v2, -0x2

    .end local v2    # "idSecond":I
    .local v16, "idSecond":I
    invoke-direct {v5, v1, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    move-object v1, v5

    .line 209
    .local v1, "layoutParamslinear2":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 210
    const/4 v2, 0x1

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 212
    invoke-virtual {v4, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 213
    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 214
    invoke-virtual {v14, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 216
    .end local v1    # "layoutParamslinear2":Landroid/widget/LinearLayout$LayoutParams;
    .end local v4    # "linearLayout2":Landroid/widget/LinearLayout;
    goto :goto_4

    .line 193
    .end local v0    # "textViewSecond":Landroid/widget/TextView;
    .end local v3    # "layoutParams2":Landroid/widget/LinearLayout$LayoutParams;
    .end local v16    # "idSecond":I
    :cond_6
    :goto_3
    invoke-virtual {v14, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 194
    const/4 v2, -0x1

    move/from16 v16, v2

    .line 227
    .restart local v16    # "idSecond":I
    :goto_4
    invoke-virtual {v8, v10}, Landroidx/cardview/widget/CardView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 228
    invoke-virtual {v8, v14}, Landroidx/cardview/widget/CardView;->addView(Landroid/view/View;)V

    .line 230
    new-instance v17, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object v2, v8

    move v3, v9

    move v4, v12

    move/from16 v5, v16

    move/from16 v6, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;-><init>(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;Landroid/view/View;IIII)V

    return-object v17
.end method

.method public setOnItemClickListener(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$ClickListener;)V
    .locals 0
    .param p1, "clickListener"    # Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$ClickListener;

    .line 363
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->clickListener:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$ClickListener;

    .line 364
    return-void
.end method

.method public toggleSelection(I)V
    .locals 2
    .param p1, "position"    # I

    .line 298
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->originalPositions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 299
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->originalPositions:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    .line 301
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->selectedItems:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 302
    return-void

    .line 304
    :cond_1
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->selectedItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 305
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->selectedItems:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 306
    .local v0, "oldPosition":I
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->selectedItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 307
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyItemChanged(I)V

    .line 309
    .end local v0    # "oldPosition":I
    :cond_2
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->selectedItems:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    invoke-virtual {p0, p1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyItemChanged(I)V

    .line 311
    return-void
.end method

.method public updateData(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 134
    .local p1, "newItems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->originalItems:Ljava/util/List;

    .line 135
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->originalPositions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 136
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->items:Ljava/util/List;

    goto :goto_0

    .line 138
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->filter:Landroid/widget/Filter;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->lastQuery:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    .line 140
    :goto_0
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->clearSelections()V

    .line 141
    return-void
.end method
