.class Lcom/google/appinventor/components/runtime/Ev3Motors$1;
.super Ljava/lang/Object;
.source "Ev3Motors.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/Ev3Motors;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/Ev3Motors;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/Ev3Motors;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/Ev3Motors;

    .line 61
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors$1;->this$0:Lcom/google/appinventor/components/runtime/Ev3Motors;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 63
    const-string v0, ""

    .line 65
    .local v0, "functionName":Ljava/lang/String;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors$1;->this$0:Lcom/google/appinventor/components/runtime/Ev3Motors;

    iget-object v1, v1, Lcom/google/appinventor/components/runtime/Ev3Motors;->bluetooth:Lcom/google/appinventor/components/runtime/BluetoothClient;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors$1;->this$0:Lcom/google/appinventor/components/runtime/Ev3Motors;

    iget-object v1, v1, Lcom/google/appinventor/components/runtime/Ev3Motors;->bluetooth:Lcom/google/appinventor/components/runtime/BluetoothClient;

    invoke-virtual {v1}, Lcom/google/appinventor/components/runtime/BluetoothClient;->IsConnected()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 66
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors$1;->this$0:Lcom/google/appinventor/components/runtime/Ev3Motors;

    invoke-static {v1}, Lcom/google/appinventor/components/runtime/Ev3Motors;->-$$Nest$fgetmotorPortBitField(Lcom/google/appinventor/components/runtime/Ev3Motors;)I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v1, v0, v3, v2}, Lcom/google/appinventor/components/runtime/Ev3Motors;->-$$Nest$mgetOutputCount(Lcom/google/appinventor/components/runtime/Ev3Motors;Ljava/lang/String;II)I

    move-result v1

    .line 68
    .local v1, "sensorValue":I
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors$1;->this$0:Lcom/google/appinventor/components/runtime/Ev3Motors;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/Ev3Motors;->-$$Nest$fgetifReset(Lcom/google/appinventor/components/runtime/Ev3Motors;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 69
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors$1;->this$0:Lcom/google/appinventor/components/runtime/Ev3Motors;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/Ev3Motors;->-$$Nest$fgetpreviousValue(Lcom/google/appinventor/components/runtime/Ev3Motors;)I

    move-result v2

    if-eq v1, v2, :cond_1

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors$1;->this$0:Lcom/google/appinventor/components/runtime/Ev3Motors;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/Ev3Motors;->-$$Nest$fgettachoCountChangedEventEnabled(Lcom/google/appinventor/components/runtime/Ev3Motors;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 70
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors$1;->this$0:Lcom/google/appinventor/components/runtime/Ev3Motors;

    invoke-virtual {v2, v1}, Lcom/google/appinventor/components/runtime/Ev3Motors;->TachoCountChanged(I)V

    goto :goto_0

    .line 73
    :cond_0
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors$1;->this$0:Lcom/google/appinventor/components/runtime/Ev3Motors;

    invoke-static {v2, v3}, Lcom/google/appinventor/components/runtime/Ev3Motors;->-$$Nest$fputifReset(Lcom/google/appinventor/components/runtime/Ev3Motors;Z)V

    .line 75
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors$1;->this$0:Lcom/google/appinventor/components/runtime/Ev3Motors;

    invoke-static {v2, v1}, Lcom/google/appinventor/components/runtime/Ev3Motors;->-$$Nest$fputpreviousValue(Lcom/google/appinventor/components/runtime/Ev3Motors;I)V

    .line 78
    .end local v1    # "sensorValue":I
    :cond_2
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors$1;->this$0:Lcom/google/appinventor/components/runtime/Ev3Motors;

    invoke-static {v1}, Lcom/google/appinventor/components/runtime/Ev3Motors;->-$$Nest$fgeteventHandler(Lcom/google/appinventor/components/runtime/Ev3Motors;)Landroid/os/Handler;

    move-result-object v1

    const-wide/16 v2, 0x32

    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 79
    return-void
.end method
