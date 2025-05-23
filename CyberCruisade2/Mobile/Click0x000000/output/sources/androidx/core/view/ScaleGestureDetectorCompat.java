package androidx.core.view;

import android.os.Build;
import android.view.ScaleGestureDetector;

/* loaded from: classes2.dex */
public final class ScaleGestureDetectorCompat {
    private ScaleGestureDetectorCompat() {
    }

    @Deprecated
    public static void setQuickScaleEnabled(Object scaleGestureDetector, boolean enabled) {
        setQuickScaleEnabled((ScaleGestureDetector) scaleGestureDetector, enabled);
    }

    public static void setQuickScaleEnabled(ScaleGestureDetector scaleGestureDetector, boolean enabled) {
        if (Build.VERSION.SDK_INT >= 19) {
            Api19Impl.setQuickScaleEnabled(scaleGestureDetector, enabled);
        }
    }

    @Deprecated
    public static boolean isQuickScaleEnabled(Object scaleGestureDetector) {
        return isQuickScaleEnabled((ScaleGestureDetector) scaleGestureDetector);
    }

    public static boolean isQuickScaleEnabled(ScaleGestureDetector scaleGestureDetector) {
        if (Build.VERSION.SDK_INT >= 19) {
            return Api19Impl.isQuickScaleEnabled(scaleGestureDetector);
        }
        return false;
    }

    static class Api19Impl {
        private Api19Impl() {
        }

        static void setQuickScaleEnabled(ScaleGestureDetector scaleGestureDetector, boolean scales) {
            scaleGestureDetector.setQuickScaleEnabled(scales);
        }

        static boolean isQuickScaleEnabled(ScaleGestureDetector scaleGestureDetector) {
            return scaleGestureDetector.isQuickScaleEnabled();
        }
    }
}
