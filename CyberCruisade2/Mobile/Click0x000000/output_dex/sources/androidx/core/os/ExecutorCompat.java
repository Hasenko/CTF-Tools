package androidx.core.os;

import android.os.Handler;
import java.util.concurrent.Executor;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public final class ExecutorCompat {
    public static Executor create(Handler handler) {
        return new HandlerExecutor(handler);
    }

    private ExecutorCompat() {
    }
}
