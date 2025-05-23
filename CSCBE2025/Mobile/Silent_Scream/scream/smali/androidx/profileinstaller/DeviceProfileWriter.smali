.class public Landroidx/profileinstaller/DeviceProfileWriter;
.super Ljava/lang/Object;
.source "DeviceProfileWriter.java"


# instance fields
.field private final mApkName:Ljava/lang/String;

.field private final mAssetManager:Landroid/content/res/AssetManager;

.field private final mCurProfile:Ljava/io/File;

.field private final mDesiredVersion:[B

.field private mDeviceSupportsAotProfile:Z

.field private final mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private mProfile:[Landroidx/profileinstaller/DexProfileData;

.field private final mProfileMetaSourceLocation:Ljava/lang/String;

.field private final mProfileSourceLocation:Ljava/lang/String;

.field private mTranscodedProfile:[B


# direct methods
.method public constructor <init>(Landroid/content/res/AssetManager;Ljava/util/concurrent/Executor;Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)V
    .locals 1
    .param p1, "assetManager"    # Landroid/content/res/AssetManager;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "diagnosticsCallback"    # Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;
    .param p4, "apkName"    # Ljava/lang/String;
    .param p5, "profileSourceLocation"    # Ljava/lang/String;
    .param p6, "profileMetaSourceLocation"    # Ljava/lang/String;
    .param p7, "curProfile"    # Ljava/io/File;

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDeviceSupportsAotProfile:Z

    .line 100
    iput-object p1, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mAssetManager:Landroid/content/res/AssetManager;

    .line 101
    iput-object p2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mExecutor:Ljava/util/concurrent/Executor;

    .line 102
    iput-object p3, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    .line 103
    iput-object p4, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mApkName:Ljava/lang/String;

    .line 104
    iput-object p5, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfileSourceLocation:Ljava/lang/String;

    .line 105
    iput-object p6, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfileMetaSourceLocation:Ljava/lang/String;

    .line 106
    iput-object p7, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mCurProfile:Ljava/io/File;

    .line 107
    invoke-static {}, Landroidx/profileinstaller/DeviceProfileWriter;->desiredVersion()[B

    move-result-object v0

    iput-object v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDesiredVersion:[B

    .line 108
    return-void
.end method

.method private addMetadata([Landroidx/profileinstaller/DexProfileData;[B)Landroidx/profileinstaller/DeviceProfileWriter;
    .locals 4
    .param p1, "profile"    # [Landroidx/profileinstaller/DexProfileData;
    .param p2, "desiredVersion"    # [B

    .line 265
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mAssetManager:Landroid/content/res/AssetManager;

    iget-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfileMetaSourceLocation:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Landroidx/profileinstaller/DeviceProfileWriter;->openStreamFromAssets(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 266
    .local v1, "is":Ljava/io/InputStream;
    if-eqz v1, :cond_2

    .line 267
    :try_start_1
    sget-object v2, Landroidx/profileinstaller/ProfileTranscoder;->MAGIC_PROFM:[B

    invoke-static {v1, v2}, Landroidx/profileinstaller/ProfileTranscoder;->readHeader(Ljava/io/InputStream;[B)[B

    move-result-object v2

    .line 268
    .local v2, "metaVersion":[B
    invoke-static {v1, v2, p2, p1}, Landroidx/profileinstaller/ProfileTranscoder;->readMeta(Ljava/io/InputStream;[B[B[Landroidx/profileinstaller/DexProfileData;)[Landroidx/profileinstaller/DexProfileData;

    move-result-object v3

    iput-object v3, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfile:[Landroidx/profileinstaller/DexProfileData;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 274
    nop

    .line 276
    if-eqz v1, :cond_0

    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0

    .line 274
    :cond_0
    return-object p0

    .line 265
    .end local v2    # "metaVersion":[B
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_1

    :try_start_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v3

    :try_start_4
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p1    # "profile":[Landroidx/profileinstaller/DexProfileData;
    .end local p2    # "desiredVersion":[B
    :cond_1
    :goto_0
    throw v2

    .line 276
    .restart local p1    # "profile":[Landroidx/profileinstaller/DexProfileData;
    .restart local p2    # "desiredVersion":[B
    :cond_2
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    .line 281
    .end local v1    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v1

    .line 282
    .local v1, "e":Ljava/lang/IllegalStateException;
    iput-object v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfile:[Landroidx/profileinstaller/DexProfileData;

    .line 283
    iget-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    const/16 v3, 0x8

    invoke-interface {v2, v3, v1}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onResultReceived(ILjava/lang/Object;)V

    goto :goto_2

    .line 279
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v1

    .line 280
    .local v1, "e":Ljava/io/IOException;
    iget-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    const/4 v3, 0x7

    invoke-interface {v2, v3, v1}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onResultReceived(ILjava/lang/Object;)V

    .end local v1    # "e":Ljava/io/IOException;
    goto :goto_1

    .line 276
    :catch_2
    move-exception v1

    .line 277
    .local v1, "e":Ljava/io/FileNotFoundException;
    iget-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    const/16 v3, 0x9

    invoke-interface {v2, v3, v1}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onResultReceived(ILjava/lang/Object;)V

    .line 284
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    :cond_3
    :goto_1
    nop

    .line 285
    :goto_2
    return-object v0
.end method

.method private assertDeviceAllowsProfileInstallerAotWritesCalled()V
    .locals 2

    .line 149
    iget-boolean v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDeviceSupportsAotProfile:Z

    if-eqz v0, :cond_0

    .line 153
    return-void

    .line 150
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "This device doesn\'t support aot. Did you call deviceSupportsAotProfile()?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static desiredVersion()[B
    .locals 2

    .line 380
    nop

    .line 385
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    .line 386
    sget-object v0, Landroidx/profileinstaller/ProfileVersion;->V015_S:[B

    return-object v0

    .line 389
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    packed-switch v0, :pswitch_data_0

    .line 405
    const/4 v0, 0x0

    return-object v0

    .line 402
    :pswitch_0
    sget-object v0, Landroidx/profileinstaller/ProfileVersion;->V010_P:[B

    return-object v0

    .line 397
    :pswitch_1
    sget-object v0, Landroidx/profileinstaller/ProfileVersion;->V009_O_MR1:[B

    return-object v0

    .line 395
    :pswitch_2
    sget-object v0, Landroidx/profileinstaller/ProfileVersion;->V005_O:[B

    return-object v0

    .line 392
    :pswitch_3
    sget-object v0, Landroidx/profileinstaller/ProfileVersion;->V001_N:[B

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x18
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private getProfileInputStream(Landroid/content/res/AssetManager;)Ljava/io/InputStream;
    .locals 4
    .param p1, "assetManager"    # Landroid/content/res/AssetManager;

    .line 220
    const/4 v0, 0x0

    .line 222
    .local v0, "profileStream":Ljava/io/InputStream;
    :try_start_0
    iget-object v1, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfileSourceLocation:Ljava/lang/String;

    invoke-direct {p0, p1, v1}, Landroidx/profileinstaller/DeviceProfileWriter;->openStreamFromAssets(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 227
    :goto_0
    goto :goto_1

    .line 225
    :catch_0
    move-exception v1

    .line 226
    .local v1, "e":Ljava/io/IOException;
    iget-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    const/4 v3, 0x7

    invoke-interface {v2, v3, v1}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onResultReceived(ILjava/lang/Object;)V

    goto :goto_1

    .line 223
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 224
    .local v1, "e":Ljava/io/FileNotFoundException;
    iget-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    const/4 v3, 0x6

    invoke-interface {v2, v3, v1}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onResultReceived(ILjava/lang/Object;)V

    .end local v1    # "e":Ljava/io/FileNotFoundException;
    goto :goto_0

    .line 228
    :goto_1
    return-object v0
.end method

.method private openStreamFromAssets(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 6
    .param p1, "assetManager"    # Landroid/content/res/AssetManager;
    .param p2, "location"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 200
    const/4 v0, 0x0

    .line 202
    .local v0, "profileStream":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v1

    .line 203
    .local v1, "descriptor":Landroid/content/res/AssetFileDescriptor;
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->createInputStream()Ljava/io/FileInputStream;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    .line 210
    .end local v1    # "descriptor":Landroid/content/res/AssetFileDescriptor;
    goto :goto_0

    .line 204
    :catch_0
    move-exception v1

    .line 205
    .local v1, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    .line 206
    .local v2, "message":Ljava/lang/String;
    if-eqz v2, :cond_0

    const-string v3, "compressed"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 207
    iget-object v3, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    const/4 v4, 0x5

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onDiagnosticReceived(ILjava/lang/Object;)V

    .line 211
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    .end local v2    # "message":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v0
.end method

.method private readProfileInternal(Ljava/io/InputStream;)[Landroidx/profileinstaller/DexProfileData;
    .locals 5
    .param p1, "profileStream"    # Ljava/io/InputStream;

    .line 238
    const/4 v0, 0x0

    .line 240
    .local v0, "profile":[Landroidx/profileinstaller/DexProfileData;
    const/4 v1, 0x7

    :try_start_0
    sget-object v2, Landroidx/profileinstaller/ProfileTranscoder;->MAGIC_PROF:[B

    invoke-static {p1, v2}, Landroidx/profileinstaller/ProfileTranscoder;->readHeader(Ljava/io/InputStream;[B)[B

    move-result-object v2

    .line 241
    .local v2, "baselineVersion":[B
    iget-object v3, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mApkName:Ljava/lang/String;

    invoke-static {p1, v2, v3}, Landroidx/profileinstaller/ProfileTranscoder;->readProfile(Ljava/io/InputStream;[BLjava/lang/String;)[Landroidx/profileinstaller/DexProfileData;

    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v3

    .line 248
    .end local v2    # "baselineVersion":[B
    :try_start_1
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 251
    :goto_0
    goto :goto_1

    .line 249
    :catch_0
    move-exception v2

    .line 250
    .local v2, "e":Ljava/io/IOException;
    iget-object v3, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    invoke-interface {v3, v1, v2}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onResultReceived(ILjava/lang/Object;)V

    .line 252
    .end local v2    # "e":Ljava/io/IOException;
    goto :goto_1

    .line 247
    :catchall_0
    move-exception v2

    goto :goto_2

    .line 244
    :catch_1
    move-exception v2

    .line 245
    .local v2, "e":Ljava/lang/IllegalStateException;
    :try_start_2
    iget-object v3, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    const/16 v4, 0x8

    invoke-interface {v3, v4, v2}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onResultReceived(ILjava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 248
    .end local v2    # "e":Ljava/lang/IllegalStateException;
    :try_start_3
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 242
    :catch_2
    move-exception v2

    .line 243
    .local v2, "e":Ljava/io/IOException;
    :try_start_4
    iget-object v3, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    invoke-interface {v3, v1, v2}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onResultReceived(ILjava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 248
    .end local v2    # "e":Ljava/io/IOException;
    :try_start_5
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_0

    .line 253
    :goto_1
    return-object v0

    .line 248
    :goto_2
    :try_start_6
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 251
    goto :goto_3

    .line 249
    :catch_3
    move-exception v3

    .line 250
    .local v3, "e":Ljava/io/IOException;
    iget-object v4, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    invoke-interface {v4, v1, v3}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onResultReceived(ILjava/lang/Object;)V

    .line 252
    .end local v3    # "e":Ljava/io/IOException;
    :goto_3
    throw v2
.end method

.method private static requiresMetadata()Z
    .locals 3

    .line 411
    nop

    .line 417
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    const/4 v2, 0x1

    if-lt v0, v1, :cond_0

    .line 418
    return v2

    .line 421
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    .line 439
    return v1

    .line 436
    :pswitch_0
    return v1

    .line 427
    :pswitch_1
    return v2

    :pswitch_data_0
    .packed-switch 0x18
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private result(ILjava/lang/Object;)V
    .locals 2
    .param p1, "code"    # I
    .param p2, "data"    # Ljava/lang/Object;

    .line 85
    iget-object v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/profileinstaller/DeviceProfileWriter$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2}, Landroidx/profileinstaller/DeviceProfileWriter$$ExternalSyntheticLambda0;-><init>(Landroidx/profileinstaller/DeviceProfileWriter;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 86
    return-void
.end method


# virtual methods
.method public deviceAllowsProfileInstallerAotWrites()Z
    .locals 4

    .line 114
    iget-object v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDesiredVersion:[B

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 115
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x3

    invoke-direct {p0, v2, v0}, Landroidx/profileinstaller/DeviceProfileWriter;->result(ILjava/lang/Object;)V

    .line 116
    return v1

    .line 125
    :cond_0
    iget-object v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mCurProfile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x4

    if-eqz v0, :cond_1

    .line 126
    iget-object v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mCurProfile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->canWrite()Z

    move-result v0

    if-nez v0, :cond_3

    .line 127
    invoke-direct {p0, v3, v2}, Landroidx/profileinstaller/DeviceProfileWriter;->result(ILjava/lang/Object;)V

    .line 128
    return v1

    .line 132
    :cond_1
    :try_start_0
    iget-object v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mCurProfile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    move-result v0

    if-nez v0, :cond_2

    .line 133
    invoke-direct {p0, v3, v2}, Landroidx/profileinstaller/DeviceProfileWriter;->result(ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    return v1

    .line 141
    :cond_2
    nop

    .line 144
    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDeviceSupportsAotProfile:Z

    .line 145
    return v0

    .line 136
    :catch_0
    move-exception v0

    .line 139
    .local v0, "e":Ljava/io/IOException;
    invoke-direct {p0, v3, v2}, Landroidx/profileinstaller/DeviceProfileWriter;->result(ILjava/lang/Object;)V

    .line 140
    return v1
.end method

.method synthetic lambda$result$0$androidx-profileinstaller-DeviceProfileWriter(ILjava/lang/Object;)V
    .locals 1
    .param p1, "code"    # I
    .param p2, "data"    # Ljava/lang/Object;

    .line 85
    iget-object v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    invoke-interface {v0, p1, p2}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onResultReceived(ILjava/lang/Object;)V

    return-void
.end method

.method public read()Landroidx/profileinstaller/DeviceProfileWriter;
    .locals 3

    .line 171
    invoke-direct {p0}, Landroidx/profileinstaller/DeviceProfileWriter;->assertDeviceAllowsProfileInstallerAotWritesCalled()V

    .line 172
    iget-object v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDesiredVersion:[B

    if-nez v0, :cond_0

    .line 173
    return-object p0

    .line 176
    :cond_0
    iget-object v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mAssetManager:Landroid/content/res/AssetManager;

    invoke-direct {p0, v0}, Landroidx/profileinstaller/DeviceProfileWriter;->getProfileInputStream(Landroid/content/res/AssetManager;)Ljava/io/InputStream;

    move-result-object v0

    .line 177
    .local v0, "profileStream":Ljava/io/InputStream;
    if-eqz v0, :cond_1

    .line 178
    invoke-direct {p0, v0}, Landroidx/profileinstaller/DeviceProfileWriter;->readProfileInternal(Ljava/io/InputStream;)[Landroidx/profileinstaller/DexProfileData;

    move-result-object v1

    iput-object v1, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfile:[Landroidx/profileinstaller/DexProfileData;

    .line 180
    :cond_1
    iget-object v1, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfile:[Landroidx/profileinstaller/DexProfileData;

    if-eqz v1, :cond_2

    .line 181
    iget-object v1, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfile:[Landroidx/profileinstaller/DexProfileData;

    .line 182
    .local v1, "profile":[Landroidx/profileinstaller/DexProfileData;
    invoke-static {}, Landroidx/profileinstaller/DeviceProfileWriter;->requiresMetadata()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 183
    iget-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDesiredVersion:[B

    invoke-direct {p0, v1, v2}, Landroidx/profileinstaller/DeviceProfileWriter;->addMetadata([Landroidx/profileinstaller/DexProfileData;[B)Landroidx/profileinstaller/DeviceProfileWriter;

    move-result-object v2

    .line 184
    .local v2, "profileWriter":Landroidx/profileinstaller/DeviceProfileWriter;
    if-eqz v2, :cond_2

    return-object v2

    .line 187
    .end local v1    # "profile":[Landroidx/profileinstaller/DexProfileData;
    .end local v2    # "profileWriter":Landroidx/profileinstaller/DeviceProfileWriter;
    :cond_2
    return-object p0
.end method

.method public transcodeIfNeeded()Landroidx/profileinstaller/DeviceProfileWriter;
    .locals 7

    .line 307
    iget-object v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfile:[Landroidx/profileinstaller/DexProfileData;

    .line 308
    .local v0, "profile":[Landroidx/profileinstaller/DexProfileData;
    iget-object v1, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDesiredVersion:[B

    .line 309
    .local v1, "desiredVersion":[B
    if-eqz v0, :cond_2

    if-nez v1, :cond_0

    goto :goto_3

    .line 312
    :cond_0
    invoke-direct {p0}, Landroidx/profileinstaller/DeviceProfileWriter;->assertDeviceAllowsProfileInstallerAotWritesCalled()V

    .line 313
    const/4 v2, 0x0

    :try_start_0
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 314
    .local v3, "os":Ljava/io/ByteArrayOutputStream;
    :try_start_1
    invoke-static {v3, v1}, Landroidx/profileinstaller/ProfileTranscoder;->writeHeader(Ljava/io/OutputStream;[B)V

    .line 315
    invoke-static {v3, v1, v0}, Landroidx/profileinstaller/ProfileTranscoder;->transcodeAndWriteBody(Ljava/io/OutputStream;[B[Landroidx/profileinstaller/DexProfileData;)Z

    move-result v4

    .line 321
    .local v4, "success":Z
    if-nez v4, :cond_1

    .line 322
    iget-object v5, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    const/4 v6, 0x5

    invoke-interface {v5, v6, v2}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onResultReceived(ILjava/lang/Object;)V

    .line 326
    iput-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfile:[Landroidx/profileinstaller/DexProfileData;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 327
    nop

    .line 331
    :try_start_2
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0

    .line 327
    return-object p0

    .line 330
    :cond_1
    :try_start_3
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    iput-object v5, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mTranscodedProfile:[B
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 331
    .end local v4    # "success":Z
    :try_start_4
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    .line 313
    :catchall_0
    move-exception v4

    :try_start_5
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v5

    :try_start_6
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "profile":[Landroidx/profileinstaller/DexProfileData;
    .end local v1    # "desiredVersion":[B
    :goto_0
    throw v4
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_6 .. :try_end_6} :catch_0

    .line 333
    .end local v3    # "os":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "profile":[Landroidx/profileinstaller/DexProfileData;
    .restart local v1    # "desiredVersion":[B
    :catch_0
    move-exception v3

    .line 334
    .local v3, "e":Ljava/lang/IllegalStateException;
    iget-object v4, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    const/16 v5, 0x8

    invoke-interface {v4, v5, v3}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onResultReceived(ILjava/lang/Object;)V

    goto :goto_2

    .line 331
    .end local v3    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v3

    .line 332
    .local v3, "e":Ljava/io/IOException;
    iget-object v4, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mDiagnostics:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    const/4 v5, 0x7

    invoke-interface {v4, v5, v3}, Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;->onResultReceived(ILjava/lang/Object;)V

    .line 335
    .end local v3    # "e":Ljava/io/IOException;
    :goto_1
    nop

    .line 336
    :goto_2
    iput-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfile:[Landroidx/profileinstaller/DexProfileData;

    .line 337
    return-object p0

    .line 310
    :cond_2
    :goto_3
    return-object p0
.end method

.method public write()Z
    .locals 9

    .line 347
    iget-object v0, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mTranscodedProfile:[B

    .line 348
    .local v0, "transcodedProfile":[B
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 349
    return v1

    .line 351
    :cond_0
    invoke-direct {p0}, Landroidx/profileinstaller/DeviceProfileWriter;->assertDeviceAllowsProfileInstallerAotWritesCalled()V

    .line 353
    const/4 v2, 0x0

    :try_start_0
    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_8

    .line 354
    .local v3, "bis":Ljava/io/InputStream;
    :try_start_1
    new-instance v4, Ljava/io/FileOutputStream;

    iget-object v5, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mCurProfile:Ljava/io/File;

    invoke-direct {v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    .line 355
    .local v4, "os":Ljava/io/FileOutputStream;
    :try_start_2
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 362
    .local v5, "channel":Ljava/nio/channels/FileChannel;
    :try_start_3
    invoke-virtual {v5}, Ljava/nio/channels/FileChannel;->tryLock()Ljava/nio/channels/FileLock;

    move-result-object v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 364
    .local v6, "lock":Ljava/nio/channels/FileLock;
    :try_start_4
    invoke-static {v3, v4, v6}, Landroidx/profileinstaller/Encoding;->writeAll(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/nio/channels/FileLock;)V

    .line 365
    const/4 v7, 0x1

    invoke-direct {p0, v7, v2}, Landroidx/profileinstaller/DeviceProfileWriter;->result(ILjava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 366
    nop

    .line 367
    if-eqz v6, :cond_1

    :try_start_5
    invoke-virtual {v6}, Ljava/nio/channels/FileLock;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :cond_1
    if-eqz v5, :cond_2

    :try_start_6
    invoke-virtual {v5}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    :cond_2
    :try_start_7
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    :try_start_8
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_8

    .line 372
    iput-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mTranscodedProfile:[B

    .line 373
    iput-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfile:[Landroidx/profileinstaller/DexProfileData;

    .line 366
    return v7

    .line 352
    :catchall_0
    move-exception v7

    if-eqz v6, :cond_3

    :try_start_9
    invoke-virtual {v6}, Ljava/nio/channels/FileLock;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v8

    :try_start_a
    invoke-virtual {v7, v8}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "transcodedProfile":[B
    .end local v3    # "bis":Ljava/io/InputStream;
    .end local v4    # "os":Ljava/io/FileOutputStream;
    .end local v5    # "channel":Ljava/nio/channels/FileChannel;
    :cond_3
    :goto_0
    throw v7
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .end local v6    # "lock":Ljava/nio/channels/FileLock;
    .restart local v0    # "transcodedProfile":[B
    .restart local v3    # "bis":Ljava/io/InputStream;
    .restart local v4    # "os":Ljava/io/FileOutputStream;
    .restart local v5    # "channel":Ljava/nio/channels/FileChannel;
    :catchall_2
    move-exception v6

    if-eqz v5, :cond_4

    :try_start_b
    invoke-virtual {v5}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    goto :goto_1

    :catchall_3
    move-exception v7

    :try_start_c
    invoke-virtual {v6, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "transcodedProfile":[B
    .end local v3    # "bis":Ljava/io/InputStream;
    .end local v4    # "os":Ljava/io/FileOutputStream;
    :cond_4
    :goto_1
    throw v6
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    .end local v5    # "channel":Ljava/nio/channels/FileChannel;
    .restart local v0    # "transcodedProfile":[B
    .restart local v3    # "bis":Ljava/io/InputStream;
    .restart local v4    # "os":Ljava/io/FileOutputStream;
    :catchall_4
    move-exception v5

    :try_start_d
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    goto :goto_2

    :catchall_5
    move-exception v6

    :try_start_e
    invoke-virtual {v5, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "transcodedProfile":[B
    .end local v3    # "bis":Ljava/io/InputStream;
    :goto_2
    throw v5
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    .end local v4    # "os":Ljava/io/FileOutputStream;
    .restart local v0    # "transcodedProfile":[B
    .restart local v3    # "bis":Ljava/io/InputStream;
    :catchall_6
    move-exception v4

    :try_start_f
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_7

    goto :goto_3

    :catchall_7
    move-exception v5

    :try_start_10
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "transcodedProfile":[B
    :goto_3
    throw v4
    :try_end_10
    .catch Ljava/io/FileNotFoundException; {:try_start_10 .. :try_end_10} :catch_1
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_0
    .catchall {:try_start_10 .. :try_end_10} :catchall_8

    .line 372
    .end local v3    # "bis":Ljava/io/InputStream;
    .restart local v0    # "transcodedProfile":[B
    :catchall_8
    move-exception v1

    goto :goto_5

    .line 369
    :catch_0
    move-exception v3

    .line 370
    .local v3, "e":Ljava/io/IOException;
    const/4 v4, 0x7

    :try_start_11
    invoke-direct {p0, v4, v3}, Landroidx/profileinstaller/DeviceProfileWriter;->result(ILjava/lang/Object;)V

    .end local v3    # "e":Ljava/io/IOException;
    goto :goto_4

    .line 367
    :catch_1
    move-exception v3

    .line 368
    .local v3, "e":Ljava/io/FileNotFoundException;
    const/4 v4, 0x6

    invoke-direct {p0, v4, v3}, Landroidx/profileinstaller/DeviceProfileWriter;->result(ILjava/lang/Object;)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_8

    .line 372
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :goto_4
    iput-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mTranscodedProfile:[B

    .line 373
    iput-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfile:[Landroidx/profileinstaller/DexProfileData;

    .line 374
    nop

    .line 375
    return v1

    .line 372
    :goto_5
    iput-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mTranscodedProfile:[B

    .line 373
    iput-object v2, p0, Landroidx/profileinstaller/DeviceProfileWriter;->mProfile:[Landroidx/profileinstaller/DexProfileData;

    .line 374
    throw v1
.end method
