.class Lcom/google/appinventor/components/runtime/util/EclairUtil$1;
.super Landroid/webkit/WebChromeClient;
.source "EclairUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/util/EclairUtil;->setupWebViewGeoLoc(Lcom/google/appinventor/components/runtime/WebViewer;Landroid/webkit/WebView;Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$caller:Lcom/google/appinventor/components/runtime/WebViewer;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/WebViewer;Landroid/app/Activity;)V
    .locals 0

    .line 59
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/util/EclairUtil$1;->val$caller:Lcom/google/appinventor/components/runtime/WebViewer;

    iput-object p2, p0, Lcom/google/appinventor/components/runtime/util/EclairUtil$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 6
    .param p1, "origin"    # Ljava/lang/String;
    .param p2, "callback"    # Landroid/webkit/GeolocationPermissions$Callback;

    .line 63
    move-object v0, p2

    .line 64
    .local v0, "theCallback":Landroid/webkit/GeolocationPermissions$Callback;
    move-object v1, p1

    .line 65
    .local v1, "theOrigin":Ljava/lang/String;
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/util/EclairUtil$1;->val$caller:Lcom/google/appinventor/components/runtime/WebViewer;

    invoke-virtual {v2}, Lcom/google/appinventor/components/runtime/WebViewer;->PromptforPermission()Z

    move-result v2

    if-nez v2, :cond_0

    .line 66
    const/4 v2, 0x1

    invoke-interface {p2, p1, v2, v2}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    .line 67
    return-void

    .line 69
    :cond_0
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/google/appinventor/components/runtime/util/EclairUtil$1;->val$activity:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    .line 70
    .local v2, "alertDialog":Landroid/app/AlertDialog;
    const-string v3, "Permission Request"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 71
    const-string v3, "file://"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 72
    const-string p1, "This Application"

    .line 73
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " would like to access your location."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 74
    new-instance v3, Lcom/google/appinventor/components/runtime/util/EclairUtil$1$1;

    invoke-direct {v3, p0, v0, v1}, Lcom/google/appinventor/components/runtime/util/EclairUtil$1$1;-><init>(Lcom/google/appinventor/components/runtime/util/EclairUtil$1;Landroid/webkit/GeolocationPermissions$Callback;Ljava/lang/String;)V

    const/4 v4, -0x1

    const-string v5, "Allow"

    invoke-virtual {v2, v4, v5, v3}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 80
    new-instance v3, Lcom/google/appinventor/components/runtime/util/EclairUtil$1$2;

    invoke-direct {v3, p0, v0, v1}, Lcom/google/appinventor/components/runtime/util/EclairUtil$1$2;-><init>(Lcom/google/appinventor/components/runtime/util/EclairUtil$1;Landroid/webkit/GeolocationPermissions$Callback;Ljava/lang/String;)V

    const/4 v4, -0x2

    const-string v5, "Refuse"

    invoke-virtual {v2, v4, v5, v3}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 86
    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 87
    return-void
.end method
