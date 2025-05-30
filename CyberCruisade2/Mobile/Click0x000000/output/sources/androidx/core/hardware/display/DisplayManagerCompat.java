package androidx.core.hardware.display;

import android.content.Context;
import android.hardware.display.DisplayManager;
import android.os.Build;
import android.view.Display;
import android.view.WindowManager;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public final class DisplayManagerCompat {
    public static final String DISPLAY_CATEGORY_PRESENTATION = "android.hardware.display.category.PRESENTATION";
    private static final WeakHashMap<Context, DisplayManagerCompat> sInstances = new WeakHashMap<>();
    private final Context mContext;

    private DisplayManagerCompat(Context context) {
        this.mContext = context;
    }

    public static DisplayManagerCompat getInstance(Context context) {
        DisplayManagerCompat instance;
        WeakHashMap<Context, DisplayManagerCompat> weakHashMap = sInstances;
        synchronized (weakHashMap) {
            instance = weakHashMap.get(context);
            if (instance == null) {
                instance = new DisplayManagerCompat(context);
                weakHashMap.put(context, instance);
            }
        }
        return instance;
    }

    public Display getDisplay(int displayId) {
        if (Build.VERSION.SDK_INT >= 17) {
            return Api17Impl.getDisplay((DisplayManager) this.mContext.getSystemService("display"), displayId);
        }
        Display display = ((WindowManager) this.mContext.getSystemService("window")).getDefaultDisplay();
        if (display.getDisplayId() == displayId) {
            return display;
        }
        return null;
    }

    public Display[] getDisplays() {
        if (Build.VERSION.SDK_INT >= 17) {
            return Api17Impl.getDisplays((DisplayManager) this.mContext.getSystemService("display"));
        }
        Display display = ((WindowManager) this.mContext.getSystemService("window")).getDefaultDisplay();
        return new Display[]{display};
    }

    public Display[] getDisplays(String category) {
        if (Build.VERSION.SDK_INT >= 17) {
            return Api17Impl.getDisplays((DisplayManager) this.mContext.getSystemService("display"));
        }
        if (category == null) {
            return new Display[0];
        }
        Display display = ((WindowManager) this.mContext.getSystemService("window")).getDefaultDisplay();
        return new Display[]{display};
    }

    static class Api17Impl {
        private Api17Impl() {
        }

        static Display getDisplay(DisplayManager displayManager, int displayId) {
            return displayManager.getDisplay(displayId);
        }

        static Display[] getDisplays(DisplayManager displayManager) {
            return displayManager.getDisplays();
        }
    }
}
