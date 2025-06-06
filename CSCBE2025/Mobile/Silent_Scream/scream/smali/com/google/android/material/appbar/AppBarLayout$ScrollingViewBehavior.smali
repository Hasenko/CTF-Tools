.class public Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;
.super Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;
.source "AppBarLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/appbar/AppBarLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ScrollingViewBehavior"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2367
    invoke-direct {p0}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 2370
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2372
    sget-object v0, Lcom/google/android/material/R$styleable;->ScrollingViewBehavior_Layout:[I

    .line 2373
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 2374
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Lcom/google/android/material/R$styleable;->ScrollingViewBehavior_Layout_behavior_overlapTop:I

    .line 2375
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    .line 2374
    invoke-virtual {p0, v1}, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->setOverlayTop(I)V

    .line 2376
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 2377
    return-void
.end method

.method private static getAppBarLayoutOffset(Lcom/google/android/material/appbar/AppBarLayout;)I
    .locals 2
    .param p0, "abl"    # Lcom/google/android/material/appbar/AppBarLayout;

    .line 2465
    nop

    .line 2466
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$LayoutParams;

    invoke-virtual {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 2467
    .local v0, "behavior":Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
    instance-of v1, v0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    if-eqz v1, :cond_0

    .line 2468
    move-object v1, v0

    check-cast v1, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    invoke-virtual {v1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v1

    return v1

    .line 2470
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method private offsetChildAsNeeded(Landroid/view/View;Landroid/view/View;)V
    .locals 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "dependency"    # Landroid/view/View;

    .line 2427
    nop

    .line 2428
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$LayoutParams;

    invoke-virtual {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 2429
    .local v0, "behavior":Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
    instance-of v1, v0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    if-eqz v1, :cond_0

    .line 2432
    move-object v1, v0

    check-cast v1, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    .line 2433
    .local v1, "ablBehavior":Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;
    nop

    .line 2435
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v3

    sub-int/2addr v2, v3

    .line 2436
    invoke-static {v1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->access$200(Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;)I

    move-result v3

    add-int/2addr v2, v3

    .line 2437
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->getVerticalLayoutGap()I

    move-result v3

    add-int/2addr v2, v3

    .line 2438
    invoke-virtual {p0, p2}, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->getOverlapPixelsForOffset(Landroid/view/View;)I

    move-result v3

    sub-int/2addr v2, v3

    .line 2433
    invoke-static {p1, v2}, Landroidx/core/view/ViewCompat;->offsetTopAndBottom(Landroid/view/View;I)V

    .line 2440
    .end local v1    # "ablBehavior":Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;
    :cond_0
    return-void
.end method

.method private updateLiftedStateIfNeeded(Landroid/view/View;Landroid/view/View;)V
    .locals 2
    .param p1, "child"    # Landroid/view/View;
    .param p2, "dependency"    # Landroid/view/View;

    .line 2495
    instance-of v0, p2, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v0, :cond_0

    .line 2496
    move-object v0, p2

    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 2497
    .local v0, "appBarLayout":Lcom/google/android/material/appbar/AppBarLayout;
    invoke-virtual {v0}, Lcom/google/android/material/appbar/AppBarLayout;->isLiftOnScroll()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2498
    invoke-virtual {v0, p1}, Lcom/google/android/material/appbar/AppBarLayout;->shouldLift(Landroid/view/View;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/appbar/AppBarLayout;->setLiftedState(Z)Z

    .line 2501
    .end local v0    # "appBarLayout":Lcom/google/android/material/appbar/AppBarLayout;
    :cond_0
    return-void
.end method


# virtual methods
.method bridge synthetic findFirstDependency(Ljava/util/List;)Landroid/view/View;
    .locals 0

    .line 2365
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->findFirstDependency(Ljava/util/List;)Lcom/google/android/material/appbar/AppBarLayout;

    move-result-object p1

    return-object p1
.end method

.method findFirstDependency(Ljava/util/List;)Lcom/google/android/material/appbar/AppBarLayout;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)",
            "Lcom/google/android/material/appbar/AppBarLayout;"
        }
    .end annotation

    .line 2476
    .local p1, "views":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "z":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 2477
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 2478
    .local v2, "view":Landroid/view/View;
    instance-of v3, v2, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v3, :cond_0

    .line 2479
    move-object v3, v2

    check-cast v3, Lcom/google/android/material/appbar/AppBarLayout;

    return-object v3

    .line 2476
    .end local v2    # "view":Landroid/view/View;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2482
    .end local v0    # "i":I
    .end local v1    # "z":I
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic getLeftAndRightOffset()I
    .locals 1

    .line 2365
    invoke-super {p0}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->getLeftAndRightOffset()I

    move-result v0

    return v0
.end method

.method getOverlapRatioForOffset(Landroid/view/View;)F
    .locals 7
    .param p1, "header"    # Landroid/view/View;

    .line 2444
    instance-of v0, p1, Lcom/google/android/material/appbar/AppBarLayout;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 2445
    move-object v0, p1

    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 2446
    .local v0, "abl":Lcom/google/android/material/appbar/AppBarLayout;
    invoke-virtual {v0}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    move-result v2

    .line 2447
    .local v2, "totalScrollRange":I
    invoke-virtual {v0}, Lcom/google/android/material/appbar/AppBarLayout;->getDownNestedPreScrollRange()I

    move-result v3

    .line 2448
    .local v3, "preScrollDown":I
    invoke-static {v0}, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->getAppBarLayoutOffset(Lcom/google/android/material/appbar/AppBarLayout;)I

    move-result v4

    .line 2450
    .local v4, "offset":I
    if-eqz v3, :cond_0

    add-int v5, v2, v4

    if-gt v5, v3, :cond_0

    .line 2452
    return v1

    .line 2454
    :cond_0
    sub-int v5, v2, v3

    .line 2455
    .local v5, "availScrollRange":I
    if-eqz v5, :cond_1

    .line 2457
    int-to-float v1, v4

    int-to-float v6, v5

    div-float/2addr v1, v6

    const/high16 v6, 0x3f800000    # 1.0f

    add-float/2addr v1, v6

    return v1

    .line 2461
    .end local v0    # "abl":Lcom/google/android/material/appbar/AppBarLayout;
    .end local v2    # "totalScrollRange":I
    .end local v3    # "preScrollDown":I
    .end local v4    # "offset":I
    .end local v5    # "availScrollRange":I
    :cond_1
    return v1
.end method

.method getScrollRange(Landroid/view/View;)I
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 2487
    instance-of v0, p1, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v0, :cond_0

    .line 2488
    move-object v0, p1

    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {v0}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    return v0

    .line 2490
    :cond_0
    invoke-super {p0, p1}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->getScrollRange(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic getTopAndBottomOffset()I
    .locals 1

    .line 2365
    invoke-super {p0}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->getTopAndBottomOffset()I

    move-result v0

    return v0
.end method

.method public bridge synthetic isHorizontalOffsetEnabled()Z
    .locals 1

    .line 2365
    invoke-super {p0}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->isHorizontalOffsetEnabled()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic isVerticalOffsetEnabled()Z
    .locals 1

    .line 2365
    invoke-super {p0}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->isVerticalOffsetEnabled()Z

    move-result v0

    return v0
.end method

.method public layoutDependsOn(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .locals 1
    .param p1, "parent"    # Landroidx/coordinatorlayout/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "dependency"    # Landroid/view/View;

    .line 2382
    instance-of v0, p3, Lcom/google/android/material/appbar/AppBarLayout;

    return v0
.end method

.method public onDependentViewChanged(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .locals 1
    .param p1, "parent"    # Landroidx/coordinatorlayout/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "dependency"    # Landroid/view/View;

    .line 2388
    invoke-direct {p0, p2, p3}, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->offsetChildAsNeeded(Landroid/view/View;Landroid/view/View;)V

    .line 2389
    invoke-direct {p0, p2, p3}, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->updateLiftedStateIfNeeded(Landroid/view/View;Landroid/view/View;)V

    .line 2390
    const/4 v0, 0x0

    return v0
.end method

.method public onDependentViewRemoved(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .param p1, "parent"    # Landroidx/coordinatorlayout/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "dependency"    # Landroid/view/View;

    .line 2396
    instance-of v0, p3, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v0, :cond_0

    .line 2397
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    .line 2399
    :cond_0
    return-void
.end method

.method public bridge synthetic onLayoutChild(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .locals 0

    .line 2365
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->onLayoutChild(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic onMeasureChild(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;IIII)Z
    .locals 0

    .line 2365
    invoke-super/range {p0 .. p6}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->onMeasureChild(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;IIII)Z

    move-result p1

    return p1
.end method

.method public onRequestChildRectangleOnScreen(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .locals 6
    .param p1, "parent"    # Landroidx/coordinatorlayout/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "rectangle"    # Landroid/graphics/Rect;
    .param p4, "immediate"    # Z

    .line 2407
    invoke-virtual {p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->getDependencies(Landroid/view/View;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->findFirstDependency(Ljava/util/List;)Lcom/google/android/material/appbar/AppBarLayout;

    move-result-object v0

    .line 2408
    .local v0, "header":Lcom/google/android/material/appbar/AppBarLayout;
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2410
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, p3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 2411
    .local v2, "offsetRect":Landroid/graphics/Rect;
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 2413
    iget-object v3, p0, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->tempRect1:Landroid/graphics/Rect;

    .line 2414
    .local v3, "parentRect":Landroid/graphics/Rect;
    invoke-virtual {p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->getHeight()I

    move-result v5

    invoke-virtual {v3, v1, v1, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 2416
    invoke-virtual {v3, v2}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 2419
    xor-int/lit8 v4, p4, 0x1

    invoke-virtual {v0, v1, v4}, Lcom/google/android/material/appbar/AppBarLayout;->setExpanded(ZZ)V

    .line 2420
    const/4 v1, 0x1

    return v1

    .line 2423
    .end local v2    # "offsetRect":Landroid/graphics/Rect;
    .end local v3    # "parentRect":Landroid/graphics/Rect;
    :cond_0
    return v1
.end method

.method public bridge synthetic setHorizontalOffsetEnabled(Z)V
    .locals 0

    .line 2365
    invoke-super {p0, p1}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->setHorizontalOffsetEnabled(Z)V

    return-void
.end method

.method public bridge synthetic setLeftAndRightOffset(I)Z
    .locals 0

    .line 2365
    invoke-super {p0, p1}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->setLeftAndRightOffset(I)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic setTopAndBottomOffset(I)Z
    .locals 0

    .line 2365
    invoke-super {p0, p1}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->setTopAndBottomOffset(I)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic setVerticalOffsetEnabled(Z)V
    .locals 0

    .line 2365
    invoke-super {p0, p1}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->setVerticalOffsetEnabled(Z)V

    return-void
.end method
