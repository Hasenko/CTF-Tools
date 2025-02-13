package androidx.constraintlayout.solver.widgets;

import androidx.constraintlayout.solver.widgets.ConstraintWidget;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public class ChainHead {
    private boolean mDefined;
    protected ConstraintWidget mFirst;
    protected ConstraintWidget mFirstMatchConstraintWidget;
    protected ConstraintWidget mFirstVisibleWidget;
    protected boolean mHasComplexMatchWeights;
    protected boolean mHasDefinedWeights;
    protected boolean mHasUndefinedWeights;
    protected ConstraintWidget mHead;
    private boolean mIsRtl;
    protected ConstraintWidget mLast;
    protected ConstraintWidget mLastMatchConstraintWidget;
    protected ConstraintWidget mLastVisibleWidget;
    private int mOrientation;
    protected float mTotalWeight = 0.0f;
    protected ArrayList<ConstraintWidget> mWeightedMatchConstraintsWidgets;
    protected int mWidgetsCount;
    protected int mWidgetsMatchCount;

    public ChainHead(ConstraintWidget first, int orientation, boolean isRtl) {
        this.mIsRtl = false;
        this.mFirst = first;
        this.mOrientation = orientation;
        this.mIsRtl = isRtl;
    }

    private static boolean isMatchConstraintEqualityCandidate(ConstraintWidget widget, int orientation) {
        return widget.getVisibility() != 8 && widget.mListDimensionBehaviors[orientation] == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && (widget.mResolvedMatchConstraintDefault[orientation] == 0 || widget.mResolvedMatchConstraintDefault[orientation] == 3);
    }

    private void defineChainProperties() {
        ConstraintWidget next;
        int offset = this.mOrientation * 2;
        ConstraintWidget lastVisited = this.mFirst;
        ConstraintWidget widget = this.mFirst;
        ConstraintWidget constraintWidget = this.mFirst;
        boolean done = false;
        while (true) {
            if (done) {
                break;
            }
            this.mWidgetsCount++;
            widget.mNextChainWidget[this.mOrientation] = null;
            widget.mListNextMatchConstraintsWidget[this.mOrientation] = null;
            if (widget.getVisibility() != 8) {
                if (this.mFirstVisibleWidget == null) {
                    this.mFirstVisibleWidget = widget;
                }
                this.mLastVisibleWidget = widget;
                if (widget.mListDimensionBehaviors[this.mOrientation] == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && (widget.mResolvedMatchConstraintDefault[this.mOrientation] == 0 || widget.mResolvedMatchConstraintDefault[this.mOrientation] == 3 || widget.mResolvedMatchConstraintDefault[this.mOrientation] == 2)) {
                    this.mWidgetsMatchCount++;
                    float weight = widget.mWeight[this.mOrientation];
                    if (weight > 0.0f) {
                        this.mTotalWeight += widget.mWeight[this.mOrientation];
                    }
                    if (isMatchConstraintEqualityCandidate(widget, this.mOrientation)) {
                        if (weight < 0.0f) {
                            this.mHasUndefinedWeights = true;
                        } else {
                            this.mHasDefinedWeights = true;
                        }
                        if (this.mWeightedMatchConstraintsWidgets == null) {
                            this.mWeightedMatchConstraintsWidgets = new ArrayList<>();
                        }
                        this.mWeightedMatchConstraintsWidgets.add(widget);
                    }
                    if (this.mFirstMatchConstraintWidget == null) {
                        this.mFirstMatchConstraintWidget = widget;
                    }
                    ConstraintWidget constraintWidget2 = this.mLastMatchConstraintWidget;
                    if (constraintWidget2 != null) {
                        constraintWidget2.mListNextMatchConstraintsWidget[this.mOrientation] = widget;
                    }
                    this.mLastMatchConstraintWidget = widget;
                }
            }
            if (lastVisited != widget) {
                lastVisited.mNextChainWidget[this.mOrientation] = widget;
            }
            lastVisited = widget;
            ConstraintAnchor nextAnchor = widget.mListAnchors[offset + 1].mTarget;
            if (nextAnchor != null) {
                next = nextAnchor.mOwner;
                if (next.mListAnchors[offset].mTarget == null || next.mListAnchors[offset].mTarget.mOwner != widget) {
                    next = null;
                }
            } else {
                next = null;
            }
            if (next != null) {
                widget = next;
            } else {
                done = true;
            }
        }
        this.mLast = widget;
        if (this.mOrientation == 0 && this.mIsRtl) {
            this.mHead = widget;
        } else {
            this.mHead = this.mFirst;
        }
        this.mHasComplexMatchWeights = this.mHasDefinedWeights && this.mHasUndefinedWeights;
    }

    public ConstraintWidget getFirst() {
        return this.mFirst;
    }

    public ConstraintWidget getFirstVisibleWidget() {
        return this.mFirstVisibleWidget;
    }

    public ConstraintWidget getLast() {
        return this.mLast;
    }

    public ConstraintWidget getLastVisibleWidget() {
        return this.mLastVisibleWidget;
    }

    public ConstraintWidget getHead() {
        return this.mHead;
    }

    public ConstraintWidget getFirstMatchConstraintWidget() {
        return this.mFirstMatchConstraintWidget;
    }

    public ConstraintWidget getLastMatchConstraintWidget() {
        return this.mLastMatchConstraintWidget;
    }

    public float getTotalWeight() {
        return this.mTotalWeight;
    }

    public void define() {
        if (!this.mDefined) {
            defineChainProperties();
        }
        this.mDefined = true;
    }
}
