.class public Lcom/google/appinventor/components/runtime/errors/FileAlreadyExistsError;
.super Lcom/google/appinventor/components/runtime/errors/RuntimeError;
.source "FileAlreadyExistsError.java"


# annotations
.annotation runtime Lcom/google/appinventor/components/annotations/SimpleObject;
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .line 25
    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/errors/RuntimeError;-><init>(Ljava/lang/String;)V

    .line 26
    return-void
.end method
