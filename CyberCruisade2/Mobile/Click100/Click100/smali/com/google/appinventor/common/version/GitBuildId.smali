.class public final Lcom/google/appinventor/common/version/GitBuildId;
.super Ljava/lang/Object;
.source "GitBuildId.java"


# static fields
.field public static final ACRA_URI:Ljava/lang/String; = "${acra.uri}"

.field public static final ANT_BUILD_DATE:Ljava/lang/String; = "January 16 2025"

.field public static final GIT_BUILD_FINGERPRINT:Ljava/lang/String; = "a1060e79191f895e0ff8eb0557e676185e43bff2"

.field public static final GIT_BUILD_VERSION:Ljava/lang/String; = "nb200"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static getAcraUri()Ljava/lang/String;
    .locals 2

    .line 48
    const-string v0, "${acra.uri}"

    invoke-virtual {v0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    const-string v0, ""

    return-object v0

    .line 50
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDate()Ljava/lang/String;
    .locals 1

    .line 44
    const-string v0, "January 16 2025"

    return-object v0
.end method

.method public static getFingerprint()Ljava/lang/String;
    .locals 1

    .line 40
    const-string v0, "a1060e79191f895e0ff8eb0557e676185e43bff2"

    return-object v0
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 2

    .line 26
    const-string v0, "nb200"

    .line 32
    .local v0, "version":Ljava/lang/String;
    const-string v1, ""

    if-eq v0, v1, :cond_1

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 35
    :cond_0
    return-object v0

    .line 33
    :cond_1
    :goto_0
    const-string v1, "none"

    return-object v1
.end method
