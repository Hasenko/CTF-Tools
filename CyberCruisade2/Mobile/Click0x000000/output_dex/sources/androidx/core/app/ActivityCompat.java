package androidx.core.app;

import android.app.Activity;
import android.content.Intent;
import android.content.IntentSender;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.DragEvent;
import android.view.View;
import androidx.core.app.ActivityCompat$;
import androidx.core.content.ContextCompat;
import androidx.core.content.LocusIdCompat;
import androidx.core.os.BuildCompat;
import androidx.core.view.DragAndDropPermissionsCompat;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ActivityCompat extends ContextCompat {
    private static PermissionCompatDelegate sDelegate;

    public interface OnRequestPermissionsResultCallback {
        void onRequestPermissionsResult(int i, String[] strArr, int[] iArr);
    }

    public interface PermissionCompatDelegate {
        boolean onActivityResult(Activity activity, int i, int i2, Intent intent);

        boolean requestPermissions(Activity activity, String[] strArr, int i);
    }

    public interface RequestPermissionsRequestCodeValidator {
        void validateRequestPermissionsRequestCode(int i);
    }

    protected ActivityCompat() {
    }

    public static void setPermissionCompatDelegate(PermissionCompatDelegate delegate) {
        sDelegate = delegate;
    }

    public static PermissionCompatDelegate getPermissionCompatDelegate() {
        return sDelegate;
    }

    @Deprecated
    public static boolean invalidateOptionsMenu(Activity activity) {
        activity.invalidateOptionsMenu();
        return true;
    }

    public static void startActivityForResult(Activity activity, Intent intent, int requestCode, Bundle options) {
        if (Build.VERSION.SDK_INT >= 16) {
            Api16Impl.startActivityForResult(activity, intent, requestCode, options);
        } else {
            activity.startActivityForResult(intent, requestCode);
        }
    }

    public static void startIntentSenderForResult(Activity activity, IntentSender intent, int requestCode, Intent fillInIntent, int flagsMask, int flagsValues, int extraFlags, Bundle options) throws IntentSender.SendIntentException {
        if (Build.VERSION.SDK_INT >= 16) {
            Api16Impl.startIntentSenderForResult(activity, intent, requestCode, fillInIntent, flagsMask, flagsValues, extraFlags, options);
        } else {
            activity.startIntentSenderForResult(intent, requestCode, fillInIntent, flagsMask, flagsValues, extraFlags);
        }
    }

    public static void finishAffinity(Activity activity) {
        if (Build.VERSION.SDK_INT >= 16) {
            Api16Impl.finishAffinity(activity);
        } else {
            activity.finish();
        }
    }

    public static void finishAfterTransition(Activity activity) {
        if (Build.VERSION.SDK_INT >= 21) {
            Api21Impl.finishAfterTransition(activity);
        } else {
            activity.finish();
        }
    }

    public static Uri getReferrer(Activity activity) {
        if (Build.VERSION.SDK_INT >= 22) {
            return Api22Impl.getReferrer(activity);
        }
        Intent intent = activity.getIntent();
        Uri referrer = (Uri) intent.getParcelableExtra("android.intent.extra.REFERRER");
        if (referrer != null) {
            return referrer;
        }
        String referrerName = intent.getStringExtra("android.intent.extra.REFERRER_NAME");
        if (referrerName != null) {
            return Uri.parse(referrerName);
        }
        return null;
    }

    public static <T extends View> T requireViewById(Activity activity, int i) {
        if (Build.VERSION.SDK_INT >= 28) {
            return (T) Api28Impl.requireViewById(activity, i);
        }
        T t = (T) activity.findViewById(i);
        if (t == null) {
            throw new IllegalArgumentException("ID does not reference a View inside this Activity");
        }
        return t;
    }

    public static void setEnterSharedElementCallback(Activity activity, SharedElementCallback callback) {
        SharedElementCallback21Impl sharedElementCallback21Impl;
        if (Build.VERSION.SDK_INT >= 21) {
            if (callback != null) {
                sharedElementCallback21Impl = new SharedElementCallback21Impl(callback);
            } else {
                sharedElementCallback21Impl = null;
            }
            Api21Impl.setEnterSharedElementCallback(activity, sharedElementCallback21Impl);
        }
    }

    public static void setExitSharedElementCallback(Activity activity, SharedElementCallback callback) {
        SharedElementCallback21Impl sharedElementCallback21Impl;
        if (Build.VERSION.SDK_INT >= 21) {
            if (callback != null) {
                sharedElementCallback21Impl = new SharedElementCallback21Impl(callback);
            } else {
                sharedElementCallback21Impl = null;
            }
            Api21Impl.setExitSharedElementCallback(activity, sharedElementCallback21Impl);
        }
    }

    public static void postponeEnterTransition(Activity activity) {
        if (Build.VERSION.SDK_INT >= 21) {
            Api21Impl.postponeEnterTransition(activity);
        }
    }

    public static void startPostponedEnterTransition(Activity activity) {
        if (Build.VERSION.SDK_INT >= 21) {
            Api21Impl.startPostponedEnterTransition(activity);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static void requestPermissions(Activity activity, String[] permissions, int requestCode) {
        PermissionCompatDelegate permissionCompatDelegate = sDelegate;
        if (permissionCompatDelegate != null && permissionCompatDelegate.requestPermissions(activity, permissions, requestCode)) {
            return;
        }
        Set<Integer> indicesOfPermissionsToRemove = new HashSet<>();
        for (int i = 0; i < permissions.length; i++) {
            if (TextUtils.isEmpty(permissions[i])) {
                throw new IllegalArgumentException("Permission request for permissions " + Arrays.toString(permissions) + " must not contain null or empty values");
            }
            if (!BuildCompat.isAtLeastT() && TextUtils.equals(permissions[i], "android.permission.POST_NOTIFICATIONS")) {
                indicesOfPermissionsToRemove.add(Integer.valueOf(i));
            }
        }
        int numPermissionsToRemove = indicesOfPermissionsToRemove.size();
        String[] permissionsArray = numPermissionsToRemove > 0 ? new String[permissions.length - numPermissionsToRemove] : permissions;
        if (numPermissionsToRemove > 0) {
            if (numPermissionsToRemove == permissions.length) {
                return;
            }
            int modifiedIndex = 0;
            for (int i2 = 0; i2 < permissions.length; i2++) {
                if (!indicesOfPermissionsToRemove.contains(Integer.valueOf(i2))) {
                    permissionsArray[modifiedIndex] = permissions[i2];
                    modifiedIndex++;
                }
            }
        }
        int i3 = Build.VERSION.SDK_INT;
        if (i3 >= 23) {
            if (activity instanceof RequestPermissionsRequestCodeValidator) {
                ((RequestPermissionsRequestCodeValidator) activity).validateRequestPermissionsRequestCode(requestCode);
            }
            Api23Impl.requestPermissions(activity, permissions, requestCode);
        } else if (activity instanceof OnRequestPermissionsResultCallback) {
            Handler handler = new Handler(Looper.getMainLooper());
            handler.post(new 1(permissionsArray, activity, requestCode));
        }
    }

    public static boolean shouldShowRequestPermissionRationale(Activity activity, String permission) {
        if ((BuildCompat.isAtLeastT() || !TextUtils.equals("android.permission.POST_NOTIFICATIONS", permission)) && Build.VERSION.SDK_INT >= 23) {
            return Api23Impl.shouldShowRequestPermissionRationale(activity, permission);
        }
        return false;
    }

    public static boolean isLaunchedFromBubble(Activity activity) {
        if (Build.VERSION.SDK_INT >= 31) {
            return Api31Impl.isLaunchedFromBubble(activity);
        }
        return Build.VERSION.SDK_INT == 30 ? (Api30Impl.getDisplay(activity) == null || Api30Impl.getDisplay(activity).getDisplayId() == 0) ? false : true : (Build.VERSION.SDK_INT != 29 || activity.getWindowManager().getDefaultDisplay() == null || activity.getWindowManager().getDefaultDisplay().getDisplayId() == 0) ? false : true;
    }

    public static DragAndDropPermissionsCompat requestDragAndDropPermissions(Activity activity, DragEvent dragEvent) {
        return DragAndDropPermissionsCompat.request(activity, dragEvent);
    }

    public static void recreate(Activity activity) {
        if (Build.VERSION.SDK_INT >= 28) {
            activity.recreate();
        } else {
            Handler handler = new Handler(activity.getMainLooper());
            handler.post(new ActivityCompat$.ExternalSyntheticLambda0(activity));
        }
    }

    static /* synthetic */ void lambda$recreate$0(Activity activity) {
        if (!activity.isFinishing() && !ActivityRecreator.recreate(activity)) {
            activity.recreate();
        }
    }

    public static void setLocusContext(Activity activity, LocusIdCompat locusId, Bundle bundle) {
        if (Build.VERSION.SDK_INT >= 30) {
            Api30Impl.setLocusContext(activity, locusId, bundle);
        }
    }
}
