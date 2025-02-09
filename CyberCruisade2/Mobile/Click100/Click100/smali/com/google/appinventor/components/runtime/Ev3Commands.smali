.class public Lcom/google/appinventor/components/runtime/Ev3Commands;
.super Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Base;
.source "Ev3Commands.java"


# annotations
.annotation runtime Lcom/google/appinventor/components/annotations/DesignerComponent;
    category = .enum Lcom/google/appinventor/components/common/ComponentCategory;->LEGOMINDSTORMS:Lcom/google/appinventor/components/common/ComponentCategory;
    description = "A component that provides a low-level interface to a LEGO MINDSTORMS EV3 robot, with functions to send system or direct commands to EV3 robots."
    iconName = "images/legoMindstormsEv3.png"
    nonVisible = true
    version = 0x1
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/SimpleObject;
.end annotation


# direct methods
.method public constructor <init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V
    .locals 1
    .param p1, "container"    # Lcom/google/appinventor/components/runtime/ComponentContainer;

    .line 41
    const-string v0, "Ev3Commands"

    invoke-direct {p0, p1, v0}, Lcom/google/appinventor/components/runtime/LegoMindstormsEv3Base;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;Ljava/lang/String;)V

    .line 42
    return-void
.end method


# virtual methods
.method public GetBatteryCurrent()D
    .locals 11
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Get the battery current."
    .end annotation

    .line 93
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    .line 94
    .local v0, "functionName":Ljava/lang/String;
    const/16 v2, -0x7f

    const/4 v3, 0x1

    const/4 v4, 0x4

    const/4 v5, 0x0

    const-string v6, "cg"

    const/4 v8, 0x2

    new-array v7, v8, [Ljava/lang/Object;

    .line 99
    invoke-static {v8}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v9

    const/4 v10, 0x0

    aput-object v9, v7, v10

    .line 100
    invoke-static {v10}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v9

    aput-object v9, v7, v1

    .line 94
    invoke-static/range {v2 .. v7}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v2

    .line 101
    .local v2, "command":[B
    invoke-virtual {p0, v0, v2, v1}, Lcom/google/appinventor/components/runtime/Ev3Commands;->sendCommand(Ljava/lang/String;[BZ)[B

    move-result-object v1

    .line 102
    .local v1, "reply":[B
    if-eqz v1, :cond_0

    array-length v3, v1

    const/4 v4, 0x5

    if-ne v3, v4, :cond_0

    aget-byte v3, v1, v10

    if-ne v3, v8, :cond_0

    .line 103
    const-string v3, "xf"

    invoke-static {v3, v1}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->unpack(Ljava/lang/String;[B)[Ljava/lang/Object;

    move-result-object v3

    .line 104
    .local v3, "values":[Ljava/lang/Object;
    aget-object v4, v3, v10

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    float-to-double v4, v4

    return-wide v4

    .line 106
    .end local v3    # "values":[Ljava/lang/Object;
    :cond_0
    const-wide/high16 v3, -0x4010000000000000L    # -1.0

    return-wide v3
.end method

.method public GetBatteryVoltage()D
    .locals 11
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Get the battery voltage."
    .end annotation

    .line 71
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "functionName":Ljava/lang/String;
    const/16 v2, -0x7f

    const/4 v3, 0x1

    const/4 v4, 0x4

    const/4 v5, 0x0

    const-string v6, "cg"

    const/4 v8, 0x2

    new-array v7, v8, [Ljava/lang/Object;

    .line 77
    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v9

    const/4 v10, 0x0

    aput-object v9, v7, v10

    .line 78
    invoke-static {v10}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v9

    aput-object v9, v7, v1

    .line 72
    invoke-static/range {v2 .. v7}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v2

    .line 79
    .local v2, "command":[B
    invoke-virtual {p0, v0, v2, v1}, Lcom/google/appinventor/components/runtime/Ev3Commands;->sendCommand(Ljava/lang/String;[BZ)[B

    move-result-object v1

    .line 80
    .local v1, "reply":[B
    if-eqz v1, :cond_0

    array-length v3, v1

    const/4 v4, 0x5

    if-ne v3, v4, :cond_0

    aget-byte v3, v1, v10

    if-ne v3, v8, :cond_0

    .line 81
    const-string v3, "xf"

    invoke-static {v3, v1}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->unpack(Ljava/lang/String;[B)[Ljava/lang/Object;

    move-result-object v3

    .line 82
    .local v3, "values":[Ljava/lang/Object;
    aget-object v4, v3, v10

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    float-to-double v4, v4

    return-wide v4

    .line 84
    .end local v3    # "values":[Ljava/lang/Object;
    :cond_0
    const-wide/high16 v3, -0x4010000000000000L    # -1.0

    return-wide v3
.end method

.method public GetFirmwareBuild()Ljava/lang/String;
    .locals 11
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Get the firmware build on EV3."
    .end annotation

    .line 189
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "functionName":Ljava/lang/String;
    const/16 v2, -0x7f

    const/4 v3, 0x1

    const/16 v4, 0x64

    const/4 v5, 0x0

    const-string v6, "cg"

    const/4 v8, 0x2

    new-array v7, v8, [Ljava/lang/Object;

    .line 195
    const/16 v9, 0x7f

    invoke-static {v9}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v9

    const/4 v10, 0x0

    aput-object v9, v7, v10

    .line 196
    invoke-static {v10}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v9

    aput-object v9, v7, v1

    .line 190
    invoke-static/range {v2 .. v7}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v2

    .line 197
    .local v2, "command":[B
    invoke-virtual {p0, v0, v2, v1}, Lcom/google/appinventor/components/runtime/Ev3Commands;->sendCommand(Ljava/lang/String;[BZ)[B

    move-result-object v1

    .line 199
    .local v1, "reply":[B
    if-eqz v1, :cond_0

    aget-byte v3, v1, v10

    if-ne v3, v8, :cond_0

    .line 200
    const-string v3, "xS"

    invoke-static {v3, v1}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->unpack(Ljava/lang/String;[B)[Ljava/lang/Object;

    move-result-object v3

    .line 201
    .local v3, "value":[Ljava/lang/Object;
    aget-object v4, v3, v10

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 203
    .end local v3    # "value":[Ljava/lang/Object;
    :cond_0
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Ev3Commands;->form:Lcom/google/appinventor/components/runtime/Form;

    const/16 v4, 0xc1e

    new-array v5, v10, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v0, v4, v5}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 204
    const/4 v3, 0x0

    return-object v3
.end method

.method public GetFirmwareVersion()Ljava/lang/String;
    .locals 11
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Get the firmware version on EV3."
    .end annotation

    .line 164
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    .line 165
    .local v0, "functionName":Ljava/lang/String;
    const/16 v2, -0x7f

    const/4 v3, 0x1

    const/16 v4, 0x64

    const/4 v5, 0x0

    const-string v6, "ccg"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    .line 170
    const/16 v8, 0xa

    invoke-static {v8}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    .line 171
    const/16 v8, 0x64

    invoke-static {v8}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v8

    aput-object v8, v7, v1

    .line 172
    invoke-static {v9}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v8

    const/4 v10, 0x2

    aput-object v8, v7, v10

    .line 165
    invoke-static/range {v2 .. v7}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v2

    .line 173
    .local v2, "command":[B
    invoke-virtual {p0, v0, v2, v1}, Lcom/google/appinventor/components/runtime/Ev3Commands;->sendCommand(Ljava/lang/String;[BZ)[B

    move-result-object v1

    .line 175
    .local v1, "reply":[B
    if-eqz v1, :cond_0

    aget-byte v3, v1, v9

    if-ne v3, v10, :cond_0

    .line 176
    const-string v3, "xS"

    invoke-static {v3, v1}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->unpack(Ljava/lang/String;[B)[Ljava/lang/Object;

    move-result-object v3

    .line 177
    .local v3, "value":[Ljava/lang/Object;
    aget-object v4, v3, v9

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 179
    .end local v3    # "value":[Ljava/lang/Object;
    :cond_0
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Ev3Commands;->form:Lcom/google/appinventor/components/runtime/Form;

    const/16 v4, 0xc1e

    new-array v5, v9, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v0, v4, v5}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 180
    const/4 v3, 0x0

    return-object v3
.end method

.method public GetHardwareVersion()Ljava/lang/String;
    .locals 11
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Get the hardware version of EV3."
    .end annotation

    .line 213
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    .line 214
    .local v0, "functionName":Ljava/lang/String;
    const/16 v2, -0x7f

    const/4 v3, 0x1

    const/16 v4, 0x64

    const/4 v5, 0x0

    const-string v6, "ccg"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    .line 219
    const/16 v8, 0x9

    invoke-static {v8}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    .line 220
    const/16 v8, 0x64

    invoke-static {v8}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v8

    aput-object v8, v7, v1

    .line 221
    invoke-static {v9}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v8

    const/4 v10, 0x2

    aput-object v8, v7, v10

    .line 214
    invoke-static/range {v2 .. v7}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v2

    .line 222
    .local v2, "command":[B
    invoke-virtual {p0, v0, v2, v1}, Lcom/google/appinventor/components/runtime/Ev3Commands;->sendCommand(Ljava/lang/String;[BZ)[B

    move-result-object v1

    .line 224
    .local v1, "reply":[B
    if-eqz v1, :cond_0

    aget-byte v3, v1, v9

    if-ne v3, v10, :cond_0

    .line 225
    const-string v3, "xS"

    invoke-static {v3, v1}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->unpack(Ljava/lang/String;[B)[Ljava/lang/Object;

    move-result-object v3

    .line 226
    .local v3, "value":[Ljava/lang/Object;
    aget-object v4, v3, v9

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 228
    .end local v3    # "value":[Ljava/lang/Object;
    :cond_0
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Ev3Commands;->form:Lcom/google/appinventor/components/runtime/Form;

    const/16 v4, 0xc1e

    new-array v5, v9, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v0, v4, v5}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 229
    const/4 v3, 0x0

    return-object v3
.end method

.method public GetOSBuild()Ljava/lang/String;
    .locals 11
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Get the OS build on EV3."
    .end annotation

    .line 139
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    .line 140
    .local v0, "functionName":Ljava/lang/String;
    const/4 v2, 0x3

    const/4 v3, 0x1

    const/16 v4, 0x64

    const/4 v5, 0x0

    const-string v6, "ccg"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    .line 145
    const/16 v8, 0xc

    invoke-static {v8}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    .line 146
    const/16 v8, 0x64

    invoke-static {v8}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v8

    aput-object v8, v7, v1

    .line 147
    invoke-static {v9}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v8

    const/4 v10, 0x2

    aput-object v8, v7, v10

    .line 140
    invoke-static/range {v2 .. v7}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v2

    .line 148
    .local v2, "command":[B
    invoke-virtual {p0, v0, v2, v1}, Lcom/google/appinventor/components/runtime/Ev3Commands;->sendCommand(Ljava/lang/String;[BZ)[B

    move-result-object v1

    .line 150
    .local v1, "reply":[B
    if-eqz v1, :cond_0

    aget-byte v3, v1, v9

    if-ne v3, v10, :cond_0

    .line 151
    const-string v3, "xS"

    invoke-static {v3, v1}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->unpack(Ljava/lang/String;[B)[Ljava/lang/Object;

    move-result-object v3

    .line 152
    .local v3, "value":[Ljava/lang/Object;
    aget-object v4, v3, v9

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 154
    .end local v3    # "value":[Ljava/lang/Object;
    :cond_0
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Ev3Commands;->form:Lcom/google/appinventor/components/runtime/Form;

    const/16 v4, 0xc1e

    new-array v5, v9, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v0, v4, v5}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 155
    const/4 v3, 0x0

    return-object v3
.end method

.method public GetOSVersion()Ljava/lang/String;
    .locals 11
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Get the OS version on EV3."
    .end annotation

    .line 115
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "functionName":Ljava/lang/String;
    const/16 v2, -0x7f

    const/4 v3, 0x1

    const/16 v4, 0x64

    const/4 v5, 0x0

    const-string v6, "ccg"

    const/4 v7, 0x3

    new-array v8, v7, [Ljava/lang/Object;

    .line 121
    invoke-static {v7}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    const/4 v9, 0x0

    aput-object v7, v8, v9

    .line 122
    const/16 v7, 0x64

    invoke-static {v7}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v7

    aput-object v7, v8, v1

    .line 123
    invoke-static {v9}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    const/4 v10, 0x2

    aput-object v7, v8, v10

    .line 116
    move-object v7, v8

    invoke-static/range {v2 .. v7}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v2

    .line 124
    .local v2, "command":[B
    invoke-virtual {p0, v0, v2, v1}, Lcom/google/appinventor/components/runtime/Ev3Commands;->sendCommand(Ljava/lang/String;[BZ)[B

    move-result-object v1

    .line 125
    .local v1, "reply":[B
    if-eqz v1, :cond_0

    aget-byte v3, v1, v9

    if-ne v3, v10, :cond_0

    .line 126
    const-string v3, "xS"

    invoke-static {v3, v1}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->unpack(Ljava/lang/String;[B)[Ljava/lang/Object;

    move-result-object v3

    .line 127
    .local v3, "value":[Ljava/lang/Object;
    aget-object v4, v3, v9

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 129
    .end local v3    # "value":[Ljava/lang/Object;
    :cond_0
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Ev3Commands;->form:Lcom/google/appinventor/components/runtime/Form;

    const/16 v4, 0xc1e

    new-array v5, v9, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v0, v4, v5}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 130
    const/4 v3, 0x0

    return-object v3
.end method

.method public KeepAlive(I)V
    .locals 10
    .param p1, "minutes"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Keep the EV3 brick from shutdown for a period of time."
    .end annotation

    .line 49
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    .line 51
    .local v0, "functionName":Ljava/lang/String;
    const/4 v2, 0x0

    if-ltz p1, :cond_1

    const/16 v3, 0xff

    if-le p1, v3, :cond_0

    goto :goto_0

    .line 56
    :cond_0
    const/16 v4, -0x70

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v8, "c"

    new-array v9, v1, [Ljava/lang/Object;

    int-to-byte v1, p1

    .line 61
    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    aput-object v1, v9, v2

    .line 56
    invoke-static/range {v4 .. v9}, Lcom/google/appinventor/components/runtime/util/Ev3BinaryParser;->encodeDirectCommand(BZIILjava/lang/String;[Ljava/lang/Object;)[B

    move-result-object v1

    .line 62
    .local v1, "command":[B
    invoke-virtual {p0, v0, v1, v2}, Lcom/google/appinventor/components/runtime/Ev3Commands;->sendCommand(Ljava/lang/String;[BZ)[B

    .line 64
    return-void

    .line 52
    .end local v1    # "command":[B
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/Ev3Commands;->form:Lcom/google/appinventor/components/runtime/Form;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v2

    const/16 v2, 0xc1f

    invoke-virtual {v3, p0, v0, v2, v1}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 53
    return-void
.end method
