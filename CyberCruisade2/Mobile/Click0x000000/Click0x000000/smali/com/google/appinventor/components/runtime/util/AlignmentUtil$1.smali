.class synthetic Lcom/google/appinventor/components/runtime/util/AlignmentUtil$1;
.super Ljava/lang/Object;
.source "AlignmentUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/appinventor/components/runtime/util/AlignmentUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$google$appinventor$components$common$HorizontalAlignment:[I

.field static final synthetic $SwitchMap$com$google$appinventor$components$common$VerticalAlignment:[I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 94
    invoke-static {}, Lcom/google/appinventor/components/common/VerticalAlignment;->values()[Lcom/google/appinventor/components/common/VerticalAlignment;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/google/appinventor/components/runtime/util/AlignmentUtil$1;->$SwitchMap$com$google$appinventor$components$common$VerticalAlignment:[I

    const/4 v1, 0x1

    :try_start_0
    sget-object v2, Lcom/google/appinventor/components/common/VerticalAlignment;->Top:Lcom/google/appinventor/components/common/VerticalAlignment;

    invoke-virtual {v2}, Lcom/google/appinventor/components/common/VerticalAlignment;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    const/4 v0, 0x2

    :try_start_1
    sget-object v2, Lcom/google/appinventor/components/runtime/util/AlignmentUtil$1;->$SwitchMap$com$google$appinventor$components$common$VerticalAlignment:[I

    sget-object v3, Lcom/google/appinventor/components/common/VerticalAlignment;->Center:Lcom/google/appinventor/components/common/VerticalAlignment;

    invoke-virtual {v3}, Lcom/google/appinventor/components/common/VerticalAlignment;->ordinal()I

    move-result v3

    aput v0, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v2

    :goto_1
    const/4 v2, 0x3

    :try_start_2
    sget-object v3, Lcom/google/appinventor/components/runtime/util/AlignmentUtil$1;->$SwitchMap$com$google$appinventor$components$common$VerticalAlignment:[I

    sget-object v4, Lcom/google/appinventor/components/common/VerticalAlignment;->Bottom:Lcom/google/appinventor/components/common/VerticalAlignment;

    invoke-virtual {v4}, Lcom/google/appinventor/components/common/VerticalAlignment;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v3

    .line 53
    :goto_2
    invoke-static {}, Lcom/google/appinventor/components/common/HorizontalAlignment;->values()[Lcom/google/appinventor/components/common/HorizontalAlignment;

    move-result-object v3

    array-length v3, v3

    new-array v3, v3, [I

    sput-object v3, Lcom/google/appinventor/components/runtime/util/AlignmentUtil$1;->$SwitchMap$com$google$appinventor$components$common$HorizontalAlignment:[I

    :try_start_3
    sget-object v4, Lcom/google/appinventor/components/common/HorizontalAlignment;->Left:Lcom/google/appinventor/components/common/HorizontalAlignment;

    invoke-virtual {v4}, Lcom/google/appinventor/components/common/HorizontalAlignment;->ordinal()I

    move-result v4

    aput v1, v3, v4
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v1

    :goto_3
    :try_start_4
    sget-object v1, Lcom/google/appinventor/components/runtime/util/AlignmentUtil$1;->$SwitchMap$com$google$appinventor$components$common$HorizontalAlignment:[I

    sget-object v3, Lcom/google/appinventor/components/common/HorizontalAlignment;->Center:Lcom/google/appinventor/components/common/HorizontalAlignment;

    invoke-virtual {v3}, Lcom/google/appinventor/components/common/HorizontalAlignment;->ordinal()I

    move-result v3

    aput v0, v1, v3
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v0

    :goto_4
    :try_start_5
    sget-object v0, Lcom/google/appinventor/components/runtime/util/AlignmentUtil$1;->$SwitchMap$com$google$appinventor$components$common$HorizontalAlignment:[I

    sget-object v1, Lcom/google/appinventor/components/common/HorizontalAlignment;->Right:Lcom/google/appinventor/components/common/HorizontalAlignment;

    invoke-virtual {v1}, Lcom/google/appinventor/components/common/HorizontalAlignment;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_5

    :catch_5
    move-exception v0

    :goto_5
    return-void
.end method
