.class Landroidx/transition/ViewUtilsApi23;
.super Landroidx/transition/ViewUtilsApi22;
.source "ViewUtilsApi23.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/transition/ViewUtilsApi23$Api29Impl;
    }
.end annotation


# static fields
.field private static sTryHiddenSetTransitionVisibility:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 33
    const/4 v0, 0x1

    sput-boolean v0, Landroidx/transition/ViewUtilsApi23;->sTryHiddenSetTransitionVisibility:Z

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Landroidx/transition/ViewUtilsApi22;-><init>()V

    return-void
.end method


# virtual methods
.method public setTransitionVisibility(Landroid/view/View;I)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "visibility"    # I

    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-ne v0, v1, :cond_0

    .line 40
    invoke-super {p0, p1, p2}, Landroidx/transition/ViewUtilsApi22;->setTransitionVisibility(Landroid/view/View;I)V

    goto :goto_0

    .line 42
    :cond_0
    sget-boolean v0, Landroidx/transition/ViewUtilsApi23;->sTryHiddenSetTransitionVisibility:Z

    if-eqz v0, :cond_1

    .line 46
    :try_start_0
    invoke-static {p1, p2}, Landroidx/transition/ViewUtilsApi23$Api29Impl;->setTransitionVisibility(Landroid/view/View;I)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    goto :goto_0

    .line 47
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Ljava/lang/NoSuchMethodError;
    const/4 v1, 0x0

    sput-boolean v1, Landroidx/transition/ViewUtilsApi23;->sTryHiddenSetTransitionVisibility:Z

    .line 52
    .end local v0    # "e":Ljava/lang/NoSuchMethodError;
    :cond_1
    :goto_0
    return-void
.end method
