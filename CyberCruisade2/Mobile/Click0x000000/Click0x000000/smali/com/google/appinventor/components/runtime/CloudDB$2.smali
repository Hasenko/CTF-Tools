.class Lcom/google/appinventor/components/runtime/CloudDB$2;
.super Ljava/lang/Object;
.source "CloudDB.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/CloudDB;->StoreValue(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/CloudDB;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/CloudDB;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/CloudDB;

    .line 665
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/CloudDB$2;->this$0:Lcom/google/appinventor/components/runtime/CloudDB;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 667
    const/4 v0, 0x0

    .line 668
    .local v0, "pendingValueList":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .line 669
    .local v1, "pendingTag":Ljava/lang/String;
    const/4 v2, 0x0

    .line 676
    .local v2, "pendingValue":Ljava/lang/String;
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/CloudDB$2;->this$0:Lcom/google/appinventor/components/runtime/CloudDB;

    invoke-static {v3}, Lcom/google/appinventor/components/runtime/CloudDB;->-$$Nest$fgetstoreQueue(Lcom/google/appinventor/components/runtime/CloudDB;)Ljava/util/List;

    move-result-object v3

    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 680
    :try_start_1
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/CloudDB$2;->this$0:Lcom/google/appinventor/components/runtime/CloudDB;

    invoke-static {v4}, Lcom/google/appinventor/components/runtime/CloudDB;->-$$Nest$fgetstoreQueue(Lcom/google/appinventor/components/runtime/CloudDB;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    .line 681
    .local v4, "size":I
    const/4 v5, 0x0

    if-nez v4, :cond_0

    .line 685
    const/4 v6, 0x0

    .local v6, "work":Lcom/google/appinventor/components/runtime/CloudDB$storedValue;
    goto :goto_1

    .line 690
    .end local v6    # "work":Lcom/google/appinventor/components/runtime/CloudDB$storedValue;
    :cond_0
    iget-object v6, p0, Lcom/google/appinventor/components/runtime/CloudDB$2;->this$0:Lcom/google/appinventor/components/runtime/CloudDB;

    invoke-static {v6}, Lcom/google/appinventor/components/runtime/CloudDB;->-$$Nest$fgetstoreQueue(Lcom/google/appinventor/components/runtime/CloudDB;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/appinventor/components/runtime/CloudDB$storedValue;

    .line 695
    .end local v4    # "size":I
    .restart local v6    # "work":Lcom/google/appinventor/components/runtime/CloudDB$storedValue;
    :goto_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 699
    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v7, 0x4

    const/4 v8, 0x1

    if-nez v6, :cond_2

    .line 701
    if-eqz v1, :cond_1

    .line 702
    :try_start_2
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v9

    .line 706
    .local v9, "jsonValueList":Ljava/lang/String;
    iget-object v10, p0, Lcom/google/appinventor/components/runtime/CloudDB$2;->this$0:Lcom/google/appinventor/components/runtime/CloudDB;

    const-string v11, "local key = KEYS[1];local value = ARGV[1];local topublish = cjson.decode(ARGV[2]);local project = ARGV[3];local newtable = {};table.insert(newtable, key);table.insert(newtable, topublish);redis.call(\"publish\", project, cjson.encode(newtable));return redis.call(\'set\', project .. \":\" .. key, value);"

    const-string v12, "765978e4c340012f50733280368a0ccc4a14dfb7"

    new-array v7, v7, [Ljava/lang/String;

    aput-object v1, v7, v5

    aput-object v2, v7, v8

    aput-object v9, v7, v4

    invoke-static {v10}, Lcom/google/appinventor/components/runtime/CloudDB;->-$$Nest$fgetprojectID(Lcom/google/appinventor/components/runtime/CloudDB;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v7, v3

    invoke-virtual {v10, v11, v12, v8, v7}, Lcom/google/appinventor/components/runtime/CloudDB;->jEval(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)Ljava/lang/Object;

    .line 707
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/CloudDB$2;->this$0:Lcom/google/appinventor/components/runtime/CloudDB;

    const-string v4, "StoreValue"

    invoke-virtual {v3, v1, v4}, Lcom/google/appinventor/components/runtime/CloudDB;->UpdateDone(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Lredis/clients/jedis/exceptions/JedisException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    .line 709
    .end local v9    # "jsonValueList":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 710
    .local v3, "e":Lredis/clients/jedis/exceptions/JedisException;
    :try_start_3
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/CloudDB$2;->this$0:Lcom/google/appinventor/components/runtime/CloudDB;

    invoke-virtual {v3}, Lredis/clients/jedis/exceptions/JedisException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/appinventor/components/runtime/CloudDB;->CloudDBError(Ljava/lang/String;)V

    .line 711
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/CloudDB$2;->this$0:Lcom/google/appinventor/components/runtime/CloudDB;

    invoke-static {v4, v8}, Lcom/google/appinventor/components/runtime/CloudDB;->-$$Nest$mflushJedis(Lcom/google/appinventor/components/runtime/CloudDB;Z)V

    goto :goto_3

    .line 712
    .end local v3    # "e":Lredis/clients/jedis/exceptions/JedisException;
    :cond_1
    :goto_2
    nop

    .line 713
    :goto_3
    return-void

    .line 716
    :cond_2
    invoke-virtual {v6}, Lcom/google/appinventor/components/runtime/CloudDB$storedValue;->getTag()Ljava/lang/String;

    move-result-object v9

    .line 717
    .local v9, "tag":Ljava/lang/String;
    invoke-virtual {v6}, Lcom/google/appinventor/components/runtime/CloudDB$storedValue;->getValueList()Lorg/json/JSONArray;

    move-result-object v10

    .line 718
    .local v10, "valueList":Lorg/json/JSONArray;
    nop

    .line 727
    if-nez v1, :cond_3

    .line 728
    move-object v1, v9

    .line 729
    move-object v0, v10

    .line 730
    invoke-virtual {v10, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v2, v3

    goto :goto_4

    .line 731
    :cond_3
    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 732
    invoke-virtual {v10, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v2, v3

    .line 733
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_4

    .line 736
    :cond_4
    :try_start_4
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v11

    .line 740
    .local v11, "jsonValueList":Ljava/lang/String;
    iget-object v12, p0, Lcom/google/appinventor/components/runtime/CloudDB$2;->this$0:Lcom/google/appinventor/components/runtime/CloudDB;

    const-string v13, "local key = KEYS[1];local value = ARGV[1];local topublish = cjson.decode(ARGV[2]);local project = ARGV[3];local newtable = {};table.insert(newtable, key);table.insert(newtable, topublish);redis.call(\"publish\", project, cjson.encode(newtable));return redis.call(\'set\', project .. \":\" .. key, value);"

    const-string v14, "765978e4c340012f50733280368a0ccc4a14dfb7"

    new-array v7, v7, [Ljava/lang/String;

    aput-object v1, v7, v5

    aput-object v2, v7, v8

    aput-object v11, v7, v4

    invoke-static {v12}, Lcom/google/appinventor/components/runtime/CloudDB;->-$$Nest$fgetprojectID(Lcom/google/appinventor/components/runtime/CloudDB;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v7, v3

    invoke-virtual {v12, v13, v14, v8, v7}, Lcom/google/appinventor/components/runtime/CloudDB;->jEval(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)Ljava/lang/Object;
    :try_end_4
    .catch Lredis/clients/jedis/exceptions/JedisException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 746
    .end local v11    # "jsonValueList":Ljava/lang/String;
    nop

    .line 747
    move-object v1, v9

    .line 748
    move-object v0, v10

    .line 749
    :try_start_5
    invoke-virtual {v10, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v2, v3

    .line 751
    .end local v9    # "tag":Ljava/lang/String;
    .end local v10    # "valueList":Lorg/json/JSONArray;
    :goto_4
    goto/16 :goto_0

    .line 741
    .restart local v9    # "tag":Ljava/lang/String;
    .restart local v10    # "valueList":Lorg/json/JSONArray;
    :catch_1
    move-exception v3

    .line 742
    .restart local v3    # "e":Lredis/clients/jedis/exceptions/JedisException;
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/CloudDB$2;->this$0:Lcom/google/appinventor/components/runtime/CloudDB;

    invoke-virtual {v3}, Lredis/clients/jedis/exceptions/JedisException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/appinventor/components/runtime/CloudDB;->CloudDBError(Ljava/lang/String;)V

    .line 743
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/CloudDB$2;->this$0:Lcom/google/appinventor/components/runtime/CloudDB;

    invoke-static {v4, v8}, Lcom/google/appinventor/components/runtime/CloudDB;->-$$Nest$mflushJedis(Lcom/google/appinventor/components/runtime/CloudDB;Z)V

    .line 744
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/CloudDB$2;->this$0:Lcom/google/appinventor/components/runtime/CloudDB;

    invoke-static {v4}, Lcom/google/appinventor/components/runtime/CloudDB;->-$$Nest$fgetstoreQueue(Lcom/google/appinventor/components/runtime/CloudDB;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->clear()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 745
    return-void

    .line 695
    .end local v3    # "e":Lredis/clients/jedis/exceptions/JedisException;
    .end local v6    # "work":Lcom/google/appinventor/components/runtime/CloudDB$storedValue;
    .end local v9    # "tag":Ljava/lang/String;
    .end local v10    # "valueList":Lorg/json/JSONArray;
    :catchall_0
    move-exception v4

    :try_start_6
    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .end local v0    # "pendingValueList":Lorg/json/JSONArray;
    .end local v1    # "pendingTag":Ljava/lang/String;
    .end local v2    # "pendingValue":Ljava/lang/String;
    :try_start_7
    throw v4
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    .line 752
    .restart local v0    # "pendingValueList":Lorg/json/JSONArray;
    .restart local v1    # "pendingTag":Ljava/lang/String;
    .restart local v2    # "pendingValue":Ljava/lang/String;
    :catch_2
    move-exception v3

    .line 753
    .local v3, "e":Ljava/lang/Exception;
    const-string v4, "CloudDB"

    const-string v5, "Exception in store worker!"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 755
    .end local v3    # "e":Ljava/lang/Exception;
    return-void
.end method
