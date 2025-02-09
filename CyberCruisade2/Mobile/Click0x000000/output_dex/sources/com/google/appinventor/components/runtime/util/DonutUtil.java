package com.google.appinventor.components.runtime.util;

import android.graphics.Bitmap;
import android.view.View;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class DonutUtil {
    private DonutUtil() {
    }

    public static void buildDrawingCache(View view, boolean autoScale) {
        view.buildDrawingCache(autoScale);
    }

    public static Bitmap getDrawingCache(View view, boolean autoScale) {
        return view.getDrawingCache(autoScale);
    }
}
