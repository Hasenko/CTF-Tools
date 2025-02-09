.class public Lcom/google/appinventor/components/runtime/Map;
.super Lcom/google/appinventor/components/runtime/MapFeatureContainerBase;
.source "Map.java"

# interfaces
.implements Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;


# annotations
.annotation runtime Lcom/google/appinventor/components/annotations/DesignerComponent;
    androidMinSdk = 0x8
    category = .enum Lcom/google/appinventor/components/common/ComponentCategory;->MAPS:Lcom/google/appinventor/components/common/ComponentCategory;
    description = "<p>A two-dimensional container that renders map tiles in the background and allows for multiple Marker elements to identify points on the map. Map tiles are supplied by OpenStreetMap contributors and the United States Geological Survey.</p><p>The Map component provides three utilities for manipulating its boundaries within App Inventor. First, a locking mechanism is provided to allow the map to be moved relative to other components on the Screen. Second, when unlocked, the user can pan the Map to any location. At this new location, the &quot;Set Initial Boundary&quot; button can be pressed to save the current Map coordinates to its properties. Lastly, if the Map is moved to a different location, for example to add Markers off-screen, then the &quot;Reset Map to Initial Bounds&quot; button can be used to re-center the Map at the starting location.</p>"
    iconName = "images/map.png"
    version = 0x6
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/SimpleObject;
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/UsesAssets;
    fileNames = "location.png, marker.svg"
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/UsesLibraries;
    libraries = "osmdroid.aar, osmdroid.jar, androidsvg.jar, jts.jar"
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/UsesPermissions;
    value = {
        "android.permission.ACCESS_COARSE_LOCATION",
        "android.permission.ACCESS_FINE_LOCATION"
    }
.end annotation


# static fields
.field private static final ERROR_INVALID_NUMBER:Ljava/lang/String; = "%s is not a valid number."

.field private static final ERROR_LATITUDE_OUT_OF_BOUNDS:Ljava/lang/String; = "Latitude %f is out of bounds."

.field private static final ERROR_LONGITUDE_OUT_OF_BOUNDS:Ljava/lang/String; = "Longitude %f is out of bounds."

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

.field private sensor:Lcom/google/appinventor/components/runtime/LocationSensor;


# direct methods
.method static bridge synthetic -$$Nest$mdoSave(Lcom/google/appinventor/components/runtime/Map;Ljava/util/List;Ljava/io/File;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/appinventor/components/runtime/Map;->doSave(Ljava/util/List;Ljava/io/File;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 97
    const-class v0, Lcom/google/appinventor/components/runtime/Map;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/appinventor/components/runtime/Map;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V
    .locals 3
    .param p1, "container"    # Lcom/google/appinventor/components/runtime/ComponentContainer;

    .line 116
    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/MapFeatureContainerBase;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V

    .line 106
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    .line 108
    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->sensor:Lcom/google/appinventor/components/runtime/LocationSensor;

    .line 117
    sget-object v0, Lcom/google/appinventor/components/runtime/Map;->TAG:Ljava/lang/String;

    const-string v1, "Map.<init>"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    invoke-interface {p1, p0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$add(Lcom/google/appinventor/components/runtime/AndroidViewComponent;)V

    .line 119
    const/16 v0, 0xb0

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->Width(I)V

    .line 120
    const/16 v0, 0x90

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->Height(I)V

    .line 121
    const-string v0, "42.359144, -71.093612"

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->CenterFromString(Ljava/lang/String;)V

    .line 122
    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->ZoomLevel(I)V

    .line 123
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->EnableZoom(Z)V

    .line 124
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->EnablePan(Z)V

    .line 125
    sget-object v0, Lcom/google/appinventor/components/common/MapType;->Road:Lcom/google/appinventor/components/common/MapType;

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->MapTypeAbstract(Lcom/google/appinventor/components/common/MapType;)V

    .line 126
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->ShowCompass(Z)V

    .line 127
    new-instance v1, Lcom/google/appinventor/components/runtime/LocationSensor;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/google/appinventor/components/runtime/LocationSensor;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;Z)V

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/Map;->LocationSensor(Lcom/google/appinventor/components/runtime/LocationSensor;)V

    .line 128
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->ShowUser(Z)V

    .line 129
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->ShowZoom(Z)V

    .line 130
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->EnableRotation(Z)V

    .line 131
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->ShowScale(Z)V

    .line 132
    return-void
.end method

.method private doSave(Ljava/util/List;Ljava/io/File;)V
    .locals 3
    .param p2, "target"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .line 637
    .local p1, "featuresToSave":Ljava/util/List;, "Ljava/util/List<Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;>;"
    :try_start_0
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/appinventor/components/runtime/util/GeoJSONUtil;->writeFeaturesAsGeoJSON(Ljava/util/List;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 646
    goto :goto_0

    .line 638
    :catch_0
    move-exception v0

    .line 639
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Map;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v1

    new-instance v2, Lcom/google/appinventor/components/runtime/Map$3;

    invoke-direct {v2, p0, v0}, Lcom/google/appinventor/components/runtime/Map$3;-><init>(Lcom/google/appinventor/components/runtime/Map;Ljava/io/IOException;)V

    invoke-virtual {v1, v2}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 647
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method


# virtual methods
.method public BoundingBox()Lcom/google/appinventor/components/runtime/util/YailList;
    .locals 8
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Bounding box for the map stored as [[North, West], [South, East]]."
    .end annotation

    .line 484
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->getBoundingBox()Lorg/osmdroid/util/BoundingBox;

    move-result-object v0

    .line 485
    .local v0, "bbox":Lorg/osmdroid/util/BoundingBox;
    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Double;

    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBox;->getLatNorth()D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBox;->getLonWest()D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/util/YailList;->makeList([Ljava/lang/Object;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v2

    .line 486
    .local v2, "northwest":Lcom/google/appinventor/components/runtime/util/YailList;
    new-array v3, v1, [Ljava/lang/Double;

    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBox;->getLatSouth()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v3, v4

    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBox;->getLonEast()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v3, v5

    invoke-static {v3}, Lcom/google/appinventor/components/runtime/util/YailList;->makeList([Ljava/lang/Object;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v3

    .line 487
    .local v3, "southeast":Lcom/google/appinventor/components/runtime/util/YailList;
    new-array v1, v1, [Lcom/google/appinventor/components/runtime/util/YailList;

    aput-object v2, v1, v4

    aput-object v3, v1, v5

    invoke-static {v1}, Lcom/google/appinventor/components/runtime/util/YailList;->makeList([Ljava/lang/Object;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v1

    return-object v1
.end method

.method public BoundingBox(Lcom/google/appinventor/components/runtime/util/YailList;)V
    .locals 20
    .param p1, "boundingbox"    # Lcom/google/appinventor/components/runtime/util/YailList;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 469
    move-object/from16 v0, p1

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/util/YailList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/appinventor/components/runtime/util/YailList;

    invoke-virtual {v2, v1}, Lcom/google/appinventor/components/runtime/util/YailList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->coerceToDouble(Ljava/lang/Object;)D

    move-result-wide v12

    .line 470
    .local v12, "latNorth":D
    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/util/YailList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/appinventor/components/runtime/util/YailList;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/google/appinventor/components/runtime/util/YailList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->coerceToDouble(Ljava/lang/Object;)D

    move-result-wide v14

    .line 471
    .local v14, "longWest":D
    invoke-virtual {v0, v3}, Lcom/google/appinventor/components/runtime/util/YailList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/appinventor/components/runtime/util/YailList;

    invoke-virtual {v2, v1}, Lcom/google/appinventor/components/runtime/util/YailList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->coerceToDouble(Ljava/lang/Object;)D

    move-result-wide v1

    .line 472
    .local v1, "latSouth":D
    invoke-virtual {v0, v3}, Lcom/google/appinventor/components/runtime/util/YailList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/appinventor/components/runtime/util/YailList;

    invoke-virtual {v4, v3}, Lcom/google/appinventor/components/runtime/util/YailList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->coerceToDouble(Ljava/lang/Object;)D

    move-result-wide v16

    .line 473
    .local v16, "longEast":D
    move-object/from16 v10, p0

    iget-object v11, v10, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    new-instance v8, Lorg/osmdroid/util/BoundingBox;

    move-object v3, v8

    move-wide v4, v12

    move-wide/from16 v6, v16

    move-object v0, v8

    move-wide v8, v1

    move-wide/from16 v18, v1

    move-object v1, v11

    .end local v1    # "latSouth":D
    .local v18, "latSouth":D
    move-wide v10, v14

    invoke-direct/range {v3 .. v11}, Lorg/osmdroid/util/BoundingBox;-><init>(DDDD)V

    invoke-interface {v1, v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->setBoundingBox(Lorg/osmdroid/util/BoundingBox;)V

    .line 474
    return-void
.end method

.method public BoundsChange()V
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
        description = "User has changed the map bounds by panning or zooming the map."
    .end annotation

    .line 664
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "BoundsChange"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 665
    return-void
.end method

.method public CenterFromString(Ljava/lang/String;)V
    .locals 10
    .param p1, "center"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "42.359144, -71.093612"
        editorType = "geographic_point"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "<p>Set the initial center coordinate of the map. The value is specified as a comma-separated pair of decimal latitude and longitude coordinates, for example, <code>42.359144, -71.093612</code>.</p><p>In blocks code, it is recommended for performance reasons to use SetCenter with numerical latitude and longitude rather than convert to the string representation for use with this property.</p>"
    .end annotation

    .line 164
    const-string v0, "%s is not a valid number."

    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 165
    .local v1, "parts":[Ljava/lang/String;
    array-length v2, v1

    const/4 v3, 0x2

    if-eq v2, v3, :cond_0

    .line 166
    sget-object v0, Lcom/google/appinventor/components/runtime/Map;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not a valid point."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->InvalidPoint(Ljava/lang/String;)V

    .line 168
    return-void

    .line 173
    :cond_0
    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_0
    aget-object v4, v1, v3

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 178
    .local v4, "latitude":D
    nop

    .line 180
    :try_start_1
    aget-object v6, v1, v2

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 185
    .local v6, "longitude":D
    nop

    .line 186
    const-wide v8, 0x4056800000000000L    # 90.0

    cmpl-double v0, v4, v8

    if-gtz v0, :cond_4

    const-wide v8, -0x3fa9800000000000L    # -90.0

    cmpg-double v0, v4, v8

    if-gez v0, :cond_1

    goto :goto_1

    .line 188
    :cond_1
    const-wide v8, 0x4066800000000000L    # 180.0

    cmpl-double v0, v6, v8

    if-gtz v0, :cond_3

    const-wide v8, -0x3f99800000000000L    # -180.0

    cmpg-double v0, v6, v8

    if-gez v0, :cond_2

    goto :goto_0

    .line 191
    :cond_2
    sget-object v0, Lcom/google/appinventor/components/runtime/Map;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting center to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, v4, v5, v6, v7}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->setCenter(DD)V

    goto :goto_2

    .line 189
    :cond_3
    :goto_0
    new-array v0, v2, [Ljava/lang/Object;

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v0, v3

    const-string v2, "Longitude %f is out of bounds."

    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->InvalidPoint(Ljava/lang/String;)V

    goto :goto_2

    .line 187
    :cond_4
    :goto_1
    new-array v0, v2, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v0, v3

    const-string v2, "Latitude %f is out of bounds."

    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->InvalidPoint(Ljava/lang/String;)V

    .line 194
    :goto_2
    return-void

    .line 181
    .end local v6    # "longitude":D
    :catch_0
    move-exception v6

    .line 182
    .local v6, "e":Ljava/lang/NumberFormatException;
    sget-object v7, Lcom/google/appinventor/components/runtime/Map;->TAG:Ljava/lang/String;

    new-array v8, v2, [Ljava/lang/Object;

    aget-object v9, v1, v2

    aput-object v9, v8, v3

    invoke-static {v0, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    new-array v7, v2, [Ljava/lang/Object;

    aget-object v2, v1, v2

    aput-object v2, v7, v3

    invoke-static {v0, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->InvalidPoint(Ljava/lang/String;)V

    .line 184
    return-void

    .line 174
    .end local v4    # "latitude":D
    .end local v6    # "e":Ljava/lang/NumberFormatException;
    :catch_1
    move-exception v4

    .line 175
    .local v4, "e":Ljava/lang/NumberFormatException;
    sget-object v5, Lcom/google/appinventor/components/runtime/Map;->TAG:Ljava/lang/String;

    new-array v6, v2, [Ljava/lang/Object;

    aget-object v7, v1, v3

    aput-object v7, v6, v3

    invoke-static {v0, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    new-array v2, v2, [Ljava/lang/Object;

    aget-object v5, v1, v3

    aput-object v5, v2, v3

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->InvalidPoint(Ljava/lang/String;)V

    .line 177
    return-void
.end method

.method public CreateMarker(DD)Lcom/google/appinventor/components/runtime/Marker;
    .locals 1
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Create a new marker with default properties at the specified latitude and longitude."
    .end annotation

    .line 602
    new-instance v0, Lcom/google/appinventor/components/runtime/Marker;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/Marker;-><init>(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureContainer;)V

    .line 603
    .local v0, "marker":Lcom/google/appinventor/components/runtime/Marker;
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/appinventor/components/runtime/Marker;->SetLocation(DD)V

    .line 604
    return-object v0
.end method

.method public DoubleTapAtPoint(DD)V
    .locals 3
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
        description = "The user double-tapped at a point on the map. This event will be followed by a ZoomChanged event if zooming gestures are enabled and the map is not at the highest possible zoom level."
    .end annotation

    .line 709
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v0, v1

    const-string v1, "DoubleTapAtPoint"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 710
    return-void
.end method

.method public EnablePan(Z)V
    .locals 1
    .param p1, "pan"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "True"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 455
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->setPanEnabled(Z)V

    .line 456
    return-void
.end method

.method public EnablePan()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Enable two-finger panning of the Map"
    .end annotation

    .line 464
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->isPanEnabled()Z

    move-result v0

    return v0
.end method

.method public EnableRotation(Z)V
    .locals 1
    .param p1, "rotation"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 437
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->setRotationEnabled(Z)V

    .line 438
    return-void
.end method

.method public EnableRotation()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "If set to true, the user can use multitouch gestures to rotate the map around its current center."
    .end annotation

    .line 449
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->isRotationEnabled()Z

    move-result v0

    return v0
.end method

.method public EnableZoom(Z)V
    .locals 1
    .param p1, "zoom"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "True"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 267
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->setZoomEnabled(Z)V

    .line 268
    return-void
.end method

.method public EnableZoom()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "If this property is set to true, multitouch zoom gestures are allowed on the map. Otherwise, the map zoom cannot be changed by the user except via the zoom control buttons."
    .end annotation

    .line 280
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->isZoomEnabled()Z

    move-result v0

    return v0
.end method

.method public Features()Lcom/google/appinventor/components/runtime/util/YailList;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 493
    invoke-super {p0}, Lcom/google/appinventor/components/runtime/MapFeatureContainerBase;->Features()Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v0

    return-object v0
.end method

.method public InvalidPoint(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
        description = "An invalid coordinate was supplied during a maps operation. The message parameter will have more details about the issue."
    .end annotation

    .line 687
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "InvalidPoint"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 688
    return-void
.end method

.method public Latitude()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The latitude of the center of the map."
    .end annotation

    .line 206
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->getLatitude()D

    move-result-wide v0

    return-wide v0
.end method

.method public LocationSensor()Lcom/google/appinventor/components/runtime/LocationSensor;
    .locals 1

    .line 516
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->sensor:Lcom/google/appinventor/components/runtime/LocationSensor;

    return-object v0
.end method

.method public LocationSensor(Lcom/google/appinventor/components/runtime/LocationSensor;)V
    .locals 2
    .param p1, "sensor"    # Lcom/google/appinventor/components/runtime/LocationSensor;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "component:com.google.appinventor.components.runtime.LocationSensor"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Uses the provided LocationSensor for user location data rather than the built-in location provider."
    .end annotation

    .line 505
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->getLocationListener()Lcom/google/appinventor/components/runtime/LocationSensor$LocationSensorListener;

    move-result-object v0

    .line 506
    .local v0, "listener":Lcom/google/appinventor/components/runtime/LocationSensor$LocationSensorListener;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Map;->sensor:Lcom/google/appinventor/components/runtime/LocationSensor;

    if-eqz v1, :cond_0

    .line 507
    invoke-virtual {v1, v0}, Lcom/google/appinventor/components/runtime/LocationSensor;->removeListener(Lcom/google/appinventor/components/runtime/LocationSensor$LocationSensorListener;)V

    .line 509
    :cond_0
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Map;->sensor:Lcom/google/appinventor/components/runtime/LocationSensor;

    .line 510
    if-eqz p1, :cond_1

    .line 511
    invoke-virtual {p1, v0}, Lcom/google/appinventor/components/runtime/LocationSensor;->addListener(Lcom/google/appinventor/components/runtime/LocationSensor$LocationSensorListener;)V

    .line 513
    :cond_1
    return-void
.end method

.method public LongPressAtPoint(DD)V
    .locals 3
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
        description = "The user long-pressed at a point on the map."
    .end annotation

    .line 720
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v0, v1

    const-string v1, "LongPressAtPoint"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 721
    return-void
.end method

.method public Longitude()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The longitude of the center of the map."
    .end annotation

    .line 219
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->getLongitude()D

    move-result-wide v0

    return-wide v0
.end method

.method public MapType()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The type of tile layer to use as the base of the map. Valid values are: 1 (Roads), 2 (Aerial), 3 (Terrain)"
    .end annotation

    .line 334
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Map;->MapTypeAbstract()Lcom/google/appinventor/components/common/MapType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/appinventor/components/common/MapType;->toUnderlyingValue()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public MapType(I)V
    .locals 1
    .param p1, "type"    # I
        .annotation runtime Lcom/google/appinventor/components/annotations/Options;
            value = Lcom/google/appinventor/components/common/MapType;
        .end annotation
    .end param
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "1"
        editorType = "map_type"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 311
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lcom/google/appinventor/components/common/MapType;->fromUnderlyingValue(Ljava/lang/Integer;)Lcom/google/appinventor/components/common/MapType;

    move-result-object v0

    .line 312
    .local v0, "mapType":Lcom/google/appinventor/components/common/MapType;
    if-eqz v0, :cond_0

    .line 313
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->MapTypeAbstract(Lcom/google/appinventor/components/common/MapType;)V

    .line 315
    :cond_0
    return-void
.end method

.method public MapTypeAbstract()Lcom/google/appinventor/components/common/MapType;
    .locals 1

    .line 342
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->getMapTypeAbstract()Lcom/google/appinventor/components/common/MapType;

    move-result-object v0

    return-object v0
.end method

.method public MapTypeAbstract(Lcom/google/appinventor/components/common/MapType;)V
    .locals 1
    .param p1, "type"    # Lcom/google/appinventor/components/common/MapType;

    .line 350
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->setMapTypeAbstract(Lcom/google/appinventor/components/common/MapType;)V

    .line 351
    return-void
.end method

.method public PanTo(DDI)V
    .locals 8
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D
    .param p5, "zoom"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Pans the map center to the given latitude and longitude and adjust the zoom level to the specified zoom."
    .end annotation

    .line 589
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    move-wide v1, p1

    move-wide v3, p3

    move v5, p5

    invoke-interface/range {v0 .. v7}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->panTo(DDID)V

    .line 590
    return-void
.end method

.method public Ready()V
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
        description = "Map has been initialized and is ready for user interaction."
    .end annotation

    .line 655
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Ready"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 656
    return-void
.end method

.method public Rotation()F
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Sets or gets the rotation of the map in decimal degrees if any"
    .end annotation

    .line 294
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->getRotation()F

    move-result v0

    return v0
.end method

.method public Rotation(F)V
    .locals 1
    .param p1, "rotation"    # F
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "0.0"
        editorType = "float"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 286
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->setRotation(F)V

    .line 287
    return-void
.end method

.method public Save(Ljava/lang/String;)V
    .locals 12
    .param p1, "path"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Save the contents of the Map to the specified path."
    .end annotation

    .line 612
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Map;->features:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 614
    .local v0, "featuresToSave":Ljava/util/List;, "Ljava/util/List<Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;>;"
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "file:/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 624
    :cond_0
    new-instance v1, Lcom/google/appinventor/components/runtime/Map$2;

    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Map;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v4

    const-string v6, "Save"

    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Map;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/appinventor/components/runtime/Form;->DefaultFileScope()Lcom/google/appinventor/components/common/FileScope;

    move-result-object v8

    const/4 v9, 0x0

    const/4 v10, 0x1

    move-object v2, v1

    move-object v3, p0

    move-object v5, p0

    move-object v7, p1

    move-object v11, v0

    invoke-direct/range {v2 .. v11}, Lcom/google/appinventor/components/runtime/Map$2;-><init>(Lcom/google/appinventor/components/runtime/Map;Lcom/google/appinventor/components/runtime/Form;Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;Ljava/lang/String;Lcom/google/appinventor/components/common/FileScope;ZZLjava/util/List;)V

    .line 631
    invoke-virtual {v1}, Lcom/google/appinventor/components/runtime/Map$2;->run()V

    goto :goto_2

    .line 615
    :cond_1
    :goto_0
    const-string v1, "file:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Ljava/io/File;

    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/net/URI;)V

    goto :goto_1

    .line 616
    :cond_2
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :goto_1
    nop

    .line 617
    .local v1, "target":Ljava/io/File;
    new-instance v2, Lcom/google/appinventor/components/runtime/Map$1;

    invoke-direct {v2, p0, v0, v1}, Lcom/google/appinventor/components/runtime/Map$1;-><init>(Lcom/google/appinventor/components/runtime/Map;Ljava/util/List;Ljava/io/File;)V

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/util/AsynchUtil;->runAsynchronously(Ljava/lang/Runnable;)V

    .line 623
    .end local v1    # "target":Ljava/io/File;
    nop

    .line 633
    :goto_2
    return-void
.end method

.method public ScaleUnits()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 555
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Map;->ScaleUnitsAbstract()Lcom/google/appinventor/components/common/ScaleUnits;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/appinventor/components/common/ScaleUnits;->toUnderlyingValue()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public ScaleUnits(I)V
    .locals 5
    .param p1, "units"    # I
        .annotation runtime Lcom/google/appinventor/components/annotations/Options;
            value = Lcom/google/appinventor/components/common/ScaleUnits;
        .end annotation
    .end param
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "1"
        editorType = "map_unit_system"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
    .end annotation

    .line 544
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lcom/google/appinventor/components/common/ScaleUnits;->fromUnderlyingValue(Ljava/lang/Integer;)Lcom/google/appinventor/components/common/ScaleUnits;

    move-result-object v0

    .line 545
    .local v0, "scaleUnits":Lcom/google/appinventor/components/common/ScaleUnits;
    if-nez v0, :cond_0

    .line 546
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/Map;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    .line 547
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 546
    const-string v3, "ScaleUnits"

    const/16 v4, 0xd5d

    invoke-virtual {v1, p0, v3, v4, v2}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 548
    return-void

    .line 550
    :cond_0
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Map;->ScaleUnitsAbstract(Lcom/google/appinventor/components/common/ScaleUnits;)V

    .line 551
    return-void
.end method

.method public ScaleUnitsAbstract()Lcom/google/appinventor/components/common/ScaleUnits;
    .locals 1

    .line 563
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->getScaleUnitsAbstract()Lcom/google/appinventor/components/common/ScaleUnits;

    move-result-object v0

    return-object v0
.end method

.method public ScaleUnitsAbstract(Lcom/google/appinventor/components/common/ScaleUnits;)V
    .locals 1
    .param p1, "units"    # Lcom/google/appinventor/components/common/ScaleUnits;

    .line 571
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->setScaleUnitsAbstract(Lcom/google/appinventor/components/common/ScaleUnits;)V

    .line 572
    return-void
.end method

.method public ShowCompass(Z)V
    .locals 1
    .param p1, "compass"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 363
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->setCompassEnabled(Z)V

    .line 364
    return-void
.end method

.method public ShowCompass()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Show a compass icon rotated based on user orientation."
    .end annotation

    .line 375
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->isCompassEnabled()Z

    move-result v0

    return v0
.end method

.method public ShowScale(Z)V
    .locals 1
    .param p1, "show"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 526
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->setScaleVisible(Z)V

    .line 527
    return-void
.end method

.method public ShowScale()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Shows a scale reference on the map."
    .end annotation

    .line 532
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->isScaleVisible()Z

    move-result v0

    return v0
.end method

.method public ShowUser(Z)V
    .locals 1
    .param p1, "user"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 413
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->setShowUserEnabled(Z)V

    .line 414
    return-void
.end method

.method public ShowUser()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Show the user\'s location on the map."
    .end annotation

    .line 425
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->isShowUserEnabled()Z

    move-result v0

    return v0
.end method

.method public ShowZoom(Z)V
    .locals 1
    .param p1, "zoom"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 387
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->setZoomControlEnabled(Z)V

    .line 388
    return-void
.end method

.method public ShowZoom()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Show zoom buttons on the map."
    .end annotation

    .line 399
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->isZoomControlEnabled()Z

    move-result v0

    return v0
.end method

.method public TapAtPoint(DD)V
    .locals 3
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
        description = "The user tapped at a point on the map."
    .end annotation

    .line 697
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v0, v1

    const-string v1, "TapAtPoint"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 698
    return-void
.end method

.method public UserLatitude()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Returns the user\'s latitude if ShowUser is enabled."
    .end annotation

    .line 577
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->sensor:Lcom/google/appinventor/components/runtime/LocationSensor;

    if-nez v0, :cond_0

    const-wide v0, -0x3f70c80000000000L    # -999.0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/LocationSensor;->Latitude()D

    move-result-wide v0

    :goto_0
    return-wide v0
.end method

.method public UserLongitude()D
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Returns the user\'s longitude if ShowUser is enabled."
    .end annotation

    .line 583
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->sensor:Lcom/google/appinventor/components/runtime/LocationSensor;

    if-nez v0, :cond_0

    const-wide v0, -0x3f70c80000000000L    # -999.0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/LocationSensor;->Longitude()D

    move-result-wide v0

    :goto_0
    return-wide v0
.end method

.method public ZoomChange()V
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
        description = "User has changed the zoom level of the map."
    .end annotation

    .line 673
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "ZoomChange"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 674
    return-void
.end method

.method public ZoomLevel()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The zoom level of the map. Valid values of ZoomLevel are dependent on the tile provider and the latitude and longitude of the map. For example, zoom levels are more constrained over oceans than dense city centers to conserve space for storing tiles, so valid values may be 1-7 over ocean and 1-18 over cities. Tile providers may send warning or error tiles if the zoom level is too great for the server to support."
    .end annotation

    .line 253
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->getZoom()I

    move-result v0

    return v0
.end method

.method public ZoomLevel(I)V
    .locals 1
    .param p1, "zoom"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "13"
        editorType = "map_zoom"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 236
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->setZoom(I)V

    .line 237
    return-void
.end method

.method addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;)V
    .locals 1
    .param p1, "circle"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;

    .line 875
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->features:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 876
    invoke-interface {p1, p0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;->setMap(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureContainer;)V

    .line 877
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;)V

    .line 878
    return-void
.end method

.method addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;)V
    .locals 1
    .param p1, "lineString"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;

    .line 854
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->features:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 855
    invoke-interface {p1, p0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;->setMap(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureContainer;)V

    .line 856
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;)V

    .line 857
    return-void
.end method

.method addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;)V
    .locals 1
    .param p1, "marker"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;

    .line 847
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->features:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 848
    invoke-interface {p1, p0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;->setMap(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureContainer;)V

    .line 849
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;)V

    .line 850
    return-void
.end method

.method addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;)V
    .locals 1
    .param p1, "polygon"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;

    .line 861
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->features:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 862
    invoke-interface {p1, p0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;->setMap(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureContainer;)V

    .line 863
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;)V

    .line 864
    return-void
.end method

.method addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;)V
    .locals 1
    .param p1, "rectangle"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;

    .line 868
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->features:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 869
    invoke-interface {p1, p0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;->setMap(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureContainer;)V

    .line 870
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->addFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;)V

    .line 871
    return-void
.end method

.method public getController()Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;
    .locals 1

    .line 724
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    return-object v0
.end method

.method public getMap()Lcom/google/appinventor/components/runtime/Map;
    .locals 0

    .line 840
    return-object p0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    if-nez v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory;->newMap(Lcom/google/appinventor/components/runtime/Form;)Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    move-result-object v0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    .line 138
    invoke-interface {v0, p0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->addEventListener(Lcom/google/appinventor/components/runtime/util/MapFactory$MapEventListener;)V

    .line 140
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->getView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onBoundsChanged()V
    .locals 2

    .line 740
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/Map$5;

    invoke-direct {v1, p0}, Lcom/google/appinventor/components/runtime/Map$5;-><init>(Lcom/google/appinventor/components/runtime/Map;)V

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 746
    return-void
.end method

.method public onDoubleTap(DD)V
    .locals 8
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .line 770
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    new-instance v7, Lcom/google/appinventor/components/runtime/Map$8;

    move-object v1, v7

    move-object v2, p0

    move-wide v3, p1

    move-wide v5, p3

    invoke-direct/range {v1 .. v6}, Lcom/google/appinventor/components/runtime/Map$8;-><init>(Lcom/google/appinventor/components/runtime/Map;DD)V

    invoke-virtual {v0, v7}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 776
    return-void
.end method

.method public onFeatureClick(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 2
    .param p1, "feature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 790
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/Map$10;

    invoke-direct {v1, p0, p1}, Lcom/google/appinventor/components/runtime/Map$10;-><init>(Lcom/google/appinventor/components/runtime/Map;Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 796
    return-void
.end method

.method public onFeatureDrag(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 2
    .param p1, "feature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 820
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/Map$13;

    invoke-direct {v1, p0, p1}, Lcom/google/appinventor/components/runtime/Map$13;-><init>(Lcom/google/appinventor/components/runtime/Map;Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 826
    return-void
.end method

.method public onFeatureLongPress(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 2
    .param p1, "feature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 800
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/Map$11;

    invoke-direct {v1, p0, p1}, Lcom/google/appinventor/components/runtime/Map$11;-><init>(Lcom/google/appinventor/components/runtime/Map;Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 806
    return-void
.end method

.method public onFeatureStartDrag(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 2
    .param p1, "feature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 810
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/Map$12;

    invoke-direct {v1, p0, p1}, Lcom/google/appinventor/components/runtime/Map$12;-><init>(Lcom/google/appinventor/components/runtime/Map;Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 816
    return-void
.end method

.method public onFeatureStopDrag(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 2
    .param p1, "feature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 830
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/Map$14;

    invoke-direct {v1, p0, p1}, Lcom/google/appinventor/components/runtime/Map$14;-><init>(Lcom/google/appinventor/components/runtime/Map;Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 836
    return-void
.end method

.method public onLongPress(DD)V
    .locals 8
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .line 780
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    new-instance v7, Lcom/google/appinventor/components/runtime/Map$9;

    move-object v1, v7

    move-object v2, p0

    move-wide v3, p1

    move-wide v5, p3

    invoke-direct/range {v1 .. v6}, Lcom/google/appinventor/components/runtime/Map$9;-><init>(Lcom/google/appinventor/components/runtime/Map;DD)V

    invoke-virtual {v0, v7}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 786
    return-void
.end method

.method public onReady(Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;)V
    .locals 2
    .param p1, "map"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    .line 730
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/Map$4;

    invoke-direct {v1, p0}, Lcom/google/appinventor/components/runtime/Map$4;-><init>(Lcom/google/appinventor/components/runtime/Map;)V

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 736
    return-void
.end method

.method public onSingleTap(DD)V
    .locals 8
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .line 760
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    new-instance v7, Lcom/google/appinventor/components/runtime/Map$7;

    move-object v1, v7

    move-object v2, p0

    move-wide v3, p1

    move-wide v5, p3

    invoke-direct/range {v1 .. v6}, Lcom/google/appinventor/components/runtime/Map$7;-><init>(Lcom/google/appinventor/components/runtime/Map;DD)V

    invoke-virtual {v0, v7}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 766
    return-void
.end method

.method public onZoom()V
    .locals 2

    .line 750
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/Map$6;

    invoke-direct {v1, p0}, Lcom/google/appinventor/components/runtime/Map$6;-><init>(Lcom/google/appinventor/components/runtime/Map;)V

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/Form;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 756
    return-void
.end method

.method public removeFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V
    .locals 1
    .param p1, "feature"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;

    .line 882
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->features:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 883
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Map;->mapController:Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;

    invoke-interface {v0, p1}, Lcom/google/appinventor/components/runtime/util/MapFactory$MapController;->removeFeature(Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeature;)V

    .line 884
    return-void
.end method
