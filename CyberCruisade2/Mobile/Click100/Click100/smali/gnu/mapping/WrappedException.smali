.class public Lgnu/mapping/WrappedException;
.super Ljava/lang/RuntimeException;
.source "WrappedException.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .line 26
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Throwable;

    .line 55
    invoke-direct {p0, p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .line 40
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lgnu/mapping/WrappedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 41
    return-void
.end method

.method public static wrapIfNeeded(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
    .locals 1
    .param p0, "ex"    # Ljava/lang/Throwable;

    .line 101
    instance-of v0, p0, Ljava/lang/RuntimeException;

    if-eqz v0, :cond_0

    .line 102
    move-object v0, p0

    check-cast v0, Ljava/lang/RuntimeException;

    return-object v0

    .line 104
    :cond_0
    new-instance v0, Lgnu/mapping/WrappedException;

    invoke-direct {v0, p0}, Lgnu/mapping/WrappedException;-><init>(Ljava/lang/Throwable;)V

    return-object v0
.end method


# virtual methods
.method public getException()Ljava/lang/Throwable;
    .locals 1

    .line 69
    invoke-virtual {p0}, Lgnu/mapping/WrappedException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 79
    invoke-virtual {p0}, Lgnu/mapping/WrappedException;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
