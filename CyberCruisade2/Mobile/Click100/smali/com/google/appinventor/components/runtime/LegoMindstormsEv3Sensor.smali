.class public Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Sensor;
.super Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Base;
.source "LegoMindstormsEv3Sensor.java"


# annotations
.annotation runtime Lcom/google/appinventor/components/annotations/SimpleObject;
.end annotation


# static fields
.field protected static final DEFAULT_SENSOR_PORT:Ljava/lang/String; = "1"


# instance fields
.field protected sensorPortNumber:I


# direct methods
.method protected constructor <init>(Lcom/google/appinventor/components/runtime/ComponentContainer;Ljava/lang/String;)V
    .locals 1
    .param p1, "container"    # Lcom/google/appinventor/components/runtime/ComponentContainer;
    .param p2, "logTag"    # Ljava/lang/String;

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Base;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;Ljava/lang/String;)V

    .line 30
    const-string v0, "1"

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Sensor;->SensorPort(Ljava/lang/String;)V

    .line 31
    return-void
.end method


# virtual methods
.method public SensorPort()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The sensor port that the sensor is connected to."
        userVisible = false
    .end annotation

    .line 37
    iget v0, p0, Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Sensor;->sensorPortNumber:I

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Sensor;->portNumberToSensorPortLetter(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public SensorPort(Ljava/lang/String;)V
    .locals 1
    .param p1, "sensorPortLetter"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "1"
        editorType = "lego_ev3_sensor_port"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 48
    const-string v0, "SensorPort"

    .line 49
    .local v0, "functionName":Ljava/lang/String;
    invoke-virtual {p0, v0, p1}, Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Sensor;->setSensorPort(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method protected final readInputPercentage(Ljava/lang/String;IIII)I
    .locals 16
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "no"    # I
    .param p4, "type"    # I
    .param p5, "mode"    # I

    .line 66
    move/from16 v0, p2

    move/from16 v1, p3

    move/from16 v2, p5

    if-ltz v0, :cond_1

    const/4 v3, 0x3

    if-gt v0, v3, :cond_1

    if-ltz v1, :cond_1

    if-gt v1, v3, :cond_1

    const/4 v4, -0x1

    if-lt v2, v4, :cond_1

    const/4 v5, 0x7

    if-gt v2, v5, :cond_1

    .line 69
    const/16 v6, -0x67

    const/4 v7, 0x1

    const/4 v8, 0x1

    const/4 v9, 0x0

    const-string v10, "ccccccg"

    new-array v11, v5, [Ljava/lang/Object;

    .line 74
    const/16 v5, 0x1b

    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    const/4 v12, 0x0

    aput-object v5, v11, v12

    int-to-byte v5, v0

    .line 75
    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    const/4 v13, 0x1

    aput-object v5, v11, v13

    int-to-byte v5, v1

    .line 76
    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    const/4 v14, 0x2

    aput-object v5, v11, v14

    move/from16 v5, p4

    int-to-byte v15, v5

    .line 77
    invoke-static {v15}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v15

    aput-object v15, v11, v3

    int-to-byte v3, v2

    .line 78
    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    const/4 v15, 0x4

    aput-object v3, v11, v15

    .line 79
    invoke-static {v13}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    const/4 v15, 0x5

    aput-object v3, v11, v15

    .line 80
    invoke-static {v12}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    const/4 v15, 0x6

    aput-object v3, v11, v15

    .line 69
    invoke-static/range {v6 .. v11}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v3

    .line 82
    .local v3, "command":[B
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    invoke-virtual {v6, v7, v3, v13}, Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Sensor;->sendCommand(Ljava/lang/String;[BZ)[B

    move-result-object v8

    .line 83
    .local v8, "reply":[B
    if-eqz v8, :cond_0

    array-length v9, v8

    if-ne v9, v14, :cond_0

    aget-byte v9, v8, v12

    if-ne v9, v14, :cond_0

    .line 84
    aget-byte v4, v8, v13

    return v4

    .line 86
    :cond_0
    return v4

    .line 66
    .end local v3    # "command":[B
    .end local v8    # "reply":[B
    :cond_1
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move/from16 v5, p4

    .line 67
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3
.end method

.method protected final readInputSI(Ljava/lang/String;IIII)D
    .locals 17
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "layer"    # I
    .param p3, "no"    # I
    .param p4, "type"    # I
    .param p5, "mode"    # I

    .line 95
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p5

    if-ltz v2, :cond_1

    const/4 v5, 0x3

    if-gt v2, v5, :cond_1

    if-ltz v3, :cond_1

    if-gt v3, v5, :cond_1

    const/4 v6, -0x1

    if-lt v4, v6, :cond_1

    const/4 v6, 0x7

    if-gt v4, v6, :cond_1

    .line 97
    const/16 v7, -0x67

    const/4 v8, 0x1

    const/4 v9, 0x4

    const/4 v10, 0x0

    const-string v11, "ccccccg"

    new-array v12, v6, [Ljava/lang/Object;

    .line 102
    const/16 v6, 0x1d

    invoke-static {v6}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v6

    const/4 v13, 0x0

    aput-object v6, v12, v13

    int-to-byte v6, v2

    .line 103
    invoke-static {v6}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v6

    const/4 v14, 0x1

    aput-object v6, v12, v14

    int-to-byte v6, v3

    .line 104
    invoke-static {v6}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v6

    const/4 v15, 0x2

    aput-object v6, v12, v15

    move/from16 v6, p4

    int-to-byte v15, v6

    .line 105
    invoke-static {v15}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v15

    aput-object v15, v12, v5

    int-to-byte v5, v4

    .line 106
    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    const/4 v15, 0x4

    aput-object v5, v12, v15

    .line 107
    invoke-static {v14}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    const/4 v15, 0x5

    aput-object v5, v12, v15

    .line 108
    invoke-static {v13}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    const/16 v16, 0x6

    aput-object v5, v12, v16

    .line 97
    invoke-static/range {v7 .. v12}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v5

    .line 110
    .local v5, "command":[B
    invoke-virtual {v0, v1, v5, v14}, Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Sensor;->sendCommand(Ljava/lang/String;[BZ)[B

    move-result-object v7

    .line 112
    .local v7, "reply":[B
    if-eqz v7, :cond_0

    array-length v8, v7

    if-ne v8, v15, :cond_0

    aget-byte v8, v7, v13

    const/4 v9, 0x2

    if-ne v8, v9, :cond_0

    .line 113
    const-string v8, "xf"

    invoke-static {v8, v7}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->unpack(Ljava/lang/String;[B)[Ljava/lang/Object;

    move-result-object v8

    .line 114
    .local v8, "values":[Ljava/lang/Object;
    aget-object v9, v8, v13

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    float-to-double v9, v9

    return-wide v9

    .line 117
    .end local v8    # "values":[Ljava/lang/Object;
    :cond_0
    iget-object v8, v0, Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Sensor;->form:Lcom/google/appinventor/components/runtime/Form;

    const/16 v9, 0xc1e

    new-array v10, v13, [Ljava/lang/Object;

    invoke-virtual {v8, v0, v1, v9, v10}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 118
    const-wide/high16 v8, -0x4010000000000000L    # -1.0

    return-wide v8

    .line 95
    .end local v5    # "command":[B
    .end local v7    # "reply":[B
    :cond_1
    move/from16 v6, p4

    .line 96
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v5
.end method

.method protected final setSensorPort(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "functionName"    # Ljava/lang/String;
    .param p2, "sensorPortLetter"    # Ljava/lang/String;

    .line 54
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Sensor;->sensorPortLetterToPortNumber(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Sensor;->sensorPortNumber:I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    nop

    .line 59
    return-void

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Sensor;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/16 v3, 0xc21

    invoke-virtual {v1, p0, p1, v3, v2}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 57
    return-void
.end method
