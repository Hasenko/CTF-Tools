package com.google.appinventor.components.runtime;

import android.app.Activity;
import android.util.Log;
import com.google.appinventor.components.annotations.PropertyCategory;
import com.google.appinventor.components.annotations.SimpleEvent;
import com.google.appinventor.components.annotations.SimpleFunction;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.runtime.util.AsynchUtil;
import com.google.appinventor.components.runtime.util.ErrorMessages;
import com.google.appinventor.components.runtime.util.GeoJSONUtil;
import com.google.appinventor.components.runtime.util.MapFactory;
import com.google.appinventor.components.runtime.util.YailList;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.concurrent.CopyOnWriteArrayList;
import org.json.JSONException;

@SimpleObject
/* loaded from: classes.dex */
public abstract class MapFeatureContainerBase extends AndroidViewComponent implements MapFactory.MapFeatureContainer {
    private static final int ERROR_CODE_IO_EXCEPTION = -2;
    private static final int ERROR_CODE_MALFORMED_GEOJSON = -3;
    private static final int ERROR_CODE_MALFORMED_URL = -1;
    private static final int ERROR_CODE_UNKNOWN_TYPE = -4;
    private static final String ERROR_IO_EXCEPTION = "Unable to download content from URL";
    private static final String ERROR_MALFORMED_GEOJSON = "Malformed GeoJSON response. Expected FeatureCollection as root element.";
    private static final String ERROR_MALFORMED_URL = "The URL is malformed";
    private static final String ERROR_UNKNOWN_TYPE = "Unrecognized/invalid type in JSON object";
    private static final String GEOJSON_FEATURECOLLECTION = "FeatureCollection";
    private static final String GEOJSON_FEATURES = "features";
    private static final String GEOJSON_GEOMETRYCOLLECTION = "GeometryCollection";
    private static final String GEOJSON_TYPE = "type";
    private static final String TAG = MapFeatureContainerBase.class.getSimpleName();
    private final MapFactory.MapFeatureVisitor<Void> featureAdder;
    protected List<MapFactory.MapFeature> features;

    protected MapFeatureContainerBase(ComponentContainer container) {
        super(container);
        this.features = new CopyOnWriteArrayList();
        this.featureAdder = new MapFactory.MapFeatureVisitor<Void>() { // from class: com.google.appinventor.components.runtime.MapFeatureContainerBase.1
            @Override // com.google.appinventor.components.runtime.util.MapFactory.MapFeatureVisitor
            public Void visit(MapFactory.MapMarker marker, Object... arguments) {
                MapFeatureContainerBase.this.addFeature(marker);
                return null;
            }

            @Override // com.google.appinventor.components.runtime.util.MapFactory.MapFeatureVisitor
            public Void visit(MapFactory.MapLineString lineString, Object... arguments) {
                MapFeatureContainerBase.this.addFeature(lineString);
                return null;
            }

            @Override // com.google.appinventor.components.runtime.util.MapFactory.MapFeatureVisitor
            public Void visit(MapFactory.MapPolygon polygon, Object... arguments) {
                MapFeatureContainerBase.this.addFeature(polygon);
                return null;
            }

            @Override // com.google.appinventor.components.runtime.util.MapFactory.MapFeatureVisitor
            public Void visit(MapFactory.MapCircle circle, Object... arguments) {
                MapFeatureContainerBase.this.addFeature(circle);
                return null;
            }

            @Override // com.google.appinventor.components.runtime.util.MapFactory.MapFeatureVisitor
            public Void visit(MapFactory.MapRectangle rectangle, Object... arguments) {
                MapFeatureContainerBase.this.addFeature(rectangle);
                return null;
            }
        };
    }

    @Override // com.google.appinventor.components.runtime.util.MapFactory.MapFeatureContainer
    @SimpleProperty
    public void Features(YailList features) {
        for (MapFactory.MapFeature feature : this.features) {
            feature.removeFromMap();
        }
        this.features.clear();
        ListIterator<?> it = features.listIterator(1);
        while (it.hasNext()) {
            Object o = it.next();
            if (o instanceof MapFactory.MapFeature) {
                addFeature((MapFactory.MapFeature) o);
            }
        }
        getMap().getView().invalidate();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The list of features placed on this %type%. This list also includes any features created by calls to FeatureFromDescription")
    public YailList Features() {
        return YailList.makeList((List) this.features);
    }

    @Override // com.google.appinventor.components.runtime.util.MapFactory.MapFeatureContainer
    @SimpleEvent(description = "The user clicked on a map feature.")
    public void FeatureClick(MapFactory.MapFeature feature) {
        EventDispatcher.dispatchEvent(this, "FeatureClick", feature);
        if (getMap() != this) {
            getMap().FeatureClick(feature);
        }
    }

    @Override // com.google.appinventor.components.runtime.util.MapFactory.MapFeatureContainer
    @SimpleEvent(description = "The user long-pressed on a map feature.")
    public void FeatureLongClick(MapFactory.MapFeature feature) {
        EventDispatcher.dispatchEvent(this, "FeatureLongClick", feature);
        if (getMap() != this) {
            getMap().FeatureLongClick(feature);
        }
    }

    @Override // com.google.appinventor.components.runtime.util.MapFactory.MapFeatureContainer
    @SimpleEvent(description = "The user started dragging a map feature.")
    public void FeatureStartDrag(MapFactory.MapFeature feature) {
        EventDispatcher.dispatchEvent(this, "FeatureStartDrag", feature);
        if (getMap() != this) {
            getMap().FeatureStartDrag(feature);
        }
    }

    @Override // com.google.appinventor.components.runtime.util.MapFactory.MapFeatureContainer
    @SimpleEvent(description = "The user dragged a map feature.")
    public void FeatureDrag(MapFactory.MapFeature feature) {
        EventDispatcher.dispatchEvent(this, "FeatureDrag", feature);
        if (getMap() != this) {
            getMap().FeatureDrag(feature);
        }
    }

    @Override // com.google.appinventor.components.runtime.util.MapFactory.MapFeatureContainer
    @SimpleEvent(description = "The user stopped dragging a map feature.")
    public void FeatureStopDrag(MapFactory.MapFeature feature) {
        EventDispatcher.dispatchEvent(this, "FeatureStopDrag", feature);
        if (getMap() != this) {
            getMap().FeatureStopDrag(feature);
        }
    }

    @SimpleFunction(description = "<p>Load a feature collection in <a href=\"https://en.wikipedia.org/wiki/GeoJSON\">GeoJSON</a> format from the given url. On success, the event GotFeatures will be raised with the given url and a list of the features parsed from the GeoJSON as a list of (key, value) pairs. On failure, the LoadError event will be raised with any applicable HTTP response code and error message.</p>")
    public void LoadFromURL(final String url) {
        AsynchUtil.runAsynchronously(new Runnable() { // from class: com.google.appinventor.components.runtime.MapFeatureContainerBase.2
            @Override // java.lang.Runnable
            public void run() {
                MapFeatureContainerBase.this.performGet(url);
            }
        });
    }

    @SimpleFunction
    public Object FeatureFromDescription(YailList description) {
        try {
            Object feature = GeoJSONUtil.processGeoJSONFeature(TAG, this, description);
            if (feature == null) {
                return "No valid feature provided";
            }
            return feature;
        } catch (IllegalArgumentException e) {
            Log.e(getClass().getSimpleName(), "Unable to create feature", e);
            $form().dispatchErrorOccurredEvent(this, "FeatureFromDescription", ErrorMessages.ERROR_INVALID_GEOJSON, e.getMessage());
            return e.getMessage();
        }
    }

    @SimpleEvent(description = "A GeoJSON document was successfully read from url. The features specified in the document are provided as a list in features.")
    public void GotFeatures(String url, YailList features) {
        if (!EventDispatcher.dispatchEvent(this, "GotFeatures", url, features)) {
            Iterator it = features.iterator();
            it.next();
            while (it.hasNext()) {
                FeatureFromDescription((YailList) it.next());
            }
        }
    }

    @SimpleEvent(description = "An error was encountered while processing a GeoJSON document at the given url. The responseCode parameter will contain an HTTP status code and the errorMessage parameter will contain a detailed error message.")
    public void LoadError(String url, int responseCode, String errorMessage) {
        if (!EventDispatcher.dispatchEvent(this, "LoadError", url, Integer.valueOf(responseCode), errorMessage)) {
            if (url.startsWith("file:")) {
                $form().dispatchErrorOccurredEvent(this, "LoadFromURL", ErrorMessages.ERROR_CANNOT_READ_FILE, url);
            } else {
                $form().dispatchErrorOccurredEvent(this, "LoadFromURL", ErrorMessages.ERROR_WEB_UNABLE_TO_GET, url);
            }
        }
    }

    @Override // com.google.appinventor.components.runtime.ComponentContainer
    public Activity $context() {
        return this.container.$context();
    }

    @Override // com.google.appinventor.components.runtime.ComponentContainer
    public Form $form() {
        return this.container.$form();
    }

    @Override // com.google.appinventor.components.runtime.ComponentContainer
    public void $add(AndroidViewComponent component) {
        throw new UnsupportedOperationException("Map.$add() called");
    }

    @Override // com.google.appinventor.components.runtime.ComponentContainer
    public List<? extends Component> getChildren() {
        return this.features;
    }

    @Override // com.google.appinventor.components.runtime.ComponentContainer
    public void setChildWidth(AndroidViewComponent component, int width) {
        throw new UnsupportedOperationException("Map.setChildWidth called");
    }

    @Override // com.google.appinventor.components.runtime.ComponentContainer
    public void setChildHeight(AndroidViewComponent component, int height) {
        throw new UnsupportedOperationException("Map.setChildHeight called");
    }

    public void removeFeature(MapFactory.MapFeature feature) {
        this.features.remove(feature);
        getMap().removeFeature(feature);
    }

    @Override // com.google.appinventor.components.runtime.util.MapFactory.MapFeatureContainer, java.lang.Iterable
    public Iterator<MapFactory.MapFeature> iterator() {
        return this.features.iterator();
    }

    void addFeature(MapFactory.MapMarker marker) {
        this.features.add(marker);
        getMap().addFeature(marker);
    }

    void addFeature(MapFactory.MapLineString polyline) {
        this.features.add(polyline);
        getMap().addFeature(polyline);
    }

    void addFeature(MapFactory.MapPolygon polygon) {
        this.features.add(polygon);
        getMap().addFeature(polygon);
    }

    void addFeature(MapFactory.MapCircle circle) {
        this.features.add(circle);
        getMap().addFeature(circle);
    }

    void addFeature(MapFactory.MapRectangle rectangle) {
        this.features.add(rectangle);
        getMap().addFeature(rectangle);
    }

    @Override // com.google.appinventor.components.runtime.util.MapFactory.MapFeatureContainer
    public void addFeature(MapFactory.MapFeature feature) {
        feature.accept(this.featureAdder, new Object[0]);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void performGet(String url) {
        try {
            String jsonContent = loadUrl(url);
            if (jsonContent == null) {
                return;
            }
            processGeoJSON(url, jsonContent);
        } catch (Exception e) {
            Log.e(TAG, "Exception retreiving GeoJSON", e);
            $form().dispatchErrorOccurredEvent(this, "LoadFromURL", -4, e.toString());
        }
    }

    private String loadUrl(final String url) {
        try {
            URLConnection connection = new URL(url).openConnection();
            connection.connect();
            if (connection instanceof HttpURLConnection) {
                HttpURLConnection conn = (HttpURLConnection) connection;
                final int responseCode = conn.getResponseCode();
                final String responseMessage = conn.getResponseMessage();
                if (responseCode != 200) {
                    $form().runOnUiThread(new Runnable() { // from class: com.google.appinventor.components.runtime.MapFeatureContainerBase.3
                        @Override // java.lang.Runnable
                        public void run() {
                            MapFeatureContainerBase.this.LoadError(url, responseCode, responseMessage);
                        }
                    });
                    conn.disconnect();
                    return null;
                }
            }
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            StringBuilder content = new StringBuilder();
            while (true) {
                String line = reader.readLine();
                if (line != null) {
                    content.append(line);
                    content.append("\n");
                } else {
                    reader.close();
                    return content.toString();
                }
            }
        } catch (MalformedURLException e) {
            $form().runOnUiThread(new Runnable() { // from class: com.google.appinventor.components.runtime.MapFeatureContainerBase.4
                @Override // java.lang.Runnable
                public void run() {
                    MapFeatureContainerBase.this.LoadError(url, -1, MapFeatureContainerBase.ERROR_MALFORMED_URL);
                }
            });
            return null;
        } catch (IOException e2) {
            $form().runOnUiThread(new Runnable() { // from class: com.google.appinventor.components.runtime.MapFeatureContainerBase.5
                @Override // java.lang.Runnable
                public void run() {
                    MapFeatureContainerBase.this.LoadError(url, -2, MapFeatureContainerBase.ERROR_IO_EXCEPTION);
                }
            });
            return null;
        }
    }

    protected void processGeoJSON(final String url, String content) throws JSONException {
        String type = GeoJSONUtil.getGeoJSONType(content, GEOJSON_TYPE);
        if (!GEOJSON_FEATURECOLLECTION.equals(type) && !GEOJSON_GEOMETRYCOLLECTION.equals(type)) {
            $form().runOnUiThread(new Runnable() { // from class: com.google.appinventor.components.runtime.MapFeatureContainerBase.6
                @Override // java.lang.Runnable
                public void run() {
                    MapFeatureContainerBase.this.LoadError(url, -3, MapFeatureContainerBase.ERROR_MALFORMED_GEOJSON);
                }
            });
        } else {
            final List<YailList> yailFeatures = GeoJSONUtil.getGeoJSONFeatures(TAG, content);
            $form().runOnUiThread(new Runnable() { // from class: com.google.appinventor.components.runtime.MapFeatureContainerBase.7
                @Override // java.lang.Runnable
                public void run() {
                    MapFeatureContainerBase.this.GotFeatures(url, YailList.makeList(yailFeatures));
                }
            });
        }
    }
}
