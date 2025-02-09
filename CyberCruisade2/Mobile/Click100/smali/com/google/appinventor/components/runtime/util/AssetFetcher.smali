.class public Lcom/google/appinventor/components/runtime/util/AssetFetcher;
.super Ljava/lang/Object;
.source "AssetFetcher.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String;

.field private static background:Ljava/util/concurrent/ExecutorService;

.field private static context:Landroid/content/Context;

.field private static db:Lcom/google/appinventor/components/runtime/util/HashDatabase;

.field private static volatile inError:Z

.field private static final semaphore:Ljava/lang/Object;


# direct methods
.method static bridge synthetic -$$Nest$sfgetLOG_TAG()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$smgetFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/io/File;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->getFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 60
    invoke-static {}, Lcom/google/appinventor/components/runtime/ReplForm;->getActiveForm()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    sput-object v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->context:Landroid/content/Context;

    .line 61
    new-instance v0, Lcom/google/appinventor/components/runtime/util/HashDatabase;

    sget-object v1, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/google/appinventor/components/runtime/util/HashDatabase;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->db:Lcom/google/appinventor/components/runtime/util/HashDatabase;

    .line 63
    const-class v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->LOG_TAG:Ljava/lang/String;

    .line 66
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->background:Ljava/util/concurrent/ExecutorService;

    .line 68
    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->inError:Z

    .line 69
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->semaphore:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    return-void
.end method

.method private static byteArray2Hex([B)Ljava/lang/String;
    .locals 7
    .param p0, "hash"    # [B

    .line 310
    new-instance v0, Ljava/util/Formatter;

    invoke-direct {v0}, Ljava/util/Formatter;-><init>()V

    .line 311
    .local v0, "formatter":Ljava/util/Formatter;
    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    aget-byte v4, p0, v3

    .line 312
    .local v4, "b":B
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v6

    aput-object v6, v5, v2

    const-string v6, "%02x"

    invoke-virtual {v0, v6, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 311
    .end local v4    # "b":B
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 314
    :cond_0
    invoke-virtual {v0}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static fetchAssets(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "cookieValue"    # Ljava/lang/String;
    .param p1, "projectId"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;
    .param p3, "asset"    # Ljava/lang/String;

    .line 77
    sget-object v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->background:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/appinventor/components/runtime/util/AssetFetcher$1;

    invoke-direct {v1, p2, p1, p3, p0}, Lcom/google/appinventor/components/runtime/util/AssetFetcher$1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 86
    return-void
.end method

.method private static getDestinationFile(Lcom/google/appinventor/components/runtime/Form;Ljava/lang/String;)Ljava/io/File;
    .locals 5
    .param p0, "form"    # Lcom/google/appinventor/components/runtime/Form;
    .param p1, "asset"    # Ljava/lang/String;

    .line 287
    const-string v0, "/external_comps/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "assets/"

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x22

    if-lt v0, v3, :cond_4

    .line 289
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Form;->getCacheDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 290
    .local v0, "dest":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 291
    .local v1, "parent":Ljava/io/File;
    if-eqz v1, :cond_3

    .line 294
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    .line 295
    :cond_0
    new-instance v2, Lcom/google/appinventor/components/runtime/errors/YailRuntimeError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to create directory "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Extensions"

    invoke-direct {v2, v3, v4}, Lcom/google/appinventor/components/runtime/errors/YailRuntimeError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v2

    .line 298
    :cond_1
    :goto_0
    const-string v3, "/classes.jar"

    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 299
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".jar"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .local v2, "filename":Ljava/lang/String;
    goto :goto_1

    .line 301
    .end local v2    # "filename":Ljava/lang/String;
    :cond_2
    const-string v3, "/"

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 302
    .local v3, "parts":[Ljava/lang/String;
    array-length v4, v3

    sub-int/2addr v4, v2

    aget-object v2, v3, v4

    .line 304
    .end local v3    # "parts":[Ljava/lang/String;
    .restart local v2    # "filename":Ljava/lang/String;
    :goto_1
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v3

    .line 292
    .end local v2    # "filename":Ljava/lang/String;
    :cond_3
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to determine parent directory for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 306
    .end local v0    # "dest":Ljava/io/File;
    .end local v1    # "parent":Ljava/io/File;
    :cond_4
    new-instance v0, Ljava/io/File;

    invoke-static {p0, v2}, Lcom/google/appinventor/components/runtime/util/QUtil;->getReplAssetPath(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/io/File;
    .locals 23
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "cookieValue"    # Ljava/lang/String;
    .param p2, "asset"    # Ljava/lang/String;
    .param p3, "depth"    # I

    .line 150
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    invoke-static {}, Lcom/google/appinventor/components/runtime/Form;->getActiveForm()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v5

    .line 151
    .local v5, "form":Lcom/google/appinventor/components/runtime/Form;
    const/4 v6, 0x0

    const/4 v0, 0x1

    if-le v4, v0, :cond_1

    .line 152
    sget-object v7, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->semaphore:Ljava/lang/Object;

    monitor-enter v7

    .line 153
    :try_start_0
    sget-boolean v8, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->inError:Z

    if-eqz v8, :cond_0

    .line 154
    monitor-exit v7

    return-object v6

    .line 156
    :cond_0
    sput-boolean v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->inError:Z

    .line 157
    new-instance v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher$3;

    invoke-direct {v0, v1}, Lcom/google/appinventor/components/runtime/util/AssetFetcher$3;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 163
    monitor-exit v7

    return-object v6

    .line 165
    :catchall_0
    move-exception v0

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 168
    :cond_1
    move-object/from16 v7, p2

    .line 169
    .local v7, "destinationFilename":Ljava/lang/String;
    invoke-static {v5, v3}, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->getDestinationFile(Lcom/google/appinventor/components/runtime/Form;Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    .line 170
    .local v8, "outFile":Ljava/io/File;
    const-string v9, "/classes.jar"

    invoke-virtual {v3, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    const/4 v10, 0x0

    if-eqz v9, :cond_2

    .line 171
    const-string v9, "/"

    invoke-virtual {v3, v9}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v9

    add-int/2addr v9, v0

    invoke-virtual {v3, v10, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 173
    :cond_2
    sget-object v9, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->LOG_TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "target file = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x22

    if-lt v11, v12, :cond_3

    const-string v11, "/external_comps/"

    .line 178
    invoke-virtual {v3, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_3

    const-string v11, "/classes.jar"

    invoke-virtual {v3, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    const/4 v10, 0x1

    goto :goto_0

    :cond_3
    nop

    .line 180
    .local v10, "makeReadonly":Z
    :goto_0
    const/4 v11, 0x0

    .line 181
    .local v11, "connection":Ljava/net/HttpURLConnection;
    const/4 v12, 0x0

    .line 182
    .local v12, "responseCode":I
    const/4 v13, 0x0

    .line 183
    .local v13, "fileHash":Ljava/lang/String;
    const/4 v14, 0x0

    .line 186
    .local v14, "error":Z
    :try_start_1
    new-instance v15, Ljava/net/URL;

    invoke-direct {v15, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 187
    .local v15, "url":Ljava/net/URL;
    invoke-virtual {v15}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v16

    check-cast v16, Ljava/net/HttpURLConnection;

    move-object/from16 v11, v16

    .line 188
    if-eqz v11, :cond_13

    .line 189
    const-string v6, "Cookie"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_7

    move-object/from16 v18, v5

    .end local v5    # "form":Lcom/google/appinventor/components/runtime/Form;
    .local v18, "form":Lcom/google/appinventor/components/runtime/Form;
    :try_start_2
    const-string v5, "AppInventor = "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v6, v0}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    sget-object v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->db:Lcom/google/appinventor/components/runtime/util/HashDatabase;

    invoke-virtual {v0, v7}, Lcom/google/appinventor/components/runtime/util/HashDatabase;->getHashFile(Ljava/lang/String;)Lcom/google/appinventor/components/runtime/util/HashFile;

    move-result-object v0

    move-object v5, v0

    .line 191
    .local v5, "hashFile":Lcom/google/appinventor/components/runtime/util/HashFile;
    if-eqz v5, :cond_4

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 192
    const-string v0, "If-None-Match"

    invoke-virtual {v5}, Lcom/google/appinventor/components/runtime/util/HashFile;->getHash()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v11, v0, v6}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    :cond_4
    const-string v0, "GET"

    invoke-virtual {v11, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 195
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_6
    .catchall {:try_start_2 .. :try_end_2} :catchall_8

    move v12, v0

    .line 196
    :try_start_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "asset = "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, " responseCode = "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v9, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    invoke-virtual {v8}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    move-object v6, v0

    .line 198
    .local v6, "parentOutFile":Ljava/io/File;
    const-string v0, "ETag"

    invoke-virtual {v11, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5
    .catchall {:try_start_3 .. :try_end_3} :catchall_6

    move-object v13, v0

    .line 200
    const/16 v0, 0x130

    if-ne v12, v0, :cond_7

    .line 201
    nop

    .line 248
    if-eqz v10, :cond_5

    .line 253
    invoke-virtual {v8}, Ljava/io/File;->setReadOnly()Z

    .line 255
    :cond_5
    if-eqz v11, :cond_6

    .line 256
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 201
    :cond_6
    return-object v8

    .line 204
    :cond_7
    if-eqz v6, :cond_12

    :try_start_4
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    if-nez v0, :cond_9

    :try_start_5
    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    move-result v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6
    .catchall {:try_start_5 .. :try_end_5} :catchall_8

    if-eqz v0, :cond_8

    goto :goto_1

    :cond_8
    move-object/from16 v17, v5

    move/from16 v20, v12

    move-object/from16 v21, v13

    goto/16 :goto_8

    .line 210
    :cond_9
    :goto_1
    :try_start_6
    invoke-virtual {v8}, Ljava/io/File;->canWrite()Z

    move-result v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    if-nez v0, :cond_a

    .line 211
    const/4 v0, 0x1

    :try_start_7
    invoke-virtual {v8, v0}, Ljava/io/File;->setWritable(Z)Z
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6
    .catchall {:try_start_7 .. :try_end_7} :catchall_8

    .line 213
    :cond_a
    :try_start_8
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    move-object/from16 v17, v5

    .end local v5    # "hashFile":Lcom/google/appinventor/components/runtime/util/HashFile;
    .local v17, "hashFile":Lcom/google/appinventor/components/runtime/util/HashFile;
    const/16 v5, 0x1000

    invoke-direct {v0, v9, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    move-object v9, v0

    .line 214
    .local v9, "in":Ljava/io/BufferedInputStream;
    new-instance v0, Ljava/io/BufferedOutputStream;

    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    move/from16 v20, v12

    const/16 v12, 0x1000

    .end local v12    # "responseCode":I
    .local v20, "responseCode":I
    :try_start_9
    invoke-direct {v0, v5, v12}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    move-object v5, v0

    .line 218
    .local v5, "out":Ljava/io/BufferedOutputStream;
    :goto_2
    :try_start_a
    invoke-virtual {v9}, Ljava/io/BufferedInputStream;->read()I

    move-result v0

    .line 219
    .local v0, "b":I
    const/4 v12, -0x1

    if-ne v0, v12, :cond_d

    .line 220
    nop

    .line 224
    .end local v0    # "b":I
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 229
    :try_start_b
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->close()V

    .line 230
    if-eqz v10, :cond_c

    .line 231
    sget-object v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v19, v9

    .end local v9    # "in":Ljava/io/BufferedInputStream;
    .local v19, "in":Ljava/io/BufferedInputStream;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    move-object/from16 v21, v13

    .end local v13    # "fileHash":Ljava/lang/String;
    .local v21, "fileHash":Ljava/lang/String;
    :try_start_c
    const-string v13, "Making file read-only: "

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    invoke-virtual {v8}, Ljava/io/File;->setReadOnly()Z

    move-result v0

    if-eqz v0, :cond_b

    :goto_3
    goto/16 :goto_6

    .line 233
    :cond_b
    new-instance v0, Ljava/io/IOException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Unable to make "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v12, " read-only."

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v0, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v7    # "destinationFilename":Ljava/lang/String;
    .end local v8    # "outFile":Ljava/io/File;
    .end local v10    # "makeReadonly":Z
    .end local v11    # "connection":Ljava/net/HttpURLConnection;
    .end local v14    # "error":Z
    .end local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    .end local v20    # "responseCode":I
    .end local v21    # "fileHash":Ljava/lang/String;
    .end local p0    # "fileName":Ljava/lang/String;
    .end local p1    # "cookieValue":Ljava/lang/String;
    .end local p2    # "asset":Ljava/lang/String;
    .end local p3    # "depth":I
    :goto_4
    throw v0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_4
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    .line 230
    .end local v19    # "in":Ljava/io/BufferedInputStream;
    .restart local v7    # "destinationFilename":Ljava/lang/String;
    .restart local v8    # "outFile":Ljava/io/File;
    .restart local v9    # "in":Ljava/io/BufferedInputStream;
    .restart local v10    # "makeReadonly":Z
    .restart local v11    # "connection":Ljava/net/HttpURLConnection;
    .restart local v13    # "fileHash":Ljava/lang/String;
    .restart local v14    # "error":Z
    .restart local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    .restart local v20    # "responseCode":I
    .restart local p0    # "fileName":Ljava/lang/String;
    .restart local p1    # "cookieValue":Ljava/lang/String;
    .restart local p2    # "asset":Ljava/lang/String;
    .restart local p3    # "depth":I
    :cond_c
    move-object/from16 v19, v9

    move-object/from16 v21, v13

    .end local v9    # "in":Ljava/io/BufferedInputStream;
    .end local v13    # "fileHash":Ljava/lang/String;
    .restart local v19    # "in":Ljava/io/BufferedInputStream;
    .restart local v21    # "fileHash":Ljava/lang/String;
    goto :goto_6

    .line 222
    .end local v19    # "in":Ljava/io/BufferedInputStream;
    .end local v21    # "fileHash":Ljava/lang/String;
    .restart local v0    # "b":I
    .restart local v9    # "in":Ljava/io/BufferedInputStream;
    .restart local v13    # "fileHash":Ljava/lang/String;
    :cond_d
    move-object/from16 v19, v9

    move-object/from16 v21, v13

    .end local v9    # "in":Ljava/io/BufferedInputStream;
    .end local v13    # "fileHash":Ljava/lang/String;
    .restart local v19    # "in":Ljava/io/BufferedInputStream;
    .restart local v21    # "fileHash":Ljava/lang/String;
    :try_start_d
    invoke-virtual {v5, v0}, Ljava/io/BufferedOutputStream;->write(I)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_0
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 223
    .end local v0    # "b":I
    move-object/from16 v9, v19

    move-object/from16 v13, v21

    goto :goto_2

    .line 225
    :catch_0
    move-exception v0

    goto :goto_5

    .line 229
    .end local v19    # "in":Ljava/io/BufferedInputStream;
    .end local v21    # "fileHash":Ljava/lang/String;
    .restart local v9    # "in":Ljava/io/BufferedInputStream;
    .restart local v13    # "fileHash":Ljava/lang/String;
    :catchall_1
    move-exception v0

    move-object/from16 v19, v9

    move-object/from16 v21, v13

    .end local v9    # "in":Ljava/io/BufferedInputStream;
    .end local v13    # "fileHash":Ljava/lang/String;
    .restart local v19    # "in":Ljava/io/BufferedInputStream;
    .restart local v21    # "fileHash":Ljava/lang/String;
    goto :goto_7

    .line 225
    .end local v19    # "in":Ljava/io/BufferedInputStream;
    .end local v21    # "fileHash":Ljava/lang/String;
    .restart local v9    # "in":Ljava/io/BufferedInputStream;
    .restart local v13    # "fileHash":Ljava/lang/String;
    :catch_1
    move-exception v0

    move-object/from16 v19, v9

    move-object/from16 v21, v13

    .line 226
    .end local v9    # "in":Ljava/io/BufferedInputStream;
    .end local v13    # "fileHash":Ljava/lang/String;
    .local v0, "e":Ljava/io/IOException;
    .restart local v19    # "in":Ljava/io/BufferedInputStream;
    .restart local v21    # "fileHash":Ljava/lang/String;
    :goto_5
    :try_start_e
    sget-object v9, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->LOG_TAG:Ljava/lang/String;

    const-string v12, "copying assets"

    invoke-static {v9, v12, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 227
    const/4 v14, 0x1

    .line 229
    .end local v0    # "e":Ljava/io/IOException;
    :try_start_f
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->close()V

    .line 230
    if-eqz v10, :cond_f

    .line 231
    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Making file read-only: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v9, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    invoke-virtual {v8}, Ljava/io/File;->setReadOnly()Z

    move-result v0

    if-eqz v0, :cond_e

    goto :goto_3

    .line 233
    :cond_e
    new-instance v0, Ljava/io/IOException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Unable to make "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v12, " read-only."

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v0, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    .line 237
    .end local v5    # "out":Ljava/io/BufferedOutputStream;
    .end local v6    # "parentOutFile":Ljava/io/File;
    .end local v17    # "hashFile":Lcom/google/appinventor/components/runtime/util/HashFile;
    .end local v19    # "in":Ljava/io/BufferedInputStream;
    :cond_f
    :goto_6
    move/from16 v12, v20

    move-object/from16 v13, v21

    goto/16 :goto_9

    .line 229
    .restart local v5    # "out":Ljava/io/BufferedOutputStream;
    .restart local v6    # "parentOutFile":Ljava/io/File;
    .restart local v17    # "hashFile":Lcom/google/appinventor/components/runtime/util/HashFile;
    .restart local v19    # "in":Ljava/io/BufferedInputStream;
    :catchall_2
    move-exception v0

    :goto_7
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->close()V

    .line 230
    if-eqz v10, :cond_10

    .line 231
    sget-object v9, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v22, v5

    .end local v5    # "out":Ljava/io/BufferedOutputStream;
    .local v22, "out":Ljava/io/BufferedOutputStream;
    const-string v5, "Making file read-only: "

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v9, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    invoke-virtual {v8}, Ljava/io/File;->setReadOnly()Z

    move-result v5

    if-nez v5, :cond_11

    .line 233
    new-instance v0, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to make "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, " read-only."

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v7    # "destinationFilename":Ljava/lang/String;
    .end local v8    # "outFile":Ljava/io/File;
    .end local v10    # "makeReadonly":Z
    .end local v11    # "connection":Ljava/net/HttpURLConnection;
    .end local v14    # "error":Z
    .end local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    .end local v20    # "responseCode":I
    .end local v21    # "fileHash":Ljava/lang/String;
    .end local p0    # "fileName":Ljava/lang/String;
    .end local p1    # "cookieValue":Ljava/lang/String;
    .end local p2    # "asset":Ljava/lang/String;
    .end local p3    # "depth":I
    throw v0

    .line 230
    .end local v22    # "out":Ljava/io/BufferedOutputStream;
    .restart local v5    # "out":Ljava/io/BufferedOutputStream;
    .restart local v7    # "destinationFilename":Ljava/lang/String;
    .restart local v8    # "outFile":Ljava/io/File;
    .restart local v10    # "makeReadonly":Z
    .restart local v11    # "connection":Ljava/net/HttpURLConnection;
    .restart local v14    # "error":Z
    .restart local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    .restart local v20    # "responseCode":I
    .restart local v21    # "fileHash":Ljava/lang/String;
    .restart local p0    # "fileName":Ljava/lang/String;
    .restart local p1    # "cookieValue":Ljava/lang/String;
    .restart local p2    # "asset":Ljava/lang/String;
    .restart local p3    # "depth":I
    :cond_10
    move-object/from16 v22, v5

    .line 236
    .end local v5    # "out":Ljava/io/BufferedOutputStream;
    .restart local v22    # "out":Ljava/io/BufferedOutputStream;
    :cond_11
    nop

    .end local v7    # "destinationFilename":Ljava/lang/String;
    .end local v8    # "outFile":Ljava/io/File;
    .end local v10    # "makeReadonly":Z
    .end local v11    # "connection":Ljava/net/HttpURLConnection;
    .end local v14    # "error":Z
    .end local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    .end local v20    # "responseCode":I
    .end local v21    # "fileHash":Ljava/lang/String;
    .end local p0    # "fileName":Ljava/lang/String;
    .end local p1    # "cookieValue":Ljava/lang/String;
    .end local p2    # "asset":Ljava/lang/String;
    .end local p3    # "depth":I
    throw v0

    .line 248
    .end local v6    # "parentOutFile":Ljava/io/File;
    .end local v15    # "url":Ljava/net/URL;
    .end local v17    # "hashFile":Lcom/google/appinventor/components/runtime/util/HashFile;
    .end local v19    # "in":Ljava/io/BufferedInputStream;
    .end local v22    # "out":Ljava/io/BufferedOutputStream;
    .restart local v7    # "destinationFilename":Ljava/lang/String;
    .restart local v8    # "outFile":Ljava/io/File;
    .restart local v10    # "makeReadonly":Z
    .restart local v11    # "connection":Ljava/net/HttpURLConnection;
    .restart local v13    # "fileHash":Ljava/lang/String;
    .restart local v14    # "error":Z
    .restart local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    .restart local v20    # "responseCode":I
    .restart local p0    # "fileName":Ljava/lang/String;
    .restart local p1    # "cookieValue":Ljava/lang/String;
    .restart local p2    # "asset":Ljava/lang/String;
    .restart local p3    # "depth":I
    :catchall_3
    move-exception v0

    move-object/from16 v21, v13

    move/from16 v12, v20

    .end local v13    # "fileHash":Ljava/lang/String;
    .restart local v21    # "fileHash":Ljava/lang/String;
    goto/16 :goto_c

    .line 243
    .end local v21    # "fileHash":Ljava/lang/String;
    .restart local v13    # "fileHash":Ljava/lang/String;
    :catch_2
    move-exception v0

    move-object/from16 v21, v13

    move/from16 v12, v20

    .end local v13    # "fileHash":Ljava/lang/String;
    .restart local v21    # "fileHash":Ljava/lang/String;
    goto/16 :goto_b

    .line 248
    .end local v20    # "responseCode":I
    .end local v21    # "fileHash":Ljava/lang/String;
    .restart local v12    # "responseCode":I
    .restart local v13    # "fileHash":Ljava/lang/String;
    :catchall_4
    move-exception v0

    move/from16 v20, v12

    move-object/from16 v21, v13

    .end local v12    # "responseCode":I
    .end local v13    # "fileHash":Ljava/lang/String;
    .restart local v20    # "responseCode":I
    .restart local v21    # "fileHash":Ljava/lang/String;
    goto/16 :goto_c

    .line 243
    .end local v20    # "responseCode":I
    .end local v21    # "fileHash":Ljava/lang/String;
    .restart local v12    # "responseCode":I
    .restart local v13    # "fileHash":Ljava/lang/String;
    :catch_3
    move-exception v0

    move/from16 v20, v12

    move-object/from16 v21, v13

    .end local v12    # "responseCode":I
    .end local v13    # "fileHash":Ljava/lang/String;
    .restart local v20    # "responseCode":I
    .restart local v21    # "fileHash":Ljava/lang/String;
    goto/16 :goto_b

    .line 204
    .end local v20    # "responseCode":I
    .end local v21    # "fileHash":Ljava/lang/String;
    .local v5, "hashFile":Lcom/google/appinventor/components/runtime/util/HashFile;
    .restart local v6    # "parentOutFile":Ljava/io/File;
    .restart local v12    # "responseCode":I
    .restart local v13    # "fileHash":Ljava/lang/String;
    .restart local v15    # "url":Ljava/net/URL;
    :cond_12
    move-object/from16 v17, v5

    move/from16 v20, v12

    move-object/from16 v21, v13

    .line 205
    .end local v5    # "hashFile":Lcom/google/appinventor/components/runtime/util/HashFile;
    .end local v12    # "responseCode":I
    .end local v13    # "fileHash":Ljava/lang/String;
    .restart local v17    # "hashFile":Lcom/google/appinventor/components/runtime/util/HashFile;
    .restart local v20    # "responseCode":I
    .restart local v21    # "fileHash":Ljava/lang/String;
    :goto_8
    new-instance v0, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to create assets directory "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v7    # "destinationFilename":Ljava/lang/String;
    .end local v8    # "outFile":Ljava/io/File;
    .end local v10    # "makeReadonly":Z
    .end local v11    # "connection":Ljava/net/HttpURLConnection;
    .end local v14    # "error":Z
    .end local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    .end local v20    # "responseCode":I
    .end local v21    # "fileHash":Ljava/lang/String;
    .end local p0    # "fileName":Ljava/lang/String;
    .end local p1    # "cookieValue":Ljava/lang/String;
    .end local p2    # "asset":Ljava/lang/String;
    .end local p3    # "depth":I
    throw v0
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_4
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    .line 248
    .end local v6    # "parentOutFile":Ljava/io/File;
    .end local v15    # "url":Ljava/net/URL;
    .end local v17    # "hashFile":Lcom/google/appinventor/components/runtime/util/HashFile;
    .restart local v7    # "destinationFilename":Ljava/lang/String;
    .restart local v8    # "outFile":Ljava/io/File;
    .restart local v10    # "makeReadonly":Z
    .restart local v11    # "connection":Ljava/net/HttpURLConnection;
    .restart local v14    # "error":Z
    .restart local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    .restart local v20    # "responseCode":I
    .restart local v21    # "fileHash":Ljava/lang/String;
    .restart local p0    # "fileName":Ljava/lang/String;
    .restart local p1    # "cookieValue":Ljava/lang/String;
    .restart local p2    # "asset":Ljava/lang/String;
    .restart local p3    # "depth":I
    :catchall_5
    move-exception v0

    move/from16 v12, v20

    move-object/from16 v13, v21

    goto/16 :goto_c

    .line 243
    :catch_4
    move-exception v0

    move/from16 v12, v20

    move-object/from16 v13, v21

    goto :goto_b

    .line 248
    .end local v20    # "responseCode":I
    .end local v21    # "fileHash":Ljava/lang/String;
    .restart local v12    # "responseCode":I
    .restart local v13    # "fileHash":Ljava/lang/String;
    :catchall_6
    move-exception v0

    move/from16 v20, v12

    .end local v12    # "responseCode":I
    .restart local v20    # "responseCode":I
    goto/16 :goto_c

    .line 243
    .end local v20    # "responseCode":I
    .restart local v12    # "responseCode":I
    :catch_5
    move-exception v0

    move/from16 v20, v12

    .end local v12    # "responseCode":I
    .restart local v20    # "responseCode":I
    goto :goto_b

    .line 238
    .end local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    .end local v20    # "responseCode":I
    .local v5, "form":Lcom/google/appinventor/components/runtime/Form;
    .restart local v12    # "responseCode":I
    .restart local v15    # "url":Ljava/net/URL;
    :cond_13
    move-object/from16 v18, v5

    .end local v5    # "form":Lcom/google/appinventor/components/runtime/Form;
    .restart local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    const/4 v0, 0x1

    move v14, v0

    .line 240
    :goto_9
    if-eqz v14, :cond_16

    .line 241
    add-int/lit8 v0, v4, 0x1

    :try_start_10
    invoke-static {v1, v2, v3, v0}, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->getFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_6
    .catchall {:try_start_10 .. :try_end_10} :catchall_8

    .line 248
    if-eqz v10, :cond_14

    .line 253
    invoke-virtual {v8}, Ljava/io/File;->setReadOnly()Z

    .line 255
    :cond_14
    if-eqz v11, :cond_15

    .line 256
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 241
    :cond_15
    return-object v0

    .line 243
    .end local v15    # "url":Ljava/net/URL;
    :catch_6
    move-exception v0

    goto :goto_b

    .line 248
    :cond_16
    if-eqz v10, :cond_17

    .line 253
    invoke-virtual {v8}, Ljava/io/File;->setReadOnly()Z

    .line 255
    :cond_17
    if-eqz v11, :cond_18

    .line 256
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 260
    :cond_18
    const/16 v0, 0xc8

    if-ne v12, v0, :cond_1a

    .line 261
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 262
    .local v0, "timeStamp":Ljava/util/Date;
    new-instance v5, Lcom/google/appinventor/components/runtime/util/HashFile;

    invoke-direct {v5, v7, v13, v0}, Lcom/google/appinventor/components/runtime/util/HashFile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V

    .line 263
    .local v5, "file":Lcom/google/appinventor/components/runtime/util/HashFile;
    sget-object v6, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->db:Lcom/google/appinventor/components/runtime/util/HashDatabase;

    invoke-virtual {v6, v7}, Lcom/google/appinventor/components/runtime/util/HashDatabase;->getHashFile(Ljava/lang/String;)Lcom/google/appinventor/components/runtime/util/HashFile;

    move-result-object v6

    if-nez v6, :cond_19

    .line 264
    sget-object v6, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->db:Lcom/google/appinventor/components/runtime/util/HashDatabase;

    invoke-virtual {v6, v5}, Lcom/google/appinventor/components/runtime/util/HashDatabase;->insertHashFile(Lcom/google/appinventor/components/runtime/util/HashFile;)V

    goto :goto_a

    .line 266
    :cond_19
    sget-object v6, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->db:Lcom/google/appinventor/components/runtime/util/HashDatabase;

    invoke-virtual {v6, v5}, Lcom/google/appinventor/components/runtime/util/HashDatabase;->updateHashFile(Lcom/google/appinventor/components/runtime/util/HashFile;)I

    .line 268
    :goto_a
    return-object v8

    .line 270
    .end local v0    # "timeStamp":Ljava/util/Date;
    .end local v5    # "file":Lcom/google/appinventor/components/runtime/util/HashFile;
    :cond_1a
    const/4 v5, 0x0

    return-object v5

    .line 248
    .end local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    .local v5, "form":Lcom/google/appinventor/components/runtime/Form;
    :catchall_7
    move-exception v0

    move-object/from16 v18, v5

    .end local v5    # "form":Lcom/google/appinventor/components/runtime/Form;
    .restart local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    goto :goto_c

    .line 243
    .end local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    .restart local v5    # "form":Lcom/google/appinventor/components/runtime/Form;
    :catch_7
    move-exception v0

    move-object/from16 v18, v5

    .line 244
    .end local v5    # "form":Lcom/google/appinventor/components/runtime/Form;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v18    # "form":Lcom/google/appinventor/components/runtime/Form;
    :goto_b
    :try_start_11
    sget-object v5, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Exception while fetching "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 246
    add-int/lit8 v5, v4, 0x1

    invoke-static {v1, v2, v3, v5}, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->getFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v5
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_8

    .line 248
    if-eqz v10, :cond_1b

    .line 253
    invoke-virtual {v8}, Ljava/io/File;->setReadOnly()Z

    .line 255
    :cond_1b
    if-eqz v11, :cond_1c

    .line 256
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 246
    :cond_1c
    return-object v5

    .line 248
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_8
    move-exception v0

    :goto_c
    if-eqz v10, :cond_1d

    .line 253
    invoke-virtual {v8}, Ljava/io/File;->setReadOnly()Z

    .line 255
    :cond_1d
    if-eqz v11, :cond_1e

    .line 256
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 258
    :cond_1e
    goto :goto_e

    :goto_d
    throw v0

    :goto_e
    goto :goto_d
.end method

.method public static loadExtensions(Ljava/lang/String;)V
    .locals 8
    .param p0, "jsonString"    # Ljava/lang/String;

    .line 116
    sget-object v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadExtensions called jsonString = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    :try_start_0
    invoke-static {}, Lcom/google/appinventor/components/runtime/Form;->getActiveForm()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v1

    check-cast v1, Lcom/google/appinventor/components/runtime/ReplForm;

    .line 119
    .local v1, "form":Lcom/google/appinventor/components/runtime/ReplForm;
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 120
    .local v2, "array":Lorg/json/JSONArray;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .local v3, "extensionsToLoad":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-nez v4, :cond_0

    .line 122
    const-string v4, "loadExtensions: No Extensions"

    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    invoke-static {}, Lcom/google/appinventor/components/runtime/util/RetValManager;->extensionsLoaded()V

    .line 124
    return-void

    .line 126
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v0, v4, :cond_2

    .line 127
    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v4

    .line 128
    .local v4, "extensionName":Ljava/lang/String;
    if-eqz v4, :cond_1

    .line 129
    sget-object v5, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "loadExtensions, extensionName = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    .end local v4    # "extensionName":Ljava/lang/String;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 132
    .restart local v4    # "extensionName":Ljava/lang/String;
    :cond_1
    sget-object v5, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->LOG_TAG:Ljava/lang/String;

    const-string v6, "extensionName was null"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 133
    return-void

    .line 137
    .end local v0    # "i":I
    .end local v4    # "extensionName":Ljava/lang/String;
    :cond_2
    :try_start_1
    invoke-virtual {v1, v3}, Lcom/google/appinventor/components/runtime/ReplForm;->loadComponents(Ljava/util/List;)V

    .line 138
    invoke-static {}, Lcom/google/appinventor/components/runtime/util/RetValManager;->extensionsLoaded()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 142
    goto :goto_1

    .line 139
    :catch_0
    move-exception v0

    .line 140
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v4, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Error in form.loadComponents"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 141
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to load extensions."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/appinventor/components/runtime/util/RetValManager;->sendError(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 145
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "form":Lcom/google/appinventor/components/runtime/ReplForm;
    .end local v2    # "array":Lorg/json/JSONArray;
    .end local v3    # "extensionsToLoad":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1
    goto :goto_2

    .line 143
    :catch_1
    move-exception v0

    .line 144
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->LOG_TAG:Ljava/lang/String;

    const-string v2, "JSON Exception parsing extension string"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 146
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_2
    return-void
.end method

.method public static upgradeCompanion(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "cookieValue"    # Ljava/lang/String;
    .param p1, "inputUri"    # Ljava/lang/String;

    .line 91
    sget-object v0, Lcom/google/appinventor/components/runtime/util/AssetFetcher;->background:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/appinventor/components/runtime/util/AssetFetcher$2;

    invoke-direct {v1, p1, p0}, Lcom/google/appinventor/components/runtime/util/AssetFetcher$2;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 112
    return-void
.end method
