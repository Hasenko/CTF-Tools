package androidx.appcompat.widget;

import android.view.View;
import android.view.ViewParent;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;

/* loaded from: classes.dex */
class AppCompatHintHelper {
    static InputConnection onCreateInputConnection(InputConnection ic, EditorInfo outAttrs, View view) {
        if (ic != null && outAttrs.hintText == null) {
            ViewParent parent = view.getParent();
            while (true) {
                if (!(parent instanceof View)) {
                    break;
                }
                if (parent instanceof WithHint) {
                    outAttrs.hintText = ((WithHint) parent).getHint();
                    break;
                }
                parent = parent.getParent();
            }
        }
        return ic;
    }

    private AppCompatHintHelper() {
    }
}
