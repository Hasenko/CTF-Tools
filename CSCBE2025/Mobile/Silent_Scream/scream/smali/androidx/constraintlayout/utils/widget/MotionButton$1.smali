.class Landroidx/constraintlayout/utils/widget/MotionButton$1;
.super Landroid/view/ViewOutlineProvider;
.source "MotionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/constraintlayout/utils/widget/MotionButton;->setRoundPercent(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/constraintlayout/utils/widget/MotionButton;


# direct methods
.method constructor <init>(Landroidx/constraintlayout/utils/widget/MotionButton;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/constraintlayout/utils/widget/MotionButton;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 119
    iput-object p1, p0, Landroidx/constraintlayout/utils/widget/MotionButton$1;->this$0:Landroidx/constraintlayout/utils/widget/MotionButton;

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 9
    .param p1, "view"    # Landroid/view/View;
    .param p2, "outline"    # Landroid/graphics/Outline;

    .line 122
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/MotionButton$1;->this$0:Landroidx/constraintlayout/utils/widget/MotionButton;

    invoke-virtual {v0}, Landroidx/constraintlayout/utils/widget/MotionButton;->getWidth()I

    move-result v0

    .line 123
    .local v0, "w":I
    iget-object v1, p0, Landroidx/constraintlayout/utils/widget/MotionButton$1;->this$0:Landroidx/constraintlayout/utils/widget/MotionButton;

    invoke-virtual {v1}, Landroidx/constraintlayout/utils/widget/MotionButton;->getHeight()I

    move-result v7

    .line 124
    .local v7, "h":I
    invoke-static {v0, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Landroidx/constraintlayout/utils/widget/MotionButton$1;->this$0:Landroidx/constraintlayout/utils/widget/MotionButton;

    invoke-static {v2}, Landroidx/constraintlayout/utils/widget/MotionButton;->access$000(Landroidx/constraintlayout/utils/widget/MotionButton;)F

    move-result v2

    mul-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float v8, v1, v2

    .line 125
    .local v8, "r":F
    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p2

    move v4, v0

    move v5, v7

    move v6, v8

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 126
    return-void
.end method
