.class Lcom/google/appinventor/components/runtime/Notifier$4;
.super Ljava/lang/Object;
.source "Notifier.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/Notifier;->ShowChooseDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/Notifier;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/Notifier;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/Notifier;

    .line 223
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Notifier$4;->this$0:Lcom/google/appinventor/components/runtime/Notifier;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 225
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Notifier$4;->this$0:Lcom/google/appinventor/components/runtime/Notifier;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Notifier;->ChoosingCanceled()V

    .line 226
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Notifier$4;->this$0:Lcom/google/appinventor/components/runtime/Notifier;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Notifier;->-$$Nest$fgetactivity(Lcom/google/appinventor/components/runtime/Notifier;)Landroid/app/Activity;

    move-result-object v1

    const/high16 v2, 0x1040000

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/Notifier;->AfterChoosing(Ljava/lang/String;)V

    .line 227
    return-void
.end method
