.class Lcom/google/appinventor/components/runtime/Web$CapturedProperties;
.super Ljava/lang/Object;
.source "Web.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/appinventor/components/runtime/Web;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CapturedProperties"
.end annotation


# instance fields
.field final allowCookies:Z

.field final cookies:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field final requestHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field final responseFileName:Ljava/lang/String;

.field final saveResponse:Z

.field final timeout:I

.field final url:Ljava/net/URL;

.field final urlString:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/Web;)V
    .locals 4
    .param p1, "web"    # Lcom/google/appinventor/components/runtime/Web;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Lcom/google/appinventor/components/runtime/Web$InvalidRequestHeadersException;
        }
    .end annotation

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 173
    invoke-static {p1}, Lcom/google/appinventor/components/runtime/Web;->-$$Nest$fgeturlString(Lcom/google/appinventor/components/runtime/Web;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Web$CapturedProperties;->urlString:Ljava/lang/String;

    .line 174
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/Web$CapturedProperties;->url:Ljava/net/URL;

    .line 175
    invoke-static {p1}, Lcom/google/appinventor/components/runtime/Web;->-$$Nest$fgetallowCookies(Lcom/google/appinventor/components/runtime/Web;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/Web$CapturedProperties;->allowCookies:Z

    .line 176
    invoke-static {p1}, Lcom/google/appinventor/components/runtime/Web;->-$$Nest$fgetsaveResponse(Lcom/google/appinventor/components/runtime/Web;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/google/appinventor/components/runtime/Web$CapturedProperties;->saveResponse:Z

    .line 177
    invoke-static {p1}, Lcom/google/appinventor/components/runtime/Web;->-$$Nest$fgetresponseFileName(Lcom/google/appinventor/components/runtime/Web;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/appinventor/components/runtime/Web$CapturedProperties;->responseFileName:Ljava/lang/String;

    .line 178
    invoke-static {p1}, Lcom/google/appinventor/components/runtime/Web;->-$$Nest$fgettimeout(Lcom/google/appinventor/components/runtime/Web;)I

    move-result v2

    iput v2, p0, Lcom/google/appinventor/components/runtime/Web$CapturedProperties;->timeout:I

    .line 179
    invoke-static {p1}, Lcom/google/appinventor/components/runtime/Web;->-$$Nest$fgetrequestHeaders(Lcom/google/appinventor/components/runtime/Web;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v2

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/Web;->-$$Nest$smprocessRequestHeaders(Lcom/google/appinventor/components/runtime/util/YailList;)Ljava/util/Map;

    move-result-object v2

    iput-object v2, p0, Lcom/google/appinventor/components/runtime/Web$CapturedProperties;->requestHeaders:Ljava/util/Map;

    .line 181
    const/4 v3, 0x0

    .line 182
    .local v3, "cookiesTemp":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/google/appinventor/components/runtime/Web;->-$$Nest$fgetcookieHandler(Lcom/google/appinventor/components/runtime/Web;)Ljava/net/CookieHandler;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 184
    :try_start_0
    invoke-static {p1}, Lcom/google/appinventor/components/runtime/Web;->-$$Nest$fgetcookieHandler(Lcom/google/appinventor/components/runtime/Web;)Ljava/net/CookieHandler;

    move-result-object v0

    invoke-virtual {v1}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Ljava/net/CookieHandler;->get(Ljava/net/URI;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, v0

    .line 189
    :goto_0
    goto :goto_1

    .line 187
    :catch_0
    move-exception v0

    goto :goto_1

    .line 185
    :catch_1
    move-exception v0

    goto :goto_0

    .line 191
    :cond_0
    :goto_1
    iput-object v3, p0, Lcom/google/appinventor/components/runtime/Web$CapturedProperties;->cookies:Ljava/util/Map;

    .line 192
    return-void
.end method
