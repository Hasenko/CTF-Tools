.class Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;
.super Ljava/lang/Object;
.source "ConstraintLayoutStates.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/widget/ConstraintLayoutStates;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "State"
.end annotation


# instance fields
.field mConstraintID:I

.field mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

.field mId:I

.field mVariants:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/widget/ConstraintLayoutStates$Variant;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "parser"    # Lorg/xmlpull/v1/XmlPullParser;

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mVariants:Ljava/util/ArrayList;

    .line 156
    const/4 v0, -0x1

    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mConstraintID:I

    .line 160
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v0

    .line 161
    .local v0, "attrs":Landroid/util/AttributeSet;
    sget-object v1, Landroidx/constraintlayout/widget/R$styleable;->State:[I

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 162
    .local v1, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v2

    .line 163
    .local v2, "n":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_2

    .line 164
    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v4

    .line 165
    .local v4, "attr":I
    sget v5, Landroidx/constraintlayout/widget/R$styleable;->State_android_id:I

    if-ne v4, v5, :cond_0

    .line 166
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mId:I

    invoke-virtual {v1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mId:I

    goto :goto_1

    .line 167
    :cond_0
    sget v5, Landroidx/constraintlayout/widget/R$styleable;->State_constraints:I

    if-ne v4, v5, :cond_1

    .line 168
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mConstraintID:I

    invoke-virtual {v1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mConstraintID:I

    .line 169
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget v6, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mConstraintID:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v5

    .line 170
    .local v5, "type":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    iget v7, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mConstraintID:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v6

    .line 172
    .local v6, "name":Ljava/lang/String;
    const-string v7, "layout"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 173
    new-instance v7, Landroidx/constraintlayout/widget/ConstraintSet;

    invoke-direct {v7}, Landroidx/constraintlayout/widget/ConstraintSet;-><init>()V

    iput-object v7, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    .line 174
    iget-object v7, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    iget v8, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mConstraintID:I

    invoke-virtual {v7, p1, v8}, Landroidx/constraintlayout/widget/ConstraintSet;->clone(Landroid/content/Context;I)V

    .line 163
    .end local v4    # "attr":I
    .end local v5    # "type":Ljava/lang/String;
    .end local v6    # "name":Ljava/lang/String;
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 181
    .end local v3    # "i":I
    :cond_2
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 182
    return-void
.end method


# virtual methods
.method add(Landroidx/constraintlayout/widget/ConstraintLayoutStates$Variant;)V
    .locals 1
    .param p1, "size"    # Landroidx/constraintlayout/widget/ConstraintLayoutStates$Variant;

    .line 185
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mVariants:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 186
    return-void
.end method

.method public findMatch(FF)I
    .locals 2
    .param p1, "width"    # F
    .param p2, "height"    # F

    .line 189
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mVariants:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 190
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayoutStates$State;->mVariants:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayoutStates$Variant;

    invoke-virtual {v1, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayoutStates$Variant;->match(FF)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 191
    return v0

    .line 189
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 194
    .end local v0    # "i":I
    :cond_1
    const/4 v0, -0x1

    return v0
.end method
