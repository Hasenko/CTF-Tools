.class Lcom/google/appinventor/components/runtime/GameClient$25;
.super Ljava/lang/Object;
.source "GameClient.java"

# interfaces
.implements Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/GameClient;->postNewMessage(Ljava/lang/String;Lcom/google/appinventor/components/runtime/util/YailList;Lcom/google/appinventor/components/runtime/util/YailList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/GameClient;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/GameClient;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/GameClient;

    .line 936
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/GameClient$25;->this$0:Lcom/google/appinventor/components/runtime/GameClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .line 941
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/GameClient$25;->this$0:Lcom/google/appinventor/components/runtime/GameClient;

    const-string v1, "SendMessage"

    invoke-virtual {v0, v1, p1}, Lcom/google/appinventor/components/runtime/GameClient;->WebServiceError(Ljava/lang/String;Ljava/lang/String;)V

    .line 942
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 936
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/google/appinventor/components/runtime/GameClient$25;->onSuccess(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onSuccess(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "response"    # Lorg/json/JSONObject;

    .line 938
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/GameClient$25;->this$0:Lcom/google/appinventor/components/runtime/GameClient;

    const-string v1, "SendMessage"

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/GameClient;->FunctionCompleted(Ljava/lang/String;)V

    .line 939
    return-void
.end method
