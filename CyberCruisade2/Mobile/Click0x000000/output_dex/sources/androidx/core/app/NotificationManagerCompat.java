package androidx.core.app;

import android.app.AppOpsManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationChannelGroup;
import android.app.NotificationManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public final class NotificationManagerCompat {
    public static final String ACTION_BIND_SIDE_CHANNEL = "android.support.BIND_NOTIFICATION_SIDE_CHANNEL";
    private static final String CHECK_OP_NO_THROW = "checkOpNoThrow";
    public static final String EXTRA_USE_SIDE_CHANNEL = "android.support.useSideChannel";
    public static final int IMPORTANCE_DEFAULT = 3;
    public static final int IMPORTANCE_HIGH = 4;
    public static final int IMPORTANCE_LOW = 2;
    public static final int IMPORTANCE_MAX = 5;
    public static final int IMPORTANCE_MIN = 1;
    public static final int IMPORTANCE_NONE = 0;
    public static final int IMPORTANCE_UNSPECIFIED = -1000;
    static final int MAX_SIDE_CHANNEL_SDK_VERSION = 19;
    private static final String OP_POST_NOTIFICATION = "OP_POST_NOTIFICATION";
    private static final String SETTING_ENABLED_NOTIFICATION_LISTENERS = "enabled_notification_listeners";
    private static final int SIDE_CHANNEL_RETRY_BASE_INTERVAL_MS = 1000;
    private static final int SIDE_CHANNEL_RETRY_MAX_COUNT = 6;
    private static final String TAG = "NotifManCompat";
    private static String sEnabledNotificationListeners;
    private static SideChannelManager sSideChannelManager;
    private final Context mContext;
    private final NotificationManager mNotificationManager;
    private static final Object sEnabledNotificationListenersLock = new Object();
    private static Set<String> sEnabledNotificationListenerPackages = new HashSet();
    private static final Object sLock = new Object();

    public static NotificationManagerCompat from(Context context) {
        return new NotificationManagerCompat(context);
    }

    private NotificationManagerCompat(Context context) {
        this.mContext = context;
        this.mNotificationManager = (NotificationManager) context.getSystemService("notification");
    }

    public void cancel(int id) {
        cancel(null, id);
    }

    public void cancel(String tag, int id) {
        this.mNotificationManager.cancel(tag, id);
        if (Build.VERSION.SDK_INT <= 19) {
            pushSideChannelQueue(new CancelTask(this.mContext.getPackageName(), id, tag));
        }
    }

    public void cancelAll() {
        this.mNotificationManager.cancelAll();
        if (Build.VERSION.SDK_INT <= 19) {
            pushSideChannelQueue(new CancelTask(this.mContext.getPackageName()));
        }
    }

    public void notify(int id, Notification notification) {
        notify(null, id, notification);
    }

    public void notify(String tag, int id, Notification notification) {
        if (useSideChannelForNotification(notification)) {
            pushSideChannelQueue(new NotifyTask(this.mContext.getPackageName(), id, tag, notification));
            this.mNotificationManager.cancel(tag, id);
        } else {
            this.mNotificationManager.notify(tag, id, notification);
        }
    }

    public boolean areNotificationsEnabled() {
        if (Build.VERSION.SDK_INT >= 24) {
            return this.mNotificationManager.areNotificationsEnabled();
        }
        if (Build.VERSION.SDK_INT < 19) {
            return true;
        }
        AppOpsManager appOps = (AppOpsManager) this.mContext.getSystemService("appops");
        ApplicationInfo appInfo = this.mContext.getApplicationInfo();
        String pkg = this.mContext.getApplicationContext().getPackageName();
        int uid = appInfo.uid;
        try {
            Class<?> appOpsClass = Class.forName(AppOpsManager.class.getName());
            Method checkOpNoThrowMethod = appOpsClass.getMethod(CHECK_OP_NO_THROW, Integer.TYPE, Integer.TYPE, String.class);
            Field opPostNotificationValue = appOpsClass.getDeclaredField(OP_POST_NOTIFICATION);
            int value = ((Integer) opPostNotificationValue.get(Integer.class)).intValue();
            return ((Integer) checkOpNoThrowMethod.invoke(appOps, Integer.valueOf(value), Integer.valueOf(uid), pkg)).intValue() == 0;
        } catch (ClassNotFoundException | IllegalAccessException | NoSuchFieldException | NoSuchMethodException | RuntimeException | InvocationTargetException e) {
            return true;
        }
    }

    public int getImportance() {
        if (Build.VERSION.SDK_INT >= 24) {
            return this.mNotificationManager.getImportance();
        }
        return -1000;
    }

    public void createNotificationChannel(NotificationChannel channel) {
        if (Build.VERSION.SDK_INT >= 26) {
            this.mNotificationManager.createNotificationChannel(channel);
        }
    }

    public void createNotificationChannel(NotificationChannelCompat channel) {
        createNotificationChannel(channel.getNotificationChannel());
    }

    public void createNotificationChannelGroup(NotificationChannelGroup group) {
        if (Build.VERSION.SDK_INT >= 26) {
            this.mNotificationManager.createNotificationChannelGroup(group);
        }
    }

    public void createNotificationChannelGroup(NotificationChannelGroupCompat group) {
        createNotificationChannelGroup(group.getNotificationChannelGroup());
    }

    public void createNotificationChannels(List<NotificationChannel> channels) {
        if (Build.VERSION.SDK_INT >= 26) {
            this.mNotificationManager.createNotificationChannels(channels);
        }
    }

    public void createNotificationChannelsCompat(List<NotificationChannelCompat> channels) {
        if (Build.VERSION.SDK_INT >= 26 && !channels.isEmpty()) {
            List<NotificationChannel> platformChannels = new ArrayList<>(channels.size());
            for (NotificationChannelCompat channel : channels) {
                platformChannels.add(channel.getNotificationChannel());
            }
            this.mNotificationManager.createNotificationChannels(platformChannels);
        }
    }

    public void createNotificationChannelGroups(List<NotificationChannelGroup> groups) {
        if (Build.VERSION.SDK_INT >= 26) {
            this.mNotificationManager.createNotificationChannelGroups(groups);
        }
    }

    public void createNotificationChannelGroupsCompat(List<NotificationChannelGroupCompat> groups) {
        if (Build.VERSION.SDK_INT >= 26 && !groups.isEmpty()) {
            List<NotificationChannelGroup> platformGroups = new ArrayList<>(groups.size());
            for (NotificationChannelGroupCompat group : groups) {
                platformGroups.add(group.getNotificationChannelGroup());
            }
            this.mNotificationManager.createNotificationChannelGroups(platformGroups);
        }
    }

    public void deleteNotificationChannel(String channelId) {
        if (Build.VERSION.SDK_INT >= 26) {
            this.mNotificationManager.deleteNotificationChannel(channelId);
        }
    }

    public void deleteNotificationChannelGroup(String groupId) {
        if (Build.VERSION.SDK_INT >= 26) {
            this.mNotificationManager.deleteNotificationChannelGroup(groupId);
        }
    }

    public void deleteUnlistedNotificationChannels(Collection<String> channelIds) {
        if (Build.VERSION.SDK_INT >= 26) {
            for (NotificationChannel channel : this.mNotificationManager.getNotificationChannels()) {
                if (!channelIds.contains(channel.getId()) && (Build.VERSION.SDK_INT < 30 || !channelIds.contains(channel.getParentChannelId()))) {
                    this.mNotificationManager.deleteNotificationChannel(channel.getId());
                }
            }
        }
    }

    public NotificationChannel getNotificationChannel(String channelId) {
        if (Build.VERSION.SDK_INT >= 26) {
            return this.mNotificationManager.getNotificationChannel(channelId);
        }
        return null;
    }

    public NotificationChannelCompat getNotificationChannelCompat(String channelId) {
        NotificationChannel channel;
        if (Build.VERSION.SDK_INT >= 26 && (channel = getNotificationChannel(channelId)) != null) {
            return new NotificationChannelCompat(channel);
        }
        return null;
    }

    public NotificationChannel getNotificationChannel(String channelId, String conversationId) {
        if (Build.VERSION.SDK_INT >= 30) {
            return this.mNotificationManager.getNotificationChannel(channelId, conversationId);
        }
        return getNotificationChannel(channelId);
    }

    public NotificationChannelCompat getNotificationChannelCompat(String channelId, String conversationId) {
        NotificationChannel channel;
        if (Build.VERSION.SDK_INT >= 26 && (channel = getNotificationChannel(channelId, conversationId)) != null) {
            return new NotificationChannelCompat(channel);
        }
        return null;
    }

    public NotificationChannelGroup getNotificationChannelGroup(String channelGroupId) {
        if (Build.VERSION.SDK_INT >= 28) {
            return this.mNotificationManager.getNotificationChannelGroup(channelGroupId);
        }
        if (Build.VERSION.SDK_INT < 26) {
            return null;
        }
        for (NotificationChannelGroup group : getNotificationChannelGroups()) {
            if (group.getId().equals(channelGroupId)) {
                return group;
            }
        }
        return null;
    }

    public NotificationChannelGroupCompat getNotificationChannelGroupCompat(String channelGroupId) {
        NotificationChannelGroup group;
        if (Build.VERSION.SDK_INT >= 28) {
            NotificationChannelGroup group2 = getNotificationChannelGroup(channelGroupId);
            if (group2 != null) {
                return new NotificationChannelGroupCompat(group2);
            }
            return null;
        }
        if (Build.VERSION.SDK_INT >= 26 && (group = getNotificationChannelGroup(channelGroupId)) != null) {
            return new NotificationChannelGroupCompat(group, getNotificationChannels());
        }
        return null;
    }

    public List<NotificationChannel> getNotificationChannels() {
        if (Build.VERSION.SDK_INT >= 26) {
            return this.mNotificationManager.getNotificationChannels();
        }
        return Collections.emptyList();
    }

    public List<NotificationChannelCompat> getNotificationChannelsCompat() {
        if (Build.VERSION.SDK_INT >= 26) {
            List<NotificationChannel> channels = getNotificationChannels();
            if (!channels.isEmpty()) {
                List<NotificationChannelCompat> channelsCompat = new ArrayList<>(channels.size());
                for (NotificationChannel channel : channels) {
                    channelsCompat.add(new NotificationChannelCompat(channel));
                }
                return channelsCompat;
            }
        }
        return Collections.emptyList();
    }

    public List<NotificationChannelGroup> getNotificationChannelGroups() {
        if (Build.VERSION.SDK_INT >= 26) {
            return this.mNotificationManager.getNotificationChannelGroups();
        }
        return Collections.emptyList();
    }

    public List<NotificationChannelGroupCompat> getNotificationChannelGroupsCompat() {
        List<NotificationChannel> allChannels;
        if (Build.VERSION.SDK_INT >= 26) {
            List<NotificationChannelGroup> groups = getNotificationChannelGroups();
            if (!groups.isEmpty()) {
                if (Build.VERSION.SDK_INT >= 28) {
                    allChannels = Collections.emptyList();
                } else {
                    allChannels = getNotificationChannels();
                }
                List<NotificationChannelGroupCompat> groupsCompat = new ArrayList<>(groups.size());
                for (NotificationChannelGroup group : groups) {
                    if (Build.VERSION.SDK_INT >= 28) {
                        groupsCompat.add(new NotificationChannelGroupCompat(group));
                    } else {
                        groupsCompat.add(new NotificationChannelGroupCompat(group, allChannels));
                    }
                }
                return groupsCompat;
            }
        }
        return Collections.emptyList();
    }

    public static Set<String> getEnabledListenerPackages(Context context) {
        Set<String> set;
        String enabledNotificationListeners = Settings.Secure.getString(context.getContentResolver(), SETTING_ENABLED_NOTIFICATION_LISTENERS);
        synchronized (sEnabledNotificationListenersLock) {
            if (enabledNotificationListeners != null) {
                if (!enabledNotificationListeners.equals(sEnabledNotificationListeners)) {
                    String[] components = enabledNotificationListeners.split(":", -1);
                    Set<String> packageNames = new HashSet<>(components.length);
                    for (String component : components) {
                        ComponentName componentName = ComponentName.unflattenFromString(component);
                        if (componentName != null) {
                            packageNames.add(componentName.getPackageName());
                        }
                    }
                    sEnabledNotificationListenerPackages = packageNames;
                    sEnabledNotificationListeners = enabledNotificationListeners;
                }
            }
            set = sEnabledNotificationListenerPackages;
        }
        return set;
    }

    private static boolean useSideChannelForNotification(Notification notification) {
        Bundle extras = NotificationCompat.getExtras(notification);
        return extras != null && extras.getBoolean(EXTRA_USE_SIDE_CHANNEL);
    }

    private void pushSideChannelQueue(Task task) {
        synchronized (sLock) {
            if (sSideChannelManager == null) {
                sSideChannelManager = new SideChannelManager(this.mContext.getApplicationContext());
            }
            sSideChannelManager.queueTask(task);
        }
    }
}
