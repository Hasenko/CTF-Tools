.class public Lcom/google/appinventor/components/runtime/Ev3Motors;
.super Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Base;
.source "Ev3Motors.java"


# annotations
.annotation runtime Lcom/google/appinventor/components/annotations/DesignerComponent;
    category = .enum Lcom/google/appinventor/components/common/ComponentCategory;->LEGOMINDSTORMS:Lcom/google/appinventor/components/common/ComponentCategory;
    description = "A component that provides both high- and low-level interfaces to a LEGO MINDSTORMS EV3 robot, with functions that can control the motors."
    iconName = "images/legoMindstormsEv3.png"
    nonVisible = true
    version = 0x1
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/SimpleObject;
.end annotation


# static fields
.field private static final DEFAULT_MOTOR_PORTS:Ljava/lang/String; = "ABC"

.field private static final DEFAULT_WHEEL_DIAMETER:D = 4.32

.field private static final DELAY_MILLISECONDS:I = 0x32


# instance fields
.field private directionReversed:Z

.field private eventHandler:Landroid/os/Handler;

.field private ifReset:Z

.field private motorPortBitField:I

.field private previousValue:I

.field private regulationEnabled:Z

.field private final sensorValueChecker:Ljava/lang/Runnable;

.field private stopBeforeDisconnect:Z

.field private tachoCountChangedEventEnabled:Z

.field private wheelDiameter:D


# direct methods
.method static bridge synthetic -$$Nest$fgeteventHandler(Lcom/google/appinventor/components/runtime/Ev3Motors;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->eventHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetifReset(Lcom/google/appinventor/components/runtime/Ev3Motors;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->ifReset:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmotorPortBitField(Lcom/google/appinventor/components/runtime/Ev3Motors;)I
    .locals 0

    iget p0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetpreviousValue(Lcom/google/appinventor/components/runtime/Ev3Motors;)I
    .locals 0

    iget p0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->previousValue:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgettachoCountChangedEventEnabled(Lcom/google/appinventor/components/runtime/Ev3Motors;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->tachoCountChangedEventEnabled:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fputifReset(Lcom/google/appinventor/components/runtime/Ev3Motors;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->ifReset:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputpreviousValue(Lcom/google/appinventor/components/runtime/Ev3Motors;I)V
    .locals 0

    iput p1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->previousValue:I

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetOutputCount(Lcom/google/appinventor/components/runtime/Ev3Motors;Ljava/lang/String;II)I
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/appinventor/components/runtime/Ev3Motors;->getOutputCount(Ljava/lang/String;II)I

    move-result p0

    return p0
.end method

.method public constructor <init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V
    .locals 6
    .param p1, "container"    # Lcom/google/appinventor/components/runtime/ComponentContainer;

    .line 59
    const-string v0, "Ev3Motors"

    invoke-direct {p0, p1, v0}, Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Base;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;Ljava/lang/String;)V

    .line 44
    const/4 v0, 0x1

    iput v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    .line 45
    const-wide v1, 0x401147ae147ae148L    # 4.32

    iput-wide v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->wheelDiameter:D

    .line 46
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->directionReversed:Z

    .line 47
    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->regulationEnabled:Z

    .line 48
    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->stopBeforeDisconnect:Z

    .line 49
    iput-boolean v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->tachoCountChangedEventEnabled:Z

    .line 52
    iput v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->previousValue:I

    .line 53
    iput-boolean v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->ifReset:Z

    .line 60
    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    iput-object v4, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->eventHandler:Landroid/os/Handler;

    .line 61
    new-instance v4, Lcom/google/appinventor/components/runtime/Ev3Motors$1;

    invoke-direct {v4, p0}, Lcom/google/appinventor/components/runtime/Ev3Motors$1;-><init>(Lcom/google/appinventor/components/runtime/Ev3Motors;)V

    iput-object v4, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->sensorValueChecker:Ljava/lang/Runnable;

    .line 82
    iget-object v5, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->eventHandler:Landroid/os/Handler;

    invoke-virtual {v5, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 84
    const-string v4, "ABC"

    invoke-virtual {p0, v4}, Lcom/google/appinventor/components/runtime/Ev3Motors;->MotorPorts(Ljava/lang/String;)V

    .line 85
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Ev3Motors;->StopBeforeDisconnect(Z)V

    .line 86
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Ev3Motors;->EnableSpeedRegulation(Z)V

    .line 87
    invoke-virtual {p0, v3}, Lcom/google/appinventor/components/runtime/Ev3Motors;->ReverseDirection(Z)V

    .line 88
    invoke-virtual {p0, v1, v2}, Lcom/google/appinventor/components/runtime/Ev3Motors;->WheelDiameter(D)V

    .line 89
    invoke-virtual {p0, v3}, Lcom/google/appinventor/components/runtime/Ev3Motors;->TachoCountChangedEventEnabled(Z)V

    .line 90
    return-void
.end method

.method private clearOutputCount(Ljava/lang/String;II)V
    .locals 9
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I

    .line 708
    if-ltz p2, :cond_0

    const/4 v0, 0x3

    if-gt p2, v0, :cond_0

    if-ltz p3, :cond_0

    const/16 v0, 0xf

    if-gt p3, v0, :cond_0

    .line 711
    const/16 v1, -0x4e

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "cc"

    const/4 v0, 0x2

    new-array v6, v0, [Ljava/lang/Object;

    int-to-byte v0, p2

    .line 716
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v7, 0x0

    aput-object v0, v6, v7

    int-to-byte v0, p3

    .line 717
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v8, 0x1

    aput-object v0, v6, v8

    .line 711
    invoke-static/range {v1 .. v6}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v0

    .line 718
    .local v0, "command":[B
    invoke-virtual {p0, p1, v0, v7}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 719
    return-void

    .line 709
    .end local v0    # "command":[B
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method private getOutputCount(Ljava/lang/String;II)I
    .locals 11
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I

    .line 661
    if-ltz p2, :cond_1

    const/4 v0, 0x3

    if-gt p2, v0, :cond_1

    if-ltz p3, :cond_1

    const/16 v1, 0xf

    if-gt p3, v1, :cond_1

    .line 665
    add-int/lit8 v1, p3, -0x1

    xor-int/2addr v1, p3

    const/4 v2, 0x1

    add-int/2addr v1, v2

    ushr-int/lit8 p3, v1, 0x1

    .line 668
    sparse-switch p3, :sswitch_data_0

    .line 686
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 682
    :sswitch_0
    const/4 v1, 0x3

    .line 683
    .local v1, "portNumber":I
    goto :goto_0

    .line 678
    .end local v1    # "portNumber":I
    :sswitch_1
    const/4 v1, 0x2

    .line 679
    .restart local v1    # "portNumber":I
    goto :goto_0

    .line 674
    .end local v1    # "portNumber":I
    :sswitch_2
    const/4 v1, 0x1

    .line 675
    .restart local v1    # "portNumber":I
    goto :goto_0

    .line 670
    .end local v1    # "portNumber":I
    :sswitch_3
    const/4 v1, 0x0

    .line 671
    .restart local v1    # "portNumber":I
    nop

    .line 689
    :goto_0
    const/16 v3, -0x4d

    const/4 v4, 0x1

    const/4 v5, 0x4

    const/4 v6, 0x0

    const-string v7, "ccg"

    new-array v8, v0, [Ljava/lang/Object;

    int-to-byte v0, p2

    .line 694
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v9, 0x0

    aput-object v0, v8, v9

    int-to-byte v0, v1

    .line 695
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    aput-object v0, v8, v2

    .line 696
    invoke-static {v9}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v10, 0x2

    aput-object v0, v8, v10

    .line 689
    invoke-static/range {v3 .. v8}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v0

    .line 697
    .local v0, "command":[B
    invoke-virtual {p0, p1, v0, v2}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    move-result-object v2

    .line 699
    .local v2, "reply":[B
    if-eqz v2, :cond_0

    array-length v3, v2

    const/4 v4, 0x5

    if-ne v3, v4, :cond_0

    aget-byte v3, v2, v9

    if-ne v3, v10, :cond_0

    .line 700
    const-string v3, "xi"

    invoke-static {v3, v2}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->unpack(Ljava/lang/String;[B)[Ljava/lang/Object;

    move-result-object v3

    .line 701
    .local v3, "values":[Ljava/lang/Object;
    aget-object v4, v3, v9

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    return v4

    .line 703
    .end local v3    # "values":[Ljava/lang/Object;
    :cond_0
    return v9

    .line 662
    .end local v0    # "command":[B
    .end local v1    # "portNumber":I
    .end local v2    # "reply":[B
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_3
        0x2 -> :sswitch_2
        0x4 -> :sswitch_1
        0x8 -> :sswitch_0
    .end sparse-switch
.end method

.method private isOneShotInteger(I)Z
    .locals 1
    .param p1, "value"    # I

    .line 441
    if-eqz p1, :cond_0

    add-int/lit8 v0, p1, -0x1

    xor-int/2addr v0, p1

    xor-int/lit8 v0, v0, -0x1

    and-int/2addr v0, p1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private outputStepPower(Ljava/lang/String;IIIIIIZ)V
    .locals 14
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I
    .param p4, "power"    # I
    .param p5, "step1"    # I
    .param p6, "step2"    # I
    .param p7, "step3"    # I
    .param p8, "brake"    # Z

    .line 488
    move-object v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    if-ltz v1, :cond_0

    const/4 v3, 0x3

    if-gt v1, v3, :cond_0

    if-ltz v2, :cond_0

    const/16 v4, 0xf

    if-gt v2, v4, :cond_0

    if-ltz p5, :cond_0

    if-ltz p6, :cond_0

    if-ltz p7, :cond_0

    .line 491
    const/16 v4, -0x64

    const/16 v5, 0x64

    move/from16 v6, p4

    invoke-direct {p0, v6, v4, v5}, Lcom/google/appinventor/components/runtime/Ev3Motors;->roundValue(III)I

    move-result v4

    .line 493
    .end local p4    # "power":I
    .local v4, "power":I
    const/16 v5, -0x54

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "ccccccc"

    const/4 v10, 0x7

    new-array v10, v10, [Ljava/lang/Object;

    int-to-byte v11, v1

    .line 498
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v12, 0x0

    aput-object v11, v10, v12

    int-to-byte v11, v2

    .line 499
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x1

    aput-object v11, v10, v13

    int-to-byte v11, v4

    .line 500
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x2

    aput-object v11, v10, v13

    .line 501
    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v3

    .line 502
    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v11, 0x4

    aput-object v3, v10, v11

    .line 503
    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v11, 0x5

    aput-object v3, v10, v11

    .line 504
    move/from16 v3, p8

    int-to-byte v11, v3

    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x6

    aput-object v11, v10, v13

    .line 493
    invoke-static/range {v5 .. v10}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v5

    .line 505
    .local v5, "command":[B
    move-object v7, p1

    invoke-virtual {p0, p1, v5, v12}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 506
    return-void

    .line 488
    .end local v4    # "power":I
    .end local v5    # "command":[B
    .restart local p4    # "power":I
    :cond_0
    move-object v7, p1

    move/from16 v6, p4

    move/from16 v3, p8

    .line 489
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4
.end method

.method private outputStepSpeed(Ljava/lang/String;IIIIIIZ)V
    .locals 14
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I
    .param p4, "speed"    # I
    .param p5, "step1"    # I
    .param p6, "step2"    # I
    .param p7, "step3"    # I
    .param p8, "brake"    # Z

    .line 509
    move-object v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    if-ltz v1, :cond_0

    const/4 v3, 0x3

    if-gt v1, v3, :cond_0

    if-ltz v2, :cond_0

    const/16 v4, 0xf

    if-gt v2, v4, :cond_0

    if-ltz p5, :cond_0

    if-ltz p6, :cond_0

    if-ltz p7, :cond_0

    .line 512
    const/16 v4, -0x64

    const/16 v5, 0x64

    move/from16 v6, p4

    invoke-direct {p0, v6, v4, v5}, Lcom/google/appinventor/components/runtime/Ev3Motors;->roundValue(III)I

    move-result v4

    .line 514
    .end local p4    # "speed":I
    .local v4, "speed":I
    const/16 v5, -0x52

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "ccccccc"

    const/4 v10, 0x7

    new-array v10, v10, [Ljava/lang/Object;

    int-to-byte v11, v1

    .line 519
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v12, 0x0

    aput-object v11, v10, v12

    int-to-byte v11, v2

    .line 520
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x1

    aput-object v11, v10, v13

    int-to-byte v11, v4

    .line 521
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x2

    aput-object v11, v10, v13

    .line 522
    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v3

    .line 523
    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v11, 0x4

    aput-object v3, v10, v11

    .line 524
    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v11, 0x5

    aput-object v3, v10, v11

    .line 525
    move/from16 v3, p8

    int-to-byte v11, v3

    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x6

    aput-object v11, v10, v13

    .line 514
    invoke-static/range {v5 .. v10}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v5

    .line 526
    .local v5, "command":[B
    move-object v7, p1

    invoke-virtual {p0, p1, v5, v12}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 527
    return-void

    .line 509
    .end local v4    # "speed":I
    .end local v5    # "command":[B
    .restart local p4    # "speed":I
    :cond_0
    move-object v7, p1

    move/from16 v6, p4

    move/from16 v3, p8

    .line 510
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4
.end method

.method private outputStepSync(Ljava/lang/String;IIIIIZ)V
    .locals 15
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I
    .param p4, "speed"    # I
    .param p5, "turnRatio"    # I
    .param p6, "tachoCounts"    # I
    .param p7, "brake"    # Z

    .line 530
    move-object v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p5

    if-ltz v1, :cond_0

    const/4 v4, 0x3

    if-gt v1, v4, :cond_0

    if-ltz v2, :cond_0

    const/16 v5, 0xf

    if-gt v2, v5, :cond_0

    const/16 v5, -0xc8

    if-lt v3, v5, :cond_0

    const/16 v5, 0xc8

    if-gt v3, v5, :cond_0

    .line 533
    const/16 v5, -0x64

    const/16 v6, 0x64

    move/from16 v7, p4

    invoke-direct {p0, v7, v5, v6}, Lcom/google/appinventor/components/runtime/Ev3Motors;->roundValue(III)I

    move-result v5

    .line 535
    .end local p4    # "speed":I
    .local v5, "speed":I
    const/16 v6, -0x50

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v10, "cccccc"

    const/4 v11, 0x6

    new-array v11, v11, [Ljava/lang/Object;

    int-to-byte v12, v1

    .line 540
    invoke-static {v12}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v12

    const/4 v13, 0x0

    aput-object v12, v11, v13

    int-to-byte v12, v2

    .line 541
    invoke-static {v12}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v12

    const/4 v14, 0x1

    aput-object v12, v11, v14

    int-to-byte v12, v5

    .line 542
    invoke-static {v12}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v12

    const/4 v14, 0x2

    aput-object v12, v11, v14

    int-to-short v12, v3

    .line 543
    invoke-static {v12}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v12

    aput-object v12, v11, v4

    .line 544
    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v12, 0x4

    aput-object v4, v11, v12

    .line 545
    move/from16 v4, p7

    int-to-byte v12, v4

    invoke-static {v12}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v12

    const/4 v14, 0x5

    aput-object v12, v11, v14

    .line 535
    invoke-static/range {v6 .. v11}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v6

    .line 546
    .local v6, "command":[B
    move-object/from16 v8, p1

    invoke-virtual {p0, v8, v6, v13}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 547
    return-void

    .line 530
    .end local v5    # "speed":I
    .end local v6    # "command":[B
    .restart local p4    # "speed":I
    :cond_0
    move-object/from16 v8, p1

    move/from16 v7, p4

    move/from16 v4, p7

    .line 531
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v5
.end method

.method private outputTimePower(Ljava/lang/String;IIIIIIZ)V
    .locals 14
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I
    .param p4, "power"    # I
    .param p5, "step1"    # I
    .param p6, "step2"    # I
    .param p7, "step3"    # I
    .param p8, "brake"    # Z

    .line 550
    move-object v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    if-ltz v1, :cond_0

    const/4 v3, 0x3

    if-gt v1, v3, :cond_0

    if-ltz v2, :cond_0

    const/16 v4, 0xf

    if-gt v2, v4, :cond_0

    if-ltz p5, :cond_0

    if-ltz p6, :cond_0

    if-ltz p7, :cond_0

    .line 553
    const/16 v4, -0x64

    const/16 v5, 0x64

    move/from16 v6, p4

    invoke-direct {p0, v6, v4, v5}, Lcom/google/appinventor/components/runtime/Ev3Motors;->roundValue(III)I

    move-result v4

    .line 555
    .end local p4    # "power":I
    .local v4, "power":I
    const/16 v5, -0x53

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "ccccccc"

    const/4 v10, 0x7

    new-array v10, v10, [Ljava/lang/Object;

    int-to-byte v11, v1

    .line 560
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v12, 0x0

    aput-object v11, v10, v12

    int-to-byte v11, v2

    .line 561
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x1

    aput-object v11, v10, v13

    int-to-byte v11, v4

    .line 562
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x2

    aput-object v11, v10, v13

    .line 563
    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v3

    .line 564
    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v11, 0x4

    aput-object v3, v10, v11

    .line 565
    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v11, 0x5

    aput-object v3, v10, v11

    .line 566
    move/from16 v3, p8

    int-to-byte v11, v3

    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x6

    aput-object v11, v10, v13

    .line 555
    invoke-static/range {v5 .. v10}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v5

    .line 567
    .local v5, "command":[B
    move-object v7, p1

    invoke-virtual {p0, p1, v5, v12}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 568
    return-void

    .line 550
    .end local v4    # "power":I
    .end local v5    # "command":[B
    .restart local p4    # "power":I
    :cond_0
    move-object v7, p1

    move/from16 v6, p4

    move/from16 v3, p8

    .line 551
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4
.end method

.method private outputTimeSpeed(Ljava/lang/String;IIIIIIZ)V
    .locals 14
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I
    .param p4, "speed"    # I
    .param p5, "step1"    # I
    .param p6, "step2"    # I
    .param p7, "step3"    # I
    .param p8, "brake"    # Z

    .line 571
    move-object v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    if-ltz v1, :cond_0

    const/4 v3, 0x3

    if-gt v1, v3, :cond_0

    if-ltz v2, :cond_0

    const/16 v4, 0xf

    if-gt v2, v4, :cond_0

    if-ltz p5, :cond_0

    if-ltz p6, :cond_0

    if-ltz p7, :cond_0

    .line 574
    const/16 v4, -0x64

    const/16 v5, 0x64

    move/from16 v6, p4

    invoke-direct {p0, v6, v4, v5}, Lcom/google/appinventor/components/runtime/Ev3Motors;->roundValue(III)I

    move-result v4

    .line 576
    .end local p4    # "speed":I
    .local v4, "speed":I
    const/16 v5, -0x51

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "ccccccc"

    const/4 v10, 0x7

    new-array v10, v10, [Ljava/lang/Object;

    int-to-byte v11, v1

    .line 581
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v12, 0x0

    aput-object v11, v10, v12

    int-to-byte v11, v2

    .line 582
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x1

    aput-object v11, v10, v13

    int-to-byte v11, v4

    .line 583
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x2

    aput-object v11, v10, v13

    .line 584
    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v3

    .line 585
    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v11, 0x4

    aput-object v3, v10, v11

    .line 586
    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v11, 0x5

    aput-object v3, v10, v11

    .line 587
    move/from16 v3, p8

    int-to-byte v11, v3

    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x6

    aput-object v11, v10, v13

    .line 576
    invoke-static/range {v5 .. v10}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v5

    .line 588
    .local v5, "command":[B
    move-object v7, p1

    invoke-virtual {p0, p1, v5, v12}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 589
    return-void

    .line 571
    .end local v4    # "speed":I
    .end local v5    # "command":[B
    .restart local p4    # "speed":I
    :cond_0
    move-object v7, p1

    move/from16 v6, p4

    move/from16 v3, p8

    .line 572
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4
.end method

.method private outputTimeSync(Ljava/lang/String;IIIIIZ)V
    .locals 15
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I
    .param p4, "speed"    # I
    .param p5, "turnRatio"    # I
    .param p6, "milliseconds"    # I
    .param p7, "brake"    # Z

    .line 592
    move-object v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    if-ltz v1, :cond_0

    const/4 v3, 0x3

    if-gt v1, v3, :cond_0

    if-ltz v2, :cond_0

    const/16 v4, 0xf

    if-gt v2, v4, :cond_0

    if-ltz p6, :cond_0

    .line 595
    const/16 v4, -0x64

    const/16 v5, 0x64

    move/from16 v6, p4

    invoke-direct {p0, v6, v4, v5}, Lcom/google/appinventor/components/runtime/Ev3Motors;->roundValue(III)I

    move-result v4

    .line 597
    .end local p4    # "speed":I
    .local v4, "speed":I
    const/16 v5, -0x4f

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "cccccc"

    const/4 v10, 0x6

    new-array v10, v10, [Ljava/lang/Object;

    int-to-byte v11, v1

    .line 602
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v12, 0x0

    aput-object v11, v10, v12

    int-to-byte v11, v2

    .line 603
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x1

    aput-object v11, v10, v13

    int-to-byte v11, v4

    .line 604
    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    const/4 v13, 0x2

    aput-object v11, v10, v13

    move/from16 v11, p5

    int-to-short v13, v11

    .line 605
    invoke-static {v13}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v13

    aput-object v13, v10, v3

    .line 606
    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v13, 0x4

    aput-object v3, v10, v13

    .line 607
    move/from16 v3, p7

    int-to-byte v13, v3

    invoke-static {v13}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v13

    const/4 v14, 0x5

    aput-object v13, v10, v14

    .line 597
    invoke-static/range {v5 .. v10}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v5

    .line 608
    .local v5, "command":[B
    move-object/from16 v7, p1

    invoke-virtual {p0, v7, v5, v12}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 609
    return-void

    .line 592
    .end local v4    # "speed":I
    .end local v5    # "command":[B
    .restart local p4    # "speed":I
    :cond_0
    move-object/from16 v7, p1

    move/from16 v6, p4

    move/from16 v11, p5

    move/from16 v3, p7

    .line 593
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4
.end method

.method private resetOutput(Ljava/lang/String;II)V
    .locals 9
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I

    .line 445
    if-ltz p2, :cond_0

    const/4 v0, 0x3

    if-gt p2, v0, :cond_0

    if-ltz p3, :cond_0

    const/16 v0, 0xf

    if-gt p3, v0, :cond_0

    .line 447
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->ifReset:Z

    .line 448
    const/16 v1, -0x5e

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "cc"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    int-to-byte v7, p2

    .line 453
    invoke-static {v7}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    const/4 v8, 0x0

    aput-object v7, v6, v8

    int-to-byte v7, p3

    .line 454
    invoke-static {v7}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v6, v0

    .line 448
    invoke-static/range {v1 .. v6}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v0

    .line 455
    .local v0, "command":[B
    invoke-virtual {p0, p1, v0, v8}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 456
    return-void

    .line 446
    .end local v0    # "command":[B
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method private roundValue(III)I
    .locals 1
    .param p1, "value"    # I
    .param p2, "minimum"    # I
    .param p3, "maximum"    # I

    .line 437
    if-ge p1, p2, :cond_0

    move v0, p2

    goto :goto_0

    :cond_0
    if-le p1, p3, :cond_1

    move v0, p3

    goto :goto_0

    :cond_1
    move v0, p1

    :goto_0
    return v0
.end method

.method private setOutputDirection(Ljava/lang/String;III)V
    .locals 9
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I
    .param p4, "direction"    # I

    .line 612
    if-ltz p2, :cond_0

    const/4 v0, 0x3

    if-gt p2, v0, :cond_0

    if-ltz p3, :cond_0

    const/16 v1, 0xf

    if-gt p3, v1, :cond_0

    const/4 v1, -0x1

    if-lt p4, v1, :cond_0

    const/4 v1, 0x1

    if-gt p4, v1, :cond_0

    .line 615
    const/16 v2, -0x59

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v6, "ccc"

    new-array v7, v0, [Ljava/lang/Object;

    int-to-byte v0, p2

    .line 620
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v8, 0x0

    aput-object v0, v7, v8

    int-to-byte v0, p3

    .line 621
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    aput-object v0, v7, v1

    int-to-byte v0, p4

    .line 622
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v7, v1

    .line 615
    invoke-static/range {v2 .. v7}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v0

    .line 623
    .local v0, "command":[B
    invoke-virtual {p0, p1, v0, v8}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 624
    return-void

    .line 613
    .end local v0    # "command":[B
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method private setOutputPower(Ljava/lang/String;III)V
    .locals 9
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I
    .param p4, "power"    # I

    .line 644
    if-ltz p2, :cond_0

    const/4 v0, 0x3

    if-gt p2, v0, :cond_0

    if-ltz p3, :cond_0

    const/16 v1, 0xf

    if-gt p3, v1, :cond_0

    .line 647
    const/16 v1, -0x64

    const/16 v2, 0x64

    invoke-direct {p0, p4, v1, v2}, Lcom/google/appinventor/components/runtime/Ev3Motors;->roundValue(III)I

    move-result p4

    .line 649
    const/16 v1, -0x5c

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "ccc"

    new-array v6, v0, [Ljava/lang/Object;

    int-to-byte v0, p2

    .line 654
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v7, 0x0

    aput-object v0, v6, v7

    int-to-byte v0, p3

    .line 655
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v8, 0x1

    aput-object v0, v6, v8

    int-to-byte v0, p4

    .line 656
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v8, 0x2

    aput-object v0, v6, v8

    .line 649
    invoke-static/range {v1 .. v6}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v0

    .line 657
    .local v0, "command":[B
    invoke-virtual {p0, p1, v0, v7}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 658
    return-void

    .line 645
    .end local v0    # "command":[B
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method private setOutputSpeed(Ljava/lang/String;III)V
    .locals 9
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I
    .param p4, "speed"    # I

    .line 627
    if-ltz p2, :cond_0

    const/4 v0, 0x3

    if-gt p2, v0, :cond_0

    if-ltz p3, :cond_0

    const/16 v1, 0xf

    if-gt p3, v1, :cond_0

    .line 630
    const/16 v1, -0x64

    const/16 v2, 0x64

    invoke-direct {p0, p4, v1, v2}, Lcom/google/appinventor/components/runtime/Ev3Motors;->roundValue(III)I

    move-result p4

    .line 632
    const/16 v1, -0x5b

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "ccc"

    new-array v6, v0, [Ljava/lang/Object;

    int-to-byte v0, p2

    .line 637
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v7, 0x0

    aput-object v0, v6, v7

    int-to-byte v0, p3

    .line 638
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v8, 0x1

    aput-object v0, v6, v8

    int-to-byte v0, p4

    .line 639
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v8, 0x2

    aput-object v0, v6, v8

    .line 632
    invoke-static/range {v1 .. v6}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v0

    .line 640
    .local v0, "command":[B
    invoke-virtual {p0, p1, v0, v7}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 641
    return-void

    .line 628
    .end local v0    # "command":[B
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method private startOutput(Ljava/lang/String;II)V
    .locals 9
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I

    .line 459
    if-ltz p2, :cond_0

    const/4 v0, 0x3

    if-gt p2, v0, :cond_0

    if-ltz p3, :cond_0

    const/16 v0, 0xf

    if-gt p3, v0, :cond_0

    .line 462
    const/16 v1, -0x5a

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "cc"

    const/4 v0, 0x2

    new-array v6, v0, [Ljava/lang/Object;

    int-to-byte v0, p2

    .line 467
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v7, 0x0

    aput-object v0, v6, v7

    int-to-byte v0, p3

    .line 468
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v8, 0x1

    aput-object v0, v6, v8

    .line 462
    invoke-static/range {v1 .. v6}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v0

    .line 469
    .local v0, "command":[B
    invoke-virtual {p0, p1, v0, v7}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 470
    return-void

    .line 460
    .end local v0    # "command":[B
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method private stopOutput(Ljava/lang/String;IIZ)V
    .locals 9
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "nos"    # I
    .param p4, "useBrake"    # Z

    .line 473
    if-ltz p2, :cond_0

    const/4 v0, 0x3

    if-gt p2, v0, :cond_0

    if-ltz p3, :cond_0

    const/16 v1, 0xf

    if-gt p3, v1, :cond_0

    .line 476
    const/16 v2, -0x5d

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v6, "ccc"

    new-array v7, v0, [Ljava/lang/Object;

    int-to-byte v0, p2

    .line 481
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, v7, v1

    int-to-byte v0, p3

    .line 482
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v8, 0x1

    aput-object v0, v7, v8

    .line 483
    invoke-static {p4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    const/4 v8, 0x2

    aput-object v0, v7, v8

    .line 476
    invoke-static/range {v2 .. v7}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v0

    .line 484
    .local v0, "command":[B
    invoke-virtual {p0, p1, v0, v1}, Lcom/google/appinventor/components/runtime/Ev3Motors;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 485
    return-void

    .line 474
    .end local v0    # "command":[B
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method


# virtual methods
.method public EnableSpeedRegulation(Z)V
    .locals 0
    .param p1, "enabled"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "True"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 169
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->regulationEnabled:Z

    .line 170
    return-void
.end method

.method public EnableSpeedRegulation()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The robot adjusts the power to maintain the speed if speed regulation is enabled."
    .end annotation

    .line 178
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->regulationEnabled:Z

    return v0
.end method

.method public GetTachoCount()I
    .locals 6
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Get the current tacho count."
    .end annotation

    .line 419
    const-string v0, "GetTachoCount"

    .line 421
    .local v0, "functionName":Ljava/lang/String;
    const/4 v1, 0x0

    :try_start_0
    iget v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    invoke-direct {p0, v0, v1, v2}, Lcom/google/appinventor/components/runtime/Ev3Motors;->getOutputCount(Ljava/lang/String;II)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 422
    :catch_0
    move-exception v2

    .line 423
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v1

    const/16 v5, 0xc1f

    invoke-virtual {v3, p0, v0, v5, v4}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 424
    return v1
.end method

.method public MotorPorts()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The motor ports that the motors are connected to. The ports are specified by a sequence of port letters."
        userVisible = false
    .end annotation

    .line 99
    iget v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Ev3Motors;->bitFieldToMotorPortLetters(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public MotorPorts(Ljava/lang/String;)V
    .locals 5
    .param p1, "motorPortLetters"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "ABC"
        editorType = "string"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 109
    const-string v0, "MotorPorts"

    .line 111
    .local v0, "functionName":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortLettersToBitField(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    goto :goto_0

    .line 112
    :catch_0
    move-exception v1

    .line 113
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/16 v4, 0xc20

    invoke-virtual {v2, p0, v0, v4, v3}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 115
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :goto_0
    return-void
.end method

.method public ResetTachoCount()V
    .locals 5
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Set the current tacho count to zero."
    .end annotation

    .line 406
    const-string v0, "ResetTachoCount"

    .line 408
    .local v0, "functionName":Ljava/lang/String;
    const/4 v1, 0x0

    :try_start_0
    iget v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    invoke-direct {p0, v0, v1, v2}, Lcom/google/appinventor/components/runtime/Ev3Motors;->clearOutputCount(Ljava/lang/String;II)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 411
    goto :goto_0

    .line 409
    :catch_0
    move-exception v2

    .line 410
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v1

    const/16 v1, 0xc1f

    invoke-virtual {v3, p0, v0, v1, v4}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 412
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    :goto_0
    return-void
.end method

.method public ReverseDirection(Z)V
    .locals 5
    .param p1, "reversed"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 144
    const-string v0, "ReverseDirection"

    .line 146
    .local v0, "functionName":Ljava/lang/String;
    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_0
    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    if-eqz p1, :cond_0

    const/4 v4, -0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x1

    :goto_0
    invoke-direct {p0, v0, v2, v3, v4}, Lcom/google/appinventor/components/runtime/Ev3Motors;->setOutputDirection(Ljava/lang/String;III)V

    .line 147
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->directionReversed:Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    goto :goto_1

    .line 148
    :catch_0
    move-exception v3

    .line 149
    .local v3, "e":Ljava/lang/IllegalArgumentException;
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v2

    const/16 v2, 0xc1f

    invoke-virtual {v4, p0, v0, v2, v1}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 151
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    return-void
.end method

.method public ReverseDirection()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "It specifies if the direction of the motors is reversed."
    .end annotation

    .line 159
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->directionReversed:Z

    return v0
.end method

.method public RotateInDistance(IDZ)V
    .locals 11
    .param p1, "power"    # I
    .param p2, "distance"    # D
    .param p4, "useBrake"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Rotate the motors in a distance."
    .end annotation

    .line 276
    const-string v9, "RotateInDistance"

    .line 277
    .local v9, "functionName":Ljava/lang/String;
    const-wide v0, 0x4076800000000000L    # 360.0

    mul-double v0, v0, p2

    iget-wide v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->wheelDiameter:D

    div-double/2addr v0, v2

    const-wide v2, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v0, v2

    double-to-int v10, v0

    .line 280
    .local v10, "tachoCounts":I
    :try_start_0
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->regulationEnabled:Z

    if-eqz v0, :cond_0

    .line 281
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, v9

    move v4, p1

    move v6, v10

    move v8, p4

    invoke-direct/range {v0 .. v8}, Lcom/google/appinventor/components/runtime/Ev3Motors;->outputStepSpeed(Ljava/lang/String;IIIIIIZ)V

    goto :goto_0

    .line 283
    :cond_0
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, v9

    move v4, p1

    move v6, v10

    move v8, p4

    invoke-direct/range {v0 .. v8}, Lcom/google/appinventor/components/runtime/Ev3Motors;->outputStepPower(Ljava/lang/String;IIIIIIZ)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    :goto_0
    goto :goto_1

    .line 284
    :catch_0
    move-exception v0

    .line 285
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v9, v2, v3

    const/16 v3, 0xc1f

    invoke-virtual {v1, p0, v9, v3, v2}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 287
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    return-void
.end method

.method public RotateInDuration(IIZ)V
    .locals 10
    .param p1, "power"    # I
    .param p2, "milliseconds"    # I
    .param p3, "useBrake"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Rotate the motors in a period of time."
    .end annotation

    .line 260
    const-string v9, "RotateInDuration"

    .line 262
    .local v9, "functionName":Ljava/lang/String;
    :try_start_0
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->regulationEnabled:Z

    if-eqz v0, :cond_0

    .line 263
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, v9

    move v4, p1

    move v6, p2

    move v8, p3

    invoke-direct/range {v0 .. v8}, Lcom/google/appinventor/components/runtime/Ev3Motors;->outputTimeSpeed(Ljava/lang/String;IIIIIIZ)V

    goto :goto_0

    .line 265
    :cond_0
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, v9

    move v4, p1

    move v6, p2

    move v8, p3

    invoke-direct/range {v0 .. v8}, Lcom/google/appinventor/components/runtime/Ev3Motors;->outputTimePower(Ljava/lang/String;IIIIIIZ)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 268
    :goto_0
    goto :goto_1

    .line 266
    :catch_0
    move-exception v0

    .line 267
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v9, v2, v3

    const/16 v3, 0xc1f

    invoke-virtual {v1, p0, v9, v3, v2}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 269
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    return-void
.end method

.method public RotateInTachoCounts(IIZ)V
    .locals 10
    .param p1, "power"    # I
    .param p2, "tachoCounts"    # I
    .param p3, "useBrake"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Rotate the motors in a number of tacho counts."
    .end annotation

    .line 244
    const-string v9, "RotateInTachoCounts"

    .line 246
    .local v9, "functionName":Ljava/lang/String;
    :try_start_0
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->regulationEnabled:Z

    if-eqz v0, :cond_0

    .line 247
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, v9

    move v4, p1

    move v6, p2

    move v8, p3

    invoke-direct/range {v0 .. v8}, Lcom/google/appinventor/components/runtime/Ev3Motors;->outputStepSpeed(Ljava/lang/String;IIIIIIZ)V

    goto :goto_0

    .line 249
    :cond_0
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, v9

    move v4, p1

    move v6, p2

    move v8, p3

    invoke-direct/range {v0 .. v8}, Lcom/google/appinventor/components/runtime/Ev3Motors;->outputStepPower(Ljava/lang/String;IIIIIIZ)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 252
    :goto_0
    goto :goto_1

    .line 250
    :catch_0
    move-exception v0

    .line 251
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v9, v2, v3

    const/16 v3, 0xc1f

    invoke-virtual {v1, p0, v9, v3, v2}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 253
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    return-void
.end method

.method public RotateIndefinitely(I)V
    .locals 5
    .param p1, "power"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Start to rotate the motors."
    .end annotation

    .line 226
    const-string v0, "RotateIndefinitely"

    .line 228
    .local v0, "functionName":Ljava/lang/String;
    const/4 v1, 0x0

    :try_start_0
    iget-boolean v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->regulationEnabled:Z

    if-eqz v2, :cond_0

    .line 229
    iget v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/google/appinventor/components/runtime/Ev3Motors;->setOutputPower(Ljava/lang/String;III)V

    goto :goto_0

    .line 231
    :cond_0
    iget v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/google/appinventor/components/runtime/Ev3Motors;->setOutputSpeed(Ljava/lang/String;III)V

    .line 233
    :goto_0
    iget v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    invoke-direct {p0, v0, v1, v2}, Lcom/google/appinventor/components/runtime/Ev3Motors;->startOutput(Ljava/lang/String;II)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 236
    goto :goto_1

    .line 234
    :catch_0
    move-exception v2

    .line 235
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v1

    const/16 v1, 0xc1f

    invoke-virtual {v3, p0, v0, v1, v4}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 237
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    return-void
.end method

.method public RotateSyncInDistance(IIIZ)V
    .locals 11
    .param p1, "power"    # I
    .param p2, "distance"    # I
    .param p3, "turnRatio"    # I
    .param p4, "useBrake"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Rotate the motors at the same speed for a distance in cm."
    .end annotation

    .line 315
    const-string v9, "RotateSyncInDuration"

    .line 316
    .local v9, "functionName":Ljava/lang/String;
    int-to-double v0, p2

    const-wide v2, 0x4076800000000000L    # 360.0

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    iget-wide v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->wheelDiameter:D

    div-double/2addr v0, v2

    const-wide v2, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v0, v2

    double-to-int v10, v0

    .line 320
    .local v10, "tachoCounts":I
    :try_start_0
    iget v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    if-eqz v0, :cond_1

    .line 321
    invoke-direct {p0, v0}, Lcom/google/appinventor/components/runtime/Ev3Motors;->isOneShotInteger(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 322
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, v9

    move v4, p1

    move v6, v10

    move v8, p4

    invoke-direct/range {v0 .. v8}, Lcom/google/appinventor/components/runtime/Ev3Motors;->outputStepSpeed(Ljava/lang/String;IIIIIIZ)V

    goto :goto_0

    .line 324
    :cond_0
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    move-object v0, p0

    move-object v1, v9

    move v4, p1

    move v5, p3

    move v6, v10

    move v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/google/appinventor/components/runtime/Ev3Motors;->outputStepSync(Ljava/lang/String;IIIIIZ)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 329
    :cond_1
    :goto_0
    goto :goto_1

    .line 327
    :catch_0
    move-exception v0

    .line 328
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v9, v2, v3

    const/16 v3, 0xc1f

    invoke-virtual {v1, p0, v9, v3, v2}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 330
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    return-void
.end method

.method public RotateSyncInDuration(IIIZ)V
    .locals 10
    .param p1, "power"    # I
    .param p2, "milliseconds"    # I
    .param p3, "turnRatio"    # I
    .param p4, "useBrake"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Rotate the motors at the same speed in a period of time."
    .end annotation

    .line 337
    const-string v9, "RotateSyncInDuration"

    .line 341
    .local v9, "functionName":Ljava/lang/String;
    :try_start_0
    iget v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    if-eqz v0, :cond_1

    .line 342
    invoke-direct {p0, v0}, Lcom/google/appinventor/components/runtime/Ev3Motors;->isOneShotInteger(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 343
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, v9

    move v4, p1

    move v6, p2

    move v8, p4

    invoke-direct/range {v0 .. v8}, Lcom/google/appinventor/components/runtime/Ev3Motors;->outputTimeSpeed(Ljava/lang/String;IIIIIIZ)V

    goto :goto_0

    .line 345
    :cond_0
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    move-object v0, p0

    move-object v1, v9

    move v4, p1

    move v5, p3

    move v6, p2

    move v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/google/appinventor/components/runtime/Ev3Motors;->outputTimeSync(Ljava/lang/String;IIIIIZ)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 350
    :cond_1
    :goto_0
    goto :goto_1

    .line 348
    :catch_0
    move-exception v0

    .line 349
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v9, v2, v3

    const/16 v3, 0xc1f

    invoke-virtual {v1, p0, v9, v3, v2}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 351
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    return-void
.end method

.method public RotateSyncInTachoCounts(IIIZ)V
    .locals 10
    .param p1, "power"    # I
    .param p2, "tachoCounts"    # I
    .param p3, "turnRatio"    # I
    .param p4, "useBrake"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Rotate the motors at the same speed in a number of tacho counts."
    .end annotation

    .line 358
    const-string v9, "RotateSyncInTachoCounts"

    .line 362
    .local v9, "functionName":Ljava/lang/String;
    :try_start_0
    iget v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    if-eqz v0, :cond_1

    .line 363
    invoke-direct {p0, v0}, Lcom/google/appinventor/components/runtime/Ev3Motors;->isOneShotInteger(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 364
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, v9

    move v4, p1

    move v6, p2

    move v8, p4

    invoke-direct/range {v0 .. v8}, Lcom/google/appinventor/components/runtime/Ev3Motors;->outputStepSpeed(Ljava/lang/String;IIIIIIZ)V

    goto :goto_0

    .line 366
    :cond_0
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    move-object v0, p0

    move-object v1, v9

    move v4, p1

    move v5, p3

    move v6, p2

    move v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/google/appinventor/components/runtime/Ev3Motors;->outputStepSync(Ljava/lang/String;IIIIIZ)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 371
    :cond_1
    :goto_0
    goto :goto_1

    .line 369
    :catch_0
    move-exception v0

    .line 370
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v9, v2, v3

    const/16 v3, 0xc1f

    invoke-virtual {v1, p0, v9, v3, v2}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 372
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    return-void
.end method

.method public RotateSyncIndefinitely(II)V
    .locals 10
    .param p1, "power"    # I
    .param p2, "turnRatio"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Start to rotate the motors at the same speed."
    .end annotation

    .line 294
    const-string v8, "RotateSyncIndefinitely"

    .line 298
    .local v8, "functionName":Ljava/lang/String;
    const/4 v9, 0x0

    :try_start_0
    iget v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    if-eqz v0, :cond_1

    .line 299
    invoke-direct {p0, v0}, Lcom/google/appinventor/components/runtime/Ev3Motors;->isOneShotInteger(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 300
    iget v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    invoke-direct {p0, v8, v9, v0, p1}, Lcom/google/appinventor/components/runtime/Ev3Motors;->setOutputSpeed(Ljava/lang/String;III)V

    goto :goto_0

    .line 302
    :cond_0
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v0, p0

    move-object v1, v8

    move v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v7}, Lcom/google/appinventor/components/runtime/Ev3Motors;->outputStepSync(Ljava/lang/String;IIIIIZ)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 307
    :cond_1
    :goto_0
    goto :goto_1

    .line 305
    :catch_0
    move-exception v0

    .line 306
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v8, v2, v9

    const/16 v3, 0xc1f

    invoke-virtual {v1, p0, v8, v3, v2}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 308
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    return-void
.end method

.method public Stop(Z)V
    .locals 5
    .param p1, "useBrake"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Stop the motors of the robot."
    .end annotation

    .line 379
    const-string v0, "Stop"

    .line 381
    .local v0, "functionName":Ljava/lang/String;
    const/4 v1, 0x0

    :try_start_0
    iget v2, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/google/appinventor/components/runtime/Ev3Motors;->stopOutput(Ljava/lang/String;IIZ)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 384
    goto :goto_0

    .line 382
    :catch_0
    move-exception v2

    .line 383
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v1

    const/16 v1, 0xc1f

    invoke-virtual {v3, p0, v0, v1, v4}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 385
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    :goto_0
    return-void
.end method

.method public StopBeforeDisconnect(Z)V
    .locals 0
    .param p1, "stopBeforeDisconnect"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "True"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 199
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->stopBeforeDisconnect:Z

    .line 200
    return-void
.end method

.method public StopBeforeDisconnect()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Whether to stop the motor before disconnecting."
    .end annotation

    .line 187
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->stopBeforeDisconnect:Z

    return v0
.end method

.method public TachoCountChanged(I)V
    .locals 3
    .param p1, "tachoCount"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
        description = "Called when the tacho count has changed."
    .end annotation

    .line 433
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const-string v1, "TachoCountChanged"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 434
    return-void
.end method

.method public TachoCountChangedEventEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 218
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->tachoCountChangedEventEnabled:Z

    .line 219
    return-void
.end method

.method public TachoCountChangedEventEnabled()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Whether the TachoCountChanged event should fire when the angle is changed."
    .end annotation

    .line 208
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->tachoCountChangedEventEnabled:Z

    return v0
.end method

.method public ToggleDirection()V
    .locals 5
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Toggle the direction of motors."
    .end annotation

    .line 392
    const-string v0, "ToggleDirection"

    .line 394
    .local v0, "functionName":Ljava/lang/String;
    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_0
    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    invoke-direct {p0, v0, v2, v3, v2}, Lcom/google/appinventor/components/runtime/Ev3Motors;->setOutputDirection(Ljava/lang/String;III)V

    .line 395
    iget-boolean v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->directionReversed:Z

    if-nez v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    iput-boolean v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->directionReversed:Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 398
    goto :goto_1

    .line 396
    :catch_0
    move-exception v3

    .line 397
    .local v3, "e":Ljava/lang/IllegalArgumentException;
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v2

    const/16 v2, 0xc1f

    invoke-virtual {v4, p0, v0, v2, v1}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 399
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    return-void
.end method

.method public WheelDiameter()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The diameter of the wheels attached on the motors in centimeters."
        userVisible = false
    .end annotation

    .line 134
    iget-wide v0, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->wheelDiameter:D

    return-wide v0
.end method

.method public WheelDiameter(D)V
    .locals 0
    .param p1, "diameter"    # D
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "4.32"
        editorType = "float"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 124
    iput-wide p1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->wheelDiameter:D

    .line 125
    return-void
.end method

.method public beforeDisconnect(Lcom/google/appinventor/components/runtime/BluetoothConnectionBase;)V
    .locals 5
    .param p1, "bluetoothConnection"    # Lcom/google/appinventor/components/runtime/BluetoothConnectionBase;

    .line 723
    const-string v0, "beforeDisconnect"

    .line 724
    .local v0, "functionName":Ljava/lang/String;
    iget-boolean v1, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->stopBeforeDisconnect:Z

    if-eqz v1, :cond_0

    .line 726
    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_0
    iget v3, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->motorPortBitField:I

    invoke-direct {p0, v0, v2, v3, v1}, Lcom/google/appinventor/components/runtime/Ev3Motors;->stopOutput(Ljava/lang/String;IIZ)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 729
    goto :goto_0

    .line 727
    :catch_0
    move-exception v3

    .line 728
    .local v3, "e":Ljava/lang/IllegalArgumentException;
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/Ev3Motors;->form:Lcom/google/appinventor/components/runtime/Form;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v2

    const/16 v2, 0xc1f

    invoke-virtual {v4, p0, v0, v2, v1}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 731
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    :cond_0
    :goto_0
    return-void
.end method
