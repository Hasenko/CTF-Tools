.class Lcom/google/appinventor/components/runtime/chatbot/ChatBotToken$1;
.super Ljava/lang/Object;
.source "ChatBotToken.java"

# interfaces
.implements Lcom/google/protobuf/Descriptors$FileDescriptor$InternalDescriptorAssigner;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/appinventor/components/runtime/chatbot/ChatBotToken;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 4347
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public assignDescriptors(Lcom/google/protobuf/Descriptors$FileDescriptor;)Lcom/google/protobuf/ExtensionRegistry;
    .locals 1
    .param p1, "root"    # Lcom/google/protobuf/Descriptors$FileDescriptor;

    .line 4350
    invoke-static {p1}, Lcom/google/appinventor/components/runtime/chatbot/ChatBotToken;->-$$Nest$sfputdescriptor(Lcom/google/protobuf/Descriptors$FileDescriptor;)V

    .line 4351
    const/4 v0, 0x0

    return-object v0
.end method
