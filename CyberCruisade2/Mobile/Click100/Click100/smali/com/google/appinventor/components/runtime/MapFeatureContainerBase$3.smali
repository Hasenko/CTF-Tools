.class Lcom/google/appinventor/components/runtime/MapFeatureContainerBase$3;
.super Ljava/lang/Object;
.source "MapFeatureContainerBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/MapFeatureContainerBase;->loadUrl(Ljava/lang/String;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/MapFeatureContainerBase;

.field final synthetic val$responseCode:I

.field final synthetic val$responseMessage:Ljava/lang/String;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/MapFeatureContainerBase;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/MapFeatureContainerBase;

    .line 414
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/MapFeatureContainerBase$3;->this$0:Lcom/google/appinventor/components/runtime/MapFeatureContainerBase;

    iput-object p2, p0, Lcom/google/appinventor/components/runtime/MapFeatureContainerBase$3;->val$url:Ljava/lang/String;

    iput p3, p0, Lcom/google/appinventor/components/runtime/MapFeatureContainerBase$3;->val$responseCode:I

    iput-object p4, p0, Lcom/google/appinventor/components/runtime/MapFeatureContainerBase$3;->val$responseMessage:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 416
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/MapFeatureContainerBase$3;->this$0:Lcom/google/appinventor/components/runtime/MapFeatureContainerBase;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/MapFeatureContainerBase$3;->val$url:Ljava/lang/String;

    iget v2, p0, Lcom/google/appinventor/components/runtime/MapFeatureContainerBase$3;->val$responseCode:I

    iget-object v3, p0, Lcom/google/appinventor/components/runtime/MapFeatureContainerBase$3;->val$responseMessage:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/appinventor/components/runtime/MapFeatureContainerBase;->LoadError(Ljava/lang/String;ILjava/lang/String;)V

    .line 417
    return-void
.end method
