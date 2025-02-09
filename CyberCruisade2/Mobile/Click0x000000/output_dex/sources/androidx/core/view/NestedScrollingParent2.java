package androidx.core.view;

import android.view.View;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public interface NestedScrollingParent2 extends NestedScrollingParent {
    void onNestedPreScroll(View view, int i, int i2, int[] iArr, int i3);

    void onNestedScroll(View view, int i, int i2, int i3, int i4, int i5);

    void onNestedScrollAccepted(View view, View view2, int i, int i2);

    boolean onStartNestedScroll(View view, View view2, int i, int i2);

    void onStopNestedScroll(View view, int i);
}
