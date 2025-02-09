.class public final Lcom/google/appinventor/components/runtime/util/ViewUtil;
.super Ljava/lang/Object;
.source "ViewUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method private static calculatePixels(Landroid/view/View;I)I
    .locals 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "sizeInDP"    # I

    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    int-to-float v1, p1

    mul-float v0, v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public static setBackgroundDrawable(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p0, "view"    # Landroid/view/View;
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 201
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 202
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 203
    return-void
.end method

.method public static setBackgroundImage(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p0, "view"    # Landroid/view/View;
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 185
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 186
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 187
    return-void
.end method

.method public static setChildHeightForHorizontalLayout(Landroid/view/View;I)V
    .locals 3
    .param p0, "view"    # Landroid/view/View;
    .param p1, "height"    # I

    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 70
    .local v0, "layoutParams":Ljava/lang/Object;
    instance-of v1, v0, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v1, :cond_0

    .line 71
    move-object v1, v0

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 72
    .local v1, "linearLayoutParams":Landroid/widget/LinearLayout$LayoutParams;
    packed-switch p1, :pswitch_data_0

    .line 80
    invoke-static {p0, p1}, Lcom/google/appinventor/components/runtime/util/ViewUtil;->calculatePixels(Landroid/view/View;I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    goto :goto_0

    .line 74
    :pswitch_0
    const/4 v2, -0x2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 75
    goto :goto_0

    .line 77
    :pswitch_1
    const/4 v2, -0x1

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 78
    nop

    .line 83
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 84
    .end local v1    # "linearLayoutParams":Landroid/widget/LinearLayout$LayoutParams;
    goto :goto_1

    .line 85
    :cond_0
    const-string v1, "ViewUtil"

    const-string v2, "The view does not have linear layout parameters"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static setChildHeightForTableLayout(Landroid/view/View;I)V
    .locals 3
    .param p0, "view"    # Landroid/view/View;
    .param p1, "height"    # I

    .line 161
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 162
    .local v0, "layoutParams":Ljava/lang/Object;
    instance-of v1, v0, Landroid/widget/TableRow$LayoutParams;

    if-eqz v1, :cond_0

    .line 163
    move-object v1, v0

    check-cast v1, Landroid/widget/TableRow$LayoutParams;

    .line 164
    .local v1, "tableLayoutParams":Landroid/widget/TableRow$LayoutParams;
    packed-switch p1, :pswitch_data_0

    .line 172
    invoke-static {p0, p1}, Lcom/google/appinventor/components/runtime/util/ViewUtil;->calculatePixels(Landroid/view/View;I)I

    move-result v2

    iput v2, v1, Landroid/widget/TableRow$LayoutParams;->height:I

    goto :goto_0

    .line 166
    :pswitch_0
    const/4 v2, -0x2

    iput v2, v1, Landroid/widget/TableRow$LayoutParams;->height:I

    .line 167
    goto :goto_0

    .line 169
    :pswitch_1
    const/4 v2, -0x1

    iput v2, v1, Landroid/widget/TableRow$LayoutParams;->height:I

    .line 170
    nop

    .line 175
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 176
    .end local v1    # "tableLayoutParams":Landroid/widget/TableRow$LayoutParams;
    goto :goto_1

    .line 177
    :cond_0
    const-string v1, "ViewUtil"

    const-string v2, "The view does not have table layout parameters"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static setChildHeightForVerticalLayout(Landroid/view/View;I)V
    .locals 4
    .param p0, "view"    # Landroid/view/View;
    .param p1, "height"    # I

    .line 116
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 117
    .local v0, "layoutParams":Ljava/lang/Object;
    instance-of v1, v0, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v1, :cond_0

    .line 118
    move-object v1, v0

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 119
    .local v1, "linearLayoutParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v2, 0x0

    packed-switch p1, :pswitch_data_0

    .line 129
    invoke-static {p0, p1}, Lcom/google/appinventor/components/runtime/util/ViewUtil;->calculatePixels(Landroid/view/View;I)I

    move-result v3

    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 130
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    goto :goto_0

    .line 121
    :pswitch_0
    const/4 v3, -0x2

    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 122
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 123
    goto :goto_0

    .line 125
    :pswitch_1
    const/4 v2, 0x0

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 126
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 127
    nop

    .line 133
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 134
    .end local v1    # "linearLayoutParams":Landroid/widget/LinearLayout$LayoutParams;
    goto :goto_1

    .line 135
    :cond_0
    const-string v1, "ViewUtil"

    const-string v2, "The view does not have linear layout parameters"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static setChildWidthForHorizontalLayout(Landroid/view/View;I)V
    .locals 4
    .param p0, "view"    # Landroid/view/View;
    .param p1, "width"    # I

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 44
    .local v0, "layoutParams":Ljava/lang/Object;
    instance-of v1, v0, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v1, :cond_0

    .line 45
    move-object v1, v0

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 46
    .local v1, "linearLayoutParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v2, 0x0

    packed-switch p1, :pswitch_data_0

    .line 56
    invoke-static {p0, p1}, Lcom/google/appinventor/components/runtime/util/ViewUtil;->calculatePixels(Landroid/view/View;I)I

    move-result v3

    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 57
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    goto :goto_0

    .line 48
    :pswitch_0
    const/4 v3, -0x2

    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 49
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 50
    goto :goto_0

    .line 52
    :pswitch_1
    const/4 v2, 0x0

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 53
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 54
    nop

    .line 60
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 61
    .end local v1    # "linearLayoutParams":Landroid/widget/LinearLayout$LayoutParams;
    goto :goto_1

    .line 62
    :cond_0
    const-string v1, "ViewUtil"

    const-string v2, "The view does not have linear layout parameters"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static setChildWidthForTableLayout(Landroid/view/View;I)V
    .locals 3
    .param p0, "view"    # Landroid/view/View;
    .param p1, "width"    # I

    .line 140
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 141
    .local v0, "layoutParams":Ljava/lang/Object;
    instance-of v1, v0, Landroid/widget/TableRow$LayoutParams;

    if-eqz v1, :cond_0

    .line 142
    move-object v1, v0

    check-cast v1, Landroid/widget/TableRow$LayoutParams;

    .line 143
    .local v1, "tableLayoutParams":Landroid/widget/TableRow$LayoutParams;
    packed-switch p1, :pswitch_data_0

    .line 151
    invoke-static {p0, p1}, Lcom/google/appinventor/components/runtime/util/ViewUtil;->calculatePixels(Landroid/view/View;I)I

    move-result v2

    iput v2, v1, Landroid/widget/TableRow$LayoutParams;->width:I

    goto :goto_0

    .line 145
    :pswitch_0
    const/4 v2, -0x2

    iput v2, v1, Landroid/widget/TableRow$LayoutParams;->width:I

    .line 146
    goto :goto_0

    .line 148
    :pswitch_1
    const/4 v2, -0x1

    iput v2, v1, Landroid/widget/TableRow$LayoutParams;->width:I

    .line 149
    nop

    .line 154
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 155
    .end local v1    # "tableLayoutParams":Landroid/widget/TableRow$LayoutParams;
    goto :goto_1

    .line 156
    :cond_0
    const-string v1, "ViewUtil"

    const-string v2, "The view does not have table layout parameters"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static setChildWidthForVerticalLayout(Landroid/view/View;I)V
    .locals 3
    .param p0, "view"    # Landroid/view/View;
    .param p1, "width"    # I

    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 93
    .local v0, "layoutParams":Ljava/lang/Object;
    instance-of v1, v0, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v1, :cond_0

    .line 94
    move-object v1, v0

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 95
    .local v1, "linearLayoutParams":Landroid/widget/LinearLayout$LayoutParams;
    packed-switch p1, :pswitch_data_0

    .line 103
    invoke-static {p0, p1}, Lcom/google/appinventor/components/runtime/util/ViewUtil;->calculatePixels(Landroid/view/View;I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    goto :goto_0

    .line 97
    :pswitch_0
    const/4 v2, -0x2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 98
    goto :goto_0

    .line 100
    :pswitch_1
    const/4 v2, -0x1

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 101
    nop

    .line 107
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 108
    .end local v1    # "linearLayoutParams":Landroid/widget/LinearLayout$LayoutParams;
    goto :goto_1

    .line 109
    :cond_0
    const-string v1, "ViewUtil"

    const-string v2, "The view does not have linear layout parameters"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static setImage(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p0, "view"    # Landroid/widget/ImageView;
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 193
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 194
    if-eqz p1, :cond_0

    .line 195
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V

    .line 197
    :cond_0
    invoke-virtual {p0}, Landroid/widget/ImageView;->requestLayout()V

    .line 198
    return-void
.end method
