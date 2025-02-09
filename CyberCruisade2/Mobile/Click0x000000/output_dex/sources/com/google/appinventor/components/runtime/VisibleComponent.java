package com.google.appinventor.components.runtime;

import com.google.appinventor.components.annotations.PropertyCategory;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;

@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public abstract class VisibleComponent implements Component {
    @SimpleProperty(category = PropertyCategory.APPEARANCE)
    public abstract int Height();

    @SimpleProperty
    public abstract void Height(int i);

    @SimpleProperty(category = PropertyCategory.APPEARANCE)
    public abstract void HeightPercent(int i);

    @SimpleProperty(category = PropertyCategory.APPEARANCE)
    public abstract int Width();

    @SimpleProperty
    public abstract void Width(int i);

    @SimpleProperty(category = PropertyCategory.APPEARANCE)
    public abstract void WidthPercent(int i);

    protected VisibleComponent() {
    }
}
