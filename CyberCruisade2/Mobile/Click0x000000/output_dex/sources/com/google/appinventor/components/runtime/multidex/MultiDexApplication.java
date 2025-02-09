package com.google.appinventor.components.runtime.multidex;

import android.app.Application;
import android.content.Context;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class MultiDexApplication extends Application {
    public static boolean installed = false;

    @Override // android.content.ContextWrapper
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        MultiDex.install(this, true);
    }
}
