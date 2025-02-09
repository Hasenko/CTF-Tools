.class Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "ListAdapterWithRecyclerView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RvViewHolder"
.end annotation


# instance fields
.field public cardView:Landroidx/cardview/widget/CardView;

.field public imageVieww:Landroid/widget/ImageView;

.field public textViewFirst:Landroid/widget/TextView;

.field public textViewSecond:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;


# direct methods
.method public constructor <init>(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;Landroid/view/View;IIII)V
    .locals 2
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "idCard"    # I
    .param p4, "idFirst"    # I
    .param p5, "idSecond"    # I
    .param p6, "idImages"    # I

    .line 336
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    .line 337
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 339
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 341
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/cardview/widget/CardView;

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->cardView:Landroidx/cardview/widget/CardView;

    .line 342
    invoke-virtual {p2, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->textViewFirst:Landroid/widget/TextView;

    .line 344
    const/4 v0, -0x1

    if-eq p5, v0, :cond_0

    .line 345
    invoke-virtual {p2, p5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->textViewSecond:Landroid/widget/TextView;

    .line 347
    :cond_0
    if-eq p6, v0, :cond_1

    .line 348
    invoke-virtual {p2, p6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->imageVieww:Landroid/widget/ImageView;

    .line 350
    :cond_1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 353
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->getAdapterPosition()I

    move-result v0

    .line 355
    .local v0, "position":I
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-static {v1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fgetoriginalPositions(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 356
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-static {v1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fgetoriginalPositions(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 358
    :cond_0
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$RvViewHolder;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-static {v1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fgetclickListener(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$ClickListener;

    move-result-object v1

    invoke-interface {v1, v0, p1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$ClickListener;->onItemClick(ILandroid/view/View;)V

    .line 359
    return-void
.end method
