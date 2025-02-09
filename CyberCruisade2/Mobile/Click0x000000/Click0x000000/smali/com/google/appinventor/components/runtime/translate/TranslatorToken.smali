.class public final Lcom/google/appinventor/components/runtime/translate/TranslatorToken;
.super Ljava/lang/Object;
.source "TranslatorToken.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/appinventor/components/runtime/translate/TranslatorToken$response;,
        Lcom/google/appinventor/components/runtime/translate/TranslatorToken$responseOrBuilder;,
        Lcom/google/appinventor/components/runtime/translate/TranslatorToken$request;,
        Lcom/google/appinventor/components/runtime/translate/TranslatorToken$requestOrBuilder;,
        Lcom/google/appinventor/components/runtime/translate/TranslatorToken$token;,
        Lcom/google/appinventor/components/runtime/translate/TranslatorToken$tokenOrBuilder;,
        Lcom/google/appinventor/components/runtime/translate/TranslatorToken$unsigned;,
        Lcom/google/appinventor/components/runtime/translate/TranslatorToken$unsignedOrBuilder;
    }
.end annotation


# static fields
.field private static descriptor:Lcom/google/protobuf/Descriptors$FileDescriptor;

.field private static final internal_static_request_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

.field private static final internal_static_request_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

.field private static final internal_static_response_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

.field private static final internal_static_response_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

.field private static final internal_static_token_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

.field private static final internal_static_token_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

.field private static final internal_static_unsigned_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

.field private static final internal_static_unsigned_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;


# direct methods
.method static bridge synthetic -$$Nest$sfgetinternal_static_request_descriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    sget-object v0, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_request_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetinternal_static_request_fieldAccessorTable()Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;
    .locals 1

    sget-object v0, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_request_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetinternal_static_response_descriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    sget-object v0, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_response_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetinternal_static_response_fieldAccessorTable()Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;
    .locals 1

    sget-object v0, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_response_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetinternal_static_token_descriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    sget-object v0, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_token_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetinternal_static_token_fieldAccessorTable()Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;
    .locals 1

    sget-object v0, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_token_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetinternal_static_unsigned_descriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    sget-object v0, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_unsigned_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetinternal_static_unsigned_fieldAccessorTable()Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;
    .locals 1

    sget-object v0, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_unsigned_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputdescriptor(Lcom/google/protobuf/Descriptors$FileDescriptor;)V
    .locals 0

    sput-object p0, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->descriptor:Lcom/google/protobuf/Descriptors$FileDescriptor;

    return-void
.end method

.method static constructor <clinit>()V
    .locals 13

    .line 3746
    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/String;

    const-string v2, "\n\u0008tr.proto\"D\n\u0008unsigned\u0012\r\n\u0005huuid\u0018\u0001 \u0001(\t\u0012\u0012\n\u0007version\u0018\u0002 \u0001(\u0004:\u00010\u0012\u0015\n\ngeneration\u0018\u0003 \u0001(\u0004:\u00010\"i\n\u0005token\u0012\u0012\n\u0007version\u0018\u0001 \u0001(\u0004:\u00011\u0012\u0010\n\u0005keyid\u0018\u0002 \u0001(\u0004:\u00011\u0012\u0015\n\ngeneration\u0018\u0003 \u0001(\u0004:\u00010\u0012\u0010\n\u0008unsigned\u0018\u0004 \u0001(\u000c\u0012\u0011\n\tsignature\u0018\u0005 \u0001(\u000c\"\u008f\u0001\n\u0007request\u0012\u0012\n\u0007version\u0018\u0001 \u0001(\u0004:\u00011\u0012\u0015\n\u0005token\u0018\u0002 \u0001(\u000b2\u0006.token\u0012\u0013\n\u000btotranslate\u0018\u0003 \u0001(\t\u0012\u0014\n\u000clanguagecode\u0018\u0004 \u0001(\t\u0012\u0016\n\u000esourcelanguage\u0018\u0005 \u0001(\t\u0012\u0016\n\u000etargetlanguage\u0018\u0006 \u0001(\t\"E\n\u0008response\u0012\u0012\n\u0007version\u0018\u0001 \u0001(\u0004:\u00011\u0012\u0011\n\u0006status\u0018\u0002 \u0001(\u0004:\u00010\u0012\u0012\n\ntranslated\u0018\u0003"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, " \u0001(\tBF\n3com.google.appinventor.components.runtime.translateB\u000fTranslatorToken"

    const/4 v4, 0x1

    aput-object v2, v1, v4

    .line 3760
    .local v1, "descriptorData":[Ljava/lang/String;
    new-instance v2, Lcom/google/appinventor/components/runtime/translate/TranslatorToken$1;

    invoke-direct {v2}, Lcom/google/appinventor/components/runtime/translate/TranslatorToken$1;-><init>()V

    .line 3768
    .local v2, "assigner":Lcom/google/protobuf/Descriptors$FileDescriptor$InternalDescriptorAssigner;
    new-array v5, v3, [Lcom/google/protobuf/Descriptors$FileDescriptor;

    .line 3769
    invoke-static {v1, v5, v2}, Lcom/google/protobuf/Descriptors$FileDescriptor;->internalBuildGeneratedFileFrom([Ljava/lang/String;[Lcom/google/protobuf/Descriptors$FileDescriptor;Lcom/google/protobuf/Descriptors$FileDescriptor$InternalDescriptorAssigner;)V

    .line 3773
    invoke-static {}, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/Descriptors$Descriptor;

    sput-object v5, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_unsigned_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    .line 3774
    new-instance v6, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    const/4 v7, 0x3

    new-array v8, v7, [Ljava/lang/String;

    const-string v9, "Huuid"

    aput-object v9, v8, v3

    const-string v9, "Version"

    aput-object v9, v8, v4

    const-string v10, "Generation"

    aput-object v10, v8, v0

    invoke-direct {v6, v5, v8}, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    sput-object v6, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_unsigned_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    .line 3779
    invoke-static {}, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/Descriptors$Descriptor;

    sput-object v5, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_token_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    .line 3780
    new-instance v6, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    const/4 v8, 0x5

    new-array v11, v8, [Ljava/lang/String;

    aput-object v9, v11, v3

    const-string v12, "Keyid"

    aput-object v12, v11, v4

    aput-object v10, v11, v0

    const-string v10, "Unsigned"

    aput-object v10, v11, v7

    const-string v10, "Signature"

    const/4 v12, 0x4

    aput-object v10, v11, v12

    invoke-direct {v6, v5, v11}, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    sput-object v6, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_token_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    .line 3785
    invoke-static {}, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/Descriptors$Descriptor;

    sput-object v5, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_request_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    .line 3786
    new-instance v6, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    const/4 v10, 0x6

    new-array v10, v10, [Ljava/lang/String;

    aput-object v9, v10, v3

    const-string v11, "Token"

    aput-object v11, v10, v4

    const-string v11, "Totranslate"

    aput-object v11, v10, v0

    const-string v11, "Languagecode"

    aput-object v11, v10, v7

    const-string v11, "Sourcelanguage"

    aput-object v11, v10, v12

    const-string v11, "Targetlanguage"

    aput-object v11, v10, v8

    invoke-direct {v6, v5, v10}, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    sput-object v6, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_request_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    .line 3791
    invoke-static {}, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/Descriptors$Descriptor;

    sput-object v5, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_response_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    .line 3792
    new-instance v6, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    new-array v7, v7, [Ljava/lang/String;

    aput-object v9, v7, v3

    const-string v3, "Status"

    aput-object v3, v7, v4

    const-string v3, "Translated"

    aput-object v3, v7, v0

    invoke-direct {v6, v5, v7}, Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    sput-object v6, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->internal_static_response_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessageV3$FieldAccessorTable;

    .line 3796
    .end local v1    # "descriptorData":[Ljava/lang/String;
    .end local v2    # "assigner":Lcom/google/protobuf/Descriptors$FileDescriptor$InternalDescriptorAssigner;
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;
    .locals 1

    .line 3741
    sget-object v0, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->descriptor:Lcom/google/protobuf/Descriptors$FileDescriptor;

    return-object v0
.end method

.method public static registerAllExtensions(Lcom/google/protobuf/ExtensionRegistry;)V
    .locals 0
    .param p0, "registry"    # Lcom/google/protobuf/ExtensionRegistry;

    .line 14
    invoke-static {p0}, Lcom/google/appinventor/components/runtime/translate/TranslatorToken;->registerAllExtensions(Lcom/google/protobuf/ExtensionRegistryLite;)V

    .line 16
    return-void
.end method

.method public static registerAllExtensions(Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 0
    .param p0, "registry"    # Lcom/google/protobuf/ExtensionRegistryLite;

    .line 10
    return-void
.end method
