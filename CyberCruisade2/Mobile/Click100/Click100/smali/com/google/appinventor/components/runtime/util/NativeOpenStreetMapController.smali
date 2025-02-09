.class Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;
.super Ljava/lang/Object;
.source "NativeOpenStreetMapController.java"

# interfaces
.implements Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;
.implements Lorg/osmdroid/events/MapListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;,
        Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$CustomMapTileProviderBasic;,
        Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$CustomMapView;,
        Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MapReadyHandler;,
        Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay;,
        Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$AppInventorLocationSensorAdapter;
    }
.end annotation


# static fields
.field private static final ANCHOR_HORIZONTAL:[F

.field private static final ANCHOR_VERTICAL:[F

.field private static final SPECIFIED_FILL:J = 0x1L

.field private static final SPECIFIED_FILL_OPACITY:J = 0x4L

.field private static final SPECIFIED_STROKE:J = 0x8L

.field private static final SPECIFIED_STROKE_OPACITY:J = 0x10L

.field private static final SPECIFIED_STROKE_WIDTH:J = 0x20L

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private caches:Z

.field private compass:Lorg/osmdroid/views/overlay/compass/CompassOverlay;

.field private containerView:Landroid/widget/RelativeLayout;

.field private defaultInfoWindow:Lorg/osmdroid/views/overlay/infowindow/OverlayInfoWindow;

.field private defaultMarkerSVG:Lcom/caverock/androidsvg/SVG;

.field private eventListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;",
            ">;"
        }
    .end annotation
.end field

.field private featureOverlays:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;",
            "Lorg/osmdroid/views/overlay/OverlayWithIW;",
            ">;"
        }
    .end annotation
.end field

.field private final form:Lcom/google/appinventor/components/runtime/Form;

.field private hiddenFeatureCollections:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureCollection;",
            ">;"
        }
    .end annotation
.end field

.field private hiddenFeatures:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;",
            ">;"
        }
    .end annotation
.end field

.field private lastAzimuth:F

.field private final locationProvider:Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$AppInventorLocationSensorAdapter;

.field private ready:Z

.field private rotation:Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;

.field private scaleBar:Lorg/osmdroid/views/overlay/ScaleBarOverlay;

.field private tileType:Lcom/google/appinventor/components/common/MapType;

.field private touch:Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay;

.field private final userLocation:Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

.field private view:Lorg/osmdroid/views/MapView;

.field private zoomControlEnabled:Z

.field private zoomControls:Lcom/google/appinventor/components/runtime/view/ZoomControlView;

.field private zoomEnabled:Z


# direct methods
.method static bridge synthetic -$$Nest$fgetcompass(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;)Lorg/osmdroid/views/overlay/compass/CompassOverlay;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->compass:Lorg/osmdroid/views/overlay/compass/CompassOverlay;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgeteventListeners(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;)Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->eventListeners:Ljava/util/Set;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetform(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;)Lcom/google/appinventor/components/runtime/Form;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->form:Lcom/google/appinventor/components/runtime/Form;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetready(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->ready:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetview(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;)Lorg/osmdroid/views/MapView;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputready(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->ready:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetDefaultMarkerDrawable(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;)Landroid/graphics/drawable/Drawable;
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->getDefaultMarkerDrawable(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetMarkerDrawable(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->getMarkerDrawable(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetTAG()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 106
    const-class v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->TAG:Ljava/lang/String;

    .line 139
    const/4 v0, 0x4

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    sput-object v1, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->ANCHOR_HORIZONTAL:[F

    .line 140
    new-array v0, v0, [F

    fill-array-data v0, :array_1

    sput-object v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->ANCHOR_VERTICAL:[F

    return-void

    :array_0
    .array-data 4
        0x7fc00000    # Float.NaN
        0x0
        0x3f800000    # 1.0f
        0x3f000000    # 0.5f
    .end array-data

    :array_1
    .array-data 4
        0x7fc00000    # Float.NaN
        0x0
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method constructor <init>(Lcom/google/appinventor/components/runtime/Form;)V
    .locals 5
    .param p1, "form"    # Lcom/google/appinventor/components/runtime/Form;

    .line 312
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->compass:Lorg/osmdroid/views/overlay/compass/CompassOverlay;

    .line 116
    iput-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->rotation:Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;

    .line 117
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->eventListeners:Ljava/util/Set;

    .line 118
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    .line 119
    iput-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->defaultMarkerSVG:Lcom/caverock/androidsvg/SVG;

    .line 120
    iput-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->touch:Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay;

    .line 121
    iput-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->defaultInfoWindow:Lorg/osmdroid/views/overlay/infowindow/OverlayInfoWindow;

    .line 122
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->ready:Z

    .line 123
    iput-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->zoomControls:Lcom/google/appinventor/components/runtime/view/ZoomControlView;

    .line 124
    const/high16 v1, 0x7fc00000    # Float.NaN

    iput v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->lastAzimuth:F

    .line 130
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hiddenFeatureCollections:Ljava/util/Set;

    .line 137
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hiddenFeatures:Ljava/util/Set;

    .line 313
    invoke-virtual {p1}, Lcom/google/appinventor/components/runtime/Form;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->setUserAgentValue(Ljava/lang/String;)V

    .line 314
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Lcom/google/appinventor/components/runtime/Form;->getCacheDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "osmdroid"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 315
    .local v1, "osmdroid":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 316
    :cond_0
    invoke-static {}, Lorg/osmdroid/config/Configuration;->getInstance()Lorg/osmdroid/config/IConfigurationProvider;

    move-result-object v2

    invoke-interface {v2, v1}, Lorg/osmdroid/config/IConfigurationProvider;->setOsmdroidBasePath(Ljava/io/File;)V

    .line 317
    new-instance v2, Ljava/io/File;

    const-string v4, "tiles"

    invoke-direct {v2, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 318
    .local v2, "osmdroidTiles":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 319
    :cond_1
    invoke-static {}, Lorg/osmdroid/config/Configuration;->getInstance()Lorg/osmdroid/config/IConfigurationProvider;

    move-result-object v4

    invoke-interface {v4, v2}, Lorg/osmdroid/config/IConfigurationProvider;->setOsmdroidTileCache(Ljava/io/File;)V

    .line 320
    iput-boolean v3, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->caches:Z

    .line 323
    .end local v2    # "osmdroidTiles":Ljava/io/File;
    :cond_2
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->form:Lcom/google/appinventor/components/runtime/Form;

    .line 324
    new-instance v2, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay;

    invoke-direct {v2, p0, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay-IA;)V

    iput-object v2, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->touch:Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay;

    .line 325
    invoke-virtual {p1}, Lcom/google/appinventor/components/runtime/Form;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->createCustomMapView(Landroid/content/Context;)Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$CustomMapView;

    move-result-object v2

    iput-object v2, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    .line 326
    new-instance v2, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$AppInventorLocationSensorAdapter;

    invoke-direct {v2, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$AppInventorLocationSensorAdapter;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$AppInventorLocationSensorAdapter-IA;)V

    iput-object v2, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->locationProvider:Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$AppInventorLocationSensorAdapter;

    .line 327
    new-instance v0, Lorg/osmdroid/views/overlay/infowindow/OverlayInfoWindow;

    iget-object v4, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-direct {v0, v4}, Lorg/osmdroid/views/overlay/infowindow/OverlayInfoWindow;-><init>(Lorg/osmdroid/views/MapView;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->defaultInfoWindow:Lorg/osmdroid/views/overlay/infowindow/OverlayInfoWindow;

    .line 328
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, v3}, Lorg/osmdroid/views/MapView;->setTilesScaledToDpi(Z)V

    .line 329
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, p0}, Lorg/osmdroid/views/MapView;->setMapListener(Lorg/osmdroid/events/MapListener;)V

    .line 330
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    new-instance v4, Lorg/osmdroid/views/overlay/CopyrightOverlay;

    invoke-direct {v4, p1}, Lorg/osmdroid/views/overlay/CopyrightOverlay;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v4}, Lorg/osmdroid/views/overlay/OverlayManager;->add(Ljava/lang/Object;)Z

    .line 331
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v4, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->touch:Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay;

    invoke-interface {v0, v4}, Lorg/osmdroid/views/overlay/OverlayManager;->add(Ljava/lang/Object;)Z

    .line 332
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    new-instance v4, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$1;

    invoke-direct {v4, p0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$1;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;)V

    invoke-virtual {v0, v4}, Lorg/osmdroid/views/MapView;->addOnTapListener(Lorg/osmdroid/views/MapView$OnTapListener;)V

    .line 347
    new-instance v0, Lcom/google/appinventor/components/runtime/view/ZoomControlView;

    iget-object v4, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-direct {v0, v4}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;-><init>(Lorg/osmdroid/views/MapView;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->zoomControls:Lcom/google/appinventor/components/runtime/view/ZoomControlView;

    .line 348
    new-instance v0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

    iget-object v4, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-direct {v0, v2, v4}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;-><init>(Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;Lorg/osmdroid/views/MapView;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->userLocation:Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

    .line 349
    new-instance v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-direct {v0, v2}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;-><init>(Lorg/osmdroid/views/MapView;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->scaleBar:Lorg/osmdroid/views/overlay/ScaleBarOverlay;

    .line 350
    invoke-virtual {v0, v3}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->setAlignBottom(Z)V

    .line 351
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->scaleBar:Lorg/osmdroid/views/overlay/ScaleBarOverlay;

    invoke-virtual {v0, v3}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->setAlignRight(Z)V

    .line 352
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->scaleBar:Lorg/osmdroid/views/overlay/ScaleBarOverlay;

    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->disableScaleBar()V

    .line 353
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->scaleBar:Lorg/osmdroid/views/overlay/ScaleBarOverlay;

    invoke-interface {v0, v2}, Lorg/osmdroid/views/overlay/OverlayManager;->add(Ljava/lang/Object;)Z

    .line 355
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-direct {v0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->containerView:Landroid/widget/RelativeLayout;

    .line 356
    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->setClipChildren(Z)V

    .line 357
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->containerView:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 358
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->containerView:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->zoomControls:Lcom/google/appinventor/components/runtime/view/ZoomControlView;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 359
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->zoomControls:Lcom/google/appinventor/components/runtime/view/ZoomControlView;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->setVisibility(I)V

    .line 360
    return-void
.end method

.method private configurePolygon(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;Lorg/osmdroid/views/overlay/Polygon;)V
    .locals 1
    .param p1, "component"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;
    .param p2, "polygon"    # Lorg/osmdroid/views/overlay/Polygon;

    .line 673
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 674
    new-instance v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$6;

    invoke-direct {v0, p0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$6;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V

    invoke-virtual {p2, v0}, Lorg/osmdroid/views/overlay/Polygon;->setOnClickListener(Lorg/osmdroid/views/overlay/Polygon$OnClickListener;)V

    .line 694
    new-instance v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$7;

    invoke-direct {v0, p0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$7;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V

    invoke-virtual {p2, v0}, Lorg/osmdroid/views/overlay/Polygon;->setOnDragListener(Lorg/osmdroid/views/overlay/Polygon$OnDragListener;)V

    .line 744
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;->Visible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 745
    invoke-virtual {p0, p2}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->showOverlay(Lorg/osmdroid/views/overlay/OverlayWithIW;)V

    goto :goto_0

    .line 747
    :cond_0
    invoke-virtual {p0, p2}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hideOverlay(Lorg/osmdroid/views/overlay/OverlayWithIW;)V

    .line 749
    :goto_0
    return-void
.end method

.method private createNativeCircle(Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;)Lorg/osmdroid/views/overlay/Polygon;
    .locals 6
    .param p1, "aiCircle"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;

    .line 1185
    new-instance v0, Lorg/osmdroid/views/overlay/Polygon;

    invoke-direct {v0}, Lorg/osmdroid/views/overlay/Polygon;-><init>()V

    .line 1186
    .local v0, "osmPolygon":Lorg/osmdroid/views/overlay/Polygon;
    invoke-direct {p0, v0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->createPolygon(Lorg/osmdroid/views/overlay/Polygon;Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V

    .line 1187
    new-instance v1, Lorg/osmdroid/util/GeoPoint;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;->Latitude()D

    move-result-wide v2

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;->Longitude()D

    move-result-wide v4

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/osmdroid/util/GeoPoint;-><init>(DD)V

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;->Radius()D

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lorg/osmdroid/views/overlay/Polygon;->pointsAsCircle(Lorg/osmdroid/util/GeoPoint;D)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Polygon;->setPoints(Ljava/util/List;)V

    .line 1188
    return-object v0
.end method

.method private createNativeMarker(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V
    .locals 6
    .param p1, "aiMarker"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;",
            "Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair<",
            "Lorg/osmdroid/views/overlay/Marker;",
            ">;)V"
        }
    .end annotation

    .line 1133
    .local p2, "callback":Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;, "Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair<Lorg/osmdroid/views/overlay/Marker;>;"
    new-instance v0, Lorg/osmdroid/views/overlay/Marker;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-direct {v0, v1}, Lorg/osmdroid/views/overlay/Marker;-><init>(Lorg/osmdroid/views/MapView;)V

    .line 1134
    .local v0, "osmMarker":Lorg/osmdroid/views/overlay/Marker;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1135
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->Draggable()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Marker;->setDraggable(Z)V

    .line 1136
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->Title()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Marker;->setTitle(Ljava/lang/String;)V

    .line 1137
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->Description()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Marker;->setSnippet(Ljava/lang/String;)V

    .line 1138
    new-instance v1, Lorg/osmdroid/util/GeoPoint;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->Latitude()D

    move-result-wide v2

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->Longitude()D

    move-result-wide v4

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/osmdroid/util/GeoPoint;-><init>(DD)V

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Marker;->setPosition(Lorg/osmdroid/util/GeoPoint;)V

    .line 1139
    const/high16 v1, 0x3f000000    # 0.5f

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v2}, Lorg/osmdroid/views/overlay/Marker;->setAnchor(FF)V

    .line 1140
    new-instance v1, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$13;

    invoke-direct {v1, p0, p2, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$13;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;Lorg/osmdroid/views/overlay/Marker;)V

    invoke-direct {p0, p1, v1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->getMarkerDrawable(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V

    .line 1152
    return-void
.end method

.method private createNativePolygon(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;)Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;
    .locals 2
    .param p1, "aiPolygon"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;

    .line 1177
    new-instance v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;

    invoke-direct {v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;-><init>()V

    .line 1178
    .local v0, "osmPolygon":Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;
    invoke-direct {p0, v0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->createPolygon(Lorg/osmdroid/views/overlay/Polygon;Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V

    .line 1179
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;->getPoints()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;->setMultiPoints(Ljava/util/List;)V

    .line 1180
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;->getHolePoints()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;->setMultiHoles(Ljava/util/List;)V

    .line 1181
    return-object v0
.end method

.method private createNativePolyline(Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;)Lorg/osmdroid/views/overlay/Polyline;
    .locals 2
    .param p1, "aiLineString"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;

    .line 1155
    new-instance v0, Lorg/osmdroid/views/overlay/Polyline;

    invoke-direct {v0}, Lorg/osmdroid/views/overlay/Polyline;-><init>()V

    .line 1156
    .local v0, "osmLine":Lorg/osmdroid/views/overlay/Polyline;
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;->Draggable()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Polyline;->setDraggable(Z)V

    .line 1157
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;->Title()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Polyline;->setTitle(Ljava/lang/String;)V

    .line 1158
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;->Description()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Polyline;->setSnippet(Ljava/lang/String;)V

    .line 1159
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;->getPoints()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Polyline;->setPoints(Ljava/util/List;)V

    .line 1160
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;->StrokeColor()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Polyline;->setColor(I)V

    .line 1161
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;->StrokeWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Polyline;->setWidth(F)V

    .line 1162
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->defaultInfoWindow:Lorg/osmdroid/views/overlay/infowindow/OverlayInfoWindow;

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Polyline;->setInfoWindow(Lorg/osmdroid/views/overlay/infowindow/InfoWindow;)V

    .line 1163
    return-object v0
.end method

.method private createNativeRectangle(Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;)Lorg/osmdroid/views/overlay/Polygon;
    .locals 10
    .param p1, "aiRectangle"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;

    .line 1192
    new-instance v9, Lorg/osmdroid/util/BoundingBox;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;->NorthLatitude()D

    move-result-wide v1

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;->EastLongitude()D

    move-result-wide v3

    .line 1193
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;->SouthLatitude()D

    move-result-wide v5

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;->WestLongitude()D

    move-result-wide v7

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Lorg/osmdroid/util/BoundingBox;-><init>(DDDD)V

    .line 1194
    .local v0, "bbox":Lorg/osmdroid/util/BoundingBox;
    new-instance v1, Lorg/osmdroid/views/overlay/Polygon;

    invoke-direct {v1}, Lorg/osmdroid/views/overlay/Polygon;-><init>()V

    .line 1195
    .local v1, "osmPolygon":Lorg/osmdroid/views/overlay/Polygon;
    invoke-direct {p0, v1, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->createPolygon(Lorg/osmdroid/views/overlay/Polygon;Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V

    .line 1196
    new-instance v2, Ljava/util/ArrayList;

    invoke-static {v0}, Lorg/osmdroid/views/overlay/Polygon;->pointsAsRect(Lorg/osmdroid/util/BoundingBox;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1, v2}, Lorg/osmdroid/views/overlay/Polygon;->setPoints(Ljava/util/List;)V

    .line 1197
    return-object v1
.end method

.method private createPolygon(Lorg/osmdroid/views/overlay/Polygon;Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 1
    .param p1, "osmPolygon"    # Lorg/osmdroid/views/overlay/Polygon;
    .param p2, "aiFeature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 1167
    invoke-interface {p2}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;->Draggable()Z

    move-result v0

    invoke-virtual {p1, v0}, Lorg/osmdroid/views/overlay/Polygon;->setDraggable(Z)V

    .line 1168
    invoke-interface {p2}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;->Title()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/osmdroid/views/overlay/Polygon;->setTitle(Ljava/lang/String;)V

    .line 1169
    invoke-interface {p2}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;->Description()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/osmdroid/views/overlay/Polygon;->setSnippet(Ljava/lang/String;)V

    .line 1170
    move-object v0, p2

    check-cast v0, Lcom/google/appinventor/components/runtime/util/MapFactory$HasStroke;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$HasStroke;->StrokeColor()I

    move-result v0

    invoke-virtual {p1, v0}, Lorg/osmdroid/views/overlay/Polygon;->setStrokeColor(I)V

    .line 1171
    move-object v0, p2

    check-cast v0, Lcom/google/appinventor/components/runtime/util/MapFactory$HasStroke;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$HasStroke;->StrokeWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Lorg/osmdroid/views/overlay/Polygon;->setStrokeWidth(F)V

    .line 1172
    move-object v0, p2

    check-cast v0, Lcom/google/appinventor/components/runtime/util/MapFactory$HasFill;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$HasFill;->FillColor()I

    move-result v0

    invoke-virtual {p1, v0}, Lorg/osmdroid/views/overlay/Polygon;->setFillColor(I)V

    .line 1173
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->defaultInfoWindow:Lorg/osmdroid/views/overlay/infowindow/OverlayInfoWindow;

    invoke-virtual {p1, v0}, Lorg/osmdroid/views/overlay/Polygon;->setInfoWindow(Lorg/osmdroid/views/overlay/infowindow/InfoWindow;)V

    .line 1174
    return-void
.end method

.method private static getBestGuessHeight(Lcom/caverock/androidsvg/SVG$Svg;)F
    .locals 1
    .param p0, "svg"    # Lcom/caverock/androidsvg/SVG$Svg;

    .line 1061
    iget-object v0, p0, Lcom/caverock/androidsvg/SVG$Svg;->height:Lcom/caverock/androidsvg/SVG$Length;

    if-eqz v0, :cond_0

    .line 1062
    iget-object v0, p0, Lcom/caverock/androidsvg/SVG$Svg;->height:Lcom/caverock/androidsvg/SVG$Length;

    invoke-virtual {v0}, Lcom/caverock/androidsvg/SVG$Length;->floatValue()F

    move-result v0

    return v0

    .line 1063
    :cond_0
    iget-object v0, p0, Lcom/caverock/androidsvg/SVG$Svg;->viewBox:Lcom/caverock/androidsvg/SVG$Box;

    if-eqz v0, :cond_1

    .line 1064
    iget-object v0, p0, Lcom/caverock/androidsvg/SVG$Svg;->viewBox:Lcom/caverock/androidsvg/SVG$Box;

    iget v0, v0, Lcom/caverock/androidsvg/SVG$Box;->height:F

    return v0

    .line 1066
    :cond_1
    const/high16 v0, 0x42480000    # 50.0f

    return v0
.end method

.method private static getBestGuessWidth(Lcom/caverock/androidsvg/SVG$Svg;)F
    .locals 1
    .param p0, "svg"    # Lcom/caverock/androidsvg/SVG$Svg;

    .line 1051
    iget-object v0, p0, Lcom/caverock/androidsvg/SVG$Svg;->width:Lcom/caverock/androidsvg/SVG$Length;

    if-eqz v0, :cond_0

    .line 1052
    iget-object v0, p0, Lcom/caverock/androidsvg/SVG$Svg;->width:Lcom/caverock/androidsvg/SVG$Length;

    invoke-virtual {v0}, Lcom/caverock/androidsvg/SVG$Length;->floatValue()F

    move-result v0

    return v0

    .line 1053
    :cond_0
    iget-object v0, p0, Lcom/caverock/androidsvg/SVG$Svg;->viewBox:Lcom/caverock/androidsvg/SVG$Box;

    if-eqz v0, :cond_1

    .line 1054
    iget-object v0, p0, Lcom/caverock/androidsvg/SVG$Svg;->viewBox:Lcom/caverock/androidsvg/SVG$Box;

    iget v0, v0, Lcom/caverock/androidsvg/SVG$Box;->width:F

    return v0

    .line 1056
    :cond_1
    const/high16 v0, 0x41f00000    # 30.0f

    return v0
.end method

.method private getDefaultMarkerDrawable(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p1, "aiMarker"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;

    .line 1047
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->defaultMarkerSVG:Lcom/caverock/androidsvg/SVG;

    invoke-direct {p0, p1, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->rasterizeSVG(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/caverock/androidsvg/SVG;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method private getMarkerDrawable(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V
    .locals 2
    .param p1, "aiMarker"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;",
            "Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair<",
            "Landroid/graphics/drawable/Drawable;",
            ">;)V"
        }
    .end annotation

    .line 972
    .local p2, "callback":Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;, "Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair<Landroid/graphics/drawable/Drawable;>;"
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->ImageAsset()Ljava/lang/String;

    move-result-object v0

    .line 973
    .local v0, "assetPath":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, ".svg"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 976
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->getMarkerDrawableRaster(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V

    goto :goto_1

    .line 974
    :cond_1
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->getMarkerDrawableVector(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V

    .line 978
    :goto_1
    return-void
.end method

.method private getMarkerDrawableRaster(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V
    .locals 5
    .param p1, "aiMarker"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;",
            "Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair<",
            "Landroid/graphics/drawable/Drawable;",
            ">;)V"
        }
    .end annotation

    .line 1031
    .local p2, "callback":Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;, "Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair<Landroid/graphics/drawable/Drawable;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->form:Lcom/google/appinventor/components/runtime/Form;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->ImageAsset()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->Width()I

    move-result v2

    .line 1032
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->Height()I

    move-result v3

    new-instance v4, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$12;

    invoke-direct {v4, p0, p2, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$12;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;)V

    .line 1031
    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/appinventor/components/runtime/util/MediaUtil;->getBitmapDrawableAsync(Lcom/google/appinventor/components/runtime/Form;Ljava/lang/String;IILcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V

    .line 1044
    return-void
.end method

.method private getMarkerDrawableVector(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V
    .locals 6
    .param p1, "aiMarker"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;",
            "Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair<",
            "Landroid/graphics/drawable/Drawable;",
            ">;)V"
        }
    .end annotation

    .line 982
    .local p2, "callback":Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;, "Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair<Landroid/graphics/drawable/Drawable;>;"
    const/4 v0, 0x0

    .line 983
    .local v0, "markerSvg":Lcom/caverock/androidsvg/SVG;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->defaultMarkerSVG:Lcom/caverock/androidsvg/SVG;

    const-string v2, "Unable to read Marker asset"

    const-string v3, "Invalid SVG in Marker asset"

    if-nez v1, :cond_1

    .line 985
    :try_start_0
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v4, "marker.svg"

    invoke-static {v1, v4}, Lcom/caverock/androidsvg/SVG;->getFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Lcom/caverock/androidsvg/SVG;

    move-result-object v1

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->defaultMarkerSVG:Lcom/caverock/androidsvg/SVG;
    :try_end_0
    .catch Lcom/caverock/androidsvg/SVGParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 988
    :catch_0
    move-exception v1

    .line 989
    .local v1, "e":Ljava/io/IOException;
    sget-object v4, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->TAG:Ljava/lang/String;

    invoke-static {v4, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 986
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 987
    .local v1, "e":Lcom/caverock/androidsvg/SVGParseException;
    sget-object v4, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->TAG:Ljava/lang/String;

    invoke-static {v4, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 990
    .end local v1    # "e":Lcom/caverock/androidsvg/SVGParseException;
    :goto_0
    nop

    .line 991
    :goto_1
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->defaultMarkerSVG:Lcom/caverock/androidsvg/SVG;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/caverock/androidsvg/SVG;->getRootElement()Lcom/caverock/androidsvg/SVG$Svg;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_2

    .line 992
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Unable to load SVG from assets"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 995
    :cond_1
    :goto_2
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->ImageAsset()Ljava/lang/String;

    move-result-object v1

    .line 996
    .local v1, "markerAsset":Ljava/lang/String;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_2

    .line 998
    :try_start_1
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v4}, Lorg/osmdroid/views/MapView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    invoke-static {v4, v1}, Lcom/caverock/androidsvg/SVG;->getFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Lcom/caverock/androidsvg/SVG;

    move-result-object v4
    :try_end_1
    .catch Lcom/caverock/androidsvg/SVGParseException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-object v0, v4

    .line 1003
    :goto_3
    goto :goto_4

    .line 1001
    :catch_2
    move-exception v4

    .line 1002
    .local v4, "e":Ljava/io/IOException;
    sget-object v5, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->TAG:Ljava/lang/String;

    invoke-static {v5, v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4

    .line 999
    .end local v4    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v4

    .line 1000
    .local v4, "e":Lcom/caverock/androidsvg/SVGParseException;
    sget-object v5, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->TAG:Ljava/lang/String;

    invoke-static {v5, v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v4    # "e":Lcom/caverock/androidsvg/SVGParseException;
    goto :goto_3

    .line 1004
    :goto_4
    if-nez v0, :cond_2

    .line 1006
    const/4 v4, 0x0

    .line 1008
    .local v4, "is":Ljava/io/InputStream;
    :try_start_2
    iget-object v5, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->form:Lcom/google/appinventor/components/runtime/Form;

    invoke-static {v5, v1}, Lcom/google/appinventor/components/runtime/util/MediaUtil;->openMedia(Lcom/google/appinventor/components/runtime/Form;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    move-object v4, v5

    .line 1009
    invoke-static {v4}, Lcom/caverock/androidsvg/SVG;->getFromInputStream(Ljava/io/InputStream;)Lcom/caverock/androidsvg/SVG;

    move-result-object v2
    :try_end_2
    .catch Lcom/caverock/androidsvg/SVGParseException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v0, v2

    .line 1015
    sget-object v2, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->TAG:Ljava/lang/String;

    invoke-static {v2, v4}, Lcom/google/appinventor/components/runtime/util/IOUtils;->closeQuietly(Ljava/lang/String;Ljava/io/Closeable;)V

    .line 1016
    :goto_5
    goto :goto_8

    .line 1015
    :catchall_0
    move-exception v2

    goto :goto_7

    .line 1012
    :catch_4
    move-exception v3

    .line 1013
    .local v3, "e":Ljava/io/IOException;
    :try_start_3
    sget-object v5, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->TAG:Ljava/lang/String;

    invoke-static {v5, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1015
    nop

    .end local v3    # "e":Ljava/io/IOException;
    goto :goto_6

    .line 1010
    :catch_5
    move-exception v2

    .line 1011
    .local v2, "e":Lcom/caverock/androidsvg/SVGParseException;
    sget-object v5, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->TAG:Ljava/lang/String;

    invoke-static {v5, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1015
    nop

    .end local v2    # "e":Lcom/caverock/androidsvg/SVGParseException;
    :goto_6
    invoke-static {v5, v4}, Lcom/google/appinventor/components/runtime/util/IOUtils;->closeQuietly(Ljava/lang/String;Ljava/io/Closeable;)V

    goto :goto_5

    :goto_7
    sget-object v3, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->TAG:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/google/appinventor/components/runtime/util/IOUtils;->closeQuietly(Ljava/lang/String;Ljava/io/Closeable;)V

    .line 1016
    throw v2

    .line 1019
    .end local v4    # "is":Ljava/io/InputStream;
    :cond_2
    :goto_8
    if-nez v0, :cond_3

    .line 1020
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->defaultMarkerSVG:Lcom/caverock/androidsvg/SVG;

    .line 1023
    :cond_3
    :try_start_4
    invoke-direct {p0, p1, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->rasterizeSVG(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/caverock/androidsvg/SVG;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-interface {p2, v2}, Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;->onSuccess(Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_6

    .line 1026
    goto :goto_9

    .line 1024
    :catch_6
    move-exception v2

    .line 1025
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, v3}, Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;->onFailure(Ljava/lang/String;)V

    .line 1027
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_9
    return-void
.end method

.method private rasterizeSVG(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/caverock/androidsvg/SVG;)Landroid/graphics/drawable/Drawable;
    .locals 22
    .param p1, "aiMarker"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;
    .param p2, "markerSvg"    # Lcom/caverock/androidsvg/SVG;

    .line 1071
    invoke-virtual/range {p2 .. p2}, Lcom/caverock/androidsvg/SVG;->getRootElement()Lcom/caverock/androidsvg/SVG$Svg;

    move-result-object v0

    .line 1072
    .local v0, "svg":Lcom/caverock/androidsvg/SVG$Svg;
    move-object/from16 v1, p0

    iget-object v2, v1, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 1073
    .local v2, "density":F
    invoke-interface/range {p1 .. p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->Height()I

    move-result v3

    if-gtz v3, :cond_0

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->getBestGuessHeight(Lcom/caverock/androidsvg/SVG$Svg;)F

    move-result v3

    goto :goto_0

    :cond_0
    invoke-interface/range {p1 .. p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->Height()I

    move-result v3

    int-to-float v3, v3

    .line 1074
    .local v3, "height":F
    :goto_0
    invoke-interface/range {p1 .. p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->Width()I

    move-result v4

    if-gtz v4, :cond_1

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->getBestGuessWidth(Lcom/caverock/androidsvg/SVG$Svg;)F

    move-result v4

    goto :goto_1

    :cond_1
    invoke-interface/range {p1 .. p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->Width()I

    move-result v4

    int-to-float v4, v4

    .line 1075
    .local v4, "width":F
    :goto_1
    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->getBestGuessHeight(Lcom/caverock/androidsvg/SVG$Svg;)F

    move-result v5

    div-float v5, v3, v5

    .line 1076
    .local v5, "scaleH":F
    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->getBestGuessWidth(Lcom/caverock/androidsvg/SVG$Svg;)F

    move-result v6

    div-float v6, v4, v6

    .line 1077
    .local v6, "scaleW":F
    mul-float v7, v5, v5

    mul-float v8, v6, v6

    add-float/2addr v7, v8

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    double-to-float v7, v7

    .line 1080
    .local v7, "scale":F
    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    .line 1081
    .local v8, "fillPaint":Landroid/graphics/Paint;
    new-instance v9, Landroid/graphics/Paint;

    invoke-direct {v9}, Landroid/graphics/Paint;-><init>()V

    .line 1082
    .local v9, "strokePaint":Landroid/graphics/Paint;
    invoke-interface/range {p1 .. p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->FillColor()I

    move-result v10

    invoke-static {v8, v10}, Lcom/google/appinventor/components/runtime/util/PaintUtil;->changePaint(Landroid/graphics/Paint;I)V

    .line 1083
    invoke-interface/range {p1 .. p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->StrokeColor()I

    move-result v10

    invoke-static {v9, v10}, Lcom/google/appinventor/components/runtime/util/PaintUtil;->changePaint(Landroid/graphics/Paint;I)V

    .line 1084
    new-instance v10, Lcom/caverock/androidsvg/SVG$Length;

    invoke-interface/range {p1 .. p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->StrokeWidth()I

    move-result v11

    int-to-float v11, v11

    div-float/2addr v11, v7

    invoke-direct {v10, v11}, Lcom/caverock/androidsvg/SVG$Length;-><init>(F)V

    .line 1085
    .local v10, "strokeWidth":Lcom/caverock/androidsvg/SVG$Length;
    invoke-virtual {v0}, Lcom/caverock/androidsvg/SVG$Svg;->getChildren()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_8

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/caverock/androidsvg/SVG$SvgObject;

    .line 1086
    .local v12, "element":Lcom/caverock/androidsvg/SVG$SvgObject;
    instance-of v13, v12, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;

    if-eqz v13, :cond_6

    .line 1087
    move-object v13, v12

    check-cast v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;

    .line 1088
    .local v13, "path":Lcom/caverock/androidsvg/SVG$SvgConditionalElement;
    iget-object v14, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->baseStyle:Lcom/caverock/androidsvg/SVG$Style;

    new-instance v15, Lcom/caverock/androidsvg/SVG$Colour;

    move-object/from16 v16, v0

    .end local v0    # "svg":Lcom/caverock/androidsvg/SVG$Svg;
    .local v16, "svg":Lcom/caverock/androidsvg/SVG$Svg;
    invoke-virtual {v8}, Landroid/graphics/Paint;->getColor()I

    move-result v0

    invoke-direct {v15, v0}, Lcom/caverock/androidsvg/SVG$Colour;-><init>(I)V

    iput-object v15, v14, Lcom/caverock/androidsvg/SVG$Style;->fill:Lcom/caverock/androidsvg/SVG$SvgPaint;

    .line 1089
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->baseStyle:Lcom/caverock/androidsvg/SVG$Style;

    invoke-virtual {v8}, Landroid/graphics/Paint;->getAlpha()I

    move-result v14

    int-to-float v14, v14

    const/high16 v15, 0x437f0000    # 255.0f

    div-float/2addr v14, v15

    invoke-static {v14}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v14

    iput-object v14, v0, Lcom/caverock/androidsvg/SVG$Style;->fillOpacity:Ljava/lang/Float;

    .line 1090
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->baseStyle:Lcom/caverock/androidsvg/SVG$Style;

    new-instance v14, Lcom/caverock/androidsvg/SVG$Colour;

    invoke-virtual {v9}, Landroid/graphics/Paint;->getColor()I

    move-result v15

    invoke-direct {v14, v15}, Lcom/caverock/androidsvg/SVG$Colour;-><init>(I)V

    iput-object v14, v0, Lcom/caverock/androidsvg/SVG$Style;->stroke:Lcom/caverock/androidsvg/SVG$SvgPaint;

    .line 1091
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->baseStyle:Lcom/caverock/androidsvg/SVG$Style;

    invoke-virtual {v9}, Landroid/graphics/Paint;->getAlpha()I

    move-result v14

    int-to-float v14, v14

    const/high16 v15, 0x437f0000    # 255.0f

    div-float/2addr v14, v15

    invoke-static {v14}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v14

    iput-object v14, v0, Lcom/caverock/androidsvg/SVG$Style;->strokeOpacity:Ljava/lang/Float;

    .line 1092
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->baseStyle:Lcom/caverock/androidsvg/SVG$Style;

    iput-object v10, v0, Lcom/caverock/androidsvg/SVG$Style;->strokeWidth:Lcom/caverock/androidsvg/SVG$Length;

    .line 1093
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->baseStyle:Lcom/caverock/androidsvg/SVG$Style;

    const-wide/16 v14, 0x3d

    iput-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    .line 1094
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    if-eqz v0, :cond_7

    .line 1095
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    iget-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    const-wide/16 v18, 0x1

    and-long v14, v14, v18

    const-wide/16 v20, 0x0

    cmp-long v0, v14, v20

    if-nez v0, :cond_2

    .line 1096
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    new-instance v14, Lcom/caverock/androidsvg/SVG$Colour;

    invoke-virtual {v8}, Landroid/graphics/Paint;->getColor()I

    move-result v15

    invoke-direct {v14, v15}, Lcom/caverock/androidsvg/SVG$Colour;-><init>(I)V

    iput-object v14, v0, Lcom/caverock/androidsvg/SVG$Style;->fill:Lcom/caverock/androidsvg/SVG$SvgPaint;

    .line 1097
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    iget-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    or-long v14, v14, v18

    iput-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    .line 1099
    :cond_2
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    iget-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    const-wide/16 v18, 0x4

    and-long v14, v14, v18

    cmp-long v0, v14, v20

    if-nez v0, :cond_3

    .line 1100
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    invoke-virtual {v8}, Landroid/graphics/Paint;->getAlpha()I

    move-result v14

    int-to-float v14, v14

    const/high16 v15, 0x437f0000    # 255.0f

    div-float/2addr v14, v15

    invoke-static {v14}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v14

    iput-object v14, v0, Lcom/caverock/androidsvg/SVG$Style;->fillOpacity:Ljava/lang/Float;

    .line 1101
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    iget-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    or-long v14, v14, v18

    iput-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    .line 1103
    :cond_3
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    iget-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    const-wide/16 v18, 0x8

    and-long v14, v14, v18

    cmp-long v0, v14, v20

    if-nez v0, :cond_4

    .line 1104
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    new-instance v14, Lcom/caverock/androidsvg/SVG$Colour;

    invoke-virtual {v9}, Landroid/graphics/Paint;->getColor()I

    move-result v15

    invoke-direct {v14, v15}, Lcom/caverock/androidsvg/SVG$Colour;-><init>(I)V

    iput-object v14, v0, Lcom/caverock/androidsvg/SVG$Style;->stroke:Lcom/caverock/androidsvg/SVG$SvgPaint;

    .line 1105
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    iget-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    or-long v14, v14, v18

    iput-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    .line 1107
    :cond_4
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    iget-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    const-wide/16 v18, 0x10

    and-long v14, v14, v18

    cmp-long v0, v14, v20

    if-nez v0, :cond_5

    .line 1108
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    invoke-virtual {v9}, Landroid/graphics/Paint;->getAlpha()I

    move-result v14

    int-to-float v14, v14

    const/high16 v15, 0x437f0000    # 255.0f

    div-float/2addr v14, v15

    invoke-static {v14}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v14

    iput-object v14, v0, Lcom/caverock/androidsvg/SVG$Style;->strokeOpacity:Ljava/lang/Float;

    .line 1109
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    iget-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    or-long v14, v14, v18

    iput-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    .line 1111
    :cond_5
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    iget-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    const-wide/16 v17, 0x20

    and-long v14, v14, v17

    cmp-long v0, v14, v20

    if-nez v0, :cond_7

    .line 1112
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    iput-object v10, v0, Lcom/caverock/androidsvg/SVG$Style;->strokeWidth:Lcom/caverock/androidsvg/SVG$Length;

    .line 1113
    iget-object v0, v13, Lcom/caverock/androidsvg/SVG$SvgConditionalElement;->style:Lcom/caverock/androidsvg/SVG$Style;

    iget-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    or-long v14, v14, v17

    iput-wide v14, v0, Lcom/caverock/androidsvg/SVG$Style;->specifiedFlags:J

    goto :goto_3

    .line 1086
    .end local v13    # "path":Lcom/caverock/androidsvg/SVG$SvgConditionalElement;
    .end local v16    # "svg":Lcom/caverock/androidsvg/SVG$Svg;
    .restart local v0    # "svg":Lcom/caverock/androidsvg/SVG$Svg;
    :cond_6
    move-object/from16 v16, v0

    .line 1117
    .end local v0    # "svg":Lcom/caverock/androidsvg/SVG$Svg;
    .end local v12    # "element":Lcom/caverock/androidsvg/SVG$SvgObject;
    .restart local v16    # "svg":Lcom/caverock/androidsvg/SVG$Svg;
    :cond_7
    :goto_3
    move-object/from16 v0, v16

    goto/16 :goto_2

    .line 1120
    .end local v16    # "svg":Lcom/caverock/androidsvg/SVG$Svg;
    .restart local v0    # "svg":Lcom/caverock/androidsvg/SVG$Svg;
    :cond_8
    move-object/from16 v16, v0

    .end local v0    # "svg":Lcom/caverock/androidsvg/SVG$Svg;
    .restart local v16    # "svg":Lcom/caverock/androidsvg/SVG$Svg;
    invoke-virtual/range {p2 .. p2}, Lcom/caverock/androidsvg/SVG;->renderToPicture()Landroid/graphics/Picture;

    move-result-object v0

    .line 1121
    .local v0, "picture":Landroid/graphics/Picture;
    new-instance v11, Landroid/graphics/Picture;

    invoke-direct {v11}, Landroid/graphics/Picture;-><init>()V

    .line 1122
    .local v11, "scaledPicture":Landroid/graphics/Picture;
    invoke-interface/range {p1 .. p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->StrokeWidth()I

    move-result v12

    int-to-float v12, v12

    const/high16 v13, 0x40000000    # 2.0f

    mul-float v12, v12, v13

    add-float/2addr v12, v4

    mul-float v12, v12, v2

    float-to-int v12, v12

    .line 1123
    invoke-interface/range {p1 .. p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->StrokeWidth()I

    move-result v14

    int-to-float v14, v14

    mul-float v14, v14, v13

    add-float/2addr v14, v3

    mul-float v14, v14, v2

    float-to-int v13, v14

    .line 1122
    invoke-virtual {v11, v12, v13}, Landroid/graphics/Picture;->beginRecording(II)Landroid/graphics/Canvas;

    move-result-object v12

    .line 1124
    .local v12, "canvas":Landroid/graphics/Canvas;
    mul-float v13, v2, v6

    mul-float v14, v2, v5

    invoke-virtual {v12, v13, v14}, Landroid/graphics/Canvas;->scale(FF)V

    .line 1125
    invoke-virtual {v10}, Lcom/caverock/androidsvg/SVG$Length;->floatValue()F

    move-result v13

    invoke-virtual {v10}, Lcom/caverock/androidsvg/SVG$Length;->floatValue()F

    move-result v14

    invoke-virtual {v12, v13, v14}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1126
    invoke-virtual {v0, v12}, Landroid/graphics/Picture;->draw(Landroid/graphics/Canvas;)V

    .line 1127
    invoke-virtual {v11}, Landroid/graphics/Picture;->endRecording()V

    .line 1128
    new-instance v13, Landroid/graphics/drawable/PictureDrawable;

    invoke-direct {v13, v11}, Landroid/graphics/drawable/PictureDrawable;-><init>(Landroid/graphics/Picture;)V

    return-object v13
.end method


# virtual methods
.method public addEventListener(Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;)V
    .locals 3
    .param p1, "listener"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;

    .line 548
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->eventListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 549
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->ready:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-static {v0}, Landroidx/core/view/ViewCompat;->isAttachedToWindow(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->form:Lcom/google/appinventor/components/runtime/Form;

    const/4 v1, 0x0

    const-string v2, "MapReady"

    invoke-virtual {v0, v1, v2}, Lcom/google/appinventor/components/runtime/Form;->canDispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 550
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->ready:Z

    .line 551
    invoke-interface {p1, p0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;->onReady(Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;)V

    .line 553
    :cond_1
    return-void
.end method

.method public addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;)V
    .locals 1
    .param p1, "aiCircle"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;

    .line 758
    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->createNativeCircle(Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;)Lorg/osmdroid/views/overlay/Polygon;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->configurePolygon(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;Lorg/osmdroid/views/overlay/Polygon;)V

    .line 759
    return-void
.end method

.method public addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;)V
    .locals 2
    .param p1, "aiPolyline"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;

    .line 620
    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->createNativePolyline(Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;)Lorg/osmdroid/views/overlay/Polyline;

    move-result-object v0

    .line 621
    .local v0, "polyline":Lorg/osmdroid/views/overlay/Polyline;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 622
    new-instance v1, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$4;

    invoke-direct {v1, p0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$4;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;)V

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Polyline;->setOnClickListener(Lorg/osmdroid/views/overlay/Polyline$OnClickListener;)V

    .line 642
    new-instance v1, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$5;

    invoke-direct {v1, p0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$5;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;)V

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Polyline;->setOnDragListener(Lorg/osmdroid/views/overlay/Polyline$OnDragListener;)V

    .line 665
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;->Visible()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 666
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->showOverlay(Lorg/osmdroid/views/overlay/OverlayWithIW;)V

    goto :goto_0

    .line 668
    :cond_0
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hideOverlay(Lorg/osmdroid/views/overlay/OverlayWithIW;)V

    .line 670
    :goto_0
    return-void
.end method

.method public addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;)V
    .locals 1
    .param p1, "aiMarker"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;

    .line 557
    new-instance v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$3;

    invoke-direct {v0, p0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$3;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;)V

    invoke-direct {p0, p1, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->createNativeMarker(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V

    .line 616
    return-void
.end method

.method public addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;)V
    .locals 1
    .param p1, "aiPolygon"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;

    .line 753
    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->createNativePolygon(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;)Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->configurePolygon(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;Lorg/osmdroid/views/overlay/Polygon;)V

    .line 754
    return-void
.end method

.method public addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;)V
    .locals 1
    .param p1, "aiRectangle"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;

    .line 763
    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->createNativeRectangle(Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;)Lorg/osmdroid/views/overlay/Polygon;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->configurePolygon(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;Lorg/osmdroid/views/overlay/Polygon;)V

    .line 764
    return-void
.end method

.method createCustomMapView(Landroid/content/Context;)Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$CustomMapView;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .line 306
    new-instance v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$CustomMapView;

    new-instance v1, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$CustomMapTileProviderBasic;

    sget-object v2, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->DEFAULT_TILE_SOURCE:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    new-instance v3, Lorg/osmdroid/tileprovider/modules/TileWriter;

    invoke-direct {v3}, Lorg/osmdroid/tileprovider/modules/TileWriter;-><init>()V

    invoke-direct {v1, p1, v2, v3}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$CustomMapTileProviderBasic;-><init>(Landroid/content/Context;Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/modules/IFilesystemCache;)V

    invoke-direct {v0, p0, p1, v1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$CustomMapView;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Landroid/content/Context;Lorg/osmdroid/tileprovider/MapTileProviderBase;)V

    return-object v0
.end method

.method public getBoundingBox()Lorg/osmdroid/util/BoundingBox;
    .locals 1

    .line 1285
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getBoundingBox()Lorg/osmdroid/util/BoundingBox;

    move-result-object v0

    return-object v0
.end method

.method public getLatitude()D
    .locals 2

    .line 369
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getMapCenter()Lorg/osmdroid/api/IGeoPoint;

    move-result-object v0

    invoke-interface {v0}, Lorg/osmdroid/api/IGeoPoint;->getLatitude()D

    move-result-wide v0

    return-wide v0
.end method

.method public getLocationListener()Lcom/google/appinventor/components/runtime/LocationSensor$LocationSensorListener;
    .locals 1

    .line 1313
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->locationProvider:Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$AppInventorLocationSensorAdapter;

    return-object v0
.end method

.method public getLongitude()D
    .locals 2

    .line 374
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getMapCenter()Lorg/osmdroid/api/IGeoPoint;

    move-result-object v0

    invoke-interface {v0}, Lorg/osmdroid/api/IGeoPoint;->getLongitude()D

    move-result-wide v0

    return-wide v0
.end method

.method public getMapType()Lcom/google/appinventor/components/runtime/util/MapFactory$MapType;
    .locals 2

    .line 416
    invoke-static {}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapType;->values()[Lcom/google/appinventor/components/runtime/util/MapFactory$MapType;

    move-result-object v0

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->tileType:Lcom/google/appinventor/components/common/MapType;

    invoke-virtual {v1}, Lcom/google/appinventor/components/common/MapType;->toUnderlyingValue()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getMapTypeAbstract()Lcom/google/appinventor/components/common/MapType;
    .locals 1

    .line 437
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->tileType:Lcom/google/appinventor/components/common/MapType;

    return-object v0
.end method

.method public getOverlayCount()I
    .locals 2

    .line 1318
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getOverlays()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 1319
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlays()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getRotation()F
    .locals 1

    .line 1329
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v0

    return v0
.end method

.method public getScaleUnits()Lcom/google/appinventor/components/runtime/util/MapFactory$MapScaleUnits;
    .locals 2

    .line 1360
    sget-object v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$14;->$SwitchMap$org$osmdroid$views$overlay$ScaleBarOverlay$UnitsOfMeasure:[I

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->scaleBar:Lorg/osmdroid/views/overlay/ScaleBarOverlay;

    invoke-virtual {v1}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->getUnitsOfMeasure()Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    move-result-object v1

    invoke-virtual {v1}, Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 1366
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Somehow we have an unallowed unit system"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1364
    :pswitch_0
    sget-object v0, Lcom/google/appinventor/components/runtime/util/MapFactory$MapScaleUnits;->METRIC:Lcom/google/appinventor/components/runtime/util/MapFactory$MapScaleUnits;

    return-object v0

    .line 1362
    :pswitch_1
    sget-object v0, Lcom/google/appinventor/components/runtime/util/MapFactory$MapScaleUnits;->IMPERIAL:Lcom/google/appinventor/components/runtime/util/MapFactory$MapScaleUnits;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getScaleUnitsAbstract()Lcom/google/appinventor/components/common/ScaleUnits;
    .locals 2

    .line 1387
    sget-object v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$14;->$SwitchMap$org$osmdroid$views$overlay$ScaleBarOverlay$UnitsOfMeasure:[I

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->scaleBar:Lorg/osmdroid/views/overlay/ScaleBarOverlay;

    invoke-virtual {v1}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->getUnitsOfMeasure()Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    move-result-object v1

    invoke-virtual {v1}, Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 1393
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Somehow we have an unallowed unit system"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1391
    :pswitch_0
    sget-object v0, Lcom/google/appinventor/components/common/ScaleUnits;->Metric:Lcom/google/appinventor/components/common/ScaleUnits;

    return-object v0

    .line 1389
    :pswitch_1
    sget-object v0, Lcom/google/appinventor/components/common/ScaleUnits;->Imperial:Lcom/google/appinventor/components/common/ScaleUnits;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .line 364
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->containerView:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method public getZoom()I
    .locals 2

    .line 392
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/MapView;->getZoomLevel(Z)D

    move-result-wide v0

    double-to-int v0, v0

    return v0
.end method

.method public hideFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 1
    .param p1, "feature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 1214
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/OverlayWithIW;

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hideOverlay(Lorg/osmdroid/views/overlay/OverlayWithIW;)V

    .line 1215
    return-void
.end method

.method public hideInfobox(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 1
    .param p1, "feature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 1273
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/OverlayWithIW;

    .line 1274
    .local v0, "overlay":Lorg/osmdroid/views/overlay/OverlayWithIW;
    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/OverlayWithIW;->closeInfoWindow()V

    .line 1275
    return-void
.end method

.method protected hideOverlay(Lorg/osmdroid/views/overlay/OverlayWithIW;)V
    .locals 1
    .param p1, "overlay"    # Lorg/osmdroid/views/overlay/OverlayWithIW;

    .line 1218
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/osmdroid/views/overlay/OverlayManager;->remove(Ljava/lang/Object;)Z

    .line 1219
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 1220
    return-void
.end method

.method public isCompassEnabled()Z
    .locals 1

    .line 471
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->compass:Lorg/osmdroid/views/overlay/compass/CompassOverlay;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->isCompassEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFeatureCollectionVisible(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureCollection;)Z
    .locals 1
    .param p1, "collection"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureCollection;

    .line 1230
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hiddenFeatureCollections:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isFeatureVisible(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)Z
    .locals 2
    .param p1, "feature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 1224
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/OverlayWithIW;

    .line 1225
    .local v0, "overlay":Lorg/osmdroid/views/overlay/OverlayWithIW;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/osmdroid/views/overlay/OverlayManager;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isInfoboxVisible(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)Z
    .locals 2
    .param p1, "feature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 1279
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/OverlayWithIW;

    .line 1280
    .local v0, "overlay":Lorg/osmdroid/views/overlay/OverlayWithIW;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/OverlayWithIW;->isInfoWindowOpen()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isPanEnabled()Z
    .locals 1

    .line 532
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->touch:Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay;->-$$Nest$fgetscrollEnabled(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay;)Z

    move-result v0

    return v0
.end method

.method public isRotationEnabled()Z
    .locals 1

    .line 522
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->rotation:Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isScaleVisible()Z
    .locals 1

    .line 1340
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->scaleBar:Lorg/osmdroid/views/overlay/ScaleBarOverlay;

    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->isEnabled()Z

    move-result v0

    return v0
.end method

.method public isShowUserEnabled()Z
    .locals 1

    .line 502
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->userLocation:Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isZoomControlEnabled()Z
    .locals 1

    .line 485
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->zoomControlEnabled:Z

    return v0
.end method

.method public isZoomEnabled()Z
    .locals 1

    .line 403
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->zoomEnabled:Z

    return v0
.end method

.method public onScroll(Lorg/osmdroid/events/ScrollEvent;)Z
    .locals 2
    .param p1, "event"    # Lorg/osmdroid/events/ScrollEvent;

    .line 1296
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->eventListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;

    .line 1297
    .local v1, "listener":Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;
    invoke-interface {v1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;->onBoundsChanged()V

    .line 1298
    .end local v1    # "listener":Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;
    goto :goto_0

    .line 1299
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onZoom(Lorg/osmdroid/events/ZoomEvent;)Z
    .locals 2
    .param p1, "event"    # Lorg/osmdroid/events/ZoomEvent;

    .line 1304
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->zoomControls:Lcom/google/appinventor/components/runtime/view/ZoomControlView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->updateButtons()V

    .line 1305
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->eventListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;

    .line 1306
    .local v1, "listener":Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;
    invoke-interface {v1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;->onZoom()V

    .line 1307
    .end local v1    # "listener":Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;
    goto :goto_0

    .line 1308
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public panTo(DDID)V
    .locals 3
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D
    .param p5, "zoom"    # I
    .param p6, "seconds"    # D

    .line 537
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    new-instance v1, Lorg/osmdroid/util/GeoPoint;

    invoke-direct {v1, p1, p2, p3, p4}, Lorg/osmdroid/util/GeoPoint;-><init>(DD)V

    invoke-interface {v0, v1}, Lorg/osmdroid/api/IMapController;->animateTo(Lorg/osmdroid/api/IGeoPoint;)V

    .line 538
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    int-to-double v1, p5

    invoke-interface {v0, v1, v2}, Lorg/osmdroid/api/IMapController;->zoomTo(D)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 539
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    .line 540
    .local v0, "animation":Landroid/view/animation/Animation;
    if-eqz v0, :cond_0

    .line 541
    const-wide v1, 0x408f400000000000L    # 1000.0

    mul-double v1, v1, p6

    double-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 544
    .end local v0    # "animation":Landroid/view/animation/Animation;
    :cond_0
    return-void
.end method

.method public removeFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 2
    .param p1, "aiFeature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 768
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/osmdroid/views/overlay/OverlayManager;->remove(Ljava/lang/Object;)Z

    .line 769
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 770
    return-void
.end method

.method public setBoundingBox(Lorg/osmdroid/util/BoundingBox;)V
    .locals 5
    .param p1, "bbox"    # Lorg/osmdroid/util/BoundingBox;

    .line 1290
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    invoke-virtual {p1}, Lorg/osmdroid/util/BoundingBox;->getCenter()Lorg/osmdroid/util/GeoPoint;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/osmdroid/api/IMapController;->setCenter(Lorg/osmdroid/api/IGeoPoint;)V

    .line 1291
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    invoke-virtual {p1}, Lorg/osmdroid/util/BoundingBox;->getLatitudeSpan()D

    move-result-wide v1

    invoke-virtual {p1}, Lorg/osmdroid/util/BoundingBox;->getLongitudeSpan()D

    move-result-wide v3

    invoke-interface {v0, v1, v2, v3, v4}, Lorg/osmdroid/api/IMapController;->zoomToSpan(DD)V

    .line 1292
    return-void
.end method

.method public setCenter(DD)V
    .locals 2
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .line 379
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    new-instance v1, Lorg/osmdroid/util/GeoPoint;

    invoke-direct {v1, p1, p2, p3, p4}, Lorg/osmdroid/util/GeoPoint;-><init>(DD)V

    invoke-interface {v0, v1}, Lorg/osmdroid/api/IMapController;->setCenter(Lorg/osmdroid/api/IGeoPoint;)V

    .line 380
    return-void
.end method

.method public setCompassEnabled(Z)V
    .locals 3
    .param p1, "enabled"    # Z

    .line 442
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->compass:Lorg/osmdroid/views/overlay/compass/CompassOverlay;

    if-nez v0, :cond_0

    .line 443
    new-instance v0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-direct {v0, v1, v2}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;-><init>(Landroid/content/Context;Lorg/osmdroid/views/MapView;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->compass:Lorg/osmdroid/views/overlay/compass/CompassOverlay;

    .line 444
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$2;

    invoke-direct {v1, p0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$2;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 452
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->compass:Lorg/osmdroid/views/overlay/compass/CompassOverlay;

    invoke-interface {v0, v1}, Lorg/osmdroid/views/overlay/OverlayManager;->add(Ljava/lang/Object;)Z

    .line 454
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->compass:Lorg/osmdroid/views/overlay/compass/CompassOverlay;

    if-eqz v0, :cond_3

    .line 455
    if-eqz p1, :cond_2

    .line 456
    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->getOrientationProvider()Lorg/osmdroid/views/overlay/compass/IOrientationProvider;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 457
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->compass:Lorg/osmdroid/views/overlay/compass/CompassOverlay;

    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->enableCompass()Z

    goto :goto_0

    .line 459
    :cond_1
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->compass:Lorg/osmdroid/views/overlay/compass/CompassOverlay;

    new-instance v1, Lorg/osmdroid/views/overlay/compass/InternalCompassOrientationProvider;

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/osmdroid/views/overlay/compass/InternalCompassOrientationProvider;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->enableCompass(Lorg/osmdroid/views/overlay/compass/IOrientationProvider;)Z

    .line 461
    :goto_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->compass:Lorg/osmdroid/views/overlay/compass/CompassOverlay;

    iget v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->lastAzimuth:F

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->onOrientationChanged(FLorg/osmdroid/views/overlay/compass/IOrientationProvider;)V

    goto :goto_1

    .line 463
    :cond_2
    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->getOrientation()F

    move-result v0

    iput v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->lastAzimuth:F

    .line 464
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->compass:Lorg/osmdroid/views/overlay/compass/CompassOverlay;

    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->disableCompass()V

    .line 467
    :cond_3
    :goto_1
    return-void
.end method

.method public setFeatureCollectionVisible(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureCollection;Z)V
    .locals 3
    .param p1, "collection"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureCollection;
    .param p2, "visible"    # Z

    .line 1235
    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hiddenFeatureCollections:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    if-eqz p2, :cond_2

    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hiddenFeatureCollections:Ljava/util/Set;

    .line 1236
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1238
    :cond_1
    return-void

    .line 1240
    :cond_2
    if-eqz p2, :cond_5

    .line 1241
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hiddenFeatureCollections:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1242
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 1243
    .local v1, "feature":Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hiddenFeatures:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1244
    invoke-interface {v1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;->Visible()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1245
    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->showFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V

    .line 1247
    .end local v1    # "feature":Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;
    :cond_3
    goto :goto_0

    :cond_4
    goto :goto_2

    .line 1249
    :cond_5
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hiddenFeatureCollections:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1250
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 1251
    .restart local v1    # "feature":Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hiddenFeatures:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1252
    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hideFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V

    .line 1253
    .end local v1    # "feature":Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;
    goto :goto_1

    .line 1255
    :cond_6
    :goto_2
    return-void
.end method

.method public setMapType(Lcom/google/appinventor/components/runtime/util/MapFactory$MapType;)V
    .locals 1
    .param p1, "type"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapType;

    .line 408
    invoke-virtual {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapType;->ordinal()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lcom/google/appinventor/components/common/MapType;->fromUnderlyingValue(Ljava/lang/Integer;)Lcom/google/appinventor/components/common/MapType;

    move-result-object v0

    .line 409
    .local v0, "mapType":Lcom/google/appinventor/components/common/MapType;
    if-eqz v0, :cond_0

    .line 410
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->setMapTypeAbstract(Lcom/google/appinventor/components/common/MapType;)V

    .line 412
    :cond_0
    return-void
.end method

.method public setMapTypeAbstract(Lcom/google/appinventor/components/common/MapType;)V
    .locals 2
    .param p1, "type"    # Lcom/google/appinventor/components/common/MapType;

    .line 421
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->tileType:Lcom/google/appinventor/components/common/MapType;

    .line 422
    sget-object v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$14;->$SwitchMap$com$google$appinventor$components$common$MapType:[I

    invoke-virtual {p1}, Lcom/google/appinventor/components/common/MapType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 430
    :pswitch_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    sget-object v1, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->USGS_TOPO:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/MapView;->setTileSource(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    goto :goto_0

    .line 427
    :pswitch_1
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    sget-object v1, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->USGS_SAT:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/MapView;->setTileSource(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    .line 428
    goto :goto_0

    .line 424
    :pswitch_2
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    sget-object v1, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->MAPNIK:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/MapView;->setTileSource(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    .line 425
    nop

    .line 433
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setPanEnabled(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .line 527
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->touch:Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay;

    invoke-static {v0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay;->-$$Nest$fputscrollEnabled(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$TouchOverlay;Z)V

    .line 528
    return-void
.end method

.method public setRotation(F)V
    .locals 1
    .param p1, "Rotation"    # F

    .line 1324
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, p1}, Lorg/osmdroid/views/MapView;->setMapOrientation(F)V

    .line 1325
    return-void
.end method

.method public setRotationEnabled(Z)V
    .locals 2
    .param p1, "enabled"    # Z

    .line 507
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->rotation:Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;

    if-nez v0, :cond_0

    .line 508
    new-instance v0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-direct {v0, v1}, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;-><init>(Lorg/osmdroid/views/MapView;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->rotation:Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;

    .line 510
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->rotation:Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;

    if-eqz v0, :cond_2

    .line 511
    invoke-virtual {v0, p1}, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->setEnabled(Z)V

    .line 512
    if-eqz p1, :cond_1

    .line 513
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->rotation:Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;

    invoke-interface {v0, v1}, Lorg/osmdroid/views/overlay/OverlayManager;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 515
    :cond_1
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->rotation:Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;

    invoke-interface {v0, v1}, Lorg/osmdroid/views/overlay/OverlayManager;->remove(Ljava/lang/Object;)Z

    .line 518
    :cond_2
    :goto_0
    return-void
.end method

.method public setScaleUnits(Lcom/google/appinventor/components/runtime/util/MapFactory$MapScaleUnits;)V
    .locals 3
    .param p1, "units"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapScaleUnits;

    .line 1345
    sget-object v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$14;->$SwitchMap$com$google$appinventor$components$runtime$util$MapFactory$MapScaleUnits:[I

    invoke-virtual {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapScaleUnits;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 1353
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unallowable unit system: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1350
    :pswitch_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->scaleBar:Lorg/osmdroid/views/overlay/ScaleBarOverlay;

    sget-object v1, Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;->imperial:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->setUnitsOfMeasure(Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;)V

    .line 1351
    goto :goto_0

    .line 1347
    :pswitch_1
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->scaleBar:Lorg/osmdroid/views/overlay/ScaleBarOverlay;

    sget-object v1, Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;->metric:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->setUnitsOfMeasure(Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;)V

    .line 1348
    nop

    .line 1355
    :goto_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 1356
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setScaleUnitsAbstract(Lcom/google/appinventor/components/common/ScaleUnits;)V
    .locals 2
    .param p1, "units"    # Lcom/google/appinventor/components/common/ScaleUnits;

    .line 1372
    sget-object v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$14;->$SwitchMap$com$google$appinventor$components$common$ScaleUnits:[I

    invoke-virtual {p1}, Lcom/google/appinventor/components/common/ScaleUnits;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 1377
    :pswitch_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->scaleBar:Lorg/osmdroid/views/overlay/ScaleBarOverlay;

    sget-object v1, Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;->imperial:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->setUnitsOfMeasure(Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;)V

    .line 1378
    goto :goto_0

    .line 1374
    :pswitch_1
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->scaleBar:Lorg/osmdroid/views/overlay/ScaleBarOverlay;

    sget-object v1, Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;->metric:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->setUnitsOfMeasure(Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;)V

    .line 1375
    nop

    .line 1382
    :goto_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 1383
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setScaleVisible(Z)V
    .locals 1
    .param p1, "show"    # Z

    .line 1334
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->scaleBar:Lorg/osmdroid/views/overlay/ScaleBarOverlay;

    invoke-virtual {v0, p1}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->setEnabled(Z)V

    .line 1335
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 1336
    return-void
.end method

.method public setShowUserEnabled(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .line 490
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->userLocation:Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

    invoke-virtual {v0, p1}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->setEnabled(Z)V

    .line 491
    if-eqz p1, :cond_0

    .line 492
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->userLocation:Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->enableMyLocation()Z

    .line 493
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->userLocation:Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

    invoke-interface {v0, v1}, Lorg/osmdroid/views/overlay/OverlayManager;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 495
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->userLocation:Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->disableMyLocation()V

    .line 496
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->userLocation:Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

    invoke-interface {v0, v1}, Lorg/osmdroid/views/overlay/OverlayManager;->remove(Ljava/lang/Object;)Z

    .line 498
    :goto_0
    return-void
.end method

.method public setZoom(I)V
    .locals 3
    .param p1, "zoom"    # I

    .line 384
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    int-to-double v1, p1

    invoke-interface {v0, v1, v2}, Lorg/osmdroid/api/IMapController;->setZoom(D)D

    .line 385
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->zoomControls:Lcom/google/appinventor/components/runtime/view/ZoomControlView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->updateButtons()V

    .line 386
    return-void
.end method

.method public setZoomControlEnabled(Z)V
    .locals 2
    .param p1, "enabled"    # Z

    .line 476
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->zoomControlEnabled:Z

    if-eq v0, p1, :cond_1

    .line 477
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->zoomControls:Lcom/google/appinventor/components/runtime/view/ZoomControlView;

    if-eqz p1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/view/ZoomControlView;->setVisibility(I)V

    .line 478
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->zoomControlEnabled:Z

    .line 479
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->containerView:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->invalidate()V

    .line 481
    :cond_1
    return-void
.end method

.method public setZoomEnabled(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .line 397
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->zoomEnabled:Z

    .line 398
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, p1}, Lorg/osmdroid/views/MapView;->setMultiTouchControls(Z)V

    .line 399
    return-void
.end method

.method public showFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 1
    .param p1, "feature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 1202
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->hiddenFeatures:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1203
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/OverlayWithIW;

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->showOverlay(Lorg/osmdroid/views/overlay/OverlayWithIW;)V

    .line 1205
    :cond_0
    return-void
.end method

.method public showInfobox(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 3
    .param p1, "feature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 1259
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/OverlayWithIW;

    .line 1260
    .local v0, "overlay":Lorg/osmdroid/views/overlay/OverlayWithIW;
    instance-of v1, v0, Lorg/osmdroid/views/overlay/Marker;

    if-eqz v1, :cond_0

    .line 1261
    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/OverlayWithIW;->showInfoWindow()V

    goto :goto_0

    .line 1262
    :cond_0
    instance-of v1, v0, Lorg/osmdroid/views/overlay/Polyline;

    if-eqz v1, :cond_1

    .line 1263
    move-object v1, v0

    check-cast v1, Lorg/osmdroid/views/overlay/Polyline;

    .line 1264
    .local v1, "polyOverlay":Lorg/osmdroid/views/overlay/Polyline;
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;->getCentroid()Lorg/osmdroid/util/GeoPoint;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/osmdroid/views/overlay/Polyline;->showInfoWindow(Lorg/osmdroid/util/GeoPoint;)V

    .line 1265
    .end local v1    # "polyOverlay":Lorg/osmdroid/views/overlay/Polyline;
    goto :goto_0

    .line 1266
    :cond_1
    move-object v1, v0

    check-cast v1, Lorg/osmdroid/views/overlay/Polygon;

    .line 1267
    .local v1, "polyOverlay":Lorg/osmdroid/views/overlay/Polygon;
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;->getCentroid()Lorg/osmdroid/util/GeoPoint;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/osmdroid/views/overlay/Polygon;->showInfoWindow(Lorg/osmdroid/util/GeoPoint;)V

    .line 1269
    .end local v1    # "polyOverlay":Lorg/osmdroid/views/overlay/Polygon;
    :goto_0
    return-void
.end method

.method protected showOverlay(Lorg/osmdroid/views/overlay/OverlayWithIW;)V
    .locals 1
    .param p1, "overlay"    # Lorg/osmdroid/views/overlay/OverlayWithIW;

    .line 1208
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/osmdroid/views/overlay/OverlayManager;->add(Ljava/lang/Object;)Z

    .line 1209
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 1210
    return-void
.end method

.method public updateFeatureDraggable(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 2
    .param p1, "aiFeature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 924
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/OverlayWithIW;

    .line 925
    .local v0, "overlay":Lorg/osmdroid/views/overlay/OverlayWithIW;
    if-eqz v0, :cond_0

    .line 926
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;->Draggable()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/OverlayWithIW;->setDraggable(Z)V

    .line 928
    :cond_0
    return-void
.end method

.method public updateFeatureFill(Lcom/google/appinventor/components/runtime/util/MapFactory$HasFill;)V
    .locals 2
    .param p1, "aiFeature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$HasFill;

    .line 835
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/OverlayWithIW;

    .line 836
    .local v0, "overlay":Lorg/osmdroid/views/overlay/OverlayWithIW;
    if-nez v0, :cond_0

    .line 837
    return-void

    .line 839
    :cond_0
    new-instance v1, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$8;

    invoke-direct {v1, p0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$8;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lcom/google/appinventor/components/runtime/util/MapFactory$HasFill;)V

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/OverlayWithIW;->accept(Lorg/osmdroid/views/overlay/OverlayWithIWVisitor;)V

    .line 868
    return-void
.end method

.method public updateFeatureHoles(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;)V
    .locals 2
    .param p1, "aiPolygon"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;

    .line 803
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;

    .line 804
    .local v0, "polygon":Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;
    if-eqz v0, :cond_0

    .line 805
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;->getHolePoints()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;->setMultiHoles(Ljava/util/List;)V

    .line 806
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 808
    :cond_0
    return-void
.end method

.method public updateFeatureImage(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;)V
    .locals 2
    .param p1, "aiMarker"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;

    .line 932
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/Marker;

    .line 933
    .local v0, "marker":Lorg/osmdroid/views/overlay/Marker;
    if-nez v0, :cond_0

    .line 934
    return-void

    .line 936
    :cond_0
    new-instance v1, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$10;

    invoke-direct {v1, p0, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$10;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lorg/osmdroid/views/overlay/Marker;)V

    invoke-direct {p0, p1, v1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->getMarkerDrawable(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V

    .line 948
    return-void
.end method

.method public updateFeaturePosition(Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;)V
    .locals 5
    .param p1, "aiCircle"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;

    .line 812
    new-instance v0, Lorg/osmdroid/util/GeoPoint;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;->Latitude()D

    move-result-wide v1

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;->Longitude()D

    move-result-wide v3

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/osmdroid/util/GeoPoint;-><init>(DD)V

    .line 813
    .local v0, "center":Lorg/osmdroid/util/GeoPoint;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Polygon;

    .line 814
    .local v1, "polygon":Lorg/osmdroid/views/overlay/Polygon;
    if-eqz v1, :cond_0

    .line 815
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;->Radius()D

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lorg/osmdroid/views/overlay/Polygon;->pointsAsCircle(Lorg/osmdroid/util/GeoPoint;D)Ljava/util/ArrayList;

    move-result-object v2

    .line 816
    .local v2, "geopoints":Ljava/util/List;, "Ljava/util/List<Lorg/osmdroid/util/GeoPoint;>;"
    invoke-virtual {v1, v2}, Lorg/osmdroid/views/overlay/Polygon;->setPoints(Ljava/util/List;)V

    .line 817
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v3}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 819
    .end local v2    # "geopoints":Ljava/util/List;, "Ljava/util/List<Lorg/osmdroid/util/GeoPoint;>;"
    :cond_0
    return-void
.end method

.method public updateFeaturePosition(Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;)V
    .locals 2
    .param p1, "aiPolyline"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;

    .line 785
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/Polyline;

    .line 786
    .local v0, "overlay":Lorg/osmdroid/views/overlay/Polyline;
    if-eqz v0, :cond_0

    .line 787
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;->getPoints()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Polyline;->setPoints(Ljava/util/List;)V

    .line 788
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 790
    :cond_0
    return-void
.end method

.method public updateFeaturePosition(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;)V
    .locals 6
    .param p1, "aiMarker"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;

    .line 774
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/Marker;

    .line 775
    .local v0, "marker":Lorg/osmdroid/views/overlay/Marker;
    if-eqz v0, :cond_0

    .line 776
    sget-object v1, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->ANCHOR_HORIZONTAL:[F

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->AnchorHorizontal()I

    move-result v2

    aget v1, v1, v2

    sget-object v2, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->ANCHOR_VERTICAL:[F

    .line 777
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->AnchorVertical()I

    move-result v3

    aget v2, v2, v3

    .line 776
    invoke-virtual {v0, v1, v2}, Lorg/osmdroid/views/overlay/Marker;->setAnchor(FF)V

    .line 778
    new-instance v1, Lorg/osmdroid/util/GeoPoint;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->Latitude()D

    move-result-wide v2

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->Longitude()D

    move-result-wide v4

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/osmdroid/util/GeoPoint;-><init>(DD)V

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Marker;->setPosition(Lorg/osmdroid/util/GeoPoint;)V

    .line 779
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 781
    :cond_0
    return-void
.end method

.method public updateFeaturePosition(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;)V
    .locals 2
    .param p1, "aiPolygon"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;

    .line 794
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;

    .line 795
    .local v0, "polygon":Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;
    if-eqz v0, :cond_0

    .line 796
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;->getPoints()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$MultiPolygon;->setMultiPoints(Ljava/util/List;)V

    .line 797
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 799
    :cond_0
    return-void
.end method

.method public updateFeaturePosition(Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;)V
    .locals 11
    .param p1, "aiRectangle"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;

    .line 824
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/Polygon;

    .line 825
    .local v0, "polygon":Lorg/osmdroid/views/overlay/Polygon;
    if-eqz v0, :cond_0

    .line 826
    new-instance v10, Lorg/osmdroid/util/BoundingBox;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;->NorthLatitude()D

    move-result-wide v2

    .line 827
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;->EastLongitude()D

    move-result-wide v4

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;->SouthLatitude()D

    move-result-wide v6

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;->WestLongitude()D

    move-result-wide v8

    move-object v1, v10

    invoke-direct/range {v1 .. v9}, Lorg/osmdroid/util/BoundingBox;-><init>(DDDD)V

    .line 826
    invoke-static {v10}, Lorg/osmdroid/views/overlay/Polygon;->pointsAsRect(Lorg/osmdroid/util/BoundingBox;)Ljava/util/ArrayList;

    move-result-object v1

    .line 828
    .local v1, "geopoints":Ljava/util/List;, "Ljava/util/List<Lorg/osmdroid/util/GeoPoint;>;"
    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/Polygon;->setPoints(Ljava/util/List;)V

    .line 829
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->view:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 831
    .end local v1    # "geopoints":Ljava/util/List;, "Ljava/util/List<Lorg/osmdroid/util/GeoPoint;>;"
    :cond_0
    return-void
.end method

.method public updateFeatureSize(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;)V
    .locals 2
    .param p1, "aiMarker"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;

    .line 952
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/Marker;

    .line 953
    .local v0, "marker":Lorg/osmdroid/views/overlay/Marker;
    if-nez v0, :cond_0

    .line 954
    return-void

    .line 956
    :cond_0
    new-instance v1, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$11;

    invoke-direct {v1, p0, v0}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$11;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lorg/osmdroid/views/overlay/Marker;)V

    invoke-direct {p0, p1, v1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->getMarkerDrawable(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/AsyncCallbackPair;)V

    .line 968
    return-void
.end method

.method public updateFeatureStroke(Lcom/google/appinventor/components/runtime/util/MapFactory$HasStroke;)V
    .locals 2
    .param p1, "aiFeature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$HasStroke;

    .line 872
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/OverlayWithIW;

    .line 873
    .local v0, "overlay":Lorg/osmdroid/views/overlay/OverlayWithIW;
    if-nez v0, :cond_0

    .line 874
    return-void

    .line 876
    :cond_0
    new-instance v1, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$9;

    invoke-direct {v1, p0, p1}, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController$9;-><init>(Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;Lcom/google/appinventor/components/runtime/util/MapFactory$HasStroke;)V

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/OverlayWithIW;->accept(Lorg/osmdroid/views/overlay/OverlayWithIWVisitor;)V

    .line 911
    return-void
.end method

.method public updateFeatureText(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 2
    .param p1, "aiFeature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 915
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/util/NativeOpenStreetMapController;->featureOverlays:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/OverlayWithIW;

    .line 916
    .local v0, "overlay":Lorg/osmdroid/views/overlay/OverlayWithIW;
    if-eqz v0, :cond_0

    .line 917
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;->Title()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/OverlayWithIW;->setTitle(Ljava/lang/String;)V

    .line 918
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;->Description()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/OverlayWithIW;->setSnippet(Ljava/lang/String;)V

    .line 920
    :cond_0
    return-void
.end method
