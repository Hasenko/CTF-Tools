.class public abstract Lcom/google/appinventor/components/runtime/AxisChartView;
.super Lcom/google/appinventor/components/runtime/ChartView;
.source "AxisChartView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Lcom/github/mikephil/charting/data/Entry;",
        "T::",
        "Lcom/github/mikephil/charting/interfaces/datasets/IBarLineScatterCandleBubbleDataSet<",
        "TE;>;D:",
        "Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData<",
        "TT;>;C:",
        "Lcom/github/mikephil/charting/charts/BarLineChartBase<",
        "TD;>;V:",
        "Lcom/google/appinventor/components/runtime/AxisChartView<",
        "TE;TT;TD;TC;TV;>;>",
        "Lcom/google/appinventor/components/runtime/ChartView<",
        "TE;TT;TD;TC;TV;>;"
    }
.end annotation


# instance fields
.field private axisLabels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$fgetaxisLabels(Lcom/google/appinventor/components/runtime/AxisChartView;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->axisLabels:Ljava/util/List;

    return-object p0
.end method

.method protected constructor <init>(Lcom/google/appinventor/components/runtime/Chart;)V
    .locals 1
    .param p1, "chartComponent"    # Lcom/google/appinventor/components/runtime/Chart;

    .line 48
    .local p0, "this":Lcom/google/appinventor/components/runtime/AxisChartView;, "Lcom/google/appinventor/components/runtime/AxisChartView<TE;TT;TD;TC;TV;>;"
    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/ChartView;-><init>(Lcom/google/appinventor/components/runtime/Chart;)V

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->axisLabels:Ljava/util/List;

    .line 49
    return-void
.end method


# virtual methods
.method public getXBounds()[D
    .locals 4

    .line 140
    .local p0, "this":Lcom/google/appinventor/components/runtime/AxisChartView;, "Lcom/google/appinventor/components/runtime/AxisChartView<TE;TT;TD;TC;TV;>;"
    const/4 v0, 0x2

    new-array v0, v0, [D

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v1, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getAxisMinimum()F

    move-result v1

    float-to-double v1, v1

    const/4 v3, 0x0

    aput-wide v1, v0, v3

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v1, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getAxisMaximum()F

    move-result v1

    float-to-double v1, v1

    const/4 v3, 0x1

    aput-wide v1, v0, v3

    return-object v0
.end method

.method public getYBounds()[D
    .locals 4

    .line 150
    .local p0, "this":Lcom/google/appinventor/components/runtime/AxisChartView;, "Lcom/google/appinventor/components/runtime/AxisChartView<TE;TT;TD;TC;TV;>;"
    const/4 v0, 0x2

    new-array v0, v0, [D

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v1, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    .line 151
    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/YAxis;->getAxisMinimum()F

    move-result v1

    float-to-double v1, v1

    const/4 v3, 0x0

    aput-wide v1, v0, v3

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v1, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    .line 152
    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/YAxis;->getAxisMaximum()F

    move-result v1

    float-to-double v1, v1

    const/4 v3, 0x1

    aput-wide v1, v0, v3

    .line 150
    return-object v0
.end method

.method protected initializeDefaultSettings()V
    .locals 2

    .line 53
    .local p0, "this":Lcom/google/appinventor/components/runtime/AxisChartView;, "Lcom/google/appinventor/components/runtime/AxisChartView<TE;TT;TD;TC;TV;>;"
    invoke-super {p0}, Lcom/google/appinventor/components/runtime/ChartView;->initializeDefaultSettings()V

    .line 55
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    sget-object v1, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->BOTTOM:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/components/XAxis;->setPosition(Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;)V

    .line 56
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisRight()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/components/YAxis;->setEnabled(Z)V

    .line 59
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/components/YAxis;->setGranularity(F)V

    .line 60
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/components/XAxis;->setGranularity(F)V

    .line 64
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/AxisChartView$1;

    invoke-direct {v1, p0}, Lcom/google/appinventor/components/runtime/AxisChartView$1;-><init>(Lcom/google/appinventor/components/runtime/AxisChartView;)V

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/components/XAxis;->setValueFormatter(Lcom/github/mikephil/charting/formatter/ValueFormatter;)V

    .line 92
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chartComponent:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Chart;->XFromZero()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/components/XAxis;->setAxisMaximum(F)V

    .line 95
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chartComponent:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Chart;->YFromZero()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 96
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/components/YAxis;->setAxisMinimum(F)V

    .line 98
    :cond_1
    return-void
.end method

.method public resetAxes()V
    .locals 1

    .line 104
    .local p0, "this":Lcom/google/appinventor/components/runtime/AxisChartView;, "Lcom/google/appinventor/components/runtime/AxisChartView<TE;TT;TD;TC;TV;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->resetAxisMaximum()V

    .line 105
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->resetAxisMinimum()V

    .line 106
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/YAxis;->resetAxisMaximum()V

    .line 107
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/YAxis;->resetAxisMinimum()V

    .line 108
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->invalidate()V

    .line 109
    return-void
.end method

.method public setGridEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 170
    .local p0, "this":Lcom/google/appinventor/components/runtime/AxisChartView;, "Lcom/google/appinventor/components/runtime/AxisChartView<TE;TT;TD;TC;TV;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/github/mikephil/charting/components/XAxis;->setDrawGridLines(Z)V

    .line 171
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/github/mikephil/charting/components/YAxis;->setDrawGridLines(Z)V

    .line 172
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->invalidate()V

    .line 173
    return-void
.end method

.method public setLabels(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 187
    .local p0, "this":Lcom/google/appinventor/components/runtime/AxisChartView;, "Lcom/google/appinventor/components/runtime/AxisChartView<TE;TT;TD;TC;TV;>;"
    .local p1, "labels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->axisLabels:Ljava/util/List;

    .line 188
    return-void
.end method

.method public setXBounds(DD)V
    .locals 2
    .param p1, "minimum"    # D
    .param p3, "maximum"    # D

    .line 144
    .local p0, "this":Lcom/google/appinventor/components/runtime/AxisChartView;, "Lcom/google/appinventor/components/runtime/AxisChartView<TE;TT;TD;TC;TV;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    double-to-float v1, p1

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/components/XAxis;->setAxisMinimum(F)V

    .line 145
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    double-to-float v1, p3

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/components/XAxis;->setAxisMaximum(F)V

    .line 146
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->invalidate()V

    .line 147
    return-void
.end method

.method public setXMinimum(Z)V
    .locals 2
    .param p1, "zero"    # Z

    .line 117
    .local p0, "this":Lcom/google/appinventor/components/runtime/AxisChartView;, "Lcom/google/appinventor/components/runtime/AxisChartView<TE;TT;TD;TC;TV;>;"
    if-eqz p1, :cond_0

    .line 118
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/components/XAxis;->setAxisMinimum(F)V

    goto :goto_0

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->resetAxisMinimum()V

    .line 122
    :goto_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->invalidate()V

    .line 123
    return-void
.end method

.method public setYBounds(DD)V
    .locals 2
    .param p1, "minimum"    # D
    .param p3, "maximum"    # D

    .line 157
    .local p0, "this":Lcom/google/appinventor/components/runtime/AxisChartView;, "Lcom/google/appinventor/components/runtime/AxisChartView<TE;TT;TD;TC;TV;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v0

    double-to-float v1, p1

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/components/YAxis;->setAxisMinimum(F)V

    .line 158
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v0

    double-to-float v1, p3

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/components/YAxis;->setAxisMaximum(F)V

    .line 159
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->invalidate()V

    .line 160
    return-void
.end method

.method public setYMinimum(Z)V
    .locals 2
    .param p1, "zero"    # Z

    .line 131
    .local p0, "this":Lcom/google/appinventor/components/runtime/AxisChartView;, "Lcom/google/appinventor/components/runtime/AxisChartView<TE;TT;TD;TC;TV;>;"
    if-eqz p1, :cond_0

    .line 132
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/components/YAxis;->setAxisMinimum(F)V

    goto :goto_0

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/YAxis;->resetAxisMinimum()V

    .line 136
    :goto_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/AxisChartView;->chart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->invalidate()V

    .line 137
    return-void
.end method
