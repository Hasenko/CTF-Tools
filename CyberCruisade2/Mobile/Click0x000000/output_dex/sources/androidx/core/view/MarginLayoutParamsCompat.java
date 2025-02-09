package androidx.core.view;

import android.os.Build;
import android.view.ViewGroup;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public final class MarginLayoutParamsCompat {
    public static int getMarginStart(ViewGroup.MarginLayoutParams lp) {
        if (Build.VERSION.SDK_INT >= 17) {
            return Api17Impl.getMarginStart(lp);
        }
        return lp.leftMargin;
    }

    public static int getMarginEnd(ViewGroup.MarginLayoutParams lp) {
        if (Build.VERSION.SDK_INT >= 17) {
            return Api17Impl.getMarginEnd(lp);
        }
        return lp.rightMargin;
    }

    public static void setMarginStart(ViewGroup.MarginLayoutParams lp, int marginStart) {
        if (Build.VERSION.SDK_INT >= 17) {
            Api17Impl.setMarginStart(lp, marginStart);
        } else {
            lp.leftMargin = marginStart;
        }
    }

    public static void setMarginEnd(ViewGroup.MarginLayoutParams lp, int marginEnd) {
        if (Build.VERSION.SDK_INT >= 17) {
            Api17Impl.setMarginEnd(lp, marginEnd);
        } else {
            lp.rightMargin = marginEnd;
        }
    }

    public static boolean isMarginRelative(ViewGroup.MarginLayoutParams lp) {
        if (Build.VERSION.SDK_INT >= 17) {
            return Api17Impl.isMarginRelative(lp);
        }
        return false;
    }

    public static int getLayoutDirection(ViewGroup.MarginLayoutParams lp) {
        int result;
        if (Build.VERSION.SDK_INT >= 17) {
            result = Api17Impl.getLayoutDirection(lp);
        } else {
            result = 0;
        }
        if (result != 0 && result != 1) {
            return 0;
        }
        return result;
    }

    public static void setLayoutDirection(ViewGroup.MarginLayoutParams lp, int layoutDirection) {
        if (Build.VERSION.SDK_INT >= 17) {
            Api17Impl.setLayoutDirection(lp, layoutDirection);
        }
    }

    public static void resolveLayoutDirection(ViewGroup.MarginLayoutParams lp, int layoutDirection) {
        if (Build.VERSION.SDK_INT >= 17) {
            Api17Impl.resolveLayoutDirection(lp, layoutDirection);
        }
    }

    private MarginLayoutParamsCompat() {
    }
}
