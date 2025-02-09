.class Lcom/google/appinventor/components/runtime/Spreadsheet$8;
.super Ljava/lang/Object;
.source "Spreadsheet.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/Spreadsheet;->ReadColumn(Ljava/lang/String;Ljava/lang/String;)V
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

    .line 975
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    iput-object p2, p0, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->val$rangeRef:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    .line 980
    move-object/from16 v1, p0

    :try_start_0
    iget-object v0, v1, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$fgetcredentialsPath(Lcom/google/appinventor/components/runtime/Spreadsheet;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v2, 0x0

    const-string v3, ""

    if-nez v0, :cond_4

    .line 982
    move-object v4, v3

    .line 984
    .local v4, "cleanRangeReference":Ljava/lang/String;
    :try_start_1
    iget-object v0, v1, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->val$rangeRef:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-static {v0, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 988
    .end local v4    # "cleanRangeReference":Ljava/lang/String;
    .local v0, "cleanRangeReference":Ljava/lang/String;
    nop

    .line 991
    :try_start_2
    const-string v4, "https://docs.google.com/spreadsheets/d/%s/export?format=csv&range=%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, v1, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-static {v6}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$fgetspreadsheetID(Lcom/google/appinventor/components/runtime/Spreadsheet;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v2

    const/4 v6, 0x1

    aput-object v0, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 994
    .local v4, "getUrl":Ljava/lang/String;
    const-string v5, "SPREADSHEET"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "ReadColumn url: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 997
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 998
    .local v5, "url":Ljava/net/URL;
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v7

    check-cast v7, Ljava/net/HttpURLConnection;

    .line 999
    .local v7, "connection":Ljava/net/HttpURLConnection;
    const-string v8, "GET"

    invoke-virtual {v7, v8}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 1001
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v8

    const/16 v9, 0x190

    if-ne v8, v9, :cond_0

    .line 1002
    iget-object v2, v1, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ReadColumn: Bad HTTP Request. Please check the address and try again. "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/appinventor/components/runtime/Spreadsheet;->ErrorOccurred(Ljava/lang/String;)V

    .line 1004
    return-void

    .line 1008
    :cond_0
    invoke-static {v7}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$smgetResponseContent(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v8

    .line 1009
    .local v8, "responseContent":Ljava/lang/String;
    invoke-static {v8}, Lcom/google/appinventor/components/runtime/util/CsvUtil;->fromCsvTable(Ljava/lang/String;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v9

    .line 1010
    .local v9, "parsedCsv":Lcom/google/appinventor/components/runtime/util/YailList;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 1011
    .local v10, "col":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v9}, Lcom/google/appinventor/components/runtime/util/YailList;->getCdr()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lgnu/lists/LList;

    invoke-virtual {v11}, Lgnu/lists/LList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    .line 1012
    .local v12, "elem":Ljava/lang/Object;
    instance-of v13, v12, Lcom/google/appinventor/components/runtime/util/YailList;

    if-nez v13, :cond_1

    .line 1013
    goto :goto_0

    .line 1014
    :cond_1
    move-object v13, v12

    check-cast v13, Lcom/google/appinventor/components/runtime/util/YailList;

    .line 1016
    .local v13, "row":Lcom/google/appinventor/components/runtime/util/YailList;
    const-string v14, "%s"

    new-array v15, v6, [Ljava/lang/Object;

    invoke-virtual {v13}, Lcom/google/appinventor/components/runtime/util/YailList;->isEmpty()Z

    move-result v16

    if-eqz v16, :cond_2

    move-object/from16 v16, v3

    goto :goto_1

    :cond_2
    invoke-virtual {v13, v6}, Lcom/google/appinventor/components/runtime/util/YailList;->get(I)Ljava/lang/Object;

    move-result-object v16

    :goto_1
    aput-object v16, v15, v2

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v10, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1017
    nop

    .end local v12    # "elem":Ljava/lang/Object;
    .end local v13    # "row":Lcom/google/appinventor/components/runtime/util/YailList;
    goto :goto_0

    .line 1019
    :cond_3
    iget-object v2, v1, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$fgetactivity(Lcom/google/appinventor/components/runtime/Spreadsheet;)Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Lcom/google/appinventor/components/runtime/Spreadsheet$8$1;

    invoke-direct {v3, v1, v10}, Lcom/google/appinventor/components/runtime/Spreadsheet$8$1;-><init>(Lcom/google/appinventor/components/runtime/Spreadsheet$8;Ljava/util/List;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1025
    return-void

    .line 985
    .end local v0    # "cleanRangeReference":Ljava/lang/String;
    .end local v5    # "url":Ljava/net/URL;
    .end local v7    # "connection":Ljava/net/HttpURLConnection;
    .end local v8    # "responseContent":Ljava/lang/String;
    .end local v9    # "parsedCsv":Lcom/google/appinventor/components/runtime/util/YailList;
    .end local v10    # "col":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v4, "cleanRangeReference":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 986
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    iget-object v2, v1, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    const-string v3, "ReadColumn: Error occurred encoding the query. UTF-8 is unsupported?"

    invoke-virtual {v2, v3}, Lcom/google/appinventor/components/runtime/Spreadsheet;->ErrorOccurred(Ljava/lang/String;)V

    .line 987
    return-void

    .line 1029
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v4    # "cleanRangeReference":Ljava/lang/String;
    :cond_4
    iget-object v0, v1, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$mgetSheetsService(Lcom/google/appinventor/components/runtime/Spreadsheet;)Lcom/google/api/services/sheets/v4/Sheets;

    move-result-object v0

    .line 1031
    .local v0, "sheetsService":Lcom/google/api/services/sheets/v4/Sheets;
    invoke-virtual {v0}, Lcom/google/api/services/sheets/v4/Sheets;->spreadsheets()Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets;->values()Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values;

    move-result-object v4

    iget-object v5, v1, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-static {v5}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$fgetspreadsheetID(Lcom/google/appinventor/components/runtime/Spreadsheet;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, v1, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->val$rangeRef:Ljava/lang/String;

    .line 1032
    invoke-virtual {v4, v5, v6}, Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values;->get(Ljava/lang/String;Ljava/lang/String;)Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values$Get;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/api/services/sheets/v4/Sheets$Spreadsheets$Values$Get;->execute()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/api/services/sheets/v4/model/ValueRange;

    .line 1033
    .local v4, "readResult":Lcom/google/api/services/sheets/v4/model/ValueRange;
    invoke-virtual {v4}, Lcom/google/api/services/sheets/v4/model/ValueRange;->getValues()Ljava/util/List;

    move-result-object v5

    .line 1036
    .local v5, "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/Object;>;>;"
    if-eqz v5, :cond_8

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_5

    goto :goto_4

    .line 1042
    :cond_5
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1043
    .local v6, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    .line 1044
    .local v8, "row":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_6

    move-object v9, v3

    goto :goto_3

    :cond_6
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    :goto_3
    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1045
    nop

    .end local v8    # "row":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    goto :goto_2

    .line 1048
    :cond_7
    iget-object v2, v1, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/Spreadsheet;->-$$Nest$fgetactivity(Lcom/google/appinventor/components/runtime/Spreadsheet;)Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Lcom/google/appinventor/components/runtime/Spreadsheet$8$2;

    invoke-direct {v3, v1, v6}, Lcom/google/appinventor/components/runtime/Spreadsheet$8$2;-><init>(Lcom/google/appinventor/components/runtime/Spreadsheet$8;Ljava/util/List;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1057
    .end local v0    # "sheetsService":Lcom/google/api/services/sheets/v4/Sheets;
    .end local v4    # "readResult":Lcom/google/api/services/sheets/v4/model/ValueRange;
    .end local v5    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/Object;>;>;"
    .end local v6    # "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_5

    .line 1037
    .restart local v0    # "sheetsService":Lcom/google/api/services/sheets/v4/Sheets;
    .restart local v4    # "readResult":Lcom/google/api/services/sheets/v4/model/ValueRange;
    .restart local v5    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/Object;>;>;"
    :cond_8
    :goto_4
    iget-object v2, v1, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    const-string v3, "ReadColumn: No data found."

    invoke-virtual {v2, v3}, Lcom/google/appinventor/components/runtime/Spreadsheet;->ErrorOccurred(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 1038
    return-void

    .line 1054
    .end local v0    # "sheetsService":Lcom/google/api/services/sheets/v4/Sheets;
    .end local v4    # "readResult":Lcom/google/api/services/sheets/v4/model/ValueRange;
    .end local v5    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/Object;>;>;"
    :catch_1
    move-exception v0

    .line 1055
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 1056
    iget-object v2, v1, Lcom/google/appinventor/components/runtime/Spreadsheet$8;->this$0:Lcom/google/appinventor/components/runtime/Spreadsheet;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ReadColumn: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/appinventor/components/runtime/Spreadsheet;->ErrorOccurred(Ljava/lang/String;)V

    .line 1058
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_5
    return-void
.end method
