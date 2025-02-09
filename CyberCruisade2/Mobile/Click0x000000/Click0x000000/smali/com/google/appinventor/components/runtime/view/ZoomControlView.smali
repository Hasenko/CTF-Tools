.class public Lcom/google/appinventor/components/runtime/view/ZoomControlView;
.super Landroid/widget/LinearLayout;
.source "ZoomControlView.java"


# instance fields
.field private density:F

.field private final parent:Lorg/osmdroid/views/MapView;

.field private final zoomIn:Landroid/widget/Button;

.field private final zoomOut:Landroid/widget/Button;


# direct methods
.method static bridge synthetic -$$Nest$fgetparent(Lcom/google/appinventor/components/runtime/view/ZoomControlView;)Lorg/osmdroid/views/MapView;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->parent:Lorg/osmdroid/views/MapView;

    return-object p0
.end method

.method public constructor <init>(Lorg/osmdroid/views/MapView;)V
    .locals 6
    .param p1, "parent"    # Lorg/osmdroid/views/MapView;

    .line 29
    invoke-virtual {p1}, Lorg/osmdroid/views/MapView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 31
    invoke-virtual {p1}, Lorg/osmdroid/views/MapView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->density:F

    .line 33
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->parent:Lorg/osmdroid/views/MapView;

    .line 34
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->setOrientation(I)V

    .line 35
    new-instance v1, Landroid/widget/Button;

    invoke-virtual {p1}, Lorg/osmdroid/views/MapView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->zoomIn:Landroid/widget/Button;

    .line 36
    new-instance v2, Landroid/widget/Button;

    invoke-virtual {p1}, Lorg/osmdroid/views/MapView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->zoomOut:Landroid/widget/Button;

    .line 37
    const-string v3, "+"

    invoke-direct {p0, v1, v3}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->initButton(Landroid/widget/Button;Ljava/lang/String;)V

    .line 38
    const-string v3, "\u2212"

    invoke-direct {p0, v2, v3}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->initButton(Landroid/widget/Button;Ljava/lang/String;)V

    .line 39
    new-instance v3, Lcom/google/appinventor/components/runtime/view/ZoomControlView$1;

    invoke-direct {v3, p0}, Lcom/google/appinventor/components/runtime/view/ZoomControlView$1;-><init>(Lcom/google/appinventor/components/runtime/view/ZoomControlView;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    new-instance v3, Lcom/google/appinventor/components/runtime/view/ZoomControlView$2;

    invoke-direct {v3, p0}, Lcom/google/appinventor/components/runtime/view/ZoomControlView$2;-><init>(Lcom/google/appinventor/components/runtime/view/ZoomControlView;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    iget v3, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->density:F

    invoke-static {v3}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->getZoomInDrawable(F)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/google/appinventor/components/runtime/util/ViewUtil;->setBackgroundDrawable(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 53
    iget v3, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->density:F

    invoke-static {v3}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->getZoomOutDrawable(F)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/appinventor/components/runtime/util/ViewUtil;->setBackgroundDrawable(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 55
    const/4 v3, 0x2

    new-array v3, v3, [[I

    const v4, -0x101009e

    filled-new-array {v4}, [I

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const v4, 0x101009e

    filled-new-array {v4}, [I

    move-result-object v4

    aput-object v4, v3, v0

    move-object v0, v3

    .line 59
    .local v0, "states":[[I
    const v3, -0x333334

    const/high16 v4, -0x1000000

    filled-new-array {v3, v4}, [I

    move-result-object v3

    .line 63
    .local v3, "colors":[I
    new-instance v4, Landroid/content/res/ColorStateList;

    invoke-direct {v4, v0, v3}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 64
    new-instance v4, Landroid/content/res/ColorStateList;

    invoke-direct {v4, v0, v3}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 66
    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->addView(Landroid/view/View;)V

    .line 67
    invoke-virtual {p0, v2}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->addView(Landroid/view/View;)V

    .line 69
    iget v1, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->density:F

    const/high16 v2, 0x41400000    # 12.0f

    mul-float v4, v1, v2

    float-to-int v4, v4

    mul-float v1, v1, v2

    float-to-int v1, v1

    invoke-virtual {p0, v4, v1, v5, v5}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->setPadding(IIII)V

    .line 70
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->updateButtons()V

    .line 71
    return-void
.end method

.method private static getZoomInDrawable(F)Landroid/graphics/drawable/Drawable;
    .locals 6
    .param p0, "density"    # F

    .line 93
    const/high16 v0, 0x40800000    # 4.0f

    mul-float v0, v0, p0

    float-to-int v0, v0

    .line 94
    .local v0, "R":I
    new-instance v1, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v2, Landroid/graphics/drawable/shapes/RoundRectShape;

    const/16 v3, 0x8

    new-array v3, v3, [F

    const/4 v4, 0x0

    int-to-float v5, v0

    aput v5, v3, v4

    const/4 v4, 0x1

    int-to-float v5, v0

    aput v5, v3, v4

    const/4 v4, 0x2

    int-to-float v5, v0

    aput v5, v3, v4

    const/4 v4, 0x3

    int-to-float v5, v0

    aput v5, v3, v4

    const/4 v4, 0x4

    const/4 v5, 0x0

    aput v5, v3, v4

    const/4 v4, 0x5

    aput v5, v3, v4

    const/4 v4, 0x6

    aput v5, v3, v4

    const/4 v4, 0x7

    aput v5, v3, v4

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v4}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 95
    .local v1, "drawable":Landroid/graphics/drawable/ShapeDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 96
    return-object v1
.end method

.method private static getZoomOutDrawable(F)Landroid/graphics/drawable/Drawable;
    .locals 6
    .param p0, "density"    # F

    .line 100
    const/high16 v0, 0x40800000    # 4.0f

    mul-float v0, v0, p0

    float-to-int v0, v0

    .line 101
    .local v0, "R":I
    new-instance v1, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v2, Landroid/graphics/drawable/shapes/RoundRectShape;

    const/16 v3, 0x8

    new-array v3, v3, [F

    const/4 v4, 0x0

    const/4 v5, 0x0

    aput v5, v3, v4

    const/4 v4, 0x1

    aput v5, v3, v4

    const/4 v4, 0x2

    aput v5, v3, v4

    const/4 v4, 0x3

    aput v5, v3, v4

    const/4 v4, 0x4

    int-to-float v5, v0

    aput v5, v3, v4

    const/4 v4, 0x5

    int-to-float v5, v0

    aput v5, v3, v4

    const/4 v4, 0x6

    int-to-float v5, v0

    aput v5, v3, v4

    const/4 v4, 0x7

    int-to-float v5, v0

    aput v5, v3, v4

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v4}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 102
    .local v1, "drawable":Landroid/graphics/drawable/ShapeDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 103
    return-object v1
.end method

.method private initButton(Landroid/widget/Button;Ljava/lang/String;)V
    .locals 2
    .param p1, "button"    # Landroid/widget/Button;
    .param p2, "text"    # Ljava/lang/String;

    .line 83
    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 84
    const/high16 v0, 0x41b00000    # 22.0f

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextSize(F)V

    .line 85
    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/widget/Button;->setPadding(IIII)V

    .line 86
    iget v0, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->density:F

    const/high16 v1, 0x41f00000    # 30.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setWidth(I)V

    .line 87
    iget v0, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->density:F

    mul-float v0, v0, v1

    float-to-int v0, v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setHeight(I)V

    .line 88
    invoke-virtual {p1}, Landroid/widget/Button;->setSingleLine()V

    .line 89
    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setGravity(I)V

    .line 90
    return-void
.end method


# virtual methods
.method public final updateButtons()V
    .locals 2

    .line 78
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->zoomIn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->parent:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->canZoomIn()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 79
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->zoomOut:Landroid/widget/Button;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->parent:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->canZoomOut()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 80
    return-void
.end method
