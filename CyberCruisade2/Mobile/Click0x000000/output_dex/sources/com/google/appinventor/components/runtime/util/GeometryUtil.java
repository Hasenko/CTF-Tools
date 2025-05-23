package com.google.appinventor.components.runtime.util;

import com.google.appinventor.components.runtime.errors.DispatchableError;
import com.google.appinventor.components.runtime.errors.IterationError;
import com.google.appinventor.components.runtime.util.MapFactory;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.Geometry;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.LinearRing;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.Polygon;
import org.locationtech.jts.geom.PrecisionModel;
import org.osmdroid.api.IGeoPoint;
import org.osmdroid.util.GeoPoint;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public final class GeometryUtil {
    public static final double EARTH_RADIUS = 6378137.0d;
    public static final double ONE_DEG_IN_METERS = 111319.49079327358d;
    public static final int WEB_MERCATOR_SRID = 4326;
    private static final GeometryFactory FACTORY = new GeometryFactory(new PrecisionModel(), WEB_MERCATOR_SRID);

    private GeometryUtil() {
    }

    public static double coerceToDouble(Object o) {
        if (o instanceof Number) {
            return ((Number) o).doubleValue();
        }
        try {
            return Double.parseDouble(o.toString());
        } catch (NumberFormatException e) {
            return Double.NaN;
        }
    }

    public static GeoPoint coerceToPoint(Object lat, Object lng) {
        double latitude = coerceToDouble(lat);
        double longitude = coerceToDouble(lng);
        if (Double.isNaN(latitude)) {
            throw new IllegalArgumentException("Latitude must be a numeric.");
        }
        if (Double.isNaN(longitude)) {
            throw new IllegalArgumentException("Longitude must be a numeric.");
        }
        if (latitude < -90.0d || latitude > 90.0d) {
            throw new IllegalArgumentException("Latitude must be between -90 and 90.");
        }
        if (longitude < -180.0d || longitude > 180.0d) {
            throw new IllegalArgumentException("Longitude must be between -180 and 180.");
        }
        return new GeoPoint(latitude, longitude);
    }

    public static YailList asYailList(IGeoPoint point) {
        return YailList.makeList(new Object[]{Double.valueOf(point.getLatitude()), Double.valueOf(point.getLongitude())});
    }

    public static YailList pointsListToYailList(List<? extends IGeoPoint> points) {
        List<YailList> entries = new ArrayList<>();
        for (IGeoPoint point : points) {
            entries.add(asYailList(point));
        }
        return YailList.makeList((List) entries);
    }

    public static GeoPoint pointFromYailList(YailList point) {
        if (point.length() < 3) {
            throw new DispatchableError(ErrorMessages.ERROR_INVALID_NUMBER_OF_VALUES_IN_POINT, 2, Integer.valueOf(point.length() - 1));
        }
        try {
            return coerceToPoint(point.get(1), point.get(2));
        } catch (IllegalArgumentException e) {
            throw new DispatchableError(ErrorMessages.ERROR_INVALID_POINT, point.get(1), point.get(2));
        }
    }

    public static List<GeoPoint> pointsFromYailList(YailList points) {
        List<GeoPoint> newPoints = new ArrayList<>();
        Iterator<?> it = points.iterator();
        int i = 1;
        it.next();
        while (it.hasNext()) {
            try {
                newPoints.add(pointFromYailList((YailList) TypeUtil.castNotNull(it.next(), YailList.class, "list")));
                i++;
            } catch (DispatchableError e) {
                throw IterationError.fromError(i, e);
            }
        }
        return newPoints;
    }

    public static Geometry createGeometry(GeoPoint point) {
        return FACTORY.createPoint(geoPointToCoordinate(point));
    }

    public static Geometry createGeometry(List<GeoPoint> line) {
        return FACTORY.createLineString(pointsToCoordinates(line));
    }

    public static Geometry createGeometry(double north, double east, double south, double west) {
        return FACTORY.createPolygon(new Coordinate[]{new Coordinate(east, north), new Coordinate(east, south), new Coordinate(west, south), new Coordinate(west, north), new Coordinate(east, north)});
    }

    public static Geometry createGeometry(List<List<GeoPoint>> points, List<List<List<GeoPoint>>> holes) {
        if (points == null) {
            throw new IllegalArgumentException("points must not be null.");
        }
        if (holes != null && !holes.isEmpty() && holes.size() != points.size()) {
            throw new IllegalArgumentException("holes must either be null or the same length as points.");
        }
        Geometry[] geometryArr = new Polygon[points.size()];
        int i = 0;
        if (holes == null || holes.isEmpty()) {
            for (List<GeoPoint> ring : points) {
                geometryArr[i] = ringToPolygon(ring);
                i++;
            }
        } else {
            Iterator<List<GeoPoint>> ip = points.iterator();
            Iterator<List<List<GeoPoint>>> jp = holes.iterator();
            while (ip.hasNext()) {
                geometryArr[i] = ringToPolygon(ip.next(), jp.next());
                i++;
            }
        }
        return geometryArr.length == 1 ? geometryArr[0] : FACTORY.createMultiPolygon(geometryArr);
    }

    public static GeoPoint getMidpoint(List<GeoPoint> points) {
        if (points.isEmpty()) {
            return new GeoPoint(0.0d, 0.0d);
        }
        if (points.size() == 1) {
            return new GeoPoint(points.get(0));
        }
        LineString ls = FACTORY.createLineString(pointsToCoordinates(points));
        return jtsPointToGeoPoint(ls.getCentroid());
    }

    public static GeoPoint getCentroid(List<List<GeoPoint>> points, List<List<List<GeoPoint>>> holes) {
        return jtsPointToGeoPoint(createGeometry(points, holes).getCentroid());
    }

    public static Polygon ringToPolygon(List<GeoPoint> ring) {
        return FACTORY.createPolygon(geoPointsToLinearRing(ring));
    }

    public static Coordinate[] pointsToCoordinates(List<GeoPoint> list) {
        boolean equals = list.get(0).equals(list.get(list.size() - 1));
        Coordinate[] coordinateArr = new Coordinate[list.size() + (!equals ? 1 : 0)];
        int i = 0;
        Iterator<GeoPoint> it = list.iterator();
        while (it.hasNext()) {
            coordinateArr[i] = geoPointToCoordinate(it.next());
            i++;
        }
        if (!equals) {
            coordinateArr[i] = coordinateArr[0];
        }
        return coordinateArr;
    }

    public static LinearRing geoPointsToLinearRing(List<GeoPoint> points) {
        return FACTORY.createLinearRing(pointsToCoordinates(points));
    }

    public static Polygon ringToPolygon(List<GeoPoint> ring, List<List<GeoPoint>> holes) {
        LinearRing shell = geoPointsToLinearRing(ring);
        LinearRing[] holeRings = new LinearRing[holes.size()];
        int i = 0;
        for (List<GeoPoint> h : holes) {
            holeRings[i] = geoPointsToLinearRing(h);
            i++;
        }
        return FACTORY.createPolygon(shell, holeRings);
    }

    public static GeoPoint jtsPointToGeoPoint(Point p) {
        return new GeoPoint(p.getY(), p.getX());
    }

    public static Coordinate geoPointToCoordinate(GeoPoint p) {
        return new Coordinate(p.getLongitude(), p.getLatitude());
    }

    public static double distanceBetween(IGeoPoint a, IGeoPoint b) {
        double lat1 = Math.toRadians(a.getLatitude());
        double lng1 = Math.toRadians(a.getLongitude());
        double lat2 = Math.toRadians(b.getLatitude());
        double lng2 = Math.toRadians(b.getLongitude());
        double dLat = lat2 - lat1;
        double dLng = lng2 - lng1;
        double cordlen = Math.pow(Math.sin(dLat / 2.0d), 2.0d) + (Math.cos(lat1) * Math.cos(lat2) * Math.pow(Math.sin(dLng / 2.0d), 2.0d));
        double sqrt = Math.sqrt(cordlen);
        double lng12 = Math.sqrt(1.0d - cordlen);
        double angle = Math.atan2(sqrt, lng12) * 2.0d;
        return 6378137.0d * angle;
    }

    public static double distanceBetween(MapFactory.MapMarker marker, GeoPoint point) {
        return distanceBetween(marker.getLocation(), (IGeoPoint) point);
    }

    public static double distanceBetween(MapFactory.MapMarker marker1, MapFactory.MapMarker marker2) {
        return distanceBetween(marker1.getLocation(), marker2.getLocation());
    }

    public static double distanceBetweenEdges(MapFactory.MapMarker marker, MapFactory.MapLineString lineString) {
        return marker.getGeometry().distance(lineString.getGeometry()) * 111319.49079327358d;
    }

    public static double distanceBetweenEdges(MapFactory.MapMarker marker, MapFactory.MapPolygon polygon) {
        return marker.getGeometry().distance(polygon.getGeometry()) * 111319.49079327358d;
    }

    public static double distanceBetweenEdges(MapFactory.MapMarker marker, MapFactory.MapCircle circle) {
        double distanceTo = marker.getCentroid().distanceTo(circle.getCentroid());
        double Radius = circle.Radius();
        Double.isNaN(distanceTo);
        double d = distanceTo - Radius;
        if (d < 0.0d) {
            return 0.0d;
        }
        return d;
    }

    public static double distanceBetweenEdges(MapFactory.MapMarker marker, MapFactory.MapRectangle rectangle) {
        return marker.getGeometry().distance(rectangle.getGeometry()) * 111319.49079327358d;
    }

    public static double distanceBetweenEdges(MapFactory.MapLineString lineString, GeoPoint point) {
        return lineString.getGeometry().distance(createGeometry(point)) * 111319.49079327358d;
    }

    public static double distanceBetweenEdges(MapFactory.MapLineString lineString1, MapFactory.MapLineString lineString2) {
        return lineString1.getGeometry().distance(lineString2.getGeometry()) * 111319.49079327358d;
    }

    public static double distanceBetweenEdges(MapFactory.MapLineString lineString, MapFactory.MapPolygon polygon) {
        return lineString.getGeometry().distance(polygon.getGeometry()) * 111319.49079327358d;
    }

    public static double distanceBetweenEdges(MapFactory.MapLineString lineString, MapFactory.MapCircle circle) {
        double d = (lineString.getGeometry().distance(createGeometry(circle.getCentroid())) * 111319.49079327358d) - circle.Radius();
        if (d < 0.0d) {
            return 0.0d;
        }
        return d;
    }

    public static double distanceBetweenEdges(MapFactory.MapLineString lineString, MapFactory.MapRectangle rectangle) {
        return lineString.getGeometry().distance(rectangle.getGeometry()) * 111319.49079327358d;
    }

    public static double distanceBetweenEdges(MapFactory.MapPolygon polygon, GeoPoint point) {
        return polygon.getGeometry().distance(createGeometry(point)) * 111319.49079327358d;
    }

    public static double distanceBetweenEdges(MapFactory.MapPolygon polygon1, MapFactory.MapPolygon polygon2) {
        return polygon1.getGeometry().distance(polygon2.getGeometry()) * 111319.49079327358d;
    }

    public static double distanceBetweenEdges(MapFactory.MapPolygon polygon, MapFactory.MapCircle circle) {
        double d = (polygon.getGeometry().distance(createGeometry(circle.getCentroid())) * 111319.49079327358d) - circle.Radius();
        if (d < 0.0d) {
            return 0.0d;
        }
        return d;
    }

    public static double distanceBetweenEdges(MapFactory.MapPolygon polygon, MapFactory.MapRectangle rectangle) {
        return polygon.getGeometry().distance(rectangle.getGeometry()) * 111319.49079327358d;
    }

    public static double distanceBetweenEdges(MapFactory.MapCircle circle, GeoPoint point) {
        double d = distanceBetween((IGeoPoint) circle.getCentroid(), (IGeoPoint) point) - circle.Radius();
        if (d < 0.0d) {
            return 0.0d;
        }
        return d;
    }

    public static double distanceBetweenEdges(MapFactory.MapCircle circle1, MapFactory.MapCircle circle2) {
        double d = (distanceBetween((IGeoPoint) circle1.getCentroid(), (IGeoPoint) circle2.getCentroid()) - circle1.Radius()) - circle2.Radius();
        if (d < 0.0d) {
            return 0.0d;
        }
        return d;
    }

    public static double distanceBetweenEdges(MapFactory.MapCircle circle, MapFactory.MapRectangle rectangle) {
        double d = (rectangle.getGeometry().distance(createGeometry(circle.getCentroid())) * 111319.49079327358d) - circle.Radius();
        if (d < 0.0d) {
            return 0.0d;
        }
        return d;
    }

    public static double distanceBetweenEdges(MapFactory.MapRectangle rectangle, GeoPoint point) {
        return rectangle.getGeometry().distance(createGeometry(point)) * 111319.49079327358d;
    }

    public static double distanceBetweenEdges(MapFactory.MapRectangle rectangle1, MapFactory.MapRectangle rectangle2) {
        return rectangle1.getGeometry().distance(rectangle2.getGeometry()) * 111319.49079327358d;
    }

    public static double distanceBetweenCentroids(MapFactory.MapMarker marker, MapFactory.MapLineString lineString) {
        return distanceBetween((IGeoPoint) marker.getCentroid(), (IGeoPoint) lineString.getCentroid());
    }

    public static double distanceBetweenCentroids(MapFactory.MapMarker marker, MapFactory.MapPolygon polygon) {
        return distanceBetween((IGeoPoint) marker.getCentroid(), (IGeoPoint) polygon.getCentroid());
    }

    public static double distanceBetweenCentroids(MapFactory.MapMarker marker, MapFactory.MapCircle circle) {
        return distanceBetween((IGeoPoint) marker.getCentroid(), (IGeoPoint) circle.getCentroid());
    }

    public static double distanceBetweenCentroids(MapFactory.MapMarker marker, MapFactory.MapRectangle rectangle) {
        return distanceBetween((IGeoPoint) marker.getCentroid(), (IGeoPoint) rectangle.getCentroid());
    }

    public static double distanceBetweenCentroids(MapFactory.MapLineString lineString, GeoPoint point) {
        return distanceBetween((IGeoPoint) lineString.getCentroid(), (IGeoPoint) point);
    }

    public static double distanceBetweenCentroids(MapFactory.MapLineString lineString1, MapFactory.MapLineString lineString2) {
        return distanceBetween((IGeoPoint) lineString1.getCentroid(), (IGeoPoint) lineString2.getCentroid());
    }

    public static double distanceBetweenCentroids(MapFactory.MapLineString lineString, MapFactory.MapPolygon polygon) {
        return distanceBetween((IGeoPoint) lineString.getCentroid(), (IGeoPoint) polygon.getCentroid());
    }

    public static double distanceBetweenCentroids(MapFactory.MapLineString lineString, MapFactory.MapCircle circle) {
        return distanceBetween((IGeoPoint) lineString.getCentroid(), (IGeoPoint) circle.getCentroid());
    }

    public static double distanceBetweenCentroids(MapFactory.MapLineString lineString, MapFactory.MapRectangle rectangle) {
        return distanceBetween((IGeoPoint) lineString.getCentroid(), (IGeoPoint) rectangle.getCentroid());
    }

    public static double distanceBetweenCentroids(MapFactory.MapPolygon polygon, GeoPoint point) {
        return distanceBetween((IGeoPoint) polygon.getCentroid(), (IGeoPoint) point);
    }

    public static double distanceBetweenCentroids(MapFactory.MapPolygon polygon1, MapFactory.MapPolygon polygon2) {
        return distanceBetween((IGeoPoint) polygon1.getCentroid(), (IGeoPoint) polygon2.getCentroid());
    }

    public static double distanceBetweenCentroids(MapFactory.MapPolygon polygon, MapFactory.MapCircle circle) {
        return distanceBetween((IGeoPoint) polygon.getCentroid(), (IGeoPoint) circle.getCentroid());
    }

    public static double distanceBetweenCentroids(MapFactory.MapPolygon polygon, MapFactory.MapRectangle rectangle) {
        return distanceBetween((IGeoPoint) polygon.getCentroid(), (IGeoPoint) rectangle.getCentroid());
    }

    public static double distanceBetweenCentroids(MapFactory.MapCircle circle, GeoPoint point) {
        return distanceBetween((IGeoPoint) circle.getCentroid(), (IGeoPoint) point);
    }

    public static double distanceBetweenCentroids(MapFactory.MapCircle circle1, MapFactory.MapCircle circle2) {
        return distanceBetween((IGeoPoint) circle1.getCentroid(), (IGeoPoint) circle2.getCentroid());
    }

    public static double distanceBetweenCentroids(MapFactory.MapCircle circle, MapFactory.MapRectangle rectangle) {
        return distanceBetween((IGeoPoint) circle.getCentroid(), (IGeoPoint) rectangle.getCentroid());
    }

    public static double distanceBetweenCentroids(MapFactory.MapRectangle rectangle, GeoPoint point) {
        return distanceBetween((IGeoPoint) rectangle.getCentroid(), (IGeoPoint) point);
    }

    public static double distanceBetweenCentroids(MapFactory.MapRectangle rectangle1, MapFactory.MapRectangle rectangle2) {
        return distanceBetween((IGeoPoint) rectangle1.getCentroid(), (IGeoPoint) rectangle2.getCentroid());
    }

    public static double bearingTo(MapFactory.MapMarker from, MapFactory.MapMarker to) {
        return from.getCentroid().bearingTo(to.getCentroid());
    }

    public static double bearingToEdge(MapFactory.MapMarker from, MapFactory.MapLineString to) {
        return from.getCentroid().bearingTo(to.getCentroid());
    }

    public static double bearingToEdge(MapFactory.MapMarker from, MapFactory.MapPolygon to) {
        return from.getCentroid().bearingTo(to.getCentroid());
    }

    public static double bearingToEdge(MapFactory.MapMarker from, MapFactory.MapRectangle to) {
        return from.getCentroid().bearingTo(to.getCentroid());
    }

    public static double bearingToEdge(MapFactory.MapMarker from, MapFactory.MapCircle to) {
        return from.getCentroid().bearingTo(to.getCentroid());
    }

    public static double bearingToCentroid(MapFactory.MapMarker from, MapFactory.MapLineString to) {
        return from.getCentroid().bearingTo(to.getCentroid());
    }

    public static double bearingToCentroid(MapFactory.MapMarker from, MapFactory.MapPolygon to) {
        return from.getCentroid().bearingTo(to.getCentroid());
    }

    public static double bearingToCentroid(MapFactory.MapMarker from, MapFactory.MapRectangle to) {
        return from.getCentroid().bearingTo(to.getCentroid());
    }

    public static double bearingToCentroid(MapFactory.MapMarker from, MapFactory.MapCircle to) {
        return from.getCentroid().bearingTo(to.getCentroid());
    }

    public static boolean isValidLatitude(double latitude) {
        return -90.0d <= latitude && latitude <= 90.0d;
    }

    public static boolean isValidLongitude(double longitude) {
        return -180.0d <= longitude && longitude <= 180.0d;
    }

    public static List<GeoPoint> polygonToList(JSONArray array) throws JSONException {
        List<GeoPoint> points = new ArrayList<>(array.length());
        if (array.length() < 3) {
            throw new DispatchableError(ErrorMessages.ERROR_POLYGON_PARSE_ERROR, "Too few points in Polygon, expected 3.");
        }
        for (int i = 0; i < array.length(); i++) {
            JSONArray point = array.getJSONArray(i);
            if (point.length() < 2) {
                throw new JSONException("Invalid number of dimensions in polygon, expected 2.");
            }
            if (point.length() == 2) {
                points.add(new GeoPoint(point.getDouble(0), point.getDouble(1)));
            } else {
                points.add(new GeoPoint(point.getDouble(0), point.getDouble(1), point.getDouble(2)));
            }
        }
        return points;
    }

    public static List<List<GeoPoint>> multiPolygonToList(JSONArray array) throws JSONException {
        List<List<GeoPoint>> result = new ArrayList<>();
        if (array.length() == 0) {
            return result;
        }
        if (array.getJSONArray(0).optJSONArray(0) == null) {
            result.add(polygonToList(array));
        } else {
            for (int i = 0; i < array.length(); i++) {
                result.add(polygonToList(array.getJSONArray(i)));
            }
        }
        return result;
    }

    public static YailList multiPolygonToYailList(List<List<GeoPoint>> multipolygon) {
        List<YailList> result = new LinkedList<>();
        for (List<GeoPoint> polygon : multipolygon) {
            result.add(pointsListToYailList(polygon));
        }
        return YailList.makeList((List) result);
    }

    public static List<List<GeoPoint>> multiPolygonFromYailList(YailList list) {
        List<List<GeoPoint>> multipolygon = new ArrayList<>();
        Iterator<?> it = list.listIterator(1);
        while (it.hasNext()) {
            multipolygon.add(pointsFromYailList((YailList) TypeUtil.castNotNull(it.next(), YailList.class, "list")));
        }
        return multipolygon;
    }

    public static List<List<List<GeoPoint>>> multiPolygonHolesFromYailList(YailList points) {
        List<List<List<GeoPoint>>> holes = new ArrayList<>();
        Iterator<?> it = points.listIterator(1);
        int i = 1;
        while (it.hasNext()) {
            try {
                YailList yailHoles = (YailList) TypeUtil.castNotNull(it.next(), YailList.class, "list");
                holes.add(multiPolygonFromYailList(yailHoles));
                i++;
            } catch (DispatchableError e) {
                throw IterationError.fromError(i, e);
            }
        }
        return holes;
    }

    public static List<List<List<GeoPoint>>> multiPolygonHolesToList(JSONArray array) throws JSONException {
        List<List<List<GeoPoint>>> result = new ArrayList<>();
        if (array.getJSONArray(0).getJSONArray(0).optJSONArray(0) == null) {
            result.add(multiPolygonToList(array));
        } else {
            for (int i = 0; i < array.length(); i++) {
                result.add(multiPolygonToList(array.getJSONArray(i)));
            }
        }
        return result;
    }

    public static boolean isPolygon(YailList points) {
        if (points.size() < 3) {
            return false;
        }
        try {
            pointFromYailList((YailList) TypeUtil.castNotNull(points.get(1), YailList.class, "list"));
            return true;
        } catch (DispatchableError e) {
            return false;
        }
    }

    public static boolean isMultiPolygon(YailList points) {
        return points.size() > 0 && isPolygon((YailList) TypeUtil.castNotNull(points.get(1), YailList.class, "list"));
    }
}
