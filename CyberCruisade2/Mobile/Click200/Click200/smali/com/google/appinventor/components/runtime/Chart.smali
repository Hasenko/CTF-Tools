.class public Lcom/google/appinventor/components/runtime/Chart;
.super Lcom/google/appinventor/components/runtime/AndroidViewComponent;
.source "Chart.java"

# interfaces
.implements Lcom/google/appinventor/components/runtime/ComponentContainer;
.implements Lcom/google/appinventor/components/runtime/util/OnInitializeListener;


# annotations
.annotation runtime Lcom/google/appinventor/components/annotations/DesignerComponent;
    category = .enum Lcom/google/appinventor/components/common/ComponentCategory;->CHARTS:Lcom/google/appinventor/components/common/ComponentCategory;
    description = "A component that allows visualizing data"
    version = 0x3
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/SimpleObject;
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/UsesLibraries;
    libraries = "mpandroidchart.jar"
.end annotation


# instance fields
.field private backgroundColor:I

.field private chartView:Lcom/google/appinventor/components/runtime/ChartView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/appinventor/components/runtime/ChartView<",
            "*****>;"
        }
    .end annotation
.end field

.field private final dataComponents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/appinventor/components/runtime/ChartComponent;",
            ">;"
        }
    .end annotation
.end field

.field private description:Ljava/lang/String;

.field private gridEnabled:Z

.field private labels:Lcom/google/appinventor/components/runtime/util/YailList;

.field private legendEnabled:Z

.field private pieRadius:I

.field private tick:I

.field private type:Lcom/google/appinventor/components/common/ChartType;

.field private final view:Landroid/widget/RelativeLayout;

.field private zeroX:Z

.field private zeroY:Z


# direct methods
.method public constructor <init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V
    .locals 3
    .param p1, "container"    # Lcom/google/appinventor/components/runtime/ComponentContainer;

    .line 85
    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/AndroidViewComponent;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V

    .line 74
    const/4 v0, 0x1

    iput v0, p0, Lcom/google/appinventor/components/runtime/Chart;->tick:I

    .line 87
    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/Chart;->view:Landroid/widget/RelativeLayout;

    .line 90
    invoke-interface {p1, p0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$add(Lcom/google/appinventor/components/runtime/AndroidViewComponent;)V

    .line 92
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/Chart;->dataComponents:Ljava/util/List;

    .line 95
    sget-object v1, Lcom/google/appinventor/components/common/ChartType;->Line:Lcom/google/appinventor/components/common/ChartType;

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/Chart;->Type(Lcom/google/appinventor/components/common/ChartType;)V

    .line 96
    const/16 v1, 0xb0

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/Chart;->Width(I)V

    .line 97
    const/16 v1, 0x90

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/Chart;->Height(I)V

    .line 98
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/Chart;->BackgroundColor(I)V

    .line 99
    const-string v2, ""

    invoke-virtual {p0, v2}, Lcom/google/appinventor/components/runtime/Chart;->Description(Ljava/lang/String;)V

    .line 100
    const/16 v2, 0x64

    invoke-virtual {p0, v2}, Lcom/google/appinventor/components/runtime/Chart;->PieRadius(I)V

    .line 101
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Chart;->LegendEnabled(Z)V

    .line 102
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Chart;->GridEnabled(Z)V

    .line 103
    new-instance v0, Lcom/google/appinventor/components/runtime/util/YailList;

    invoke-direct {v0}, Lcom/google/appinventor/components/runtime/util/YailList;-><init>()V

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Chart;->Labels(Lcom/google/appinventor/components/runtime/util/YailList;)V

    .line 104
    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/Chart;->XFromZero(Z)V

    .line 105
    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/Chart;->YFromZero(Z)V

    .line 108
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Chart;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/appinventor/components/runtime/Form;->registerForOnInitialize(Lcom/google/appinventor/components/runtime/util/OnInitializeListener;)V

    .line 109
    return-void
.end method

.method private createChartViewFromType(Lcom/google/appinventor/components/common/ChartType;)Lcom/google/appinventor/components/runtime/ChartView;
    .locals 3
    .param p1, "type"    # Lcom/google/appinventor/components/common/ChartType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/appinventor/components/common/ChartType;",
            ")",
            "Lcom/google/appinventor/components/runtime/ChartView<",
            "*****>;"
        }
    .end annotation

    .line 201
    sget-object v0, Lcom/google/appinventor/components/runtime/Chart$1;->$SwitchMap$com$google$appinventor$components$common$ChartType:[I

    invoke-virtual {p1}, Lcom/google/appinventor/components/common/ChartType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 214
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid Chart type specified: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 211
    :pswitch_0
    new-instance v0, Lcom/google/appinventor/components/runtime/PieChartView;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/PieChartView;-><init>(Lcom/google/appinventor/components/runtime/Chart;)V

    return-object v0

    .line 209
    :pswitch_1
    new-instance v0, Lcom/google/appinventor/components/runtime/BarChartView;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/BarChartView;-><init>(Lcom/google/appinventor/components/runtime/Chart;)V

    return-object v0

    .line 207
    :pswitch_2
    new-instance v0, Lcom/google/appinventor/components/runtime/AreaChartView;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/AreaChartView;-><init>(Lcom/google/appinventor/components/runtime/Chart;)V

    return-object v0

    .line 205
    :pswitch_3
    new-instance v0, Lcom/google/appinventor/components/runtime/ScatterChartView;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/ScatterChartView;-><init>(Lcom/google/appinventor/components/runtime/Chart;)V

    return-object v0

    .line 203
    :pswitch_4
    new-instance v0, Lcom/google/appinventor/components/runtime/LineChartView;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/LineChartView;-><init>(Lcom/google/appinventor/components/runtime/Chart;)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private reinitializeChart()V
    .locals 2

    .line 228
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->dataComponents:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/appinventor/components/runtime/ChartComponent;

    .line 229
    .local v1, "dataComponent":Lcom/google/appinventor/components/runtime/ChartComponent;
    invoke-interface {v1}, Lcom/google/appinventor/components/runtime/ChartComponent;->initChartData()V

    .line 230
    .end local v1    # "dataComponent":Lcom/google/appinventor/components/runtime/ChartComponent;
    goto :goto_0

    .line 232
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->description:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Chart;->Description(Ljava/lang/String;)V

    .line 233
    iget v0, p0, Lcom/google/appinventor/components/runtime/Chart;->backgroundColor:I

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Chart;->BackgroundColor(I)V

    .line 234
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Chart;->legendEnabled:Z

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Chart;->LegendEnabled(Z)V

    .line 235
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Chart;->gridEnabled:Z

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Chart;->GridEnabled(Z)V

    .line 236
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->labels:Lcom/google/appinventor/components/runtime/util/YailList;

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Chart;->Labels(Lcom/google/appinventor/components/runtime/util/YailList;)V

    .line 237
    return-void
.end method


# virtual methods
.method public $add(Lcom/google/appinventor/components/runtime/AndroidViewComponent;)V
    .locals 2
    .param p1, "component"    # Lcom/google/appinventor/components/runtime/AndroidViewComponent;

    .line 128
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "ChartBase.$add() called"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public $context()Landroid/app/Activity;
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public $form()Lcom/google/appinventor/components/runtime/Form;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    return-object v0
.end method

.method public BackgroundColor()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
    .end annotation

    .line 272
    iget v0, p0, Lcom/google/appinventor/components/runtime/Chart;->backgroundColor:I

    return v0
.end method

.method public BackgroundColor(I)V
    .locals 1
    .param p1, "argb"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "&H00000000"
        editorType = "color"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 285
    if-nez p1, :cond_1

    .line 286
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Chart;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Form;->isDarkTheme()Z

    move-result v0

    if-eqz v0, :cond_0

    const/high16 v0, -0x1000000

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    move p1, v0

    .line 288
    :cond_1
    iput p1, p0, Lcom/google/appinventor/components/runtime/Chart;->backgroundColor:I

    .line 289
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    invoke-virtual {v0, p1}, Lcom/google/appinventor/components/runtime/ChartView;->setBackgroundColor(I)V

    .line 290
    return-void
.end method

.method public Description()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
    .end annotation

    .line 247
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->description:Ljava/lang/String;

    return-object v0
.end method

.method public Description(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "string"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 259
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Chart;->description:Ljava/lang/String;

    .line 260
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    invoke-virtual {v0, p1}, Lcom/google/appinventor/components/runtime/ChartView;->setDescription(Ljava/lang/String;)V

    .line 261
    return-void
.end method

.method public EntryClick(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/Object;D)V
    .locals 3
    .param p1, "series"    # Lcom/google/appinventor/components/runtime/Component;
    .param p2, "x"    # Ljava/lang/Object;
    .param p3, "y"    # D
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
    .end annotation

    .line 583
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    const/4 v1, 0x2

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v0, v1

    const-string v1, "EntryClick"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 584
    return-void
.end method

.method public ExtendDomainToInclude(D)V
    .locals 6
    .param p1, "x"    # D
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
    .end annotation

    .line 496
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    instance-of v1, v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    if-eqz v1, :cond_2

    .line 497
    check-cast v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/AxisChartView;->getXBounds()[D

    move-result-object v0

    .line 498
    .local v0, "bounds":[D
    const/4 v1, 0x0

    aget-wide v2, v0, v1

    const/4 v4, 0x1

    cmpg-double v5, p1, v2

    if-gez v5, :cond_0

    .line 499
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    check-cast v1, Lcom/google/appinventor/components/runtime/AxisChartView;

    aget-wide v2, v0, v4

    invoke-virtual {v1, p1, p2, v2, v3}, Lcom/google/appinventor/components/runtime/AxisChartView;->setXBounds(DD)V

    goto :goto_0

    .line 500
    :cond_0
    aget-wide v2, v0, v4

    cmpl-double v4, p1, v2

    if-lez v4, :cond_1

    .line 501
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    check-cast v2, Lcom/google/appinventor/components/runtime/AxisChartView;

    aget-wide v3, v0, v1

    invoke-virtual {v2, v3, v4, p1, p2}, Lcom/google/appinventor/components/runtime/AxisChartView;->setXBounds(DD)V

    .line 505
    :goto_0
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    invoke-virtual {v1}, Lcom/google/appinventor/components/runtime/ChartView;->refresh()V

    goto :goto_1

    .line 503
    :cond_1
    return-void

    .line 507
    .end local v0    # "bounds":[D
    :cond_2
    :goto_1
    return-void
.end method

.method public ExtendRangeToInclude(D)V
    .locals 6
    .param p1, "y"    # D
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
    .end annotation

    .line 517
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    instance-of v1, v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    if-eqz v1, :cond_2

    .line 518
    check-cast v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/AxisChartView;->getYBounds()[D

    move-result-object v0

    .line 519
    .local v0, "bounds":[D
    const/4 v1, 0x0

    aget-wide v2, v0, v1

    const/4 v4, 0x1

    cmpg-double v5, p1, v2

    if-gez v5, :cond_0

    .line 520
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    check-cast v1, Lcom/google/appinventor/components/runtime/AxisChartView;

    aget-wide v2, v0, v4

    invoke-virtual {v1, p1, p2, v2, v3}, Lcom/google/appinventor/components/runtime/AxisChartView;->setYBounds(DD)V

    goto :goto_0

    .line 521
    :cond_0
    aget-wide v2, v0, v4

    cmpl-double v4, p1, v2

    if-lez v4, :cond_1

    .line 522
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    check-cast v2, Lcom/google/appinventor/components/runtime/AxisChartView;

    aget-wide v3, v0, v1

    invoke-virtual {v2, v3, v4, p1, p2}, Lcom/google/appinventor/components/runtime/AxisChartView;->setYBounds(DD)V

    .line 526
    :goto_0
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    invoke-virtual {v1}, Lcom/google/appinventor/components/runtime/ChartView;->refresh()V

    goto :goto_1

    .line 524
    :cond_1
    return-void

    .line 528
    .end local v0    # "bounds":[D
    :cond_2
    :goto_1
    return-void
.end method

.method public GridEnabled(Z)V
    .locals 2
    .param p1, "enabled"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "True"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 369
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Chart;->gridEnabled:Z

    .line 374
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    instance-of v1, v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    if-eqz v1, :cond_0

    .line 375
    check-cast v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    invoke-virtual {v0, p1}, Lcom/google/appinventor/components/runtime/AxisChartView;->setGridEnabled(Z)V

    .line 376
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->view:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->invalidate()V

    .line 377
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ChartView;->refresh()V

    .line 379
    :cond_0
    return-void
.end method

.method public GridEnabled()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
    .end annotation

    .line 355
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Chart;->gridEnabled:Z

    return v0
.end method

.method public Labels()Lcom/google/appinventor/components/runtime/util/YailList;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 388
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->labels:Lcom/google/appinventor/components/runtime/util/YailList;

    return-object v0
.end method

.method public Labels(Lcom/google/appinventor/components/runtime/util/YailList;)V
    .locals 3
    .param p1, "labels"    # Lcom/google/appinventor/components/runtime/util/YailList;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        description = "Changes the Chart\'s X axis labels to the specified List of Strings,  provided that the Chart Type is set to a Chart with an Axis (applies to Area, Bar, Line, Scatter Charts). The labels are applied in order, starting from the smallest x value on the Chart, and continuing in order. If a label is not specified for an x value, a default value is used (the x value of the axis tick at that location)."
    .end annotation

    .line 409
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Chart;->labels:Lcom/google/appinventor/components/runtime/util/YailList;

    .line 414
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    instance-of v0, v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    if-eqz v0, :cond_1

    .line 415
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 417
    .local v0, "stringLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/google/appinventor/components/runtime/util/YailList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 418
    invoke-virtual {p1, v1}, Lcom/google/appinventor/components/runtime/util/YailList;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 419
    .local v2, "label":Ljava/lang/String;
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 417
    .end local v2    # "label":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 422
    .end local v1    # "i":I
    :cond_0
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    check-cast v1, Lcom/google/appinventor/components/runtime/AxisChartView;

    invoke-virtual {v1, v0}, Lcom/google/appinventor/components/runtime/AxisChartView;->setLabels(Ljava/util/List;)V

    .line 424
    .end local v0    # "stringLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    return-void
.end method

.method public LabelsFromString(Ljava/lang/String;)V
    .locals 1
    .param p1, "labels"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "string"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 440
    invoke-static {p1}, Lcom/google/appinventor/components/runtime/util/ElementsUtil;->elementsFromString(Ljava/lang/String;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v0

    .line 441
    .local v0, "labelsList":Lcom/google/appinventor/components/runtime/util/YailList;
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Chart;->Labels(Lcom/google/appinventor/components/runtime/util/YailList;)V

    .line 442
    return-void
.end method

.method public LegendEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "True"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 341
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Chart;->legendEnabled:Z

    .line 342
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    invoke-virtual {v0, p1}, Lcom/google/appinventor/components/runtime/ChartView;->setLegendEnabled(Z)V

    .line 343
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->view:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->invalidate()V

    .line 344
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ChartView;->refresh()V

    .line 345
    return-void
.end method

.method public LegendEnabled()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
    .end annotation

    .line 329
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Chart;->legendEnabled:Z

    return v0
.end method

.method public PieRadius(I)V
    .locals 2
    .param p1, "percent"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "100"
        editorType = "chart_pie_radius"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Sets the Pie Radius of a Pie Chart from 0% to 100%, where the percentage indicates the percentage of the hole fill. 100% means that a full Pie Chart is drawn, while values closer to 0% correspond to hollow Pie Charts."
        userVisible = false
    .end annotation

    .line 312
    iput p1, p0, Lcom/google/appinventor/components/runtime/Chart;->pieRadius:I

    .line 316
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    instance-of v1, v0, Lcom/google/appinventor/components/runtime/PieChartView;

    if-eqz v1, :cond_0

    .line 317
    check-cast v0, Lcom/google/appinventor/components/runtime/PieChartView;

    invoke-virtual {v0, p1}, Lcom/google/appinventor/components/runtime/PieChartView;->setPieRadius(I)V

    .line 319
    :cond_0
    return-void
.end method

.method public ResetAxes()V
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
    .end annotation

    .line 535
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    instance-of v1, v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    if-eqz v1, :cond_0

    .line 536
    check-cast v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/AxisChartView;->resetAxes()V

    .line 537
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Chart;->refresh()V

    .line 539
    :cond_0
    return-void
.end method

.method public SetDomain(DD)V
    .locals 3
    .param p1, "minimum"    # D
    .param p3, "maximum"    # D
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
    .end annotation

    .line 549
    const-wide/16 v0, 0x0

    cmpl-double v2, p1, v0

    if-nez v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/Chart;->zeroX:Z

    .line 551
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    instance-of v1, v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    if-eqz v1, :cond_1

    .line 552
    check-cast v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/appinventor/components/runtime/AxisChartView;->setXBounds(DD)V

    .line 553
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Chart;->refresh()V

    .line 555
    :cond_1
    return-void
.end method

.method public SetRange(DD)V
    .locals 3
    .param p1, "minimum"    # D
    .param p3, "maximum"    # D
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
    .end annotation

    .line 565
    const-wide/16 v0, 0x0

    cmpl-double v2, p1, v0

    if-nez v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/Chart;->zeroY:Z

    .line 567
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    instance-of v1, v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    if-eqz v1, :cond_1

    .line 568
    check-cast v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/appinventor/components/runtime/AxisChartView;->setYBounds(DD)V

    .line 569
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Chart;->refresh()V

    .line 571
    :cond_1
    return-void
.end method

.method public Type()Lcom/google/appinventor/components/common/ChartType;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Specifies the chart\'s type (area, bar, pie, scatter), which determines how to visualize the data."
    .end annotation

    .line 156
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->type:Lcom/google/appinventor/components/common/ChartType;

    return-object v0
.end method

.method public Type(Lcom/google/appinventor/components/common/ChartType;)V
    .locals 5
    .param p1, "type"    # Lcom/google/appinventor/components/common/ChartType;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "0"
        editorType = "chart_type"
    .end annotation

    .line 170
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 173
    .local v0, "chartViewExists":Z
    :goto_0
    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/Chart;->createChartViewFromType(Lcom/google/appinventor/components/common/ChartType;)Lcom/google/appinventor/components/runtime/ChartView;

    move-result-object v2

    .line 176
    .local v2, "newChartView":Lcom/google/appinventor/components/runtime/ChartView;, "Lcom/google/appinventor/components/runtime/ChartView<*****>;"
    if-eqz v0, :cond_1

    .line 177
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Chart;->view:Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    invoke-virtual {v4}, Lcom/google/appinventor/components/runtime/ChartView;->getView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 180
    :cond_1
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Chart;->type:Lcom/google/appinventor/components/common/ChartType;

    .line 181
    iput-object v2, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    .line 184
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Chart;->view:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Lcom/google/appinventor/components/runtime/ChartView;->getView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;I)V

    .line 188
    if-eqz v0, :cond_2

    .line 189
    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/Chart;->reinitializeChart()V

    .line 191
    :cond_2
    return-void
.end method

.method public XFromZero(Z)V
    .locals 2
    .param p1, "zero"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
    .end annotation

    .line 454
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Chart;->zeroX:Z

    .line 456
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    instance-of v1, v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    if-eqz v1, :cond_0

    .line 457
    check-cast v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    invoke-virtual {v0, p1}, Lcom/google/appinventor/components/runtime/AxisChartView;->setXMinimum(Z)V

    .line 459
    :cond_0
    return-void
.end method

.method public XFromZero()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 463
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Chart;->zeroX:Z

    return v0
.end method

.method public YFromZero(Z)V
    .locals 2
    .param p1, "zero"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
    .end annotation

    .line 476
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Chart;->zeroY:Z

    .line 478
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    instance-of v1, v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    if-eqz v1, :cond_0

    .line 479
    check-cast v0, Lcom/google/appinventor/components/runtime/AxisChartView;

    invoke-virtual {v0, p1}, Lcom/google/appinventor/components/runtime/AxisChartView;->setYMinimum(Z)V

    .line 481
    :cond_0
    return-void
.end method

.method public YFromZero()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 485
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Chart;->zeroY:Z

    return v0
.end method

.method public addDataComponent(Lcom/google/appinventor/components/runtime/ChartComponent;)V
    .locals 1
    .param p1, "dataComponent"    # Lcom/google/appinventor/components/runtime/ChartComponent;

    .line 618
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->dataComponents:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 619
    return-void
.end method

.method public createChartModel()Lcom/google/appinventor/components/runtime/ChartDataModel;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/appinventor/components/runtime/ChartDataModel<",
            "*****>;"
        }
    .end annotation

    .line 593
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ChartView;->createChartModel()Lcom/google/appinventor/components/runtime/ChartDataModel;

    move-result-object v0

    return-object v0
.end method

.method public getChartView()Lcom/google/appinventor/components/runtime/ChartView;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/appinventor/components/runtime/ChartView<",
            "*****>;"
        }
    .end annotation

    .line 609
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    return-object v0
.end method

.method public getChildren()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/appinventor/components/runtime/Component;",
            ">;"
        }
    .end annotation

    .line 143
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Chart;->dataComponents:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getSyncedTValue(I)I
    .locals 2
    .param p1, "dataSeriesT"    # I

    .line 654
    iget v0, p0, Lcom/google/appinventor/components/runtime/Chart;->tick:I

    sub-int/2addr v0, p1

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 655
    iget v0, p0, Lcom/google/appinventor/components/runtime/Chart;->tick:I

    .local v0, "returnValue":I
    goto :goto_0

    .line 657
    .end local v0    # "returnValue":I
    :cond_0
    move v0, p1

    .line 664
    .restart local v0    # "returnValue":I
    :goto_0
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/google/appinventor/components/runtime/Chart;->tick:I

    .line 667
    return v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->view:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method public onInitialize()V
    .locals 2

    .line 628
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    instance-of v1, v0, Lcom/google/appinventor/components/runtime/PieChartView;

    if-eqz v1, :cond_0

    .line 629
    check-cast v0, Lcom/google/appinventor/components/runtime/PieChartView;

    iget v1, p0, Lcom/google/appinventor/components/runtime/Chart;->pieRadius:I

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/PieChartView;->setPieRadius(I)V

    .line 630
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ChartView;->refresh()V

    .line 632
    :cond_0
    return-void
.end method

.method public refresh()V
    .locals 1

    .line 600
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Chart;->chartView:Lcom/google/appinventor/components/runtime/ChartView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ChartView;->refresh()V

    .line 601
    return-void
.end method

.method public setChildHeight(Lcom/google/appinventor/components/runtime/AndroidViewComponent;I)V
    .locals 2
    .param p1, "component"    # Lcom/google/appinventor/components/runtime/AndroidViewComponent;
    .param p2, "height"    # I

    .line 138
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "ChartBase.setChildHeight called"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setChildWidth(Lcom/google/appinventor/components/runtime/AndroidViewComponent;I)V
    .locals 2
    .param p1, "component"    # Lcom/google/appinventor/components/runtime/AndroidViewComponent;
    .param p2, "width"    # I

    .line 133
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "ChartBase.setChildWidth called"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
