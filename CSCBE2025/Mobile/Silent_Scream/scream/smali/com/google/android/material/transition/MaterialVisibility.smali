.class abstract Lcom/google/android/material/transition/MaterialVisibility;
.super Landroidx/transition/Visibility;
.source "MaterialVisibility.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P::",
        "Lcom/google/android/material/transition/VisibilityAnimatorProvider;",
        ">",
        "Landroidx/transition/Visibility;"
    }
.end annotation


# instance fields
.field private final additionalAnimatorProviders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/material/transition/VisibilityAnimatorProvider;",
            ">;"
        }
    .end annotation
.end field

.field private final primaryAnimatorProvider:Lcom/google/android/material/transition/VisibilityAnimatorProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field

.field private secondaryAnimatorProvider:Lcom/google/android/material/transition/VisibilityAnimatorProvider;


# direct methods
.method protected constructor <init>(Lcom/google/android/material/transition/VisibilityAnimatorProvider;Lcom/google/android/material/transition/VisibilityAnimatorProvider;)V
    .locals 1
    .param p2, "secondaryAnimatorProvider"    # Lcom/google/android/material/transition/VisibilityAnimatorProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;",
            "Lcom/google/android/material/transition/VisibilityAnimatorProvider;",
            ")V"
        }
    .end annotation

    .line 43
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    .local p1, "primaryAnimatorProvider":Lcom/google/android/material/transition/VisibilityAnimatorProvider;, "TP;"
    invoke-direct {p0}, Landroidx/transition/Visibility;-><init>()V

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/transition/MaterialVisibility;->additionalAnimatorProviders:Ljava/util/List;

    .line 44
    iput-object p1, p0, Lcom/google/android/material/transition/MaterialVisibility;->primaryAnimatorProvider:Lcom/google/android/material/transition/VisibilityAnimatorProvider;

    .line 45
    iput-object p2, p0, Lcom/google/android/material/transition/MaterialVisibility;->secondaryAnimatorProvider:Lcom/google/android/material/transition/VisibilityAnimatorProvider;

    .line 46
    return-void
.end method

.method private static addAnimatorIfNeeded(Ljava/util/List;Lcom/google/android/material/transition/VisibilityAnimatorProvider;Landroid/view/ViewGroup;Landroid/view/View;Z)V
    .locals 1
    .param p1, "animatorProvider"    # Lcom/google/android/material/transition/VisibilityAnimatorProvider;
    .param p2, "sceneRoot"    # Landroid/view/ViewGroup;
    .param p3, "view"    # Landroid/view/View;
    .param p4, "appearing"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;",
            "Lcom/google/android/material/transition/VisibilityAnimatorProvider;",
            "Landroid/view/ViewGroup;",
            "Landroid/view/View;",
            "Z)V"
        }
    .end annotation

    .line 147
    .local p0, "animators":Ljava/util/List;, "Ljava/util/List<Landroid/animation/Animator;>;"
    if-nez p1, :cond_0

    .line 148
    return-void

    .line 151
    :cond_0
    if-eqz p4, :cond_1

    .line 152
    invoke-interface {p1, p2, p3}, Lcom/google/android/material/transition/VisibilityAnimatorProvider;->createAppear(Landroid/view/ViewGroup;Landroid/view/View;)Landroid/animation/Animator;

    move-result-object v0

    goto :goto_0

    .line 153
    :cond_1
    invoke-interface {p1, p2, p3}, Lcom/google/android/material/transition/VisibilityAnimatorProvider;->createDisappear(Landroid/view/ViewGroup;Landroid/view/View;)Landroid/animation/Animator;

    move-result-object v0

    :goto_0
    nop

    .line 154
    .local v0, "animator":Landroid/animation/Animator;
    if-eqz v0, :cond_2

    .line 155
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    :cond_2
    return-void
.end method

.method private createAnimator(Landroid/view/ViewGroup;Landroid/view/View;Z)Landroid/animation/Animator;
    .locals 4
    .param p1, "sceneRoot"    # Landroid/view/ViewGroup;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "appearing"    # Z

    .line 124
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 125
    .local v0, "set":Landroid/animation/AnimatorSet;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .local v1, "animators":Ljava/util/List;, "Ljava/util/List<Landroid/animation/Animator;>;"
    iget-object v2, p0, Lcom/google/android/material/transition/MaterialVisibility;->primaryAnimatorProvider:Lcom/google/android/material/transition/VisibilityAnimatorProvider;

    invoke-static {v1, v2, p1, p2, p3}, Lcom/google/android/material/transition/MaterialVisibility;->addAnimatorIfNeeded(Ljava/util/List;Lcom/google/android/material/transition/VisibilityAnimatorProvider;Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 129
    iget-object v2, p0, Lcom/google/android/material/transition/MaterialVisibility;->secondaryAnimatorProvider:Lcom/google/android/material/transition/VisibilityAnimatorProvider;

    invoke-static {v1, v2, p1, p2, p3}, Lcom/google/android/material/transition/MaterialVisibility;->addAnimatorIfNeeded(Ljava/util/List;Lcom/google/android/material/transition/VisibilityAnimatorProvider;Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 131
    iget-object v2, p0, Lcom/google/android/material/transition/MaterialVisibility;->additionalAnimatorProviders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/material/transition/VisibilityAnimatorProvider;

    .line 132
    .local v3, "additionalAnimatorProvider":Lcom/google/android/material/transition/VisibilityAnimatorProvider;
    invoke-static {v1, v3, p1, p2, p3}, Lcom/google/android/material/transition/MaterialVisibility;->addAnimatorIfNeeded(Ljava/util/List;Lcom/google/android/material/transition/VisibilityAnimatorProvider;Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 133
    .end local v3    # "additionalAnimatorProvider":Lcom/google/android/material/transition/VisibilityAnimatorProvider;
    goto :goto_0

    .line 135
    :cond_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, v2, p3}, Lcom/google/android/material/transition/MaterialVisibility;->maybeApplyThemeValues(Landroid/content/Context;Z)V

    .line 137
    invoke-static {v0, v1}, Lcom/google/android/material/animation/AnimatorSetCompat;->playTogether(Landroid/animation/AnimatorSet;Ljava/util/List;)V

    .line 138
    return-object v0
.end method

.method private maybeApplyThemeValues(Landroid/content/Context;Z)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appearing"    # Z

    .line 160
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    invoke-virtual {p0, p2}, Lcom/google/android/material/transition/MaterialVisibility;->getDurationThemeAttrResId(Z)I

    move-result v0

    invoke-static {p0, p1, v0}, Lcom/google/android/material/transition/TransitionUtils;->maybeApplyThemeDuration(Landroidx/transition/Transition;Landroid/content/Context;I)Z

    .line 161
    nop

    .line 162
    invoke-virtual {p0, p2}, Lcom/google/android/material/transition/MaterialVisibility;->getEasingThemeAttrResId(Z)I

    move-result v0

    invoke-virtual {p0, p2}, Lcom/google/android/material/transition/MaterialVisibility;->getDefaultEasingInterpolator(Z)Landroid/animation/TimeInterpolator;

    move-result-object v1

    .line 161
    invoke-static {p0, p1, v0, v1}, Lcom/google/android/material/transition/TransitionUtils;->maybeApplyThemeInterpolator(Landroidx/transition/Transition;Landroid/content/Context;ILandroid/animation/TimeInterpolator;)Z

    .line 163
    return-void
.end method


# virtual methods
.method public addAdditionalAnimatorProvider(Lcom/google/android/material/transition/VisibilityAnimatorProvider;)V
    .locals 1
    .param p1, "additionalAnimatorProvider"    # Lcom/google/android/material/transition/VisibilityAnimatorProvider;

    .line 87
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    iget-object v0, p0, Lcom/google/android/material/transition/MaterialVisibility;->additionalAnimatorProviders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    return-void
.end method

.method public clearAdditionalAnimatorProvider()V
    .locals 1

    .line 107
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    iget-object v0, p0, Lcom/google/android/material/transition/MaterialVisibility;->additionalAnimatorProviders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 108
    return-void
.end method

.method getDefaultEasingInterpolator(Z)Landroid/animation/TimeInterpolator;
    .locals 1
    .param p1, "appearing"    # Z

    .line 177
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    sget-object v0, Lcom/google/android/material/animation/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    return-object v0
.end method

.method getDurationThemeAttrResId(Z)I
    .locals 1
    .param p1, "appearing"    # Z

    .line 167
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    const/4 v0, 0x0

    return v0
.end method

.method getEasingThemeAttrResId(Z)I
    .locals 1
    .param p1, "appearing"    # Z

    .line 172
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public getPrimaryAnimatorProvider()Lcom/google/android/material/transition/VisibilityAnimatorProvider;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TP;"
        }
    .end annotation

    .line 54
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    iget-object v0, p0, Lcom/google/android/material/transition/MaterialVisibility;->primaryAnimatorProvider:Lcom/google/android/material/transition/VisibilityAnimatorProvider;

    return-object v0
.end method

.method public getSecondaryAnimatorProvider()Lcom/google/android/material/transition/VisibilityAnimatorProvider;
    .locals 1

    .line 65
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    iget-object v0, p0, Lcom/google/android/material/transition/MaterialVisibility;->secondaryAnimatorProvider:Lcom/google/android/material/transition/VisibilityAnimatorProvider;

    return-object v0
.end method

.method public isSeekingSupported()Z
    .locals 1

    .line 183
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public onAppear(Landroid/view/ViewGroup;Landroid/view/View;Landroidx/transition/TransitionValues;Landroidx/transition/TransitionValues;)Landroid/animation/Animator;
    .locals 1
    .param p1, "sceneRoot"    # Landroid/view/ViewGroup;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "startValues"    # Landroidx/transition/TransitionValues;
    .param p4, "endValues"    # Landroidx/transition/TransitionValues;

    .line 113
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/transition/MaterialVisibility;->createAnimator(Landroid/view/ViewGroup;Landroid/view/View;Z)Landroid/animation/Animator;

    move-result-object v0

    return-object v0
.end method

.method public onDisappear(Landroid/view/ViewGroup;Landroid/view/View;Landroidx/transition/TransitionValues;Landroidx/transition/TransitionValues;)Landroid/animation/Animator;
    .locals 1
    .param p1, "sceneRoot"    # Landroid/view/ViewGroup;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "startValues"    # Landroidx/transition/TransitionValues;
    .param p4, "endValues"    # Landroidx/transition/TransitionValues;

    .line 119
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/transition/MaterialVisibility;->createAnimator(Landroid/view/ViewGroup;Landroid/view/View;Z)Landroid/animation/Animator;

    move-result-object v0

    return-object v0
.end method

.method public removeAdditionalAnimatorProvider(Lcom/google/android/material/transition/VisibilityAnimatorProvider;)Z
    .locals 1
    .param p1, "additionalAnimatorProvider"    # Lcom/google/android/material/transition/VisibilityAnimatorProvider;

    .line 97
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    iget-object v0, p0, Lcom/google/android/material/transition/MaterialVisibility;->additionalAnimatorProviders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setSecondaryAnimatorProvider(Lcom/google/android/material/transition/VisibilityAnimatorProvider;)V
    .locals 0
    .param p1, "secondaryAnimatorProvider"    # Lcom/google/android/material/transition/VisibilityAnimatorProvider;

    .line 74
    .local p0, "this":Lcom/google/android/material/transition/MaterialVisibility;, "Lcom/google/android/material/transition/MaterialVisibility<TP;>;"
    iput-object p1, p0, Lcom/google/android/material/transition/MaterialVisibility;->secondaryAnimatorProvider:Lcom/google/android/material/transition/VisibilityAnimatorProvider;

    .line 75
    return-void
.end method
