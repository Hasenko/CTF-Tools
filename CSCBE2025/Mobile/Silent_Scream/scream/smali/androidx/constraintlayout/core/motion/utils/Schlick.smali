.class public Landroidx/constraintlayout/core/motion/utils/Schlick;
.super Landroidx/constraintlayout/core/motion/utils/Easing;
.source "Schlick.java"


# static fields
.field private static final DEBUG:Z = false


# instance fields
.field mEps:D

.field mS:D

.field mT:D


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 5
    .param p1, "configString"    # Ljava/lang/String;

    .line 28
    invoke-direct {p0}, Landroidx/constraintlayout/core/motion/utils/Easing;-><init>()V

    .line 31
    iput-object p1, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mStr:Ljava/lang/String;

    .line 32
    const/16 v0, 0x28

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 33
    .local v0, "start":I
    const/16 v1, 0x2c

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 34
    .local v2, "off1":I
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    iput-wide v3, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mS:D

    .line 35
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 36
    .local v1, "off2":I
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    iput-wide v3, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    .line 37
    return-void
.end method

.method private dfunc(D)D
    .locals 10
    .param p1, "x"    # D

    .line 47
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    cmpg-double v0, p1, v0

    if-gez v0, :cond_0

    .line 48
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mS:D

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    mul-double/2addr v0, v2

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    mul-double/2addr v0, v2

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mS:D

    iget-wide v4, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    sub-double/2addr v4, p1

    mul-double/2addr v2, v4

    add-double/2addr v2, p1

    iget-wide v4, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mS:D

    iget-wide v6, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    sub-double/2addr v6, p1

    mul-double/2addr v4, v6

    add-double/2addr v4, p1

    mul-double/2addr v2, v4

    div-double/2addr v0, v2

    return-wide v0

    .line 50
    :cond_0
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mS:D

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v2, v4

    mul-double/2addr v0, v2

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    sub-double/2addr v2, v4

    mul-double/2addr v0, v2

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mS:D

    neg-double v2, v2

    iget-wide v6, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    sub-double/2addr v6, p1

    mul-double/2addr v2, v6

    sub-double/2addr v2, p1

    add-double/2addr v2, v4

    iget-wide v6, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mS:D

    neg-double v6, v6

    iget-wide v8, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    sub-double/2addr v8, p1

    mul-double/2addr v6, v8

    sub-double/2addr v6, p1

    add-double/2addr v6, v4

    mul-double/2addr v2, v6

    div-double/2addr v0, v2

    return-wide v0
.end method

.method private func(D)D
    .locals 8
    .param p1, "x"    # D

    .line 40
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    cmpg-double v0, p1, v0

    if-gez v0, :cond_0

    .line 41
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    mul-double/2addr v0, p1

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mS:D

    iget-wide v4, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    sub-double/2addr v4, p1

    mul-double/2addr v2, v4

    add-double/2addr v2, p1

    div-double/2addr v0, v2

    return-wide v0

    .line 43
    :cond_0
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sub-double v0, v2, v0

    sub-double v4, p1, v2

    mul-double/2addr v0, v4

    sub-double/2addr v2, p1

    iget-wide v4, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mS:D

    iget-wide v6, p0, Landroidx/constraintlayout/core/motion/utils/Schlick;->mT:D

    sub-double/2addr v6, p1

    mul-double/2addr v4, v6

    sub-double/2addr v2, v4

    div-double/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public get(D)D
    .locals 2
    .param p1, "x"    # D

    .line 62
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/core/motion/utils/Schlick;->func(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public getDiff(D)D
    .locals 2
    .param p1, "x"    # D

    .line 56
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/core/motion/utils/Schlick;->dfunc(D)D

    move-result-wide v0

    return-wide v0
.end method
