.class Lcom/google/appinventor/components/runtime/Spreadsheet$11$1;
.super Ljava/lang/Object;
.source "Spreadsheet.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/Spreadsheet$11;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/appinventor/components/runtime/Spreadsheet$11;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/Spreadsheet$11;)V
    .locals 0
    .param p1, "this$1"    # Lcom/google/appinventor/components/runtime/Spreadsheet$11;

    .line 1285
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$11$1;->this$1:Lcom/google/appinventor/components/runtime/Spreadsheet$11;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1288
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$11$1;->this$1:Lcom/google/appinventor/components/runtime/Spreadsheet$11;

    iget-object v0, v0, Lcom/google/appinventor/components/runtime/Spreadsheet$11;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Spreadsheet;->FinishedRemoveColumn()V

    .line 1289
    return-void
.end method
