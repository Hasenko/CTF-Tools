.class public final Lbe/dauntless/twister/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\u0003\u001a\u00020\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0014\u00a8\u0006\u0007"
    }
    d2 = {
        "Lbe/dauntless/twister/MainActivity;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "()V",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "app_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static synthetic $r8$lambda$kJHgIYu3ZdYDeeORHhHhm36F4Mo(Landroid/widget/FrameLayout;[Ljava/lang/String;Lbe/dauntless/twister/MainActivity;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lbe/dauntless/twister/MainActivity;->onCreate$lambda$2(Landroid/widget/FrameLayout;[Ljava/lang/String;Lbe/dauntless/twister/MainActivity;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private static final onCreate$lambda$2(Landroid/widget/FrameLayout;[Ljava/lang/String;Lbe/dauntless/twister/MainActivity;)V
    .locals 11

    const-string v0, "$stringArray"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "this$0"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v0

    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v1

    .line 32
    array-length v2, p1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_4

    aget-object v5, p1, v4

    .line 34
    rem-int/lit8 v6, v4, 0x3

    if-gtz v6, :cond_3

    .line 36
    new-instance v6, Landroid/widget/TextView;

    move-object v7, p2

    check-cast v7, Landroid/content/Context;

    invoke-direct {v6, v7}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 37
    check-cast v5, Ljava/lang/CharSequence;

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    sget-object v5, Lkotlin/random/Random;->Default:Lkotlin/random/Random$Default;

    const/16 v7, 0xc

    const/16 v8, 0x1f

    invoke-virtual {v5, v7, v8}, Lkotlin/random/Random$Default;->nextInt(II)I

    move-result v5

    int-to-float v5, v5

    const/4 v7, 0x2

    .line 41
    invoke-virtual {v6, v7, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 42
    sget-object v5, Lkotlin/random/Random;->Default:Lkotlin/random/Random$Default;

    const/16 v8, 0x100

    invoke-virtual {v5, v8}, Lkotlin/random/Random$Default;->nextInt(I)I

    move-result v5

    sget-object v9, Lkotlin/random/Random;->Default:Lkotlin/random/Random$Default;

    invoke-virtual {v9, v8}, Lkotlin/random/Random$Default;->nextInt(I)I

    move-result v9

    sget-object v10, Lkotlin/random/Random;->Default:Lkotlin/random/Random$Default;

    invoke-virtual {v10, v8}, Lkotlin/random/Random$Default;->nextInt(I)I

    move-result v8

    invoke-static {v5, v9, v8}, Landroid/graphics/Color;->rgb(III)I

    move-result v5

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    sget-object v5, Lkotlin/random/Random;->Default:Lkotlin/random/Random$Default;

    const/16 v8, 0x168

    invoke-virtual {v5, v3, v8}, Lkotlin/random/Random$Default;->nextInt(II)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setRotation(F)V

    .line 49
    invoke-virtual {v6, v3, v3}, Landroid/widget/TextView;->measure(II)V

    .line 50
    invoke-virtual {v6}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v5

    .line 51
    invoke-virtual {v6}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v8

    int-to-float v9, v5

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    .line 53
    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setPivotX(F)V

    int-to-float v9, v8

    div-float/2addr v9, v10

    .line 54
    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setPivotY(F)V

    sub-int v5, v0, v5

    if-lez v5, :cond_0

    goto :goto_1

    :cond_0
    move v5, v3

    :goto_1
    sub-int v8, v1, v8

    if-lez v8, :cond_1

    goto :goto_2

    :cond_1
    move v8, v3

    .line 60
    :goto_2
    sget-object v9, Lkotlin/random/Random;->Default:Lkotlin/random/Random$Default;

    const/4 v10, 0x1

    add-int/2addr v5, v10

    invoke-virtual {v9, v3, v5}, Lkotlin/random/Random$Default;->nextInt(II)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setX(F)V

    .line 61
    sget-object v5, Lkotlin/random/Random;->Default:Lkotlin/random/Random$Default;

    add-int/2addr v8, v10

    invoke-virtual {v5, v3, v8}, Lkotlin/random/Random$Default;->nextInt(II)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setY(F)V

    .line 68
    invoke-virtual {v6}, Landroid/widget/TextView;->getRotation()F

    move-result v5

    .line 69
    invoke-virtual {v6}, Landroid/widget/TextView;->getRotation()F

    move-result v8

    const/high16 v9, 0x43b40000    # 360.0f

    add-float/2addr v8, v9

    new-array v7, v7, [F

    aput v5, v7, v3

    aput v8, v7, v10

    .line 65
    const-string v5, "rotation"

    invoke-static {v6, v5, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 71
    rem-int/lit16 v7, v4, 0x89

    const/16 v8, 0x35

    if-ne v7, v8, :cond_2

    const-wide/16 v7, 0x1770

    goto :goto_3

    :cond_2
    const-wide/16 v7, 0x1388

    :goto_3
    invoke-virtual {v5, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    const/4 v7, -0x1

    .line 72
    invoke-virtual {v5, v7}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 73
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    check-cast v7, Landroid/animation/TimeInterpolator;

    invoke-virtual {v5, v7}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 74
    invoke-virtual {v5}, Landroid/animation/ObjectAnimator;->start()V

    .line 78
    check-cast v6, Landroid/view/View;

    invoke-virtual {p0, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    :cond_4
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 17
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    sget p1, Lbe/dauntless/twister/R$layout;->activity_main:I

    invoke-virtual {p0, p1}, Lbe/dauntless/twister/MainActivity;->setContentView(I)V

    .line 22
    sget p1, Lbe/dauntless/twister/R$id;->rootLayout:I

    invoke-virtual {p0, p1}, Lbe/dauntless/twister/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    .line 24
    invoke-virtual {p0}, Lbe/dauntless/twister/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lbe/dauntless/twister/R$array;->flags:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    const-string v1, "getStringArray(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    new-instance v1, Lbe/dauntless/twister/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1, v0, p0}, Lbe/dauntless/twister/MainActivity$$ExternalSyntheticLambda0;-><init>(Landroid/widget/FrameLayout;[Ljava/lang/String;Lbe/dauntless/twister/MainActivity;)V

    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
