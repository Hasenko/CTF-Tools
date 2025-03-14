package androidx.core.widget;

import android.os.Build;
import android.view.View;
import android.widget.ListPopupWindow;

/* loaded from: classes2.dex */
public final class ListPopupWindowCompat {
    private ListPopupWindowCompat() {
    }

    @Deprecated
    public static View.OnTouchListener createDragToOpenListener(Object listPopupWindow, View src) {
        return createDragToOpenListener((ListPopupWindow) listPopupWindow, src);
    }

    public static View.OnTouchListener createDragToOpenListener(ListPopupWindow listPopupWindow, View src) {
        if (Build.VERSION.SDK_INT >= 19) {
            return Api19Impl.createDragToOpenListener(listPopupWindow, src);
        }
        return null;
    }

    static class Api19Impl {
        private Api19Impl() {
        }

        static View.OnTouchListener createDragToOpenListener(ListPopupWindow listPopupWindow, View src) {
            return listPopupWindow.createDragToOpenListener(src);
        }
    }
}
