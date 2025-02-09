.class public Lcom/google/appinventor/components/runtime/Trendline;
.super Ljava/lang/Object;
.source "Trendline.java"

# interfaces
.implements Lcom/google/appinventor/components/runtime/ChartComponent;
.implements Lcom/google/appinventor/components/runtime/DataSourceChangeListener;


# annotations
.annotation runtime Lcom/google/appinventor/components/annotations/DesignerComponent;
    category = .enum Lcom/google/appinventor/components/common/ComponentCategory;->CHARTS:Lcom/google/appinventor/components/common/ComponentCategory;
    description = "A component that predicts a best fit model for a given data series."
    iconName = "images/trendline.png"
    version = 0x1
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/UsesLibraries;
    value = {
        "commons-math3.jar"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/appinventor/components/runtime/Trendline$LineChartBestFitModel;,
        Lcom/google/appinventor/components/runtime/Trendline$LineChartBestFitDataSet;,
        Lcom/google/appinventor/components/runtime/Trendline$ScatterChartBestFitModel;,
        Lcom/google/appinventor/components/runtime/Trendline$ScatterChartBestFitDataSet;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final ENUM_KEY_TRANSFORMER:Lcom/google/appinventor/components/runtime/util/YailDictionary$KeyTransformer;

.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field private chartData:Lcom/google/appinventor/components/runtime/ChartData2D;

.field private color:I

.field private final container:Lcom/google/appinventor/components/runtime/Chart;

.field private currentModel:Lcom/google/appinventor/components/common/TrendlineCalculator;

.field private final dashed:Landroid/graphics/DashPathEffect;

.field private dataModel:Lcom/google/appinventor/components/runtime/DataModel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/appinventor/components/runtime/DataModel<",
            "*>;"
        }
    .end annotation
.end field

.field private final density:F

.field private final dotted:Landroid/graphics/DashPathEffect;

.field private final exponentialRegression:Lcom/google/appinventor/components/runtime/util/ExponentialRegression;

.field private extend:Z

.field private initialized:Z

.field private lastResults:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final logarithmicRegression:Lcom/google/appinventor/components/runtime/util/LogarithmicRegression;

.field private maxX:D

.field private minX:D

.field private model:Lcom/google/appinventor/components/common/BestFitModel;

.field private final quadraticRegression:Lcom/google/appinventor/components/runtime/util/QuadraticRegression;

.field private final regression:Lcom/google/appinventor/components/common/LinearRegression;

.field private strokeStyle:Lcom/google/appinventor/components/common/StrokeStyle;

.field private strokeWidth:D

.field private visible:Z


# direct methods
.method static bridge synthetic -$$Nest$fgetchartData(Lcom/google/appinventor/components/runtime/Trendline;)Lcom/google/appinventor/components/runtime/ChartData2D;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/Trendline;->chartData:Lcom/google/appinventor/components/runtime/ChartData2D;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcontainer(Lcom/google/appinventor/components/runtime/Trendline;)Lcom/google/appinventor/components/runtime/Chart;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetstrokeWidth(Lcom/google/appinventor/components/runtime/Trendline;)D
    .locals 2

    iget-wide v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->strokeWidth:D

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$fgetvisible(Lcom/google/appinventor/components/runtime/Trendline;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/appinventor/components/runtime/Trendline;->visible:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$mgetColor(Lcom/google/appinventor/components/runtime/Trendline;)I
    .locals 0

    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/Trendline;->getColor()I

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mgetDashPathEffect(Lcom/google/appinventor/components/runtime/Trendline;)Landroid/graphics/DashPathEffect;
    .locals 0

    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/Trendline;->getDashPathEffect()Landroid/graphics/DashPathEffect;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetPoints(Lcom/google/appinventor/components/runtime/Trendline;FFI)[F
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/appinventor/components/runtime/Trendline;->getPoints(FFI)[F

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 69
    const-class v0, Lcom/google/appinventor/components/runtime/Trendline;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/appinventor/components/runtime/Trendline;->LOG_TAG:Ljava/lang/String;

    .line 71
    new-instance v0, Lcom/google/appinventor/components/runtime/Trendline$1;

    invoke-direct {v0}, Lcom/google/appinventor/components/runtime/Trendline$1;-><init>()V

    sput-object v0, Lcom/google/appinventor/components/runtime/Trendline;->ENUM_KEY_TRANSFORMER:Lcom/google/appinventor/components/runtime/util/YailDictionary$KeyTransformer;

    return-void
.end method

.method public constructor <init>(Lcom/google/appinventor/components/runtime/Chart;)V
    .locals 8
    .param p1, "chartContainer"    # Lcom/google/appinventor/components/runtime/Chart;

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->chartData:Lcom/google/appinventor/components/runtime/ChartData2D;

    .line 86
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/appinventor/components/runtime/Trendline;->color:I

    .line 87
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/appinventor/components/runtime/Trendline;->extend:Z

    .line 88
    sget-object v3, Lcom/google/appinventor/components/common/BestFitModel;->Linear:Lcom/google/appinventor/components/common/BestFitModel;

    iput-object v3, p0, Lcom/google/appinventor/components/runtime/Trendline;->model:Lcom/google/appinventor/components/common/BestFitModel;

    .line 89
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    iput-wide v3, p0, Lcom/google/appinventor/components/runtime/Trendline;->strokeWidth:D

    .line 90
    sget-object v3, Lcom/google/appinventor/components/common/StrokeStyle;->Solid:Lcom/google/appinventor/components/common/StrokeStyle;

    iput-object v3, p0, Lcom/google/appinventor/components/runtime/Trendline;->strokeStyle:Lcom/google/appinventor/components/common/StrokeStyle;

    .line 91
    iput-boolean v2, p0, Lcom/google/appinventor/components/runtime/Trendline;->visible:Z

    .line 92
    new-instance v3, Lcom/google/appinventor/components/common/LinearRegression;

    invoke-direct {v3}, Lcom/google/appinventor/components/common/LinearRegression;-><init>()V

    iput-object v3, p0, Lcom/google/appinventor/components/runtime/Trendline;->regression:Lcom/google/appinventor/components/common/LinearRegression;

    .line 93
    new-instance v4, Lcom/google/appinventor/components/runtime/util/QuadraticRegression;

    invoke-direct {v4}, Lcom/google/appinventor/components/runtime/util/QuadraticRegression;-><init>()V

    iput-object v4, p0, Lcom/google/appinventor/components/runtime/Trendline;->quadraticRegression:Lcom/google/appinventor/components/runtime/util/QuadraticRegression;

    .line 94
    new-instance v4, Lcom/google/appinventor/components/runtime/util/ExponentialRegression;

    invoke-direct {v4}, Lcom/google/appinventor/components/runtime/util/ExponentialRegression;-><init>()V

    iput-object v4, p0, Lcom/google/appinventor/components/runtime/Trendline;->exponentialRegression:Lcom/google/appinventor/components/runtime/util/ExponentialRegression;

    .line 95
    new-instance v4, Lcom/google/appinventor/components/runtime/util/LogarithmicRegression;

    invoke-direct {v4}, Lcom/google/appinventor/components/runtime/util/LogarithmicRegression;-><init>()V

    iput-object v4, p0, Lcom/google/appinventor/components/runtime/Trendline;->logarithmicRegression:Lcom/google/appinventor/components/runtime/util/LogarithmicRegression;

    .line 96
    iput-object v3, p0, Lcom/google/appinventor/components/runtime/Trendline;->currentModel:Lcom/google/appinventor/components/common/TrendlineCalculator;

    .line 97
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    .line 98
    iput-boolean v1, p0, Lcom/google/appinventor/components/runtime/Trendline;->initialized:Z

    .line 99
    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->dataModel:Lcom/google/appinventor/components/runtime/DataModel;

    .line 100
    const-wide/high16 v3, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    iput-wide v3, p0, Lcom/google/appinventor/components/runtime/Trendline;->minX:D

    .line 101
    const-wide/high16 v3, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    iput-wide v3, p0, Lcom/google/appinventor/components/runtime/Trendline;->maxX:D

    .line 110
    invoke-virtual {p1}, Lcom/google/appinventor/components/runtime/Chart;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Form;->deviceDensity()F

    move-result v0

    iput v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->density:F

    .line 111
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    .line 112
    invoke-virtual {p1, p0}, Lcom/google/appinventor/components/runtime/Chart;->addDataComponent(Lcom/google/appinventor/components/runtime/ChartComponent;)V

    .line 113
    new-instance v3, Landroid/graphics/DashPathEffect;

    const/4 v4, 0x2

    new-array v5, v4, [F

    const/high16 v6, 0x41200000    # 10.0f

    mul-float v7, v0, v6

    aput v7, v5, v1

    mul-float v7, v0, v6

    aput v7, v5, v2

    const/4 v7, 0x0

    invoke-direct {v3, v5, v7}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    iput-object v3, p0, Lcom/google/appinventor/components/runtime/Trendline;->dashed:Landroid/graphics/DashPathEffect;

    .line 114
    new-instance v3, Landroid/graphics/DashPathEffect;

    new-array v4, v4, [F

    const/high16 v5, 0x40000000    # 2.0f

    mul-float v5, v5, v0

    aput v5, v4, v1

    mul-float v0, v0, v6

    aput v0, v4, v2

    invoke-direct {v3, v4, v7}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    iput-object v3, p0, Lcom/google/appinventor/components/runtime/Trendline;->dotted:Landroid/graphics/DashPathEffect;

    .line 115
    return-void
.end method

.method private getColor()I
    .locals 4

    .line 584
    iget v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->color:I

    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Trendline;->chartData:Lcom/google/appinventor/components/runtime/ChartData2D;

    if-eqz v1, :cond_0

    .line 585
    invoke-virtual {v1}, Lcom/google/appinventor/components/runtime/ChartData2D;->Color()I

    move-result v0

    .line 586
    .local v0, "color":I
    shr-int/lit8 v1, v0, 0x18

    and-int/lit16 v1, v1, 0xff

    .line 587
    .local v1, "alpha":I
    const v2, 0xffffff

    and-int/2addr v2, v0

    div-int/lit8 v3, v1, 0x2

    shl-int/lit8 v3, v3, 0x18

    or-int/2addr v2, v3

    return v2

    .line 589
    .end local v0    # "color":I
    .end local v1    # "alpha":I
    :cond_0
    return v0
.end method

.method private getDashPathEffect()Landroid/graphics/DashPathEffect;
    .locals 2

    .line 547
    sget-object v0, Lcom/google/appinventor/components/runtime/Trendline$3;->$SwitchMap$com$google$appinventor$components$common$StrokeStyle:[I

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Trendline;->strokeStyle:Lcom/google/appinventor/components/common/StrokeStyle;

    invoke-virtual {v1}, Lcom/google/appinventor/components/common/StrokeStyle;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 554
    const/4 v0, 0x0

    return-object v0

    .line 551
    :pswitch_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->dotted:Landroid/graphics/DashPathEffect;

    return-object v0

    .line 549
    :pswitch_1
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->dashed:Landroid/graphics/DashPathEffect;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getPoints(FFI)[F
    .locals 8
    .param p1, "xMin"    # F
    .param p2, "xMax"    # F
    .param p3, "viewWidth"    # I

    .line 559
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->initialized:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->chartData:Lcom/google/appinventor/components/runtime/ChartData2D;

    if-nez v0, :cond_0

    goto :goto_1

    .line 562
    :cond_0
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->extend:Z

    if-nez v0, :cond_1

    .line 563
    iget-wide v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->minX:D

    double-to-float v0, v0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 564
    iget-wide v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->maxX:D

    double-to-float v0, v0

    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    move-result p2

    .line 567
    :cond_1
    sget-object v0, Lcom/google/appinventor/components/runtime/Trendline$3;->$SwitchMap$com$google$appinventor$components$common$StrokeStyle:[I

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Trendline;->strokeStyle:Lcom/google/appinventor/components/common/StrokeStyle;

    invoke-virtual {v1}, Lcom/google/appinventor/components/common/StrokeStyle;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 576
    const/4 v0, 0x1

    move v6, v0

    .local v0, "strokeStep":I
    goto :goto_0

    .line 572
    .end local v0    # "strokeStep":I
    :pswitch_0
    const/16 v0, 0xc

    .line 573
    .restart local v0    # "strokeStep":I
    move v6, v0

    goto :goto_0

    .line 569
    .end local v0    # "strokeStep":I
    :pswitch_1
    const/16 v0, 0x14

    .line 570
    .restart local v0    # "strokeStep":I
    move v6, v0

    .line 579
    .end local v0    # "strokeStep":I
    .local v6, "strokeStep":I
    :goto_0
    int-to-float v0, p3

    iget v1, p0, Lcom/google/appinventor/components/runtime/Trendline;->density:F

    int-to-float v2, v6

    mul-float v1, v1, v2

    div-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v7, v0

    .line 580
    .local v7, "steps":I
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->currentModel:Lcom/google/appinventor/components/common/TrendlineCalculator;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, v7

    invoke-interface/range {v0 .. v5}, Lcom/google/appinventor/components/common/TrendlineCalculator;->computePoints(Ljava/util/Map;FFII)[F

    move-result-object v0

    return-object v0

    .line 560
    .end local v6    # "strokeStep":I
    .end local v7    # "steps":I
    :cond_2
    :goto_1
    const/4 v0, 0x0

    new-array v0, v0, [F

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static resultOrNan(Ljava/lang/Double;)D
    .locals 2
    .param p0, "value"    # Ljava/lang/Double;

    .line 593
    if-nez p0, :cond_0

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    :goto_0
    return-wide v0
.end method

.method private static resultOrZero(Ljava/lang/Double;)D
    .locals 2
    .param p0, "value"    # Ljava/lang/Double;

    .line 597
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    :goto_0
    return-wide v0
.end method


# virtual methods
.method public ChartData(Lcom/google/appinventor/components/runtime/ChartData2D;)V
    .locals 1
    .param p1, "chartData"    # Lcom/google/appinventor/components/runtime/ChartData2D;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "component:com.google.appinventor.component.runtime.ChartData2D"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The data series for which to compute the line of best fit."
    .end annotation

    .line 216
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->chartData:Lcom/google/appinventor/components/runtime/ChartData2D;

    if-eqz v0, :cond_0

    .line 217
    invoke-virtual {v0, p0}, Lcom/google/appinventor/components/runtime/ChartData2D;->removeDataSourceChangeListener(Lcom/google/appinventor/components/runtime/DataSourceChangeListener;)V

    .line 219
    :cond_0
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Trendline;->chartData:Lcom/google/appinventor/components/runtime/ChartData2D;

    .line 220
    if-eqz p1, :cond_1

    .line 221
    invoke-virtual {p1, p0}, Lcom/google/appinventor/components/runtime/ChartData2D;->addDataSourceChangeListener(Lcom/google/appinventor/components/runtime/DataSourceChangeListener;)V

    .line 223
    :cond_1
    return-void
.end method

.method public Color()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 242
    iget v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->color:I

    return v0
.end method

.method public Color(I)V
    .locals 1
    .param p1, "color"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "&H00000000"
        editorType = "color"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The color of the line of best fit."
    .end annotation

    .line 233
    iput p1, p0, Lcom/google/appinventor/components/runtime/Trendline;->color:I

    .line 234
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->initialized:Z

    if-eqz v0, :cond_0

    .line 235
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Chart;->refresh()V

    .line 237
    :cond_0
    return-void
.end method

.method public CorrelationCoefficient()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 250
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    const-string v1, "correlation coefficient"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Trendline;->resultOrNan(Ljava/lang/Double;)D

    move-result-wide v0

    return-wide v0
.end method

.method public DisconnectFromChartData()V
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
    .end annotation

    .line 499
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->chartData:Lcom/google/appinventor/components/runtime/ChartData2D;

    if-eqz v0, :cond_0

    .line 500
    invoke-virtual {v0, p0}, Lcom/google/appinventor/components/runtime/ChartData2D;->removeDataSourceChangeListener(Lcom/google/appinventor/components/runtime/DataSourceChangeListener;)V

    .line 502
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 503
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Chart;->refresh()V

    .line 504
    return-void
.end method

.method public ExponentialBase()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 258
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    const-string v1, "b"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Trendline;->resultOrNan(Ljava/lang/Double;)D

    move-result-wide v0

    return-wide v0
.end method

.method public ExponentialCoefficient()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 266
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    const-string v1, "a"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Trendline;->resultOrNan(Ljava/lang/Double;)D

    move-result-wide v0

    return-wide v0
.end method

.method public Extend(Z)V
    .locals 1
    .param p1, "extend"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "True"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Whether to extend the line of best fit beyond the data."
    .end annotation

    .line 277
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Trendline;->extend:Z

    .line 278
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->initialized:Z

    if-eqz v0, :cond_0

    .line 279
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Chart;->refresh()V

    .line 281
    :cond_0
    return-void
.end method

.method public Extend()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 285
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->extend:Z

    return v0
.end method

.method public GetResultValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
        .annotation runtime Lcom/google/appinventor/components/annotations/Options;
            value = Lcom/google/appinventor/components/common/LOBFValues;
        .end annotation
    .end param
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
    .end annotation

    .line 516
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 517
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 519
    :cond_0
    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public Initialize()V
    .locals 1

    .line 122
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->initialized:Z

    .line 123
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->dataModel:Lcom/google/appinventor/components/runtime/DataModel;

    if-nez v0, :cond_0

    .line 124
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Trendline;->initChartData()V

    .line 126
    :cond_0
    return-void
.end method

.method public LinearCoefficient()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 293
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    const-string v1, "slope"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Trendline;->resultOrNan(Ljava/lang/Double;)D

    move-result-wide v0

    return-wide v0
.end method

.method public LogarithmCoefficient()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 301
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    const-string v1, "b"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Trendline;->resultOrNan(Ljava/lang/Double;)D

    move-result-wide v0

    return-wide v0
.end method

.method public LogarithmConstant()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 309
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    const-string v1, "a"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Trendline;->resultOrNan(Ljava/lang/Double;)D

    move-result-wide v0

    return-wide v0
.end method

.method public Model()Lcom/google/appinventor/components/common/BestFitModel;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 344
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->model:Lcom/google/appinventor/components/common/BestFitModel;

    return-object v0
.end method

.method public Model(Lcom/google/appinventor/components/common/BestFitModel;)V
    .locals 3
    .param p1, "model"    # Lcom/google/appinventor/components/common/BestFitModel;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "Linear"
        editorType = "best_fit_model"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The model to use for the line of best fit."
    .end annotation

    .line 320
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Trendline;->model:Lcom/google/appinventor/components/common/BestFitModel;

    .line 321
    sget-object v0, Lcom/google/appinventor/components/runtime/Trendline$3;->$SwitchMap$com$google$appinventor$components$common$BestFitModel:[I

    invoke-virtual {p1}, Lcom/google/appinventor/components/common/BestFitModel;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 335
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown model: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 332
    :pswitch_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->logarithmicRegression:Lcom/google/appinventor/components/runtime/util/LogarithmicRegression;

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->currentModel:Lcom/google/appinventor/components/common/TrendlineCalculator;

    .line 333
    goto :goto_0

    .line 329
    :pswitch_1
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->exponentialRegression:Lcom/google/appinventor/components/runtime/util/ExponentialRegression;

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->currentModel:Lcom/google/appinventor/components/common/TrendlineCalculator;

    .line 330
    goto :goto_0

    .line 326
    :pswitch_2
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->quadraticRegression:Lcom/google/appinventor/components/runtime/util/QuadraticRegression;

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->currentModel:Lcom/google/appinventor/components/common/TrendlineCalculator;

    .line 327
    goto :goto_0

    .line 323
    :pswitch_3
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->regression:Lcom/google/appinventor/components/common/LinearRegression;

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->currentModel:Lcom/google/appinventor/components/common/TrendlineCalculator;

    .line 324
    nop

    .line 337
    :goto_0
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->initialized:Z

    if-eqz v0, :cond_0

    .line 338
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Chart;->refresh()V

    .line 340
    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public Predictions()Ljava/util/List;
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 352
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    const-string v1, "predictions"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 354
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, v0, Ljava/util/List;

    if-eqz v1, :cond_0

    .line 356
    move-object v1, v0

    check-cast v1, Ljava/util/List;

    return-object v1

    .line 361
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    return-object v1
.end method

.method public QuadraticCoefficient()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 369
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    const-string v1, "x^2"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Trendline;->resultOrZero(Ljava/lang/Double;)D

    move-result-wide v0

    return-wide v0
.end method

.method public RSquared()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 385
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    const-string v1, "r^2"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/Trendline;->resultOrNan(Ljava/lang/Double;)D

    move-result-wide v0

    return-wide v0
.end method

.method public Results()Lcom/google/appinventor/components/runtime/util/YailDictionary;
    .locals 3
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 377
    new-instance v0, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    sget-object v2, Lcom/google/appinventor/components/runtime/Trendline;->ENUM_KEY_TRANSFORMER:Lcom/google/appinventor/components/runtime/util/YailDictionary$KeyTransformer;

    invoke-direct {v0, v1, v2}, Lcom/google/appinventor/components/runtime/util/YailDictionary;-><init>(Ljava/util/Map;Lcom/google/appinventor/components/runtime/util/YailDictionary$KeyTransformer;)V

    return-object v0
.end method

.method public StrokeStyle()Lcom/google/appinventor/components/common/StrokeStyle;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 427
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->strokeStyle:Lcom/google/appinventor/components/common/StrokeStyle;

    return-object v0
.end method

.method public StrokeStyle(I)V
    .locals 1
    .param p1, "value"    # I

    .line 407
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lcom/google/appinventor/components/common/StrokeStyle;->fromUnderlyingValue(Ljava/lang/Integer;)Lcom/google/appinventor/components/common/StrokeStyle;

    move-result-object v0

    .line 408
    .local v0, "strokeStyle":Lcom/google/appinventor/components/common/StrokeStyle;
    if-eqz v0, :cond_0

    .line 409
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Trendline;->StrokeStyle(Lcom/google/appinventor/components/common/StrokeStyle;)V

    .line 411
    :cond_0
    return-void
.end method

.method public StrokeStyle(Lcom/google/appinventor/components/common/StrokeStyle;)V
    .locals 1
    .param p1, "strokeStyle"    # Lcom/google/appinventor/components/common/StrokeStyle;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "1"
        editorType = "stroke_style"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The style of the best fit line."
    .end annotation

    .line 396
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Trendline;->strokeStyle:Lcom/google/appinventor/components/common/StrokeStyle;

    .line 397
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->initialized:Z

    if-eqz v0, :cond_0

    .line 398
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Chart;->refresh()V

    .line 400
    :cond_0
    return-void
.end method

.method public StrokeStyle(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .line 419
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Trendline;->StrokeStyle(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 422
    goto :goto_0

    .line 420
    :catch_0
    move-exception v0

    .line 423
    :goto_0
    return-void
.end method

.method public StrokeWidth()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 446
    iget-wide v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->strokeWidth:D

    return-wide v0
.end method

.method public StrokeWidth(D)V
    .locals 1
    .param p1, "strokeWidth"    # D
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "1.0"
        editorType = "non_negative_float"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The width of the best fit line."
    .end annotation

    .line 438
    iput-wide p1, p0, Lcom/google/appinventor/components/runtime/Trendline;->strokeWidth:D

    .line 439
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->initialized:Z

    if-eqz v0, :cond_0

    .line 440
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Chart;->refresh()V

    .line 442
    :cond_0
    return-void
.end method

.method public Updated(Lcom/google/appinventor/components/runtime/util/YailDictionary;)V
    .locals 2
    .param p1, "results"    # Lcom/google/appinventor/components/runtime/util/YailDictionary;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
    .end annotation

    .line 531
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "Updated"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 532
    return-void
.end method

.method public Visible(Z)V
    .locals 1
    .param p1, "visible"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "True"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
    .end annotation

    .line 456
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Trendline;->visible:Z

    .line 457
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->initialized:Z

    if-eqz v0, :cond_0

    .line 458
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Chart;->refresh()V

    .line 460
    :cond_0
    return-void
.end method

.method public Visible()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 464
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->visible:Z

    return v0
.end method

.method public XIntercepts()Ljava/lang/Object;
    .locals 3
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 473
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    const-string v1, "Xintercepts"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 474
    .local v0, "result":Ljava/lang/Object;
    if-nez v0, :cond_0

    const-wide/high16 v1, 0x7ff8000000000000L    # Double.NaN

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1
.end method

.method public YIntercept()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 482
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    const-string v1, "Yintercept"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 483
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0

    .line 484
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    const-string v1, "intercept"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 485
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0

    .line 487
    :cond_1
    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    return-wide v0
.end method

.method public getDispatchDelegate()Lcom/google/appinventor/components/runtime/HandlesEventDispatching;
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Chart;->getDispatchDelegate()Lcom/google/appinventor/components/runtime/HandlesEventDispatching;

    move-result-object v0

    return-object v0
.end method

.method public initChartData()V
    .locals 4

    .line 538
    sget-object v0, Lcom/google/appinventor/components/runtime/Trendline;->LOG_TAG:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v1}, Lcom/google/appinventor/components/runtime/Chart;->getChartView()Lcom/google/appinventor/components/runtime/ChartView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "initChartData view is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 539
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Chart;->getChartView()Lcom/google/appinventor/components/runtime/ChartView;

    move-result-object v0

    instance-of v0, v0, Lcom/google/appinventor/components/runtime/ScatterChartView;

    if-eqz v0, :cond_0

    .line 540
    new-instance v0, Lcom/google/appinventor/components/runtime/Trendline$ScatterChartBestFitModel;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/Trendline$ScatterChartBestFitModel;-><init>(Lcom/google/appinventor/components/runtime/Trendline;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->dataModel:Lcom/google/appinventor/components/runtime/DataModel;

    goto :goto_0

    .line 541
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Chart;->getChartView()Lcom/google/appinventor/components/runtime/ChartView;

    move-result-object v0

    instance-of v0, v0, Lcom/google/appinventor/components/runtime/PointChartView;

    if-eqz v0, :cond_1

    .line 542
    new-instance v0, Lcom/google/appinventor/components/runtime/Trendline$LineChartBestFitModel;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/Trendline$LineChartBestFitModel;-><init>(Lcom/google/appinventor/components/runtime/Trendline;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->dataModel:Lcom/google/appinventor/components/runtime/DataModel;

    .line 544
    :cond_1
    :goto_0
    return-void
.end method

.method public onDataSourceValueChange(Lcom/google/appinventor/components/runtime/DataSource;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 12
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "newValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/appinventor/components/runtime/DataSource<",
            "**>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 141
    .local p1, "component":Lcom/google/appinventor/components/runtime/DataSource;, "Lcom/google/appinventor/components/runtime/DataSource<**>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 142
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/google/appinventor/components/runtime/DataSource;->getDataValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 147
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, v0, Ljava/util/List;

    if-nez v1, :cond_0

    .line 148
    return-void

    .line 150
    :cond_0
    move-object v1, v0

    check-cast v1, Ljava/util/List;

    .line 151
    .local v1, "entries":Ljava/util/List;, "Ljava/util/List<*>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 152
    .local v2, "x":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 153
    .local v3, "y":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    const-wide/high16 v4, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    iput-wide v4, p0, Lcom/google/appinventor/components/runtime/Trendline;->minX:D

    .line 154
    const-wide/high16 v4, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    iput-wide v4, p0, Lcom/google/appinventor/components/runtime/Trendline;->maxX:D

    .line 155
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 156
    .local v5, "o":Ljava/lang/Object;
    instance-of v6, v5, Lcom/github/mikephil/charting/data/Entry;

    if-eqz v6, :cond_3

    .line 157
    move-object v6, v5

    check-cast v6, Lcom/github/mikephil/charting/data/Entry;

    .line 158
    .local v6, "entry":Lcom/github/mikephil/charting/data/Entry;
    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/Entry;->getX()F

    move-result v7

    float-to-double v7, v7

    .line 159
    .local v7, "currentX":D
    iget-wide v9, p0, Lcom/google/appinventor/components/runtime/Trendline;->minX:D

    cmpg-double v11, v7, v9

    if-gez v11, :cond_1

    .line 160
    iput-wide v7, p0, Lcom/google/appinventor/components/runtime/Trendline;->minX:D

    .line 162
    :cond_1
    iget-wide v9, p0, Lcom/google/appinventor/components/runtime/Trendline;->maxX:D

    cmpl-double v11, v7, v9

    if-lez v11, :cond_2

    .line 163
    iput-wide v7, p0, Lcom/google/appinventor/components/runtime/Trendline;->maxX:D

    .line 165
    :cond_2
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/Entry;->getY()F

    move-result v9

    float-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    .end local v5    # "o":Ljava/lang/Object;
    .end local v6    # "entry":Lcom/github/mikephil/charting/data/Entry;
    .end local v7    # "currentX":D
    :cond_3
    goto :goto_0

    .line 169
    :cond_4
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 170
    sget-object v4, Lcom/google/appinventor/components/runtime/Trendline;->LOG_TAG:Ljava/lang/String;

    const-string v5, "No entries in the data source"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    return-void

    .line 172
    :cond_5
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x2

    if-ge v4, v5, :cond_6

    .line 173
    sget-object v4, Lcom/google/appinventor/components/runtime/Trendline;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Not enough entries in the data source"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    return-void

    .line 175
    :cond_6
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-eq v4, v5, :cond_7

    .line 176
    sget-object v4, Lcom/google/appinventor/components/runtime/Trendline;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Must have equal X and Y data points"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    return-void

    .line 179
    :cond_7
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/Trendline;->currentModel:Lcom/google/appinventor/components/common/TrendlineCalculator;

    invoke-interface {v4, v2, v3}, Lcom/google/appinventor/components/common/TrendlineCalculator;->compute(Ljava/util/List;Ljava/util/List;)Ljava/util/Map;

    move-result-object v4

    iput-object v4, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    .line 183
    iget-boolean v4, p0, Lcom/google/appinventor/components/runtime/Trendline;->initialized:Z

    if-eqz v4, :cond_8

    .line 184
    new-instance v4, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    iget-object v5, p0, Lcom/google/appinventor/components/runtime/Trendline;->lastResults:Ljava/util/Map;

    sget-object v6, Lcom/google/appinventor/components/runtime/Trendline;->ENUM_KEY_TRANSFORMER:Lcom/google/appinventor/components/runtime/util/YailDictionary$KeyTransformer;

    invoke-direct {v4, v5, v6}, Lcom/google/appinventor/components/runtime/util/YailDictionary;-><init>(Ljava/util/Map;Lcom/google/appinventor/components/runtime/util/YailDictionary$KeyTransformer;)V

    .line 185
    .local v4, "results":Lcom/google/appinventor/components/runtime/util/YailDictionary;
    iget-object v5, p0, Lcom/google/appinventor/components/runtime/Trendline;->container:Lcom/google/appinventor/components/runtime/Chart;

    invoke-virtual {v5}, Lcom/google/appinventor/components/runtime/Chart;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v5

    new-instance v6, Lcom/google/appinventor/components/runtime/Trendline$2;

    invoke-direct {v6, p0, v4}, Lcom/google/appinventor/components/runtime/Trendline$2;-><init>(Lcom/google/appinventor/components/runtime/Trendline;Lcom/google/appinventor/components/runtime/util/YailDictionary;)V

    invoke-virtual {v5, v6}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 195
    .end local v4    # "results":Lcom/google/appinventor/components/runtime/util/YailDictionary;
    :cond_8
    return-void
.end method

.method public onReceiveValue(Lcom/google/appinventor/components/runtime/RealTimeDataSource;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/appinventor/components/runtime/RealTimeDataSource<",
            "**>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 200
    .local p1, "component":Lcom/google/appinventor/components/runtime/RealTimeDataSource;, "Lcom/google/appinventor/components/runtime/RealTimeDataSource<**>;"
    return-void
.end method
