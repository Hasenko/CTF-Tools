.class Lcom/google/appinventor/components/runtime/util/InternalTextToSpeech$1;
.super Ljava/lang/Object;
.source "InternalTextToSpeech.java"

# interfaces
.implements Landroid/speech/tts/TextToSpeech$OnInitListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/util/InternalTextToSpeech;->initializeTts()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/util/InternalTextToSpeech;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/util/InternalTextToSpeech;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/util/InternalTextToSpeech;

    .line 64
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/util/InternalTextToSpeech$1;->this$0:Lcom/google/appinventor/components/runtime/util/InternalTextToSpeech;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInit(I)V
    .locals 2
    .param p1, "status"    # I

    .line 67
    if-nez p1, :cond_0

    .line 68
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/InternalTextToSpeech$1;->this$0:Lcom/google/appinventor/components/runtime/util/InternalTextToSpeech;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/appinventor/components/runtime/util/InternalTextToSpeech;->-$$Nest$fputisTtsInitialized(Lcom/google/appinventor/components/runtime/util/InternalTextToSpeech;Z)V

    .line 70
    :cond_0
    return-void
.end method
