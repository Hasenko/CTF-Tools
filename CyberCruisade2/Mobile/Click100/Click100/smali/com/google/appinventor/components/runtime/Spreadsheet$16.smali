.class Lcom/google/appinventor/components/runtime/Spreadsheet$16;
.super Ljava/lang/Object;
.source "Spreadsheet.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/Spreadsheet;->ClearRange(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

.field final synthetic val$rangeRef:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/Spreadsheet;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/Spreadsheet;

    .line 1740
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$16;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    iput-object p2, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$16;->val$rangeRef:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1744
    :try_start_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$16;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$mgetSheetsService(Lcom/google/appinventor/components/runtime/Spreadsheet;)Lcom/google/api/services/sheets/v4/Sheets;

    move-result-object v0

    .line 1745
    .local v0, "sheetsService":Lcom/google/api/services/sheets/v4/Sheets;
    nop

    .line 1746
    invoke-virtual {v0}, Lcom/google/api/services/sheets/v4/Sheets;->spreadsheets()Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets;->values()Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values;

    move-result-object v1

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$16;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$fgetspreadsheetID(Lcom/google/appinventor/components/runtime/Spreadsheet;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$16;->val$rangeRef:Ljava/lang/String;

    new-instance v4, Lcom/google/api/services/sheets/v4/model/ClearValuesRequest;

    invoke-direct {v4}, Lcom/google/api/services/sheets/v4/model/ClearValuesRequest;-><init>()V

    .line 1747
    invoke-virtual {v1, v2, v3, v4}, Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values;->clear(Ljava/lang/String;Ljava/lang/String;Lcom/google/api/services/sheets/v4/model/ClearValuesRequest;)Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values$Clear;

    move-result-object v1

    .line 1748
    invoke-virtual {v1}, Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values$Clear;->execute()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/api/services/sheets/v4/model/ClearValuesResponse;

    .line 1749
    .local v1, "response":Lcom/google/api/services/sheets/v4/model/ClearValuesResponse;
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$16;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    iget-object v2, v2, Lcom/google/appinventor/components/runtime/Spreadsheet;->form:Lcom/google/appinventor/components/runtime/Form;

    new-instance v3, Lcom/google/appinventor/components/runtime/Spreadsheet$16$1;

    invoke-direct {v3, p0}, Lcom/google/appinventor/components/runtime/Spreadsheet$16$1;-><init>(Lcom/google/appinventor/components/runtime/Spreadsheet$16;)V

    invoke-virtual {v2, v3}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1758
    .end local v0    # "sheetsService":Lcom/google/api/services/sheets/v4/Sheets;
    .end local v1    # "response":Lcom/google/api/services/sheets/v4/model/ClearValuesResponse;
    goto :goto_0

    .line 1755
    :catch_0
    move-exception v0

    .line 1756
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 1757
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$16;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ClearRange: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/appinventor/components/runtime/Spreadsheet;->ErrorOccurred(Ljava/lang/String;)V

    .line 1759
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method
