.class public final Landroidx/core/view/animation/PathInterpolatorCompat;
.super Ljava/lang/Object;
.source "PathInterpolatorCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/view/animation/PathInterpolatorCompat$Api21Impl;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method public static create(FF)Landroid/view/animation/Interpolator;
    .locals 2
    .param p0, "controlX"    # F
    .param p1, "controlY"    # F

    .line 69
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 70
    invoke-static {p0, p1}, Landroidx/core/view/animation/PathInterpolatorCompat$Api21Impl;->createPathInterpolator(FF)Landroid/view/animation/PathInterpolator;

    move-result-object v0

    check-cast v0, Landroid/view/animation/Interpolator;

    .end local p0    # "controlX":F
    .end local p1    # "controlY":F
    return-object v0

    .line 72
    .restart local p0    # "controlX":F
    .restart local p1    # "controlY":F
    :cond_0
    new-instance v0, Landroidx/core/view/animation/PathInterpolatorApi14;

    invoke-direct {v0, p0, p1}, Landroidx/core/view/animation/PathInterpolatorApi14;-><init>(FF)V

    check-cast v0, Landroid/view/animation/Interpolator;

    .end local p0    # "controlX":F
    .end local p1    # "controlY":F
    return-object v0
.end method

.method public static create(FFFF)Landroid/view/animation/Interpolator;
    .locals 2
    .param p0, "controlX1"    # F
    .param p1, "controlY1"    # F
    .param p2, "controlX2"    # F
    .param p3, "controlY2"    # F

    .line 88
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 89
    invoke-static {p0, p1, p2, p3}, Landroidx/core/view/animation/PathInterpolatorCompat$Api21Impl;->createPathInterpolator(FFFF)Landroid/view/animation/PathInterpolator;

    move-result-object v0

    check-cast v0, Landroid/view/animation/Interpolator;

    .end local p0    # "controlX1":F
    .end local p1    # "controlY1":F
    .end local p2    # "controlX2":F
    .end local p3    # "controlY2":F
    return-object v0

    .line 91
    .restart local p0    # "controlX1":F
    .restart local p1    # "controlY1":F
    .restart local p2    # "controlX2":F
    .restart local p3    # "controlY2":F
    :cond_0
    new-instance v0, Landroidx/core/view/animation/PathInterpolatorApi14;

    invoke-direct {v0, p0, p1, p2, p3}, Landroidx/core/view/animation/PathInterpolatorApi14;-><init>(FFFF)V

    check-cast v0, Landroid/view/animation/Interpolator;

    .end local p0    # "controlX1":F
    .end local p1    # "controlY1":F
    .end local p2    # "controlX2":F
    .end local p3    # "controlY2":F
    return-object v0
.end method

.method public static create(Landroid/graphics/Path;)Landroid/view/animation/Interpolator;
    .locals 2
    .param p0, "path"    # Landroid/graphics/Path;

    .line 53
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 54
    invoke-static {p0}, Landroidx/core/view/animation/PathInterpolatorCompat$Api21Impl;->createPathInterpolator(Landroid/graphics/Path;)Landroid/view/animation/PathInterpolator;

    move-result-object v0

    check-cast v0, Landroid/view/animation/Interpolator;

    .end local p0    # "path":Landroid/graphics/Path;
    return-object v0

    .line 56
    .restart local p0    # "path":Landroid/graphics/Path;
    :cond_0
    new-instance v0, Landroidx/core/view/animation/PathInterpolatorApi14;

    invoke-direct {v0, p0}, Landroidx/core/view/animation/PathInterpolatorApi14;-><init>(Landroid/graphics/Path;)V

    check-cast v0, Landroid/view/animation/Interpolator;

    .end local p0    # "path":Landroid/graphics/Path;
    return-object v0
.end method
