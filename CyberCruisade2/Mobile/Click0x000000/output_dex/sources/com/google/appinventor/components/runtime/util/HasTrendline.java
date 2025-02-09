package com.google.appinventor.components.runtime.util;

import android.graphics.DashPathEffect;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.interfaces.datasets.IBarLineScatterCandleBubbleDataSet;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public interface HasTrendline<T extends Entry> extends IBarLineScatterCandleBubbleDataSet<T> {
    int getColor();

    DashPathEffect getDashPathEffect();

    float getLineWidth();

    float[] getPoints(float f, float f2, int i);

    boolean isVisible();
}
