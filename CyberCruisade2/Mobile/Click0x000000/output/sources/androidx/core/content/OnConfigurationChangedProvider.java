package androidx.core.content;

import android.content.res.Configuration;
import androidx.core.util.Consumer;

/* loaded from: classes2.dex */
public interface OnConfigurationChangedProvider {
    void addOnConfigurationChangedListener(Consumer<Configuration> consumer);

    void removeOnConfigurationChangedListener(Consumer<Configuration> consumer);
}
