.class Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "ListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/appinventor/components/runtime/ListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DividerItemDecoration"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/ListView;


# direct methods
.method public constructor <init>(Lcom/google/appinventor/components/runtime/ListView;)V
    .locals 0

    .line 1314
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 1315
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 6
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroidx/recyclerview/widget/RecyclerView;
    .param p4, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 1351
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v0

    .line 1352
    .local v0, "position":I
    const/4 v1, 0x1

    .line 1353
    .local v1, "spanCount":I
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetmargins(Lcom/google/appinventor/components/runtime/ListView;)I

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_2

    .line 1354
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v2

    const/4 v4, 0x1

    sub-int/2addr v2, v4

    if-ge v0, v2, :cond_1

    .line 1355
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetorientation(Lcom/google/appinventor/components/runtime/ListView;)I

    move-result v2

    if-ne v2, v4, :cond_0

    .line 1356
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetdividerSize(Lcom/google/appinventor/components/runtime/ListView;)I

    move-result v2

    invoke-virtual {p1, v3, v3, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 1358
    :cond_0
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetdividerSize(Lcom/google/appinventor/components/runtime/ListView;)I

    move-result v2

    invoke-virtual {p1, v3, v3, v3, v2}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 1361
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    goto :goto_0

    .line 1364
    :cond_2
    rem-int v2, v0, v1

    .line 1365
    .local v2, "column":I
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v4}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetmargins(Lcom/google/appinventor/components/runtime/ListView;)I

    move-result v4

    iget-object v5, p0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v5}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetmargins(Lcom/google/appinventor/components/runtime/ListView;)I

    move-result v5

    mul-int v5, v5, v2

    div-int/2addr v5, v1

    sub-int/2addr v4, v5

    iput v4, p1, Landroid/graphics/Rect;->left:I

    .line 1366
    add-int/lit8 v4, v2, 0x1

    iget-object v5, p0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v5}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetmargins(Lcom/google/appinventor/components/runtime/ListView;)I

    move-result v5

    mul-int v4, v4, v5

    div-int/2addr v4, v1

    iput v4, p1, Landroid/graphics/Rect;->right:I

    .line 1367
    if-lt v0, v1, :cond_3

    iget-object v4, p0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v4}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetfirst(Lcom/google/appinventor/components/runtime/ListView;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1368
    :cond_3
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v4, v3}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fputfirst(Lcom/google/appinventor/components/runtime/ListView;Z)V

    .line 1369
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v3}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetmargins(Lcom/google/appinventor/components/runtime/ListView;)I

    move-result v3

    iput v3, p1, Landroid/graphics/Rect;->top:I

    .line 1371
    :cond_4
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v3}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetmargins(Lcom/google/appinventor/components/runtime/ListView;)I

    move-result v3

    iput v3, p1, Landroid/graphics/Rect;->bottom:I

    .line 1373
    .end local v2    # "column":I
    :goto_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 17
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "parent"    # Landroidx/recyclerview/widget/RecyclerView;
    .param p3, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 1320
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-object v2, v0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetmargins(Lcom/google/appinventor/components/runtime/ListView;)I

    move-result v2

    if-nez v2, :cond_4

    .line 1321
    invoke-virtual/range {p2 .. p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I

    move-result v2

    .line 1322
    .local v2, "childCount":I
    iget-object v3, v0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v3}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetorientation(Lcom/google/appinventor/components/runtime/ListView;)I

    move-result v3

    const/4 v4, -0x1

    const/4 v5, 0x1

    if-ne v3, v5, :cond_2

    .line 1323
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    add-int/lit8 v5, v2, -0x1

    if-ge v3, v5, :cond_1

    .line 1324
    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1325
    .local v5, "child":Landroid/view/View;
    invoke-virtual {v1, v5}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v6

    .line 1326
    .local v6, "position":I
    if-eq v6, v4, :cond_0

    .line 1327
    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    move-result v7

    .line 1328
    .local v7, "left":I
    iget-object v8, v0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v8}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetdividerSize(Lcom/google/appinventor/components/runtime/ListView;)I

    move-result v8

    add-int/2addr v8, v7

    .line 1329
    .local v8, "right":I
    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v9

    .line 1330
    .local v9, "top":I
    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    move-result v10

    .line 1331
    .local v10, "bottom":I
    int-to-float v12, v7

    int-to-float v13, v9

    int-to-float v14, v8

    int-to-float v15, v10

    iget-object v11, v0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v11}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetdividerPaint(Lcom/google/appinventor/components/runtime/ListView;)Landroid/graphics/Paint;

    move-result-object v16

    move-object/from16 v11, p1

    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1323
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "position":I
    .end local v7    # "left":I
    .end local v8    # "right":I
    .end local v9    # "top":I
    .end local v10    # "bottom":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .end local v3    # "i":I
    :cond_1
    goto :goto_2

    .line 1335
    :cond_2
    invoke-virtual/range {p2 .. p2}, Landroidx/recyclerview/widget/RecyclerView;->getWidth()I

    move-result v3

    .line 1336
    .local v3, "width":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    add-int/lit8 v6, v2, -0x1

    if-ge v5, v6, :cond_4

    .line 1337
    invoke-virtual {v1, v5}, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 1338
    .local v6, "child":Landroid/view/View;
    invoke-virtual {v1, v6}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v7

    .line 1339
    .local v7, "position":I
    if-eq v7, v4, :cond_3

    .line 1340
    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v8

    .line 1341
    .local v8, "top":I
    iget-object v9, v0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v9}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetdividerSize(Lcom/google/appinventor/components/runtime/ListView;)I

    move-result v9

    add-int/2addr v9, v8

    .line 1342
    .local v9, "bottom":I
    const/4 v11, 0x0

    int-to-float v12, v8

    int-to-float v13, v3

    int-to-float v14, v9

    iget-object v10, v0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;->this$0:Lcom/google/appinventor/components/runtime/ListView;

    invoke-static {v10}, Lcom/google/appinventor/components/runtime/ListView;->-$$Nest$fgetdividerPaint(Lcom/google/appinventor/components/runtime/ListView;)Landroid/graphics/Paint;

    move-result-object v15

    move-object/from16 v10, p1

    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1336
    .end local v6    # "child":Landroid/view/View;
    .end local v7    # "position":I
    .end local v8    # "top":I
    .end local v9    # "bottom":I
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1347
    .end local v2    # "childCount":I
    .end local v3    # "width":I
    .end local v5    # "i":I
    :cond_4
    :goto_2
    return-void
.end method
