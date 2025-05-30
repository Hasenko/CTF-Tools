package androidx.fragment.app;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TabHost;
import android.widget.TabWidget;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public class FragmentTabHost extends TabHost implements TabHost.OnTabChangeListener {
    private boolean mAttached;
    private int mContainerId;
    private Context mContext;
    private FragmentManager mFragmentManager;
    private TabInfo mLastTab;
    private TabHost.OnTabChangeListener mOnTabChangeListener;
    private FrameLayout mRealTabContent;
    private final ArrayList<TabInfo> mTabs;

    static final class TabInfo {
        final Bundle args;
        final Class<?> clss;
        Fragment fragment;
        final String tag;

        TabInfo(String _tag, Class<?> _class, Bundle _args) {
            this.tag = _tag;
            this.clss = _class;
            this.args = _args;
        }
    }

    static class DummyTabFactory implements TabHost.TabContentFactory {
        private final Context mContext;

        public DummyTabFactory(Context context) {
            this.mContext = context;
        }

        @Override // android.widget.TabHost.TabContentFactory
        public View createTabContent(String tag) {
            View v = new View(this.mContext);
            v.setMinimumWidth(0);
            v.setMinimumHeight(0);
            return v;
        }
    }

    static class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: androidx.fragment.app.FragmentTabHost.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };
        String curTab;

        SavedState(Parcelable superState) {
            super(superState);
        }

        SavedState(Parcel in) {
            super(in);
            this.curTab = in.readString();
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeString(this.curTab);
        }

        public String toString() {
            return "FragmentTabHost.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " curTab=" + this.curTab + "}";
        }
    }

    public FragmentTabHost(Context context) {
        super(context, null);
        this.mTabs = new ArrayList<>();
        initFragmentTabHost(context, null);
    }

    public FragmentTabHost(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mTabs = new ArrayList<>();
        initFragmentTabHost(context, attrs);
    }

    private void initFragmentTabHost(Context context, AttributeSet attrs) {
        TypedArray a = context.obtainStyledAttributes(attrs, new int[]{R.attr.inflatedId}, 0, 0);
        this.mContainerId = a.getResourceId(0, 0);
        a.recycle();
        super.setOnTabChangedListener(this);
    }

    private void ensureHierarchy(Context context) {
        if (findViewById(R.id.tabs) == null) {
            LinearLayout ll = new LinearLayout(context);
            ll.setOrientation(1);
            addView(ll, new FrameLayout.LayoutParams(-1, -1));
            TabWidget tw = new TabWidget(context);
            tw.setId(R.id.tabs);
            tw.setOrientation(0);
            ll.addView(tw, new LinearLayout.LayoutParams(-1, -2, 0.0f));
            FrameLayout fl = new FrameLayout(context);
            fl.setId(R.id.tabcontent);
            ll.addView(fl, new LinearLayout.LayoutParams(0, 0, 0.0f));
            FrameLayout fl2 = new FrameLayout(context);
            this.mRealTabContent = fl2;
            fl2.setId(this.mContainerId);
            ll.addView(fl2, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        }
    }

    @Override // android.widget.TabHost
    @Deprecated
    public void setup() {
        throw new IllegalStateException("Must call setup() that takes a Context and FragmentManager");
    }

    public void setup(Context context, FragmentManager manager) {
        ensureHierarchy(context);
        super.setup();
        this.mContext = context;
        this.mFragmentManager = manager;
        ensureContent();
    }

    public void setup(Context context, FragmentManager manager, int containerId) {
        ensureHierarchy(context);
        super.setup();
        this.mContext = context;
        this.mFragmentManager = manager;
        this.mContainerId = containerId;
        ensureContent();
        this.mRealTabContent.setId(containerId);
        if (getId() == -1) {
            setId(R.id.tabhost);
        }
    }

    private void ensureContent() {
        if (this.mRealTabContent == null) {
            FrameLayout frameLayout = (FrameLayout) findViewById(this.mContainerId);
            this.mRealTabContent = frameLayout;
            if (frameLayout == null) {
                throw new IllegalStateException("No tab content FrameLayout found for id " + this.mContainerId);
            }
        }
    }

    @Override // android.widget.TabHost
    public void setOnTabChangedListener(TabHost.OnTabChangeListener l) {
        this.mOnTabChangeListener = l;
    }

    public void addTab(TabHost.TabSpec tabSpec, Class<?> clss, Bundle args) {
        tabSpec.setContent(new DummyTabFactory(this.mContext));
        String tag = tabSpec.getTag();
        TabInfo info = new TabInfo(tag, clss, args);
        if (this.mAttached) {
            info.fragment = this.mFragmentManager.findFragmentByTag(tag);
            if (info.fragment != null && !info.fragment.isDetached()) {
                FragmentTransaction ft = this.mFragmentManager.beginTransaction();
                ft.detach(info.fragment);
                ft.commit();
            }
        }
        this.mTabs.add(info);
        addTab(tabSpec);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        String currentTag = getCurrentTabTag();
        FragmentTransaction ft = null;
        int count = this.mTabs.size();
        for (int i = 0; i < count; i++) {
            TabInfo tab = this.mTabs.get(i);
            tab.fragment = this.mFragmentManager.findFragmentByTag(tab.tag);
            if (tab.fragment != null && !tab.fragment.isDetached()) {
                if (tab.tag.equals(currentTag)) {
                    this.mLastTab = tab;
                } else {
                    if (ft == null) {
                        ft = this.mFragmentManager.beginTransaction();
                    }
                    ft.detach(tab.fragment);
                }
            }
        }
        this.mAttached = true;
        FragmentTransaction ft2 = doTabChanged(currentTag, ft);
        if (ft2 != null) {
            ft2.commit();
            this.mFragmentManager.executePendingTransactions();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mAttached = false;
    }

    @Override // android.view.View
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState ss = new SavedState(superState);
        ss.curTab = getCurrentTabTag();
        return ss;
    }

    @Override // android.view.View
    protected void onRestoreInstanceState(Parcelable state) {
        if (!(state instanceof SavedState)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        setCurrentTabByTag(ss.curTab);
    }

    @Override // android.widget.TabHost.OnTabChangeListener
    public void onTabChanged(String tabId) {
        FragmentTransaction ft;
        if (this.mAttached && (ft = doTabChanged(tabId, null)) != null) {
            ft.commit();
        }
        TabHost.OnTabChangeListener onTabChangeListener = this.mOnTabChangeListener;
        if (onTabChangeListener != null) {
            onTabChangeListener.onTabChanged(tabId);
        }
    }

    private FragmentTransaction doTabChanged(String tag, FragmentTransaction ft) {
        TabInfo newTab = getTabInfoForTag(tag);
        if (this.mLastTab != newTab) {
            if (ft == null) {
                ft = this.mFragmentManager.beginTransaction();
            }
            TabInfo tabInfo = this.mLastTab;
            if (tabInfo != null && tabInfo.fragment != null) {
                ft.detach(this.mLastTab.fragment);
            }
            if (newTab != null) {
                if (newTab.fragment == null) {
                    newTab.fragment = Fragment.instantiate(this.mContext, newTab.clss.getName(), newTab.args);
                    ft.add(this.mContainerId, newTab.fragment, newTab.tag);
                } else {
                    ft.attach(newTab.fragment);
                }
            }
            this.mLastTab = newTab;
        }
        return ft;
    }

    private TabInfo getTabInfoForTag(String tabId) {
        int count = this.mTabs.size();
        for (int i = 0; i < count; i++) {
            TabInfo tab = this.mTabs.get(i);
            if (tab.tag.equals(tabId)) {
                return tab;
            }
        }
        return null;
    }
}
