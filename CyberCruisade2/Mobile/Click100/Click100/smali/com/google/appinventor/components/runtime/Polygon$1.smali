.class Lcom/google/appinventor/components/runtime/Polygon$1;
.super Ljava/lang/Object;
.source "Polygon.java"

# interfaces
.implements Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureVisitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/appinventor/components/runtime/Polygon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/appinventor/components/runtime/util/MapFactory$MapFeatureVisitor<",
        "Ljava/lang/Double;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;[Ljava/lang/Object;)Ljava/lang/Double;
    .locals 2
    .param p1, "circle"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;
    .param p2, "arguments"    # [Ljava/lang/Object;

    .line 96
    const/4 v0, 0x1

    aget-object v0, p2, v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 97
    aget-object v0, p2, v1

    check-cast v0, Lcom/google/appinventor/components/runtime/Polygon;

    invoke-static {v0, p1}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->distanceBetweenCentroids(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0

    .line 99
    :cond_0
    aget-object v0, p2, v1

    check-cast v0, Lcom/google/appinventor/components/runtime/Polygon;

    invoke-static {v0, p1}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->distanceBetweenEdges(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public varargs visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;[Ljava/lang/Object;)Ljava/lang/Double;
    .locals 2
    .param p1, "lineString"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;
    .param p2, "arguments"    # [Ljava/lang/Object;

    .line 78
    const/4 v0, 0x1

    aget-object v0, p2, v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 79
    aget-object v0, p2, v1

    check-cast v0, Lcom/google/appinventor/components/runtime/Polygon;

    invoke-static {p1, v0}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->distanceBetweenCentroids(Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0

    .line 81
    :cond_0
    aget-object v0, p2, v1

    check-cast v0, Lcom/google/appinventor/components/runtime/Polygon;

    invoke-static {p1, v0}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->distanceBetweenEdges(Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public varargs visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;[Ljava/lang/Object;)Ljava/lang/Double;
    .locals 2
    .param p1, "marker"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;
    .param p2, "arguments"    # [Ljava/lang/Object;

    .line 69
    const/4 v0, 0x1

    aget-object v0, p2, v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 70
    aget-object v0, p2, v1

    check-cast v0, Lcom/google/appinventor/components/runtime/Polygon;

    invoke-static {p1, v0}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->distanceBetweenCentroids(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0

    .line 72
    :cond_0
    aget-object v0, p2, v1

    check-cast v0, Lcom/google/appinventor/components/runtime/Polygon;

    invoke-static {p1, v0}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->distanceBetweenEdges(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public varargs visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;[Ljava/lang/Object;)Ljava/lang/Double;
    .locals 2
    .param p1, "polygon"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;
    .param p2, "arguments"    # [Ljava/lang/Object;

    .line 87
    const/4 v0, 0x1

    aget-object v0, p2, v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 88
    aget-object v0, p2, v1

    check-cast v0, Lcom/google/appinventor/components/runtime/Polygon;

    invoke-static {p1, v0}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->distanceBetweenCentroids(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0

    .line 90
    :cond_0
    aget-object v0, p2, v1

    check-cast v0, Lcom/google/appinventor/components/runtime/Polygon;

    invoke-static {p1, v0}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->distanceBetweenEdges(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public varargs visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;[Ljava/lang/Object;)Ljava/lang/Double;
    .locals 2
    .param p1, "rectangle"    # Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;
    .param p2, "arguments"    # [Ljava/lang/Object;

    .line 105
    const/4 v0, 0x1

    aget-object v0, p2, v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 106
    aget-object v0, p2, v1

    check-cast v0, Lcom/google/appinventor/components/runtime/Polygon;

    invoke-static {v0, p1}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->distanceBetweenCentroids(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0

    .line 108
    :cond_0
    aget-object v0, p2, v1

    check-cast v0, Lcom/google/appinventor/components/runtime/Polygon;

    invoke-static {v0, p1}, Lcom/google/appinventor/components/runtime/util/GeometryUtil;->distanceBetweenEdges(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 66
    invoke-virtual {p0, p1, p2}, Lcom/google/appinventor/components/runtime/Polygon$1;->visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapCircle;[Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 66
    invoke-virtual {p0, p1, p2}, Lcom/google/appinventor/components/runtime/Polygon$1;->visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapLineString;[Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 66
    invoke-virtual {p0, p1, p2}, Lcom/google/appinventor/components/runtime/Polygon$1;->visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapMarker;[Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 66
    invoke-virtual {p0, p1, p2}, Lcom/google/appinventor/components/runtime/Polygon$1;->visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapPolygon;[Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 66
    invoke-virtual {p0, p1, p2}, Lcom/google/appinventor/components/runtime/Polygon$1;->visit(Lcom/google/appinventor/components/runtime/util/MapFactory$MapRectangle;[Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object p1

    return-object p1
.end method
