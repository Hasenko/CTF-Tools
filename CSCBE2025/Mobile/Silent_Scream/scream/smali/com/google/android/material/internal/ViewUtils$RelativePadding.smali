.class public Lcom/google/android/material/internal/ViewUtils$RelativePadding;
.super Ljava/lang/Object;
.source "ViewUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/internal/ViewUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RelativePadding"
.end annotation


# instance fields
.field public bottom:I

.field public end:I

.field public start:I

.field public top:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0
    .param p1, "start"    # I
    .param p2, "top"    # I
    .param p3, "end"    # I
    .param p4, "bottom"    # I

    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 223
    iput p1, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->start:I

    .line 224
    iput p2, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->top:I

    .line 225
    iput p3, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->end:I

    .line 226
    iput p4, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->bottom:I

    .line 227
    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/internal/ViewUtils$RelativePadding;)V
    .locals 1
    .param p1, "other"    # Lcom/google/android/material/internal/ViewUtils$RelativePadding;

    .line 229
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 230
    iget v0, p1, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->start:I

    iput v0, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->start:I

    .line 231
    iget v0, p1, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->top:I

    iput v0, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->top:I

    .line 232
    iget v0, p1, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->end:I

    iput v0, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->end:I

    .line 233
    iget v0, p1, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->bottom:I

    iput v0, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->bottom:I

    .line 234
    return-void
.end method


# virtual methods
.method public applyToView(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .line 238
    iget v0, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->start:I

    iget v1, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->top:I

    iget v2, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->end:I

    iget v3, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->bottom:I

    invoke-static {p1, v0, v1, v2, v3}, Landroidx/core/view/ViewCompat;->setPaddingRelative(Landroid/view/View;IIII)V

    .line 239
    return-void
.end method
