.class Lcom/google/appinventor/components/runtime/Texting$2;
.super Landroid/content/BroadcastReceiver;
.source "Texting.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/Texting;->sendViaSms(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/Texting;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/Texting;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/Texting;

    .line 1113
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Texting$2;->this$0:Lcom/google/appinventor/components/runtime/Texting;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "arg0"    # Landroid/content/Context;
    .param p2, "arg1"    # Landroid/content/Intent;

    monitor-enter p0

    .line 1117
    :try_start_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Texting$2;->this$0:Lcom/google/appinventor/components/runtime/Texting;

    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Texting$2;->getResultCode()I

    move-result v1

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Texting$2;->this$0:Lcom/google/appinventor/components/runtime/Texting;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/Texting;->-$$Nest$fgetmessage(Lcom/google/appinventor/components/runtime/Texting;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v0, p1, v3, v1, v2}, Lcom/google/appinventor/components/runtime/Texting;->-$$Nest$mhandleSentMessage(Lcom/google/appinventor/components/runtime/Texting;Landroid/content/Context;Landroid/content/BroadcastReceiver;ILjava/lang/String;)V

    .line 1118
    invoke-static {}, Lcom/google/appinventor/components/runtime/Texting;->-$$Nest$sfgetactivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1124
    goto :goto_0

    .line 1116
    .end local p0    # "this":Lcom/google/appinventor/components/runtime/Texting$2;
    .end local p1    # "arg0":Landroid/content/Context;
    .end local p2    # "arg1":Landroid/content/Intent;
    :catchall_0
    move-exception p1

    goto :goto_1

    .line 1119
    .restart local p1    # "arg0":Landroid/content/Context;
    .restart local p2    # "arg1":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 1120
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    const-string v1, "BroadcastReceiver"

    .line 1121
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error in onReceive for msgId "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1120
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1122
    const-string v1, "BroadcastReceiver"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1123
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1125
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    monitor-exit p0

    return-void

    .line 1116
    .end local p1    # "arg0":Landroid/content/Context;
    .end local p2    # "arg1":Landroid/content/Intent;
    :goto_1
    monitor-exit p0

    throw p1
.end method
