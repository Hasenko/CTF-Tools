.class Landroidx/appcompat/view/menu/StandardMenuPopup$1;
.super Ljava/lang/Object;
.source "StandardMenuPopup.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/view/menu/StandardMenuPopup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/appcompat/view/menu/StandardMenuPopup;


# direct methods
.method constructor <init>(Landroidx/appcompat/view/menu/StandardMenuPopup;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 60
    iput-object p1, p0, Landroidx/appcompat/view/menu/StandardMenuPopup$1;->this$0:Landroidx/appcompat/view/menu/StandardMenuPopup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 1

    .line 66
    iget-object v0, p0, Landroidx/appcompat/view/menu/StandardMenuPopup$1;->this$0:Landroidx/appcompat/view/menu/StandardMenuPopup;

    invoke-virtual {v0}, Landroidx/appcompat/view/menu/StandardMenuPopup;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroidx/appcompat/view/menu/StandardMenuPopup$1;->this$0:Landroidx/appcompat/view/menu/StandardMenuPopup;

    iget-object v0, v0, Landroidx/appcompat/view/menu/StandardMenuPopup;->mPopup:Landroidx/appcompat/widget/MenuPopupWindow;

    invoke-virtual {v0}, Landroidx/appcompat/widget/MenuPopupWindow;->isModal()Z

    move-result v0

    if-nez v0, :cond_2

    .line 67
    iget-object v0, p0, Landroidx/appcompat/view/menu/StandardMenuPopup$1;->this$0:Landroidx/appcompat/view/menu/StandardMenuPopup;

    iget-object v0, v0, Landroidx/appcompat/view/menu/StandardMenuPopup;->mShownAnchorView:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 68
    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 72
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/view/menu/StandardMenuPopup$1;->this$0:Landroidx/appcompat/view/menu/StandardMenuPopup;

    iget-object v0, v0, Landroidx/appcompat/view/menu/StandardMenuPopup;->mPopup:Landroidx/appcompat/widget/MenuPopupWindow;

    invoke-virtual {v0}, Landroidx/appcompat/widget/MenuPopupWindow;->show()V

    goto :goto_1

    .line 69
    :cond_1
    :goto_0
    iget-object v0, p0, Landroidx/appcompat/view/menu/StandardMenuPopup$1;->this$0:Landroidx/appcompat/view/menu/StandardMenuPopup;

    invoke-virtual {v0}, Landroidx/appcompat/view/menu/StandardMenuPopup;->dismiss()V

    :cond_2
    :goto_1
    return-void
.end method
