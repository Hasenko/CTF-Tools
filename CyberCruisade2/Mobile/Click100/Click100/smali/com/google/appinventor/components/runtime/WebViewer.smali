.class public final Lcom/google/appinventor/components/runtime/WebViewer;
.super Lcom/google/appinventor/components/runtime/AndroidViewComponent;
.source "WebViewer.java"


# annotations
.annotation runtime Lcom/google/appinventor/components/annotations/DesignerComponent;
    category = .enum Lcom/google/appinventor/components/common/ComponentCategory;->USERINTERFACE:Lcom/google/appinventor/components/common/ComponentCategory;
    description = "Component for viewing Web pages.  The Home URL can be specified in the Designer or in the Blocks Editor.  The view can be set to follow links when they are tapped, and users can fill in Web forms. Warning: This is not a full browser.  For example, pressing the phone\'s hardware Back key will exit the app, rather than move back in the browser history.<p />You can use the WebViewer.WebViewString property to communicate between your app and Javascript code running in the Webviewer page. In the app, you get and set WebViewString.  In the WebViewer, you include Javascript that references the window.AppInventor object, using the methoods </em getWebViewString()</em> and <em>setWebViewString(text)</em>.  <p />For example, if the WebViewer opens to a page that contains the Javascript command <br /> <em>document.write(\"The answer is\" + window.AppInventor.getWebViewString());</em> <br />and if you set WebView.WebVewString to \"hello\", then the web page will show </br ><em>The answer is hello</em>.  <br />And if the Web page contains Javascript that executes the command <br /><em>window.AppInventor.setWebViewString(\"hello from Javascript\")</em>, <br />then the value of the WebViewString property will be <br /><em>hello from Javascript</em>. "
    iconName = "images/webviewer.png"
    version = 0xa
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/SimpleObject;
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/UsesPermissions;
    permissionNames = "android.permission.INTERNET"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/appinventor/components/runtime/WebViewer$WebViewInterface;,
        Lcom/google/appinventor/components/runtime/WebViewer$WebViewerClient;
    }
.end annotation


# instance fields
.field private followLinks:Z

.field private havePermission:Z

.field private homeUrl:Ljava/lang/String;

.field private ignoreSslErrors:Z

.field private prompt:Z

.field private final webview:Landroid/webkit/WebView;

.field wvInterface:Lcom/google/appinventor/components/runtime/WebViewer$WebViewInterface;


# direct methods
.method static bridge synthetic -$$Nest$fgetfollowLinks(Lcom/google/appinventor/components/runtime/WebViewer;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->followLinks:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetwebview(Lcom/google/appinventor/components/runtime/WebViewer;)Landroid/webkit/WebView;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputhavePermission(Lcom/google/appinventor/components/runtime/WebViewer;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/WebViewer;->havePermission:Z

    return-void
.end method

.method public constructor <init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V
    .locals 5
    .param p1, "container"    # Lcom/google/appinventor/components/runtime/ComponentContainer;

    .line 151
    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/AndroidViewComponent;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V

    .line 128
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->followLinks:Z

    .line 131
    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->prompt:Z

    .line 136
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/appinventor/components/runtime/WebViewer;->ignoreSslErrors:Z

    .line 142
    iput-boolean v1, p0, Lcom/google/appinventor/components/runtime/WebViewer;->havePermission:Z

    .line 153
    new-instance v1, Landroid/webkit/WebView;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    .line 154
    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/WebViewer;->resetWebViewClient()V

    .line 155
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    .line 156
    .local v2, "settings":Landroid/webkit/WebSettings;
    invoke-virtual {v2, v0}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 157
    invoke-virtual {v2, v0}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 158
    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->setFocusable(Z)V

    .line 160
    new-instance v3, Lcom/google/appinventor/components/runtime/WebViewer$WebViewInterface;

    invoke-direct {v3, p0}, Lcom/google/appinventor/components/runtime/WebViewer$WebViewInterface;-><init>(Lcom/google/appinventor/components/runtime/WebViewer;)V

    iput-object v3, p0, Lcom/google/appinventor/components/runtime/WebViewer;->wvInterface:Lcom/google/appinventor/components/runtime/WebViewer$WebViewInterface;

    .line 161
    const-string v4, "AppInventor"

    invoke-virtual {v1, v3, v4}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 163
    invoke-virtual {v2, v0}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 165
    invoke-static {}, Lcom/google/appinventor/components/runtime/util/SdkLevel;->getLevel()I

    move-result v0

    const/4 v3, 0x5

    if-lt v0, v3, :cond_0

    .line 166
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v0

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/util/EclairUtil;->setupWebViewGeoLoc(Lcom/google/appinventor/components/runtime/WebViewer;Landroid/webkit/WebView;Landroid/app/Activity;)V

    .line 168
    :cond_0
    invoke-interface {p1, p0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$add(Lcom/google/appinventor/components/runtime/AndroidViewComponent;)V

    .line 170
    new-instance v0, Lcom/google/appinventor/components/runtime/WebViewer$1;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/WebViewer$1;-><init>(Lcom/google/appinventor/components/runtime/WebViewer;)V

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 188
    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/WebViewer;->HomeUrl(Ljava/lang/String;)V

    .line 189
    const/4 v0, -0x2

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/WebViewer;->Width(I)V

    .line 190
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/WebViewer;->Height(I)V

    .line 191
    return-void
.end method

.method private loadUrl(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "caller"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;

    .line 606
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->havePermission:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/google/appinventor/components/runtime/util/MediaUtil;->isExternalFileUrl(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 607
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/WebViewer$2;

    invoke-direct {v1, p0, p2, p1}, Lcom/google/appinventor/components/runtime/WebViewer$2;-><init>(Lcom/google/appinventor/components/runtime/WebViewer;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-virtual {v0, v2, v1}, Lcom/google/appinventor/components/runtime/Form;->askPermission(Ljava/lang/String;Lcom/google/appinventor/components/runtime/PermissionResultHandler;)V

    .line 620
    return-void

    .line 622
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 623
    return-void
.end method

.method private resetWebViewClient()V
    .locals 5

    .line 535
    invoke-static {}, Lcom/google/appinventor/components/runtime/util/SdkLevel;->getLevel()I

    move-result v0

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 536
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    new-instance v1, Lcom/google/appinventor/components/runtime/util/HoneycombWebViewClient;

    iget-boolean v2, p0, Lcom/google/appinventor/components/runtime/WebViewer;->followLinks:Z

    iget-boolean v3, p0, Lcom/google/appinventor/components/runtime/WebViewer;->ignoreSslErrors:Z

    iget-object v4, p0, Lcom/google/appinventor/components/runtime/WebViewer;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    .line 537
    invoke-interface {v4}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4, p0}, Lcom/google/appinventor/components/runtime/util/HoneycombWebViewClient;-><init>(ZZLcom/google/appinventor/components/runtime/Form;Lcom/google/appinventor/components/runtime/WebViewer;)V

    .line 536
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    goto :goto_0

    .line 538
    :cond_0
    invoke-static {}, Lcom/google/appinventor/components/runtime/util/SdkLevel;->getLevel()I

    move-result v0

    const/16 v1, 0x8

    if-lt v0, v1, :cond_1

    .line 539
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    new-instance v1, Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient;

    iget-boolean v2, p0, Lcom/google/appinventor/components/runtime/WebViewer;->followLinks:Z

    iget-boolean v3, p0, Lcom/google/appinventor/components/runtime/WebViewer;->ignoreSslErrors:Z

    iget-object v4, p0, Lcom/google/appinventor/components/runtime/WebViewer;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    .line 540
    invoke-interface {v4}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4, p0}, Lcom/google/appinventor/components/runtime/util/FroyoWebViewClient;-><init>(ZZLcom/google/appinventor/components/runtime/Form;Lcom/google/appinventor/components/runtime/Component;)V

    .line 539
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    goto :goto_0

    .line 542
    :cond_1
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    new-instance v1, Lcom/google/appinventor/components/runtime/WebViewer$WebViewerClient;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/google/appinventor/components/runtime/WebViewer$WebViewerClient;-><init>(Lcom/google/appinventor/components/runtime/WebViewer;Lcom/google/appinventor/components/runtime/WebViewer$WebViewerClient-IA;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 544
    :goto_0
    return-void
.end method


# virtual methods
.method public BeforePageLoad(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
        description = "When a page is about to load this event is run."
    .end annotation

    .line 592
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "BeforePageLoad"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 593
    return-void
.end method

.method public CanGoBack()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Returns true if the WebViewer can go back in the history list."
    .end annotation

    .line 443
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    return v0
.end method

.method public CanGoForward()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Returns true if the WebViewer can go forward in the history list."
    .end annotation

    .line 433
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoForward()Z

    move-result v0

    return v0
.end method

.method public ClearCaches()V
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Clear WebView caches."
    .end annotation

    .line 553
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 554
    return-void
.end method

.method public ClearCookies()V
    .locals 3
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Clear WebView cookies."
    .end annotation

    .line 562
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    .line 563
    .local v0, "cookieManager":Landroid/webkit/CookieManager;
    invoke-static {}, Lcom/google/appinventor/components/runtime/util/SdkLevel;->getLevel()I

    move-result v1

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 564
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->removeAllCookies(Landroid/webkit/ValueCallback;)V

    goto :goto_0

    .line 566
    :cond_0
    invoke-virtual {v0}, Landroid/webkit/CookieManager;->removeAllCookie()V

    .line 568
    :goto_0
    return-void
.end method

.method public ClearLocations()V
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Clear stored location permissions."
    .end annotation

    .line 530
    invoke-static {}, Lcom/google/appinventor/components/runtime/util/SdkLevel;->getLevel()I

    move-result v0

    const/4 v1, 0x5

    if-lt v0, v1, :cond_0

    .line 531
    invoke-static {}, Lcom/google/appinventor/components/runtime/util/EclairUtil;->clearWebViewGeoLoc()V

    .line 532
    :cond_0
    return-void
.end method

.method public CurrentPageTitle()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Title of the page currently viewed"
    .end annotation

    .line 334
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public CurrentUrl()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "URL of the page currently viewed.   This could be different from the Home URL if new pages were visited by following links."
    .end annotation

    .line 322
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public ErrorOccurred(ILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "errorCode"    # I
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "failingUrl"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
        description = "When an error occurs this event is run."
    .end annotation

    .line 602
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    const/4 v1, 0x2

    aput-object p3, v0, v1

    const-string v1, "ErrorOccurred"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 603
    return-void
.end method

.method public FollowLinks(Z)V
    .locals 0
    .param p1, "follow"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "True"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 359
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/WebViewer;->followLinks:Z

    .line 360
    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/WebViewer;->resetWebViewClient()V

    .line 361
    return-void
.end method

.method public FollowLinks()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Determines whether to follow links when they are tapped in the WebViewer.  If you follow links, you can use GoBack and GoForward to navigate the browser history. "
    .end annotation

    .line 346
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->followLinks:Z

    return v0
.end method

.method public GoBack()V
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Go back to the previous page in the history list.  Does nothing if there is no previous page."
    .end annotation

    .line 410
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 411
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 413
    :cond_0
    return-void
.end method

.method public GoForward()V
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Go forward to the next page in the history list.   Does nothing if there is no next page."
    .end annotation

    .line 422
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoForward()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 423
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goForward()V

    .line 425
    :cond_0
    return-void
.end method

.method public GoHome()V
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Loads the home URL page.  This happens automatically when the home URL is changed."
    .end annotation

    .line 400
    const-string v0, "GoHome"

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/WebViewer;->homeUrl:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/google/appinventor/components/runtime/WebViewer;->loadUrl(Ljava/lang/String;Ljava/lang/String;)V

    .line 401
    return-void
.end method

.method public GoToUrl(Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Load the page at the given URL."
    .end annotation

    .line 453
    const-string v0, "GoToUrl"

    invoke-direct {p0, v0, p1}, Lcom/google/appinventor/components/runtime/WebViewer;->loadUrl(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    return-void
.end method

.method public Height(I)V
    .locals 1
    .param p1, "height"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 275
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 276
    const/4 p1, -0x2

    .line 278
    :cond_0
    invoke-super {p0, p1}, Lcom/google/appinventor/components/runtime/AndroidViewComponent;->Height(I)V

    .line 279
    return-void
.end method

.method public HomeUrl()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "URL of the page the WebViewer should initially open to.  Setting this will load the page."
    .end annotation

    .line 292
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->homeUrl:Ljava/lang/String;

    return-object v0
.end method

.method public HomeUrl(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = ""
        editorType = "string"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 305
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/WebViewer;->homeUrl:Ljava/lang/String;

    .line 307
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->clearHistory()V

    .line 308
    const-string v0, "HomeUrl"

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/WebViewer;->homeUrl:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/google/appinventor/components/runtime/WebViewer;->loadUrl(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    return-void
.end method

.method public IgnoreSslErrors(Z)V
    .locals 0
    .param p1, "ignoreSslErrors"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 388
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/WebViewer;->ignoreSslErrors:Z

    .line 389
    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/WebViewer;->resetWebViewClient()V

    .line 390
    return-void
.end method

.method public IgnoreSslErrors()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Determine whether or not to ignore SSL errors. Set to true to ignore errors. Use this to accept self signed certificates from websites."
    .end annotation

    .line 375
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->ignoreSslErrors:Z

    return v0
.end method

.method public PageLoaded(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
        description = "When a page is finished loading this event is run."
    .end annotation

    .line 597
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "PageLoaded"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 598
    return-void
.end method

.method public PromptforPermission(Z)V
    .locals 0
    .param p1, "prompt"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "True"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = true
    .end annotation

    .line 516
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/WebViewer;->prompt:Z

    .line 517
    return-void
.end method

.method public PromptforPermission()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        description = "If True, then prompt the user of the WebView to give permission to access the geolocation API. If False, then assume permission is granted."
    .end annotation

    .line 500
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->prompt:Z

    return v0
.end method

.method public Reload()V
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Reload the current page."
    .end annotation

    .line 471
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->reload()V

    .line 472
    return-void
.end method

.method public RunJavaScript(Ljava/lang/String;)V
    .locals 3
    .param p1, "js"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Run JavaScript in the current page."
    .end annotation

    .line 577
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:(function(){"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "})()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 578
    return-void
.end method

.method public StopLoading()V
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Stop loading a page."
    .end annotation

    .line 462
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 463
    return-void
.end method

.method public UsesLocation(Z)V
    .locals 0
    .param p1, "uses"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Whether or not to give the application permission to use the Javascript geolocation API. This property is available only in the designer."
        userVisible = false
    .end annotation

    .line 488
    return-void
.end method

.method public WebViewString()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Gets the WebView\'s String, which is viewable through Javascript in the WebView as the window.AppInventor object"
    .end annotation

    .line 203
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->wvInterface:Lcom/google/appinventor/components/runtime/WebViewer$WebViewInterface;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/WebViewer$WebViewInterface;->getWebViewString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public WebViewString(Ljava/lang/String;)V
    .locals 1
    .param p1, "newString"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
    .end annotation

    .line 213
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->wvInterface:Lcom/google/appinventor/components/runtime/WebViewer$WebViewInterface;

    invoke-virtual {v0, p1}, Lcom/google/appinventor/components/runtime/WebViewer$WebViewInterface;->setWebViewStringFromBlocks(Ljava/lang/String;)V

    .line 214
    return-void
.end method

.method public WebViewStringChange(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
        description = "When the JavaScript calls AppInventor.setWebViewString this event is run."
    .end annotation

    .line 587
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "WebViewStringChange"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 588
    return-void
.end method

.method public Width(I)V
    .locals 1
    .param p1, "width"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 262
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 263
    const/4 p1, -0x2

    .line 265
    :cond_0
    invoke-super {p0, p1}, Lcom/google/appinventor/components/runtime/AndroidViewComponent;->Width(I)V

    .line 266
    return-void
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .line 218
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/WebViewer;->webview:Landroid/webkit/WebView;

    return-object v0
.end method
