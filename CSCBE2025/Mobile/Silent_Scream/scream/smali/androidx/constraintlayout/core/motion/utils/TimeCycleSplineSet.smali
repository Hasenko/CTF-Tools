.class public abstract Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;
.super Ljava/lang/Object;
.source "TimeCycleSplineSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet$Sort;,
        Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet$CustomVarSet;,
        Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet$CustomSet;
    }
.end annotation


# static fields
.field protected static final CURVE_OFFSET:I = 0x2

.field protected static final CURVE_PERIOD:I = 0x1

.field protected static final CURVE_VALUE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "SplineSet"

.field protected static sVal2PI:F


# instance fields
.field protected mCache:[F

.field protected mContinue:Z

.field protected mCount:I

.field protected mCurveFit:Landroidx/constraintlayout/core/motion/utils/CurveFit;

.field protected mLastCycle:F

.field protected mLastTime:J

.field protected mTimePoints:[I

.field protected mType:Ljava/lang/String;

.field protected mValues:[[F

.field protected mWaveShape:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    const v0, 0x40c90fdb

    sput v0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->sVal2PI:F

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mWaveShape:I

    .line 33
    const/16 v1, 0xa

    new-array v2, v1, [I

    iput-object v2, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mTimePoints:[I

    .line 34
    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x1

    const/4 v4, 0x3

    aput v4, v2, v3

    aput v1, v2, v0

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[F

    iput-object v1, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mValues:[[F

    .line 37
    new-array v1, v4, [F

    iput-object v1, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mCache:[F

    .line 42
    iput-boolean v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mContinue:Z

    .line 44
    const/high16 v0, 0x7fc00000    # Float.NaN

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mLastCycle:F

    return-void
.end method


# virtual methods
.method protected calcWave(F)F
    .locals 5
    .param p1, "period"    # F

    .line 64
    move v0, p1

    .line 65
    .local v0, "p":F
    iget v1, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mWaveShape:I

    const/high16 v2, 0x40000000    # 2.0f

    const/high16 v3, 0x3f800000    # 1.0f

    packed-switch v1, :pswitch_data_0

    .line 68
    sget v1, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->sVal2PI:F

    mul-float/2addr v1, v0

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v1

    double-to-float v1, v1

    return v1

    .line 80
    :pswitch_0
    const/high16 v1, 0x40800000    # 4.0f

    mul-float v4, v0, v1

    rem-float/2addr v4, v1

    sub-float/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v1

    sub-float v1, v3, v1

    .line 81
    .local v1, "x":F
    mul-float v2, v1, v1

    sub-float/2addr v3, v2

    return v3

    .line 78
    .end local v1    # "x":F
    :pswitch_1
    sget v1, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->sVal2PI:F

    mul-float/2addr v1, v0

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v1

    double-to-float v1, v1

    return v1

    .line 76
    :pswitch_2
    mul-float v1, v0, v2

    add-float/2addr v1, v3

    rem-float/2addr v1, v2

    sub-float/2addr v3, v1

    return v3

    .line 74
    :pswitch_3
    mul-float v1, v0, v2

    add-float/2addr v1, v3

    rem-float/2addr v1, v2

    sub-float/2addr v1, v3

    return v1

    .line 72
    :pswitch_4
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v1

    sub-float/2addr v3, v1

    return v3

    .line 70
    :pswitch_5
    sget v1, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->sVal2PI:F

    mul-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getCurveFit()Landroidx/constraintlayout/core/motion/utils/CurveFit;
    .locals 1

    .line 86
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mCurveFit:Landroidx/constraintlayout/core/motion/utils/CurveFit;

    return-object v0
.end method

.method public setPoint(IFFIF)V
    .locals 3
    .param p1, "position"    # I
    .param p2, "value"    # F
    .param p3, "period"    # F
    .param p4, "shape"    # I
    .param p5, "offset"    # F

    .line 95
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mTimePoints:[I

    iget v1, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mCount:I

    aput p1, v0, v1

    .line 96
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mValues:[[F

    iget v1, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mCount:I

    aget-object v0, v0, v1

    const/4 v1, 0x0

    aput p2, v0, v1

    .line 97
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mValues:[[F

    iget v1, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mCount:I

    aget-object v0, v0, v1

    const/4 v1, 0x1

    aput p3, v0, v1

    .line 98
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mValues:[[F

    iget v2, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mCount:I

    aget-object v0, v0, v2

    const/4 v2, 0x2

    aput p5, v0, v2

    .line 99
    iget v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mWaveShape:I

    invoke-static {v0, p4}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mWaveShape:I

    .line 100
    iget v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mCount:I

    add-int/2addr v0, v1

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mCount:I

    .line 101
    return-void
.end method

.method protected setStartTime(J)V
    .locals 0
    .param p1, "currentTime"    # J

    .line 90
    iput-wide p1, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mLastTime:J

    .line 91
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .line 57
    iput-object p1, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mType:Ljava/lang/String;

    .line 58
    return-void
.end method

.method public setup(I)V
    .locals 12
    .param p1, "curveType"    # I

    .line 189
    iget v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mCount:I

    if-nez v0, :cond_0

    .line 190
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error no points added to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 191
    return-void

    .line 193
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mTimePoints:[I

    iget-object v1, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mValues:[[F

    iget v2, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mCount:I

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    const/4 v4, 0x0

    invoke-static {v0, v1, v4, v2}, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet$Sort;->doubleQuickSort([I[[FII)V

    .line 194
    const/4 v0, 0x0

    .line 195
    .local v0, "unique":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mTimePoints:[I

    array-length v2, v2

    if-ge v1, v2, :cond_2

    .line 196
    iget-object v2, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mTimePoints:[I

    aget v2, v2, v1

    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mTimePoints:[I

    add-int/lit8 v6, v1, -0x1

    aget v5, v5, v6

    if-eq v2, v5, :cond_1

    .line 197
    add-int/lit8 v0, v0, 0x1

    .line 195
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 200
    .end local v1    # "i":I
    :cond_2
    if-nez v0, :cond_3

    .line 201
    const/4 v0, 0x1

    .line 203
    :cond_3
    new-array v1, v0, [D

    .line 204
    .local v1, "time":[D
    const/4 v2, 0x2

    new-array v5, v2, [I

    const/4 v6, 0x3

    aput v6, v5, v3

    aput v0, v5, v4

    sget-object v6, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v6, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [[D

    .line 205
    .local v5, "values":[[D
    const/4 v6, 0x0

    .line 207
    .local v6, "k":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    iget v8, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mCount:I

    if-ge v7, v8, :cond_5

    .line 208
    if-lez v7, :cond_4

    iget-object v8, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mTimePoints:[I

    aget v8, v8, v7

    iget-object v9, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mTimePoints:[I

    add-int/lit8 v10, v7, -0x1

    aget v9, v9, v10

    if-ne v8, v9, :cond_4

    .line 209
    goto :goto_2

    .line 211
    :cond_4
    iget-object v8, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mTimePoints:[I

    aget v8, v8, v7

    int-to-double v8, v8

    const-wide v10, 0x3f847ae147ae147bL    # 0.01

    mul-double/2addr v8, v10

    aput-wide v8, v1, v6

    .line 212
    aget-object v8, v5, v6

    iget-object v9, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mValues:[[F

    aget-object v9, v9, v7

    aget v9, v9, v4

    float-to-double v9, v9

    aput-wide v9, v8, v4

    .line 213
    aget-object v8, v5, v6

    iget-object v9, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mValues:[[F

    aget-object v9, v9, v7

    aget v9, v9, v3

    float-to-double v9, v9

    aput-wide v9, v8, v3

    .line 214
    aget-object v8, v5, v6

    iget-object v9, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mValues:[[F

    aget-object v9, v9, v7

    aget v9, v9, v2

    float-to-double v9, v9

    aput-wide v9, v8, v2

    .line 215
    add-int/lit8 v6, v6, 0x1

    .line 207
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 217
    .end local v7    # "i":I
    :cond_5
    invoke-static {p1, v1, v5}, Landroidx/constraintlayout/core/motion/utils/CurveFit;->get(I[D[[D)Landroidx/constraintlayout/core/motion/utils/CurveFit;

    move-result-object v2

    iput-object v2, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mCurveFit:Landroidx/constraintlayout/core/motion/utils/CurveFit;

    .line 218
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 48
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mType:Ljava/lang/String;

    .line 49
    .local v0, "str":Ljava/lang/String;
    new-instance v1, Ljava/text/DecimalFormat;

    const-string v2, "##.##"

    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 50
    .local v1, "df":Ljava/text/DecimalFormat;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget v3, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mCount:I

    if-ge v2, v3, :cond_0

    .line 51
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mTimePoints:[I

    aget v4, v4, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " , "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroidx/constraintlayout/core/motion/utils/TimeCycleSplineSet;->mValues:[[F

    aget-object v4, v4, v2

    invoke-virtual {v1, v4}, Ljava/text/DecimalFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 50
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 53
    .end local v2    # "i":I
    :cond_0
    return-object v0
.end method
