.class Lcom/google/appinventor/components/runtime/TinyWebDB$3;
.super Ljava/lang/Object;
.source "TinyWebDB.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/TinyWebDB;->GetValue(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/TinyWebDB;

.field final synthetic val$tag:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/TinyWebDB;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/TinyWebDB;

    .line 267
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/TinyWebDB$3;->this$0:Lcom/google/appinventor/components/runtime/TinyWebDB;

    iput-object p2, p0, Lcom/google/appinventor/components/runtime/TinyWebDB$3;->val$tag:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 267
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/TinyWebDB$3;->this$0:Lcom/google/appinventor/components/runtime/TinyWebDB;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/TinyWebDB$3;->val$tag:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/appinventor/components/runtime/TinyWebDB;->-$$Nest$mpostGetValue(Lcom/google/appinventor/components/runtime/TinyWebDB;Ljava/lang/String;)V

    return-void
.end method
