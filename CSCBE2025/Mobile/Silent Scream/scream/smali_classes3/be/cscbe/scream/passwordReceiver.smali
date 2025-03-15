.class public Lbe/cscbe/scream/passwordReceiver;
.super Landroid/content/BroadcastReceiver;
.source "passwordReceiver.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 14
    const-string v0, "scream"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private deobfuscateString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "obfuscatedString"    # Ljava/lang/String;

    .line 36
    invoke-static {}, Ljava/util/Base64;->getDecoder()Ljava/util/Base64$Decoder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/Base64$Decoder;->decode(Ljava/lang/String;)[B

    move-result-object v0

    .line 37
    .local v0, "obfuscatedbytes":[B
    const/16 v1, 0x12

    .line 38
    .local v1, "xorKey":B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 39
    aget-byte v3, v0, v2

    and-int/lit16 v3, v3, 0xff

    ushr-int/lit8 v3, v3, 0x3

    aget-byte v4, v0, v2

    shl-int/lit8 v4, v4, 0x5

    or-int/2addr v3, v4

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 41
    aget-byte v3, v0, v2

    xor-int/2addr v3, v1

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 38
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 43
    .end local v2    # "i":I
    :cond_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([B)V

    return-object v2
.end method


# virtual methods
.method public native getStringFromNative()Ljava/lang/String;
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 21
    const-string v0, "MturA+s7EREp"

    invoke-direct {p0, v0}, Lbe/cscbe/scream/passwordReceiver;->deobfuscateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 24
    .local v0, "deobfuscatedsecret":Ljava/lang/String;
    const-string v1, "secret"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 25
    new-instance v1, Landroid/content/Intent;

    const-string v2, "be.cscbe.scream.SENDING_FLAG"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 26
    .local v1, "flagIntent":Landroid/content/Intent;
    const-string v2, "flag"

    invoke-virtual {p0}, Lbe/cscbe/scream/passwordReceiver;->getStringFromNative()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 27
    invoke-virtual {p1, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 28
    .end local v1    # "flagIntent":Landroid/content/Intent;
    goto :goto_0

    .line 29
    :cond_0
    const-string v1, "CSCBE"

    const-string v2, "Wrong password"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    :goto_0
    return-void
.end method
