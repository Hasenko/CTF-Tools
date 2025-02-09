.class Lcom/google/appinventor/components/runtime/util/MediaUtil$2;
.super Ljava/lang/Object;
.source "MediaUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/appinventor/components/runtime/util/MediaUtil;->getBitmapDrawableAsync(Lcom/google/appinventor/components/runtime/Form;Ljava/lang/String;IILcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$continuation:Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;

.field final synthetic val$desiredHeight:I

.field final synthetic val$desiredWidth:I

.field final synthetic val$form:Lcom/google/appinventor/components/runtime/Form;

.field final synthetic val$mediaPath:Ljava/lang/String;

.field final synthetic val$mediaSource:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/google/appinventor/components/runtime/Form;Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;II)V
    .locals 0

    .line 496
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$mediaPath:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$form:Lcom/google/appinventor/components/runtime/Form;

    iput-object p3, p0, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$mediaSource:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    iput-object p4, p0, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$continuation:Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;

    iput p5, p0, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$desiredWidth:I

    iput p6, p0, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$desiredHeight:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 16

    .line 504
    move-object/from16 v1, p0

    const-string v2, "Unexpected error on close"

    iget-object v0, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$mediaPath:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mediaPath = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "MediaUtil"

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 505
    const/4 v4, 0x0

    .line 506
    .local v4, "is":Ljava/io/InputStream;
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object v5, v0

    .line 507
    .local v5, "bos":Ljava/io/ByteArrayOutputStream;
    const/16 v0, 0x1000

    new-array v6, v0, [B

    .line 511
    .local v6, "buf":[B
    const/4 v7, 0x0

    :try_start_0
    iget-object v0, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$form:Lcom/google/appinventor/components/runtime/Form;

    iget-object v8, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$mediaPath:Ljava/lang/String;

    iget-object v9, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$mediaSource:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    invoke-static {v0, v8, v9}, Lcom/google/appinventor/components/runtime/util/MediaUtil;->-$$Nest$smopenMedia(Lcom/google/appinventor/components/runtime/Form;Ljava/lang/String;Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;)Ljava/io/InputStream;

    move-result-object v0

    move-object v4, v0

    .line 512
    :goto_0
    invoke-virtual {v4, v6}, Ljava/io/InputStream;->read([B)I

    move-result v0

    move v8, v0

    .local v8, "read":I
    const/4 v9, 0x0

    if-lez v0, :cond_0

    .line 513
    invoke-virtual {v5, v6, v9, v8}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 515
    :cond_0
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0
    :try_end_0
    .catch Lcom/google/appinventor/components/runtime/errors/PermissionException; {:try_start_0 .. :try_end_0} :catch_b
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-object v6, v0

    .line 532
    if-eqz v4, :cond_1

    .line 534
    :try_start_1
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 538
    goto :goto_1

    .line 535
    :catch_0
    move-exception v0

    move-object v10, v0

    move-object v0, v10

    .line 537
    .local v0, "e":Ljava/io/IOException;
    invoke-static {v3, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 540
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1
    :goto_1
    const/4 v4, 0x0

    .line 542
    :try_start_2
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 545
    goto :goto_2

    .line 543
    :catch_1
    move-exception v0

    .line 546
    :goto_2
    const/4 v5, 0x0

    .line 547
    nop

    .line 548
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v6}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    move-object v10, v0

    .line 549
    .local v10, "bis":Ljava/io/ByteArrayInputStream;
    array-length v8, v6

    .line 550
    const/4 v6, 0x0

    .line 552
    :try_start_3
    invoke-virtual {v10, v8}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 553
    iget-object v0, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$form:Lcom/google/appinventor/components/runtime/Form;

    iget-object v11, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$mediaPath:Ljava/lang/String;

    invoke-static {v0, v10, v11}, Lcom/google/appinventor/components/runtime/util/MediaUtil;->-$$Nest$smgetBitmapOptions(Lcom/google/appinventor/components/runtime/Form;Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v0

    move-object v11, v0

    .line 554
    .local v11, "options":Landroid/graphics/BitmapFactory$Options;
    invoke-virtual {v10}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 555
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v12, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$form:Lcom/google/appinventor/components/runtime/Form;

    invoke-virtual {v12}, Lcom/google/appinventor/components/runtime/Form;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    .line 556
    invoke-static {v10, v7, v11}, Lcom/google/appinventor/components/runtime/util/MediaUtil;->-$$Nest$smdecodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v7

    invoke-direct {v0, v12, v7}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    move-object v7, v0

    .line 570
    .local v7, "originalBitmapDrawable":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v0, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$form:Lcom/google/appinventor/components/runtime/Form;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Form;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/graphics/drawable/BitmapDrawable;->setTargetDensity(Landroid/util/DisplayMetrics;)V

    .line 571
    iget v0, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$desiredWidth:I

    const/4 v12, 0x1

    if-lez v0, :cond_2

    iget v0, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$desiredHeight:I

    if-ltz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_3

    :cond_2
    const/4 v0, 0x0

    :goto_3
    move v13, v0

    .line 572
    .local v13, "needsResize":Z
    if-nez v13, :cond_4

    iget v0, v11, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    if-ne v0, v12, :cond_3

    iget-object v0, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$form:Lcom/google/appinventor/components/runtime/Form;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Form;->deviceDensity()F

    move-result v0

    const/high16 v12, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v12

    if-nez v0, :cond_4

    .line 573
    :cond_3
    iget-object v0, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$continuation:Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;

    invoke-interface {v0, v7}, Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;->onSuccess(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 597
    nop

    .line 599
    :try_start_4
    invoke-virtual {v10}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 603
    goto :goto_4

    .line 600
    :catch_2
    move-exception v0

    move-object v9, v0

    move-object v0, v9

    .line 602
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-static {v3, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 574
    .end local v0    # "e":Ljava/io/IOException;
    :goto_4
    return-void

    .line 576
    :cond_4
    :try_start_5
    iget-object v0, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$form:Lcom/google/appinventor/components/runtime/Form;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Form;->deviceDensity()F

    move-result v0

    .line 577
    iget v12, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$desiredWidth:I

    if-lez v12, :cond_5

    goto :goto_5

    :cond_5
    invoke-virtual {v7}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicWidth()I

    move-result v12

    :goto_5
    int-to-float v12, v12

    mul-float v0, v0, v12

    float-to-int v0, v0

    .line 578
    .local v0, "scaledWidth":I
    iget-object v12, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$form:Lcom/google/appinventor/components/runtime/Form;

    invoke-virtual {v12}, Lcom/google/appinventor/components/runtime/Form;->deviceDensity()F

    move-result v12

    .line 579
    iget v14, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$desiredHeight:I

    if-lez v14, :cond_6

    goto :goto_6

    :cond_6
    invoke-virtual {v7}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicHeight()I

    move-result v14

    :goto_6
    int-to-float v14, v14

    mul-float v12, v12, v14

    float-to-int v12, v12

    .line 580
    .local v12, "scaledHeight":I
    iget-object v14, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$form:Lcom/google/appinventor/components/runtime/Form;

    invoke-virtual {v14}, Lcom/google/appinventor/components/runtime/Form;->deviceDensity()F

    move-result v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "form.deviceDensity() = "

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 581
    nop

    .line 582
    invoke-virtual {v7}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicWidth()I

    move-result v9

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "originalBitmapDrawable.getIntrinsicWidth() = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 581
    invoke-static {v3, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    nop

    .line 584
    invoke-virtual {v7}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicHeight()I

    move-result v9

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "originalBitmapDrawable.getIntrinsicHeight() = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 583
    invoke-static {v3, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 585
    invoke-virtual {v7}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v9

    const/4 v14, 0x0

    invoke-static {v9, v0, v12, v14}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 587
    .local v9, "scaledBitmap":Landroid/graphics/Bitmap;
    new-instance v14, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v15, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$form:Lcom/google/appinventor/components/runtime/Form;

    .line 588
    invoke-virtual {v15}, Lcom/google/appinventor/components/runtime/Form;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-direct {v14, v15, v9}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 589
    .local v14, "scaledBitmapDrawable":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v15, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$form:Lcom/google/appinventor/components/runtime/Form;

    invoke-virtual {v15}, Lcom/google/appinventor/components/runtime/Form;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/graphics/drawable/BitmapDrawable;->setTargetDensity(Landroid/util/DisplayMetrics;)V

    .line 590
    const/4 v7, 0x0

    .line 591
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 592
    iget-object v15, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$continuation:Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;

    invoke-interface {v15, v14}, Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;->onSuccess(Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 597
    .end local v0    # "scaledWidth":I
    .end local v7    # "originalBitmapDrawable":Landroid/graphics/drawable/BitmapDrawable;
    .end local v9    # "scaledBitmap":Landroid/graphics/Bitmap;
    .end local v11    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v12    # "scaledHeight":I
    .end local v13    # "needsResize":Z
    .end local v14    # "scaledBitmapDrawable":Landroid/graphics/drawable/BitmapDrawable;
    nop

    .line 599
    :try_start_6
    invoke-virtual {v10}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_7

    .line 597
    :catchall_0
    move-exception v0

    move-object v7, v0

    goto :goto_9

    .line 593
    :catch_3
    move-exception v0

    .line 594
    .local v0, "e":Ljava/lang/Exception;
    :try_start_7
    const-string v7, "Exception while loading media."

    invoke-static {v3, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 595
    iget-object v7, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$continuation:Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v9}, Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;->onFailure(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 597
    .end local v0    # "e":Ljava/lang/Exception;
    nop

    .line 599
    :try_start_8
    invoke-virtual {v10}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    .line 603
    :goto_7
    goto :goto_8

    .line 600
    :catch_4
    move-exception v0

    move-object v7, v0

    move-object v0, v7

    .line 602
    .local v0, "e":Ljava/io/IOException;
    invoke-static {v3, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v0    # "e":Ljava/io/IOException;
    goto :goto_7

    .line 606
    :goto_8
    return-void

    .line 599
    :goto_9
    :try_start_9
    invoke-virtual {v10}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_5

    .line 603
    goto :goto_a

    .line 600
    :catch_5
    move-exception v0

    move-object v9, v0

    move-object v0, v9

    .line 602
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-static {v3, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 605
    .end local v0    # "e":Ljava/io/IOException;
    :goto_a
    throw v7

    .line 532
    .end local v8    # "read":I
    .end local v10    # "bis":Ljava/io/ByteArrayInputStream;
    :catchall_1
    move-exception v0

    move-object v7, v0

    goto/16 :goto_11

    .line 519
    :catch_6
    move-exception v0

    move-object v8, v0

    .line 520
    .local v8, "e":Ljava/io/IOException;
    :try_start_a
    iget-object v0, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$mediaSource:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    sget-object v9, Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;->CONTACT_URI:Lcom/google/appinventor/components/runtime/util/MediaUtil$MediaSource;

    if-ne v0, v9, :cond_8

    .line 522
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v9, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$form:Lcom/google/appinventor/components/runtime/Form;

    invoke-virtual {v9}, Lcom/google/appinventor/components/runtime/Form;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    iget-object v10, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$form:Lcom/google/appinventor/components/runtime/Form;

    .line 523
    invoke-virtual {v10}, Lcom/google/appinventor/components/runtime/Form;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x1080066

    invoke-static {v10, v11, v7}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v7

    invoke-direct {v0, v9, v7}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    move-object v7, v0

    .line 525
    .local v7, "drawable":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v0, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$continuation:Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;

    invoke-interface {v0, v7}, Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;->onSuccess(Ljava/lang/Object;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 532
    if-eqz v4, :cond_7

    .line 534
    :try_start_b
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_7

    .line 538
    goto :goto_b

    .line 535
    :catch_7
    move-exception v0

    move-object v9, v0

    move-object v0, v9

    .line 537
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-static {v3, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 540
    .end local v0    # "e":Ljava/io/IOException;
    :cond_7
    :goto_b
    const/4 v2, 0x0

    .line 542
    .end local v4    # "is":Ljava/io/InputStream;
    .local v2, "is":Ljava/io/InputStream;
    :try_start_c
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_8

    .line 545
    goto :goto_c

    .line 543
    :catch_8
    move-exception v0

    .line 546
    :goto_c
    const/4 v0, 0x0

    .line 526
    .end local v5    # "bos":Ljava/io/ByteArrayOutputStream;
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    return-void

    .line 528
    .end local v0    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v7    # "drawable":Landroid/graphics/drawable/BitmapDrawable;
    .restart local v4    # "is":Ljava/io/InputStream;
    .restart local v5    # "bos":Ljava/io/ByteArrayOutputStream;
    :cond_8
    :try_start_d
    const-string v0, "IOException reading file."

    invoke-static {v3, v0, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 529
    iget-object v0, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$continuation:Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;->onFailure(Ljava/lang/String;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 532
    if-eqz v4, :cond_9

    .line 534
    :try_start_e
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_9

    .line 538
    goto :goto_d

    .line 535
    :catch_9
    move-exception v0

    move-object v7, v0

    move-object v0, v7

    .line 537
    .local v0, "e":Ljava/io/IOException;
    invoke-static {v3, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 540
    .end local v0    # "e":Ljava/io/IOException;
    :cond_9
    :goto_d
    const/4 v2, 0x0

    .line 542
    .end local v4    # "is":Ljava/io/InputStream;
    .restart local v2    # "is":Ljava/io/InputStream;
    :try_start_f
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_a

    .line 545
    goto :goto_e

    .line 543
    :catch_a
    move-exception v0

    .line 546
    :goto_e
    const/4 v0, 0x0

    .line 530
    .end local v5    # "bos":Ljava/io/ByteArrayOutputStream;
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    return-void

    .line 516
    .end local v0    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v4    # "is":Ljava/io/InputStream;
    .restart local v5    # "bos":Ljava/io/ByteArrayOutputStream;
    :catch_b
    move-exception v0

    move-object v7, v0

    .line 517
    .local v7, "e":Lcom/google/appinventor/components/runtime/errors/PermissionException;
    :try_start_10
    iget-object v0, v1, Lcom/google/appinventor/components/runtime/util/MediaUtil$2;->val$continuation:Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;

    invoke-virtual {v7}, Lcom/google/appinventor/components/runtime/errors/PermissionException;->getPermissionNeeded()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "PERMISSION_DENIED:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v8}, Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;->onFailure(Ljava/lang/String;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    .line 532
    if-eqz v4, :cond_a

    .line 534
    :try_start_11
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_c

    .line 538
    goto :goto_f

    .line 535
    :catch_c
    move-exception v0

    move-object v8, v0

    move-object v0, v8

    .line 537
    .local v0, "e":Ljava/io/IOException;
    invoke-static {v3, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 540
    .end local v0    # "e":Ljava/io/IOException;
    :cond_a
    :goto_f
    const/4 v2, 0x0

    .line 542
    .end local v4    # "is":Ljava/io/InputStream;
    .restart local v2    # "is":Ljava/io/InputStream;
    :try_start_12
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_d

    .line 545
    goto :goto_10

    .line 543
    :catch_d
    move-exception v0

    .line 546
    :goto_10
    const/4 v0, 0x0

    .line 518
    .end local v5    # "bos":Ljava/io/ByteArrayOutputStream;
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    return-void

    .line 532
    .end local v0    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v7    # "e":Lcom/google/appinventor/components/runtime/errors/PermissionException;
    .restart local v4    # "is":Ljava/io/InputStream;
    .restart local v5    # "bos":Ljava/io/ByteArrayOutputStream;
    :goto_11
    if-eqz v4, :cond_b

    .line 534
    :try_start_13
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_e

    .line 538
    goto :goto_12

    .line 535
    :catch_e
    move-exception v0

    move-object v8, v0

    move-object v0, v8

    .line 537
    .local v0, "e":Ljava/io/IOException;
    invoke-static {v3, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 540
    .end local v0    # "e":Ljava/io/IOException;
    :cond_b
    :goto_12
    const/4 v2, 0x0

    .line 542
    .end local v4    # "is":Ljava/io/InputStream;
    .restart local v2    # "is":Ljava/io/InputStream;
    :try_start_14
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_f

    .line 545
    goto :goto_13

    .line 543
    :catch_f
    move-exception v0

    .line 546
    :goto_13
    const/4 v0, 0x0

    .line 547
    .end local v5    # "bos":Ljava/io/ByteArrayOutputStream;
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    goto :goto_15

    :goto_14
    throw v7

    :goto_15
    goto :goto_14
.end method
