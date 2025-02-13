package androidx.core.app;

import android.content.Intent;
import androidx.core.util.Consumer;

/* loaded from: classes2.dex */
public interface OnNewIntentProvider {
    void addOnNewIntentListener(Consumer<Intent> consumer);

    void removeOnNewIntentListener(Consumer<Intent> consumer);
}
