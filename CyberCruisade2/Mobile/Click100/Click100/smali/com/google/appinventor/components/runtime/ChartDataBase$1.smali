.class Lcom/google/appinventor/components/runtime/ChartDataBase$1;
.super Ljava/lang/Object;
.source "ChartDataBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/ChartDataBase;->onValueSelected(Lcom/github/mikephil/charting/data/Entry;Lcom/github/mikephil/charting/highlight/Highlight;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/ChartDataBase;

.field final synthetic val$entry:Lcom/github/mikephil/charting/data/Entry;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/ChartDataBase;Lcom/github/mikephil/charting/data/Entry;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/ChartDataBase;

    .line 290
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ChartDataBase$1;->this$0:Lcom/google/appinventor/components/runtime/ChartDataBase;

    iput-object p2, p0, Lcom/google/appinventor/components/runtime/ChartDataBase$1;->val$entry:Lcom/github/mikephil/charting/data/Entry;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 293
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ChartDataBase$1;->val$entry:Lcom/github/mikephil/charting/data/Entry;

    instance-of v1, v0, Lcom/github/mikephil/charting/data/PieEntry;

    if-eqz v1, :cond_0

    .line 294
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ChartDataBase$1;->this$0:Lcom/google/appinventor/components/runtime/ChartDataBase;

    check-cast v0, Lcom/github/mikephil/charting/data/PieEntry;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/PieEntry;->getLabel()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ChartDataBase$1;->val$entry:Lcom/github/mikephil/charting/data/Entry;

    check-cast v2, Lcom/github/mikephil/charting/data/PieEntry;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/PieEntry;->getValue()F

    move-result v2

    float-to-double v2, v2

    invoke-virtual {v1, v0, v2, v3}, Lcom/google/appinventor/components/runtime/ChartDataBase;->EntryClick(Ljava/lang/Object;D)V

    goto :goto_0

    .line 296
    :cond_0
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ChartDataBase$1;->this$0:Lcom/google/appinventor/components/runtime/ChartDataBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getX()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ChartDataBase$1;->val$entry:Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/Entry;->getY()F

    move-result v2

    float-to-double v2, v2

    invoke-virtual {v1, v0, v2, v3}, Lcom/google/appinventor/components/runtime/ChartDataBase;->EntryClick(Ljava/lang/Object;D)V

    .line 298
    :goto_0
    return-void
.end method
