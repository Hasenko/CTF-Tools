package androidx.core.os;

import android.os.Build;
import android.os.Message;

/* loaded from: classes2.dex */
public final class MessageCompat {
    private static boolean sTrySetAsynchronous = true;
    private static boolean sTryIsAsynchronous = true;

    public static void setAsynchronous(Message message, boolean async) {
        if (Build.VERSION.SDK_INT >= 22) {
            Api22Impl.setAsynchronous(message, async);
        } else if (sTrySetAsynchronous && Build.VERSION.SDK_INT >= 16) {
            try {
                Api22Impl.setAsynchronous(message, async);
            } catch (NoSuchMethodError e) {
                sTrySetAsynchronous = false;
            }
        }
    }

    public static boolean isAsynchronous(Message message) {
        if (Build.VERSION.SDK_INT >= 22) {
            return Api22Impl.isAsynchronous(message);
        }
        if (sTryIsAsynchronous && Build.VERSION.SDK_INT >= 16) {
            try {
                return Api22Impl.isAsynchronous(message);
            } catch (NoSuchMethodError e) {
                sTryIsAsynchronous = false;
            }
        }
        return false;
    }

    private MessageCompat() {
    }

    static class Api22Impl {
        private Api22Impl() {
        }

        static boolean isAsynchronous(Message message) {
            return message.isAsynchronous();
        }

        static void setAsynchronous(Message message, boolean async) {
            message.setAsynchronous(async);
        }
    }
}
