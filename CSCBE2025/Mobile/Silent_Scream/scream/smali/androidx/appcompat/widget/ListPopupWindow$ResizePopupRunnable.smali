.class Landroidx/appcompat/widget/ListPopupWindow$ResizePopupRunnable;
.super Ljava/lang/Object;
.source "ListPopupWindow.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/ListPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ResizePopupRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/appcompat/widget/ListPopupWindow;


# direct methods
.method constructor <init>(Landroidx/appcompat/widget/ListPopupWindow;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 1369
    iput-object p1, p0, Landroidx/appcompat/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Landroidx/appcompat/widget/ListPopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1370
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1374
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Landroidx/appcompat/widget/ListPopupWindow;

    iget-object v0, v0, Landroidx/appcompat/widget/ListPopupWindow;->mDropDownList:Landroidx/appcompat/widget/DropDownListView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Landroidx/appcompat/widget/ListPopupWindow;

    iget-object v0, v0, Landroidx/appcompat/widget/ListPopupWindow;->mDropDownList:Landroidx/appcompat/widget/DropDownListView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/DropDownListView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Landroidx/appcompat/widget/ListPopupWindow;

    iget-object v0, v0, Landroidx/appcompat/widget/ListPopupWindow;->mDropDownList:Landroidx/appcompat/widget/DropDownListView;

    .line 1375
    invoke-virtual {v0}, Landroidx/appcompat/widget/DropDownListView;->getCount()I

    move-result v0

    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Landroidx/appcompat/widget/ListPopupWindow;

    iget-object v1, v1, Landroidx/appcompat/widget/ListPopupWindow;->mDropDownList:Landroidx/appcompat/widget/DropDownListView;

    invoke-virtual {v1}, Landroidx/appcompat/widget/DropDownListView;->getChildCount()I

    move-result v1

    if-le v0, v1, :cond_0

    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Landroidx/appcompat/widget/ListPopupWindow;

    iget-object v0, v0, Landroidx/appcompat/widget/ListPopupWindow;->mDropDownList:Landroidx/appcompat/widget/DropDownListView;

    .line 1376
    invoke-virtual {v0}, Landroidx/appcompat/widget/DropDownListView;->getChildCount()I

    move-result v0

    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Landroidx/appcompat/widget/ListPopupWindow;

    iget v1, v1, Landroidx/appcompat/widget/ListPopupWindow;->mListItemExpandMaximum:I

    if-gt v0, v1, :cond_0

    .line 1377
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Landroidx/appcompat/widget/ListPopupWindow;

    iget-object v0, v0, Landroidx/appcompat/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 1378
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Landroidx/appcompat/widget/ListPopupWindow;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ListPopupWindow;->show()V

    .line 1380
    :cond_0
    return-void
.end method
