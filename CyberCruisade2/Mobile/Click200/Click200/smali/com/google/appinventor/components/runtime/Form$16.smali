.class Lcom/google/appinventor/components/runtime/Form$16;
.super Ljava/lang/Object;
.source "Form.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/Form;->askPermission(Lcom/google/appinventor/components/runtime/util/BulkPermissionRequest;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/Form;

.field final synthetic val$permissionsToAsk:Ljava/util/List;

.field final synthetic val$request:Lcom/google/appinventor/components/runtime/util/BulkPermissionRequest;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/Form;Ljava/util/List;Lcom/google/appinventor/components/runtime/util/BulkPermissionRequest;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/Form;

    .line 2857
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Form$16;->this$0:Lcom/google/appinventor/components/runtime/Form;

    iput-object p2, p0, Lcom/google/appinventor/components/runtime/Form$16;->val$permissionsToAsk:Ljava/util/List;

    iput-object p3, p0, Lcom/google/appinventor/components/runtime/Form$16;->val$request:Lcom/google/appinventor/components/runtime/util/BulkPermissionRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 2860
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Form$16;->val$permissionsToAsk:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 2861
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    new-instance v1, Lcom/google/appinventor/components/runtime/Form$16$1;

    invoke-direct {v1, p0, v0}, Lcom/google/appinventor/components/runtime/Form$16$1;-><init>(Lcom/google/appinventor/components/runtime/Form$16;Ljava/util/Iterator;)V

    .line 2880
    .local v1, "handler":Lcom/google/appinventor/components/runtime/PermissionResultHandler;
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Form$16;->this$0:Lcom/google/appinventor/components/runtime/Form;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lcom/google/appinventor/components/runtime/Form;->askPermission(Ljava/lang/String;Lcom/google/appinventor/components/runtime/PermissionResultHandler;)V

    .line 2881
    return-void
.end method
