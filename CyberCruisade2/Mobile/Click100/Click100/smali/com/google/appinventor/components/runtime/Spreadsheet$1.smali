.class Lcom/google/appinventor/components/runtime/Spreadsheet$1;
.super Ljava/lang/Object;
.source "Spreadsheet.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/Spreadsheet;->ErrorOccurred(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

.field final synthetic val$errorMessage:Ljava/lang/String;

.field final synthetic val$thisInstance:Lcom/google/appinventor/components/runtime/Spreadsheet;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/Spreadsheet;Lcom/google/appinventor/components/runtime/Spreadsheet;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/Spreadsheet;

    .line 354
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$1;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    iput-object p2, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$1;->val$thisInstance:Lcom/google/appinventor/components/runtime/Spreadsheet;

    iput-object p3, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$1;->val$errorMessage:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 357
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$1;->val$thisInstance:Lcom/google/appinventor/components/runtime/Spreadsheet;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$1;->val$errorMessage:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "ErrorOccurred"

    invoke-static {v0, v3, v2}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 359
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$1;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    iget-object v0, v0, Lcom/google/appinventor/components/runtime/Spreadsheet;->form:Lcom/google/appinventor/components/runtime/Form;

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$1;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$1;->val$errorMessage:Ljava/lang/String;

    aput-object v5, v1, v4

    const/16 v4, 0x1131

    invoke-virtual {v0, v2, v3, v4, v1}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 362
    :cond_0
    return-void
.end method
