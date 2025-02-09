package androidx.core.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.app.Person;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Icon;
import android.media.AudioAttributes;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.widget.RemoteViews;
import androidx.core.R;
import androidx.core.app.NotificationCompat;
import androidx.core.content.LocusIdCompat;
import androidx.core.content.pm.ShortcutInfoCompat;
import androidx.core.graphics.drawable.IconCompat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class NotificationCompat$Builder {
    private static final int MAX_CHARSEQUENCE_LENGTH = 5120;
    public ArrayList<NotificationCompat.Action> mActions;
    boolean mAllowSystemGeneratedContextualActions;
    int mBadgeIcon;
    RemoteViews mBigContentView;
    NotificationCompat.BubbleMetadata mBubbleMetadata;
    String mCategory;
    String mChannelId;
    boolean mChronometerCountDown;
    int mColor;
    boolean mColorized;
    boolean mColorizedSet;
    CharSequence mContentInfo;
    PendingIntent mContentIntent;
    CharSequence mContentText;
    CharSequence mContentTitle;
    RemoteViews mContentView;
    public Context mContext;
    Bundle mExtras;
    int mFgsDeferBehavior;
    PendingIntent mFullScreenIntent;
    int mGroupAlertBehavior;
    String mGroupKey;
    boolean mGroupSummary;
    RemoteViews mHeadsUpContentView;
    ArrayList<NotificationCompat.Action> mInvisibleActions;
    Bitmap mLargeIcon;
    boolean mLocalOnly;
    LocusIdCompat mLocusId;
    Notification mNotification;
    int mNumber;

    @Deprecated
    public ArrayList<String> mPeople;
    public ArrayList<Person> mPersonList;
    int mPriority;
    int mProgress;
    boolean mProgressIndeterminate;
    int mProgressMax;
    Notification mPublicVersion;
    CharSequence[] mRemoteInputHistory;
    CharSequence mSettingsText;
    String mShortcutId;
    boolean mShowWhen;
    boolean mSilent;
    Icon mSmallIcon;
    String mSortKey;
    NotificationCompat.Style mStyle;
    CharSequence mSubText;
    RemoteViews mTickerView;
    long mTimeout;
    boolean mUseChronometer;
    int mVisibility;

    public NotificationCompat$Builder(Context context, Notification notification) {
        this(context, NotificationCompat.getChannelId(notification));
        ArrayList<Person> peopleList;
        Bundle extras = notification.extras;
        NotificationCompat.Style style = NotificationCompat.Style.extractStyleFromNotification(notification);
        setContentTitle(NotificationCompat.getContentTitle(notification)).setContentText(NotificationCompat.getContentText(notification)).setContentInfo(NotificationCompat.getContentInfo(notification)).setSubText(NotificationCompat.getSubText(notification)).setSettingsText(NotificationCompat.getSettingsText(notification)).setStyle(style).setContentIntent(notification.contentIntent).setGroup(NotificationCompat.getGroup(notification)).setGroupSummary(NotificationCompat.isGroupSummary(notification)).setLocusId(NotificationCompat.getLocusId(notification)).setWhen(notification.when).setShowWhen(NotificationCompat.getShowWhen(notification)).setUsesChronometer(NotificationCompat.getUsesChronometer(notification)).setAutoCancel(NotificationCompat.getAutoCancel(notification)).setOnlyAlertOnce(NotificationCompat.getOnlyAlertOnce(notification)).setOngoing(NotificationCompat.getOngoing(notification)).setLocalOnly(NotificationCompat.getLocalOnly(notification)).setLargeIcon(notification.largeIcon).setBadgeIconType(NotificationCompat.getBadgeIconType(notification)).setCategory(NotificationCompat.getCategory(notification)).setBubbleMetadata(NotificationCompat.getBubbleMetadata(notification)).setNumber(notification.number).setTicker(notification.tickerText).setContentIntent(notification.contentIntent).setDeleteIntent(notification.deleteIntent).setFullScreenIntent(notification.fullScreenIntent, NotificationCompat.getHighPriority(notification)).setSound(notification.sound, notification.audioStreamType).setVibrate(notification.vibrate).setLights(notification.ledARGB, notification.ledOnMS, notification.ledOffMS).setDefaults(notification.defaults).setPriority(notification.priority).setColor(NotificationCompat.getColor(notification)).setVisibility(NotificationCompat.getVisibility(notification)).setPublicVersion(NotificationCompat.getPublicVersion(notification)).setSortKey(NotificationCompat.getSortKey(notification)).setTimeoutAfter(NotificationCompat.getTimeoutAfter(notification)).setShortcutId(NotificationCompat.getShortcutId(notification)).setProgress(extras.getInt("android.progressMax"), extras.getInt("android.progress"), extras.getBoolean("android.progressIndeterminate")).setAllowSystemGeneratedContextualActions(NotificationCompat.getAllowSystemGeneratedContextualActions(notification)).setSmallIcon(notification.icon, notification.iconLevel).addExtras(getExtrasWithoutDuplicateData(notification, style));
        if (Build.VERSION.SDK_INT >= 23) {
            this.mSmallIcon = notification.getSmallIcon();
        }
        if (notification.actions != null && notification.actions.length != 0) {
            for (Notification.Action action : notification.actions) {
                addAction(NotificationCompat.Action.Builder.fromAndroidAction(action).build());
            }
        }
        if (Build.VERSION.SDK_INT >= 21) {
            List<NotificationCompat.Action> invisibleActions = NotificationCompat.getInvisibleActions(notification);
            if (!invisibleActions.isEmpty()) {
                for (NotificationCompat.Action invisibleAction : invisibleActions) {
                    addInvisibleAction(invisibleAction);
                }
            }
        }
        String[] people = notification.extras.getStringArray("android.people");
        if (people != null && people.length != 0) {
            for (String person : people) {
                addPerson(person);
            }
        }
        if (Build.VERSION.SDK_INT >= 28 && (peopleList = notification.extras.getParcelableArrayList("android.people.list")) != null && !peopleList.isEmpty()) {
            Iterator<Person> it = peopleList.iterator();
            while (it.hasNext()) {
                Person person2 = it.next();
                addPerson(Person.fromAndroidPerson(person2));
            }
        }
        if (Build.VERSION.SDK_INT >= 24 && extras.containsKey("android.chronometerCountDown")) {
            setChronometerCountDown(extras.getBoolean("android.chronometerCountDown"));
        }
        if (Build.VERSION.SDK_INT >= 26 && extras.containsKey("android.colorized")) {
            setColorized(extras.getBoolean("android.colorized"));
        }
    }

    private static Bundle getExtrasWithoutDuplicateData(Notification notification, NotificationCompat.Style style) {
        if (notification.extras == null) {
            return null;
        }
        Bundle newExtras = new Bundle(notification.extras);
        newExtras.remove("android.title");
        newExtras.remove("android.text");
        newExtras.remove("android.infoText");
        newExtras.remove("android.subText");
        newExtras.remove("android.intent.extra.CHANNEL_ID");
        newExtras.remove("android.intent.extra.CHANNEL_GROUP_ID");
        newExtras.remove("android.showWhen");
        newExtras.remove("android.progress");
        newExtras.remove("android.progressMax");
        newExtras.remove("android.progressIndeterminate");
        newExtras.remove("android.chronometerCountDown");
        newExtras.remove("android.colorized");
        newExtras.remove("android.people.list");
        newExtras.remove("android.people");
        newExtras.remove("android.support.sortKey");
        newExtras.remove("android.support.groupKey");
        newExtras.remove("android.support.isGroupSummary");
        newExtras.remove("android.support.localOnly");
        newExtras.remove("android.support.actionExtras");
        Bundle carExtenderExtras = newExtras.getBundle("android.car.EXTENSIONS");
        if (carExtenderExtras != null) {
            Bundle carExtenderExtras2 = new Bundle(carExtenderExtras);
            carExtenderExtras2.remove("invisible_actions");
            newExtras.putBundle("android.car.EXTENSIONS", carExtenderExtras2);
        }
        if (style != null) {
            style.clearCompatExtraKeys(newExtras);
        }
        return newExtras;
    }

    public NotificationCompat$Builder(Context context, String channelId) {
        this.mActions = new ArrayList<>();
        this.mPersonList = new ArrayList<>();
        this.mInvisibleActions = new ArrayList<>();
        this.mShowWhen = true;
        this.mLocalOnly = false;
        this.mColor = 0;
        this.mVisibility = 0;
        this.mBadgeIcon = 0;
        this.mGroupAlertBehavior = 0;
        this.mFgsDeferBehavior = 0;
        Notification notification = new Notification();
        this.mNotification = notification;
        this.mContext = context;
        this.mChannelId = channelId;
        notification.when = System.currentTimeMillis();
        this.mNotification.audioStreamType = -1;
        this.mPriority = 0;
        this.mPeople = new ArrayList<>();
        this.mAllowSystemGeneratedContextualActions = true;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    public NotificationCompat$Builder(Context context) {
        this(context, (String) null);
    }

    public NotificationCompat$Builder setWhen(long when) {
        this.mNotification.when = when;
        return this;
    }

    public NotificationCompat$Builder setShowWhen(boolean show) {
        this.mShowWhen = show;
        return this;
    }

    public NotificationCompat$Builder setSmallIcon(IconCompat icon) {
        this.mSmallIcon = icon.toIcon(this.mContext);
        return this;
    }

    public NotificationCompat$Builder setUsesChronometer(boolean b) {
        this.mUseChronometer = b;
        return this;
    }

    public NotificationCompat$Builder setChronometerCountDown(boolean countsDown) {
        this.mChronometerCountDown = countsDown;
        getExtras().putBoolean("android.chronometerCountDown", countsDown);
        return this;
    }

    public NotificationCompat$Builder setSmallIcon(int icon) {
        this.mNotification.icon = icon;
        return this;
    }

    public NotificationCompat$Builder setSmallIcon(int icon, int level) {
        this.mNotification.icon = icon;
        this.mNotification.iconLevel = level;
        return this;
    }

    @Deprecated
    public NotificationCompat$Builder setNotificationSilent() {
        this.mSilent = true;
        return this;
    }

    public NotificationCompat$Builder setSilent(boolean silent) {
        this.mSilent = silent;
        return this;
    }

    public NotificationCompat$Builder setContentTitle(CharSequence title) {
        this.mContentTitle = limitCharSequenceLength(title);
        return this;
    }

    public NotificationCompat$Builder setContentText(CharSequence text) {
        this.mContentText = limitCharSequenceLength(text);
        return this;
    }

    public NotificationCompat$Builder setSubText(CharSequence text) {
        this.mSubText = limitCharSequenceLength(text);
        return this;
    }

    public NotificationCompat$Builder setSettingsText(CharSequence text) {
        this.mSettingsText = limitCharSequenceLength(text);
        return this;
    }

    public NotificationCompat$Builder setRemoteInputHistory(CharSequence[] text) {
        this.mRemoteInputHistory = text;
        return this;
    }

    public NotificationCompat$Builder setNumber(int number) {
        this.mNumber = number;
        return this;
    }

    public NotificationCompat$Builder setContentInfo(CharSequence info) {
        this.mContentInfo = limitCharSequenceLength(info);
        return this;
    }

    public NotificationCompat$Builder setProgress(int max, int progress, boolean indeterminate) {
        this.mProgressMax = max;
        this.mProgress = progress;
        this.mProgressIndeterminate = indeterminate;
        return this;
    }

    public NotificationCompat$Builder setContent(RemoteViews views) {
        this.mNotification.contentView = views;
        return this;
    }

    public NotificationCompat$Builder setContentIntent(PendingIntent intent) {
        this.mContentIntent = intent;
        return this;
    }

    public NotificationCompat$Builder setDeleteIntent(PendingIntent intent) {
        this.mNotification.deleteIntent = intent;
        return this;
    }

    public NotificationCompat$Builder setFullScreenIntent(PendingIntent intent, boolean highPriority) {
        this.mFullScreenIntent = intent;
        setFlag(128, highPriority);
        return this;
    }

    public NotificationCompat$Builder setTicker(CharSequence tickerText) {
        this.mNotification.tickerText = limitCharSequenceLength(tickerText);
        return this;
    }

    @Deprecated
    public NotificationCompat$Builder setTicker(CharSequence tickerText, RemoteViews views) {
        this.mNotification.tickerText = limitCharSequenceLength(tickerText);
        this.mTickerView = views;
        return this;
    }

    public NotificationCompat$Builder setLargeIcon(Bitmap icon) {
        this.mLargeIcon = reduceLargeIconSize(icon);
        return this;
    }

    private Bitmap reduceLargeIconSize(Bitmap icon) {
        if (icon == null || Build.VERSION.SDK_INT >= 27) {
            return icon;
        }
        Resources res = this.mContext.getResources();
        int maxWidth = res.getDimensionPixelSize(R.dimen.compat_notification_large_icon_max_width);
        int maxHeight = res.getDimensionPixelSize(R.dimen.compat_notification_large_icon_max_height);
        if (icon.getWidth() <= maxWidth && icon.getHeight() <= maxHeight) {
            return icon;
        }
        double d = maxWidth;
        double max = Math.max(1, icon.getWidth());
        Double.isNaN(d);
        Double.isNaN(max);
        double d2 = d / max;
        double d3 = maxHeight;
        double max2 = Math.max(1, icon.getHeight());
        Double.isNaN(d3);
        Double.isNaN(max2);
        double scale = Math.min(d2, d3 / max2);
        double width = icon.getWidth();
        Double.isNaN(width);
        int ceil = (int) Math.ceil(width * scale);
        double height = icon.getHeight();
        Double.isNaN(height);
        return Bitmap.createScaledBitmap(icon, ceil, (int) Math.ceil(height * scale), true);
    }

    public NotificationCompat$Builder setSound(Uri sound) {
        this.mNotification.sound = sound;
        this.mNotification.audioStreamType = -1;
        if (Build.VERSION.SDK_INT >= 21) {
            this.mNotification.audioAttributes = new AudioAttributes.Builder().setContentType(4).setUsage(5).build();
        }
        return this;
    }

    public NotificationCompat$Builder setSound(Uri sound, int streamType) {
        this.mNotification.sound = sound;
        this.mNotification.audioStreamType = streamType;
        if (Build.VERSION.SDK_INT >= 21) {
            this.mNotification.audioAttributes = new AudioAttributes.Builder().setContentType(4).setLegacyStreamType(streamType).build();
        }
        return this;
    }

    public NotificationCompat$Builder setVibrate(long[] pattern) {
        this.mNotification.vibrate = pattern;
        return this;
    }

    public NotificationCompat$Builder setLights(int argb, int onMs, int offMs) {
        this.mNotification.ledARGB = argb;
        this.mNotification.ledOnMS = onMs;
        this.mNotification.ledOffMS = offMs;
        boolean showLights = (this.mNotification.ledOnMS == 0 || this.mNotification.ledOffMS == 0) ? false : true;
        Notification notification = this.mNotification;
        notification.flags = (showLights ? 1 : 0) | (notification.flags & (-2));
        return this;
    }

    public NotificationCompat$Builder setOngoing(boolean ongoing) {
        setFlag(2, ongoing);
        return this;
    }

    public NotificationCompat$Builder setColorized(boolean colorize) {
        this.mColorized = colorize;
        this.mColorizedSet = true;
        return this;
    }

    public NotificationCompat$Builder setOnlyAlertOnce(boolean onlyAlertOnce) {
        setFlag(8, onlyAlertOnce);
        return this;
    }

    public NotificationCompat$Builder setAutoCancel(boolean autoCancel) {
        setFlag(16, autoCancel);
        return this;
    }

    public NotificationCompat$Builder setLocalOnly(boolean b) {
        this.mLocalOnly = b;
        return this;
    }

    public NotificationCompat$Builder setCategory(String category) {
        this.mCategory = category;
        return this;
    }

    public NotificationCompat$Builder setDefaults(int defaults) {
        this.mNotification.defaults = defaults;
        if ((defaults & 4) != 0) {
            this.mNotification.flags |= 1;
        }
        return this;
    }

    private void setFlag(int mask, boolean value) {
        if (value) {
            this.mNotification.flags |= mask;
        } else {
            this.mNotification.flags &= mask ^ (-1);
        }
    }

    public NotificationCompat$Builder setPriority(int pri) {
        this.mPriority = pri;
        return this;
    }

    @Deprecated
    public NotificationCompat$Builder addPerson(String uri) {
        if (uri != null && !uri.isEmpty()) {
            this.mPeople.add(uri);
        }
        return this;
    }

    public NotificationCompat$Builder addPerson(Person person) {
        if (person != null) {
            this.mPersonList.add(person);
        }
        return this;
    }

    public NotificationCompat$Builder clearPeople() {
        this.mPersonList.clear();
        this.mPeople.clear();
        return this;
    }

    public NotificationCompat$Builder setGroup(String groupKey) {
        this.mGroupKey = groupKey;
        return this;
    }

    public NotificationCompat$Builder setGroupSummary(boolean isGroupSummary) {
        this.mGroupSummary = isGroupSummary;
        return this;
    }

    public NotificationCompat$Builder setSortKey(String sortKey) {
        this.mSortKey = sortKey;
        return this;
    }

    public NotificationCompat$Builder addExtras(Bundle extras) {
        if (extras != null) {
            Bundle bundle = this.mExtras;
            if (bundle == null) {
                this.mExtras = new Bundle(extras);
            } else {
                bundle.putAll(extras);
            }
        }
        return this;
    }

    public NotificationCompat$Builder setExtras(Bundle extras) {
        this.mExtras = extras;
        return this;
    }

    public Bundle getExtras() {
        if (this.mExtras == null) {
            this.mExtras = new Bundle();
        }
        return this.mExtras;
    }

    public NotificationCompat$Builder addAction(int icon, CharSequence title, PendingIntent intent) {
        this.mActions.add(new NotificationCompat.Action(icon, title, intent));
        return this;
    }

    public NotificationCompat$Builder addAction(NotificationCompat.Action action) {
        if (action != null) {
            this.mActions.add(action);
        }
        return this;
    }

    public NotificationCompat$Builder clearActions() {
        this.mActions.clear();
        return this;
    }

    public NotificationCompat$Builder addInvisibleAction(int icon, CharSequence title, PendingIntent intent) {
        this.mInvisibleActions.add(new NotificationCompat.Action(icon, title, intent));
        return this;
    }

    public NotificationCompat$Builder addInvisibleAction(NotificationCompat.Action action) {
        if (action != null) {
            this.mInvisibleActions.add(action);
        }
        return this;
    }

    public NotificationCompat$Builder clearInvisibleActions() {
        this.mInvisibleActions.clear();
        Bundle carExtenderBundle = this.mExtras.getBundle("android.car.EXTENSIONS");
        if (carExtenderBundle != null) {
            Bundle carExtenderBundle2 = new Bundle(carExtenderBundle);
            carExtenderBundle2.remove("invisible_actions");
            this.mExtras.putBundle("android.car.EXTENSIONS", carExtenderBundle2);
        }
        return this;
    }

    public NotificationCompat$Builder setStyle(NotificationCompat.Style style) {
        if (this.mStyle != style) {
            this.mStyle = style;
            if (style != null) {
                style.setBuilder(this);
            }
        }
        return this;
    }

    public NotificationCompat$Builder setColor(int argb) {
        this.mColor = argb;
        return this;
    }

    public NotificationCompat$Builder setVisibility(int visibility) {
        this.mVisibility = visibility;
        return this;
    }

    public NotificationCompat$Builder setPublicVersion(Notification n) {
        this.mPublicVersion = n;
        return this;
    }

    private boolean useExistingRemoteView() {
        NotificationCompat.Style style = this.mStyle;
        return style == null || !style.displayCustomViewInline();
    }

    public RemoteViews createContentView() {
        RemoteViews styleView;
        if (this.mContentView != null && useExistingRemoteView()) {
            return this.mContentView;
        }
        NotificationCompatBuilder compatBuilder = new NotificationCompatBuilder(this);
        NotificationCompat.Style style = this.mStyle;
        if (style != null && (styleView = style.makeContentView(compatBuilder)) != null) {
            return styleView;
        }
        Notification notification = compatBuilder.build();
        if (Build.VERSION.SDK_INT >= 24) {
            return Notification.Builder.recoverBuilder(this.mContext, notification).createContentView();
        }
        return notification.contentView;
    }

    public RemoteViews createBigContentView() {
        RemoteViews styleView;
        if (Build.VERSION.SDK_INT < 16) {
            return null;
        }
        if (this.mBigContentView != null && useExistingRemoteView()) {
            return this.mBigContentView;
        }
        NotificationCompatBuilder compatBuilder = new NotificationCompatBuilder(this);
        NotificationCompat.Style style = this.mStyle;
        if (style != null && (styleView = style.makeBigContentView(compatBuilder)) != null) {
            return styleView;
        }
        Notification notification = compatBuilder.build();
        if (Build.VERSION.SDK_INT >= 24) {
            return Notification.Builder.recoverBuilder(this.mContext, notification).createBigContentView();
        }
        return notification.bigContentView;
    }

    public RemoteViews createHeadsUpContentView() {
        RemoteViews styleView;
        if (Build.VERSION.SDK_INT < 21) {
            return null;
        }
        if (this.mHeadsUpContentView != null && useExistingRemoteView()) {
            return this.mHeadsUpContentView;
        }
        NotificationCompatBuilder compatBuilder = new NotificationCompatBuilder(this);
        NotificationCompat.Style style = this.mStyle;
        if (style != null && (styleView = style.makeHeadsUpContentView(compatBuilder)) != null) {
            return styleView;
        }
        Notification notification = compatBuilder.build();
        if (Build.VERSION.SDK_INT >= 24) {
            Notification.Builder platformBuilder = Notification.Builder.recoverBuilder(this.mContext, notification);
            return platformBuilder.createHeadsUpContentView();
        }
        return notification.headsUpContentView;
    }

    public NotificationCompat$Builder setCustomContentView(RemoteViews contentView) {
        this.mContentView = contentView;
        return this;
    }

    public NotificationCompat$Builder setCustomBigContentView(RemoteViews contentView) {
        this.mBigContentView = contentView;
        return this;
    }

    public NotificationCompat$Builder setCustomHeadsUpContentView(RemoteViews contentView) {
        this.mHeadsUpContentView = contentView;
        return this;
    }

    public NotificationCompat$Builder setChannelId(String channelId) {
        this.mChannelId = channelId;
        return this;
    }

    public NotificationCompat$Builder setTimeoutAfter(long durationMs) {
        this.mTimeout = durationMs;
        return this;
    }

    public NotificationCompat$Builder setShortcutId(String shortcutId) {
        this.mShortcutId = shortcutId;
        return this;
    }

    public NotificationCompat$Builder setShortcutInfo(ShortcutInfoCompat shortcutInfo) {
        if (shortcutInfo == null) {
            return this;
        }
        this.mShortcutId = shortcutInfo.getId();
        if (this.mLocusId == null) {
            if (shortcutInfo.getLocusId() != null) {
                this.mLocusId = shortcutInfo.getLocusId();
            } else if (shortcutInfo.getId() != null) {
                this.mLocusId = new LocusIdCompat(shortcutInfo.getId());
            }
        }
        if (this.mContentTitle == null) {
            setContentTitle(shortcutInfo.getShortLabel());
        }
        return this;
    }

    public NotificationCompat$Builder setLocusId(LocusIdCompat locusId) {
        this.mLocusId = locusId;
        return this;
    }

    public NotificationCompat$Builder setBadgeIconType(int icon) {
        this.mBadgeIcon = icon;
        return this;
    }

    public NotificationCompat$Builder setGroupAlertBehavior(int groupAlertBehavior) {
        this.mGroupAlertBehavior = groupAlertBehavior;
        return this;
    }

    public NotificationCompat$Builder setForegroundServiceBehavior(int behavior) {
        this.mFgsDeferBehavior = behavior;
        return this;
    }

    public NotificationCompat$Builder setBubbleMetadata(NotificationCompat.BubbleMetadata data) {
        this.mBubbleMetadata = data;
        return this;
    }

    public NotificationCompat$Builder extend(NotificationCompat.Extender extender) {
        extender.extend(this);
        return this;
    }

    public NotificationCompat$Builder setAllowSystemGeneratedContextualActions(boolean allowed) {
        this.mAllowSystemGeneratedContextualActions = allowed;
        return this;
    }

    @Deprecated
    public Notification getNotification() {
        return build();
    }

    public Notification build() {
        return new NotificationCompatBuilder(this).build();
    }

    protected static CharSequence limitCharSequenceLength(CharSequence cs) {
        if (cs == null) {
            return cs;
        }
        if (cs.length() > MAX_CHARSEQUENCE_LENGTH) {
            return cs.subSequence(0, MAX_CHARSEQUENCE_LENGTH);
        }
        return cs;
    }

    public RemoteViews getContentView() {
        return this.mContentView;
    }

    public RemoteViews getBigContentView() {
        return this.mBigContentView;
    }

    public RemoteViews getHeadsUpContentView() {
        return this.mHeadsUpContentView;
    }

    public long getWhenIfShowing() {
        if (this.mShowWhen) {
            return this.mNotification.when;
        }
        return 0L;
    }

    public int getPriority() {
        return this.mPriority;
    }

    public int getForegroundServiceBehavior() {
        return this.mFgsDeferBehavior;
    }

    public int getColor() {
        return this.mColor;
    }

    public NotificationCompat.BubbleMetadata getBubbleMetadata() {
        return this.mBubbleMetadata;
    }
}
