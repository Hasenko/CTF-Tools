.class Lcom/google/appinventor/components/runtime/Notifier$10;
.super Ljava/lang/Object;
.source "Notifier.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/Notifier;->ShowAlert(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/Notifier;

.field final synthetic val$notice:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/Notifier;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/Notifier;

    .line 438
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Notifier$10;->this$0:Lcom/google/appinventor/components/runtime/Notifier;

    iput-object p2, p0, Lcom/google/appinventor/components/runtime/Notifier$10;->val$notice:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 440
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Notifier$10;->this$0:Lcom/google/appinventor/components/runtime/Notifier;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Notifier$10;->val$notice:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/appinventor/components/runtime/Notifier;->-$$Nest$mtoastNow(Lcom/google/appinventor/components/runtime/Notifier;Ljava/lang/String;)V

    .line 441
    return-void
.end method
