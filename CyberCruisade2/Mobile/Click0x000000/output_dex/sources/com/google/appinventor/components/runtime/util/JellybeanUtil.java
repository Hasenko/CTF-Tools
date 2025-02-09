package com.google.appinventor.components.runtime.util;

import android.graphics.Point;
import android.view.Display;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class JellybeanUtil {
    private JellybeanUtil() {
    }

    public static void getRealSize(Display display, Point outSize) {
        display.getRealSize(outSize);
    }
}
