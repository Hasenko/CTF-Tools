.class Lcom/google/appinventor/components/runtime/Form$7;
.super Ljava/lang/Object;
.source "Form.java"

# interfaces
.implements Lcom/google/appinventor/components/runtime/PermissionResultHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/Form;->AskForPermission(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/Form;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/Form;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/Form;

    .line 1108
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Form$7;->this$0:Lcom/google/appinventor/components/runtime/Form;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public HandlePermissionResponse(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "permission"    # Ljava/lang/String;
    .param p2, "granted"    # Z

    .line 1111
    if-eqz p2, :cond_0

    .line 1112
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Form$7;->this$0:Lcom/google/appinventor/components/runtime/Form;

    invoke-virtual {v0, p1}, Lcom/google/appinventor/components/runtime/Form;->PermissionGranted(Ljava/lang/String;)V

    goto :goto_0

    .line 1114
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Form$7;->this$0:Lcom/google/appinventor/components/runtime/Form;

    const-string v1, "RequestPermission"

    invoke-virtual {v0, v0, v1, p1}, Lcom/google/appinventor/components/runtime/Form;->PermissionDenied(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;Ljava/lang/String;)V

    .line 1116
    :goto_0
    return-void
.end method
