.class public abstract Landroidx/constraintlayout/motion/utils/ViewOscillator;
.super Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;
.source "ViewOscillator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/motion/utils/ViewOscillator$CustomSet;,
        Landroidx/constraintlayout/motion/utils/ViewOscillator$AlphaSet;,
        Landroidx/constraintlayout/motion/utils/ViewOscillator$ElevationSet;,
        Landroidx/constraintlayout/motion/utils/ViewOscillator$RotationSet;,
        Landroidx/constraintlayout/motion/utils/ViewOscillator$RotationXset;,
        Landroidx/constraintlayout/motion/utils/ViewOscillator$RotationYset;,
        Landroidx/constraintlayout/motion/utils/ViewOscillator$PathRotateSet;,
        Landroidx/constraintlayout/motion/utils/ViewOscillator$ScaleXset;,
        Landroidx/constraintlayout/motion/utils/ViewOscillator$ScaleYset;,
        Landroidx/constraintlayout/motion/utils/ViewOscillator$TranslationXset;,
        Landroidx/constraintlayout/motion/utils/ViewOscillator$TranslationYset;,
        Landroidx/constraintlayout/motion/utils/ViewOscillator$TranslationZset;,
        Landroidx/constraintlayout/motion/utils/ViewOscillator$ProgressSet;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ViewOscillator"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;-><init>()V

    return-void
.end method

.method public static makeSpline(Ljava/lang/String;)Landroidx/constraintlayout/motion/utils/ViewOscillator;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 52
    const-string v0, "CUSTOM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$CustomSet;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$CustomSet;-><init>()V

    return-object v0

    .line 55
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_1
    goto/16 :goto_0

    :sswitch_0
    const-string/jumbo v0, "waveOffset"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x8

    goto/16 :goto_1

    :sswitch_1
    const-string v0, "alpha"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    goto/16 :goto_1

    :sswitch_2
    const-string/jumbo v0, "transitionPathRotate"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x5

    goto/16 :goto_1

    :sswitch_3
    const-string v0, "elevation"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto/16 :goto_1

    :sswitch_4
    const-string v0, "rotation"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    goto :goto_1

    :sswitch_5
    const-string/jumbo v0, "waveVariesBy"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x9

    goto :goto_1

    :sswitch_6
    const-string v0, "scaleY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x7

    goto :goto_1

    :sswitch_7
    const-string v0, "scaleX"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x6

    goto :goto_1

    :sswitch_8
    const-string v0, "progress"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xd

    goto :goto_1

    :sswitch_9
    const-string/jumbo v0, "translationZ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xc

    goto :goto_1

    :sswitch_a
    const-string/jumbo v0, "translationY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xb

    goto :goto_1

    :sswitch_b
    const-string/jumbo v0, "translationX"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xa

    goto :goto_1

    :sswitch_c
    const-string v0, "rotationY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x4

    goto :goto_1

    :sswitch_d
    const-string v0, "rotationX"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x3

    goto :goto_1

    :goto_0
    const/4 v0, -0x1

    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 85
    const/4 v0, 0x0

    return-object v0

    .line 83
    :pswitch_0
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$ProgressSet;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$ProgressSet;-><init>()V

    return-object v0

    .line 81
    :pswitch_1
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$TranslationZset;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$TranslationZset;-><init>()V

    return-object v0

    .line 79
    :pswitch_2
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$TranslationYset;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$TranslationYset;-><init>()V

    return-object v0

    .line 77
    :pswitch_3
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$TranslationXset;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$TranslationXset;-><init>()V

    return-object v0

    .line 75
    :pswitch_4
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$AlphaSet;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$AlphaSet;-><init>()V

    return-object v0

    .line 73
    :pswitch_5
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$AlphaSet;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$AlphaSet;-><init>()V

    return-object v0

    .line 71
    :pswitch_6
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$ScaleYset;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$ScaleYset;-><init>()V

    return-object v0

    .line 69
    :pswitch_7
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$ScaleXset;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$ScaleXset;-><init>()V

    return-object v0

    .line 67
    :pswitch_8
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$PathRotateSet;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$PathRotateSet;-><init>()V

    return-object v0

    .line 65
    :pswitch_9
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$RotationYset;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$RotationYset;-><init>()V

    return-object v0

    .line 63
    :pswitch_a
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$RotationXset;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$RotationXset;-><init>()V

    return-object v0

    .line 61
    :pswitch_b
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$RotationSet;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$RotationSet;-><init>()V

    return-object v0

    .line 59
    :pswitch_c
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$ElevationSet;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$ElevationSet;-><init>()V

    return-object v0

    .line 57
    :pswitch_d
    new-instance v0, Landroidx/constraintlayout/motion/utils/ViewOscillator$AlphaSet;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/ViewOscillator$AlphaSet;-><init>()V

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x4a771f66 -> :sswitch_d
        -0x4a771f65 -> :sswitch_c
        -0x490b9c39 -> :sswitch_b
        -0x490b9c38 -> :sswitch_a
        -0x490b9c37 -> :sswitch_9
        -0x3bab3dd3 -> :sswitch_8
        -0x3621dfb2 -> :sswitch_7
        -0x3621dfb1 -> :sswitch_6
        -0x2f893320 -> :sswitch_5
        -0x266f082 -> :sswitch_4
        -0x42d1a3 -> :sswitch_3
        0x2382115 -> :sswitch_2
        0x589b15e -> :sswitch_1
        0x94e04ec -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public abstract setProperty(Landroid/view/View;F)V
.end method
