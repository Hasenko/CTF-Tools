.class public abstract Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;
.super Ljava/lang/Object;
.source "BottomSheetBehavior.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BottomSheetCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method onLayout(Landroid/view/View;)V
    .locals 0
    .param p1, "bottomSheet"    # Landroid/view/View;

    .line 126
    return-void
.end method

.method public abstract onSlide(Landroid/view/View;F)V
.end method

.method public abstract onStateChanged(Landroid/view/View;I)V
.end method
