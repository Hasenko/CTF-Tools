.class Lbe/cscbe/scream/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lbe/cscbe/scream/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lbe/cscbe/scream/MainActivity;


# direct methods
.method constructor <init>(Lbe/cscbe/scream/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lbe/cscbe/scream/MainActivity;

    .line 44
    iput-object p1, p0, Lbe/cscbe/scream/MainActivity$1;->this$0:Lbe/cscbe/scream/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 47
    const/4 v0, 0x1

    .line 48
    .local v0, "duration":I
    const-string v1, "Yell the password to me"

    .line 49
    .local v1, "text":Ljava/lang/CharSequence;
    iget-object v2, p0, Lbe/cscbe/scream/MainActivity$1;->this$0:Lbe/cscbe/scream/MainActivity;

    invoke-static {v2, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 50
    .local v2, "toast":Landroid/widget/Toast;
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 51
    return-void
.end method
