.class Lcom/google/appinventor/components/runtime/Twitter$6;
.super Ljava/lang/Object;
.source "Twitter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/Twitter;->RequestMentions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field replies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ltwitter4j/Status;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/appinventor/components/runtime/Twitter;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/Twitter;)V
    .locals 1
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/Twitter;

    .line 598
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Twitter$6;->this$0:Lcom/google/appinventor/components/runtime/Twitter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 599
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Twitter$6;->replies:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 603
    :try_start_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Twitter$6;->this$0:Lcom/google/appinventor/components/runtime/Twitter;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Twitter;->-$$Nest$fgettwitter(Lcom/google/appinventor/components/runtime/Twitter;)Ltwitter4j/Twitter;

    move-result-object v0

    invoke-interface {v0}, Ltwitter4j/Twitter;->getMentionsTimeline()Ltwitter4j/ResponseList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Twitter$6;->replies:Ljava/util/List;
    :try_end_0
    .catch Ltwitter4j/TwitterException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 609
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Twitter$6;->this$0:Lcom/google/appinventor/components/runtime/Twitter;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Twitter;->-$$Nest$fgethandler(Lcom/google/appinventor/components/runtime/Twitter;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/Twitter$6$1;

    invoke-direct {v1, p0}, Lcom/google/appinventor/components/runtime/Twitter$6$1;-><init>(Lcom/google/appinventor/components/runtime/Twitter$6;)V

    :goto_0
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 619
    goto :goto_1

    .line 609
    :catchall_0
    move-exception v0

    goto :goto_2

    .line 604
    :catch_0
    move-exception v0

    .line 605
    .local v0, "e":Ltwitter4j/TwitterException;
    :try_start_1
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Twitter$6;->this$0:Lcom/google/appinventor/components/runtime/Twitter;

    iget-object v1, v1, Lcom/google/appinventor/components/runtime/Twitter;->form:Lcom/google/appinventor/components/runtime/Form;

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Twitter$6;->this$0:Lcom/google/appinventor/components/runtime/Twitter;

    const-string v3, "RequestMentions"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    .line 607
    invoke-virtual {v0}, Ltwitter4j/TwitterException;->getMessage()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 605
    const/16 v5, 0x133

    invoke-virtual {v1, v2, v3, v5, v4}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 609
    .end local v0    # "e":Ltwitter4j/TwitterException;
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Twitter$6;->this$0:Lcom/google/appinventor/components/runtime/Twitter;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Twitter;->-$$Nest$fgethandler(Lcom/google/appinventor/components/runtime/Twitter;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/Twitter$6$1;

    invoke-direct {v1, p0}, Lcom/google/appinventor/components/runtime/Twitter$6$1;-><init>(Lcom/google/appinventor/components/runtime/Twitter$6;)V

    goto :goto_0

    .line 620
    :goto_1
    return-void

    .line 609
    :goto_2
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Twitter$6;->this$0:Lcom/google/appinventor/components/runtime/Twitter;

    invoke-static {v1}, Lcom/google/appinventor/components/runtime/Twitter;->-$$Nest$fgethandler(Lcom/google/appinventor/components/runtime/Twitter;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/google/appinventor/components/runtime/Twitter$6$1;

    invoke-direct {v2, p0}, Lcom/google/appinventor/components/runtime/Twitter$6$1;-><init>(Lcom/google/appinventor/components/runtime/Twitter$6;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 619
    goto :goto_4

    :goto_3
    throw v0

    :goto_4
    goto :goto_3
.end method
