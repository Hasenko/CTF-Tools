.class Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient$1;
.super Ljava/lang/Object;
.source "FroyoWebViewClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient;

.field final synthetic val$description:Ljava/lang/String;

.field final synthetic val$errorCode:I

.field final synthetic val$failingUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient;

    .line 69
    .local p0, "this":Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient$1;, "Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient$1;"
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient$1;->this$0:Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient;

    iput p2, p0, Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient$1;->val$errorCode:I

    iput-object p3, p0, Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient$1;->val$description:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient$1;->val$failingUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 71
    .local p0, "this":Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient$1;, "Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient$1;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient$1;->this$0:Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient;->-$$Nest$fgetcomponent(Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient;)Lcom/google/appinventor/components/runtime/Component;

    move-result-object v0

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient$1;->val$errorCode:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient$1;->val$description:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient$1;->val$failingUrl:Ljava/lang/String;

    aput-object v3, v1, v2

    const-string v2, "ErrorOccurred"

    invoke-static {v0, v2, v1}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 72
    return-void
.end method
