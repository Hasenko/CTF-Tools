package androidx.core.app;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.Log;
import gnu.expr.Declaration;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public final class NavUtils {
    public static final String PARENT_ACTIVITY = "android.support.PARENT_ACTIVITY";
    private static final String TAG = "NavUtils";

    public static boolean shouldUpRecreateTask(Activity sourceActivity, Intent targetIntent) {
        if (Build.VERSION.SDK_INT >= 16) {
            return Api16Impl.shouldUpRecreateTask(sourceActivity, targetIntent);
        }
        String action = sourceActivity.getIntent().getAction();
        return (action == null || action.equals("android.intent.action.MAIN")) ? false : true;
    }

    public static void navigateUpFromSameTask(Activity sourceActivity) {
        Intent upIntent = getParentActivityIntent(sourceActivity);
        if (upIntent == null) {
            throw new IllegalArgumentException("Activity " + sourceActivity.getClass().getSimpleName() + " does not have a parent activity name specified. (Did you forget to add the android.support.PARENT_ACTIVITY <meta-data>  element in your manifest?)");
        }
        navigateUpTo(sourceActivity, upIntent);
    }

    public static void navigateUpTo(Activity sourceActivity, Intent upIntent) {
        if (Build.VERSION.SDK_INT >= 16) {
            Api16Impl.navigateUpTo(sourceActivity, upIntent);
            return;
        }
        upIntent.addFlags(Declaration.PUBLIC_ACCESS);
        sourceActivity.startActivity(upIntent);
        sourceActivity.finish();
    }

    public static Intent getParentActivityIntent(Activity sourceActivity) {
        Intent result;
        if (Build.VERSION.SDK_INT >= 16 && (result = Api16Impl.getParentActivityIntent(sourceActivity)) != null) {
            return result;
        }
        String parentName = getParentActivityName(sourceActivity);
        if (parentName == null) {
            return null;
        }
        ComponentName target = new ComponentName(sourceActivity, parentName);
        try {
            String grandparent = getParentActivityName(sourceActivity, target);
            if (grandparent == null) {
                return Intent.makeMainActivity(target);
            }
            return new Intent().setComponent(target);
        } catch (PackageManager.NameNotFoundException e) {
            Log.e(TAG, "getParentActivityIntent: bad parentActivityName '" + parentName + "' in manifest");
            return null;
        }
    }

    public static Intent getParentActivityIntent(Context context, Class<?> sourceActivityClass) throws PackageManager.NameNotFoundException {
        String parentActivity = getParentActivityName(context, new ComponentName(context, sourceActivityClass));
        if (parentActivity == null) {
            return null;
        }
        ComponentName target = new ComponentName(context, parentActivity);
        String grandparent = getParentActivityName(context, target);
        if (grandparent == null) {
            Intent parentIntent = Intent.makeMainActivity(target);
            return parentIntent;
        }
        Intent parentIntent2 = new Intent().setComponent(target);
        return parentIntent2;
    }

    public static Intent getParentActivityIntent(Context context, ComponentName componentName) throws PackageManager.NameNotFoundException {
        String parentActivity = getParentActivityName(context, componentName);
        if (parentActivity == null) {
            return null;
        }
        ComponentName target = new ComponentName(componentName.getPackageName(), parentActivity);
        String grandparent = getParentActivityName(context, target);
        if (grandparent == null) {
            Intent parentIntent = Intent.makeMainActivity(target);
            return parentIntent;
        }
        Intent parentIntent2 = new Intent().setComponent(target);
        return parentIntent2;
    }

    public static String getParentActivityName(Activity sourceActivity) {
        try {
            return getParentActivityName(sourceActivity, sourceActivity.getComponentName());
        } catch (PackageManager.NameNotFoundException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public static String getParentActivityName(Context context, ComponentName componentName) throws PackageManager.NameNotFoundException {
        int flags;
        String parentActivity;
        String result;
        PackageManager pm = context.getPackageManager();
        if (Build.VERSION.SDK_INT >= 24) {
            flags = 128 | 512;
        } else {
            flags = 128 | 512;
        }
        if (Build.VERSION.SDK_INT >= 29) {
            flags |= 269221888;
        } else if (Build.VERSION.SDK_INT >= 24) {
            flags |= 786432;
        }
        ActivityInfo info = pm.getActivityInfo(componentName, flags);
        if (Build.VERSION.SDK_INT >= 16 && (result = info.parentActivityName) != null) {
            return result;
        }
        if (info.metaData == null || (parentActivity = info.metaData.getString(PARENT_ACTIVITY)) == null) {
            return null;
        }
        if (parentActivity.charAt(0) == '.') {
            return context.getPackageName() + parentActivity;
        }
        return parentActivity;
    }

    private NavUtils() {
    }

    static class Api16Impl {
        private Api16Impl() {
        }

        static boolean shouldUpRecreateTask(Activity activity, Intent targetIntent) {
            return activity.shouldUpRecreateTask(targetIntent);
        }

        static boolean navigateUpTo(Activity activity, Intent upIntent) {
            return activity.navigateUpTo(upIntent);
        }

        static Intent getParentActivityIntent(Activity activity) {
            return activity.getParentActivityIntent();
        }
    }
}
