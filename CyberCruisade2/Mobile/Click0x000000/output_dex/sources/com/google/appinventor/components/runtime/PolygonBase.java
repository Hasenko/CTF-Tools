package com.google.appinventor.components.runtime;

import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.runtime.util.MapFactory;

@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public abstract class PolygonBase extends MapFeatureBaseWithFill {
    public PolygonBase(MapFactory.MapFeatureContainer container, MapFactory.MapFeatureVisitor<Double> distanceComputation) {
        super(container, distanceComputation);
    }
}
