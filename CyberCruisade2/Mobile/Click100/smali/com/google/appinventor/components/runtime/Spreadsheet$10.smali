.class Lcom/google/appinventor/components/runtime/Spreadsheet$10;
.super Ljava/lang/Object;
.source "Spreadsheet.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/Spreadsheet;->AddColumn(Ljava/lang/String;Lcom/google/appinventor/components/runtime/util/YailList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

.field final synthetic val$body:Lcom/google/api/services/sheets/v4/model/ValueRange;

.field final synthetic val$sheetName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/Spreadsheet;Ljava/lang/String;Lcom/google/api/services/sheets/v4/model/ValueRange;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/Spreadsheet;

    .line 1177
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    iput-object p2, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->val$sheetName:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->val$body:Lcom/google/api/services/sheets/v4/model/ValueRange;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1182
    :try_start_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$mgetSheetsService(Lcom/google/appinventor/components/runtime/Spreadsheet;)Lcom/google/api/services/sheets/v4/Sheets;

    move-result-object v0

    .line 1184
    .local v0, "sheetsService":Lcom/google/api/services/sheets/v4/Sheets;
    invoke-virtual {v0}, Lcom/google/api/services/sheets/v4/Sheets;->spreadsheets()Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets;->values()Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values;

    move-result-object v1

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$fgetspreadsheetID(Lcom/google/appinventor/components/runtime/Spreadsheet;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->val$sheetName:Ljava/lang/String;

    .line 1185
    invoke-virtual {v1, v2, v3}, Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values;->get(Ljava/lang/String;Ljava/lang/String;)Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values$Get;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values$Get;->execute()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/api/services/sheets/v4/model/ValueRange;

    .line 1187
    .local v1, "readResult":Lcom/google/api/services/sheets/v4/model/ValueRange;
    invoke-virtual {v1}, Lcom/google/api/services/sheets/v4/model/ValueRange;->getValues()Ljava/util/List;

    move-result-object v2

    .line 1189
    .local v2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/Object;>;>;"
    if-eqz v2, :cond_2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_1

    .line 1195
    :cond_0
    const/4 v3, 0x0

    .line 1196
    .local v3, "maxCol":I
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 1197
    .local v5, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    move v3, v6

    .line 1198
    .end local v5    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    goto :goto_0

    .line 1199
    :cond_1
    add-int/lit8 v4, v3, 0x1

    .line 1200
    .local v4, "nextCol":I
    move v5, v4

    .line 1202
    .local v5, "addedColumn":I
    const/16 v6, 0x1a

    new-array v6, v6, [Ljava/lang/String;

    const-string v7, "A"

    const/4 v8, 0x0

    aput-object v7, v6, v8

    const-string v7, "B"

    const/4 v8, 0x1

    aput-object v7, v6, v8

    const-string v7, "C"

    const/4 v8, 0x2

    aput-object v7, v6, v8

    const-string v7, "D"

    const/4 v8, 0x3

    aput-object v7, v6, v8

    const-string v7, "E"

    const/4 v8, 0x4

    aput-object v7, v6, v8

    const-string v7, "F"

    const/4 v8, 0x5

    aput-object v7, v6, v8

    const-string v7, "G"

    const/4 v8, 0x6

    aput-object v7, v6, v8

    const-string v7, "H"

    const/4 v8, 0x7

    aput-object v7, v6, v8

    const-string v7, "I"

    const/16 v8, 0x8

    aput-object v7, v6, v8

    const-string v7, "J"

    const/16 v8, 0x9

    aput-object v7, v6, v8

    const-string v7, "K"

    const/16 v8, 0xa

    aput-object v7, v6, v8

    const-string v7, "L"

    const/16 v8, 0xb

    aput-object v7, v6, v8

    const-string v7, "M"

    const/16 v8, 0xc

    aput-object v7, v6, v8

    const-string v7, "N"

    const/16 v8, 0xd

    aput-object v7, v6, v8

    const-string v7, "O"

    const/16 v8, 0xe

    aput-object v7, v6, v8

    const-string v7, "P"

    const/16 v8, 0xf

    aput-object v7, v6, v8

    const-string v7, "Q"

    const/16 v8, 0x10

    aput-object v7, v6, v8

    const-string v7, "R"

    const/16 v8, 0x11

    aput-object v7, v6, v8

    const-string v7, "S"

    const/16 v8, 0x12

    aput-object v7, v6, v8

    const-string v7, "T"

    const/16 v8, 0x13

    aput-object v7, v6, v8

    const-string v7, "U"

    const/16 v8, 0x14

    aput-object v7, v6, v8

    const-string v7, "V"

    const/16 v8, 0x15

    aput-object v7, v6, v8

    const-string v7, "W"

    const/16 v8, 0x16

    aput-object v7, v6, v8

    const-string v7, "X"

    const/16 v8, 0x17

    aput-object v7, v6, v8

    const-string v7, "Y"

    const/16 v8, 0x18

    aput-object v7, v6, v8

    const-string v7, "Z"

    const/16 v8, 0x19

    aput-object v7, v6, v8

    .line 1205
    .local v6, "alphabet":[Ljava/lang/String;
    iget-object v7, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-static {v7, v4}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$mgetColString(Lcom/google/appinventor/components/runtime/Spreadsheet;I)Ljava/lang/String;

    move-result-object v7

    .line 1206
    .local v7, "colReference":Ljava/lang/String;
    iget-object v8, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->val$sheetName:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "!"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "1"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1208
    .local v8, "rangeRef":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/google/api/services/sheets/v4/Sheets;->spreadsheets()Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets;->values()Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values;

    move-result-object v9

    iget-object v10, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-static {v10}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$fgetspreadsheetID(Lcom/google/appinventor/components/runtime/Spreadsheet;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->val$body:Lcom/google/api/services/sheets/v4/model/ValueRange;

    .line 1209
    invoke-virtual {v9, v10, v8, v11}, Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values;->update(Ljava/lang/String;Ljava/lang/String;Lcom/google/api/services/sheets/v4/model/ValueRange;)Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values$Update;

    move-result-object v9

    const-string v10, "USER_ENTERED"

    .line 1210
    invoke-virtual {v9, v10}, Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values$Update;->setValueInputOption(Ljava/lang/String;)Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values$Update;

    move-result-object v9

    .line 1211
    invoke-virtual {v9}, Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values$Update;->execute()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/api/services/sheets/v4/model/UpdateValuesResponse;

    .line 1213
    .local v9, "response":Lcom/google/api/services/sheets/v4/model/UpdateValuesResponse;
    iget-object v10, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-static {v10}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$fgetactivity(Lcom/google/appinventor/components/runtime/Spreadsheet;)Landroid/app/Activity;

    move-result-object v10

    new-instance v11, Lcom/google/appinventor/components/runtime/Spreadsheet$10$1;

    invoke-direct {v11, p0, v5}, Lcom/google/appinventor/components/runtime/Spreadsheet$10$1;-><init>(Lcom/google/appinventor/components/runtime/Spreadsheet$10;I)V

    invoke-virtual {v10, v11}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .end local v0    # "sheetsService":Lcom/google/api/services/sheets/v4/Sheets;
    .end local v1    # "readResult":Lcom/google/api/services/sheets/v4/model/ValueRange;
    .end local v2    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/Object;>;>;"
    .end local v3    # "maxCol":I
    .end local v4    # "nextCol":I
    .end local v5    # "addedColumn":I
    .end local v6    # "alphabet":[Ljava/lang/String;
    .end local v7    # "colReference":Ljava/lang/String;
    .end local v8    # "rangeRef":Ljava/lang/String;
    .end local v9    # "response":Lcom/google/api/services/sheets/v4/model/UpdateValuesResponse;
    goto :goto_2

    .line 1190
    .restart local v0    # "sheetsService":Lcom/google/api/services/sheets/v4/Sheets;
    .restart local v1    # "readResult":Lcom/google/api/services/sheets/v4/model/ValueRange;
    .restart local v2    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/Object;>;>;"
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    const-string v4, "AddColumn: No data found"

    invoke-virtual {v3, v4}, Lcom/google/appinventor/components/runtime/Spreadsheet;->ErrorOccurred(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1191
    return-void

    .line 1222
    .end local v0    # "sheetsService":Lcom/google/api/services/sheets/v4/Sheets;
    .end local v1    # "readResult":Lcom/google/api/services/sheets/v4/model/ValueRange;
    .end local v2    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/Object;>;>;"
    :catch_0
    move-exception v0

    .line 1223
    .local v0, "e":Ljava/security/GeneralSecurityException;
    invoke-virtual {v0}, Ljava/security/GeneralSecurityException;->printStackTrace()V

    .line 1224
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-virtual {v0}, Ljava/security/GeneralSecurityException;->getMessage()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AddColumn GeneralSecurityException: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/appinventor/components/runtime/Spreadsheet;->ErrorOccurred(Ljava/lang/String;)V

    goto :goto_3

    .line 1219
    .end local v0    # "e":Ljava/security/GeneralSecurityException;
    :catch_1
    move-exception v0

    .line 1220
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 1221
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$10;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AddColumn IOException: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/appinventor/components/runtime/Spreadsheet;->ErrorOccurred(Ljava/lang/String;)V

    .line 1225
    .end local v0    # "e":Ljava/io/IOException;
    :goto_2
    nop

    .line 1226
    :goto_3
    return-void
.end method
