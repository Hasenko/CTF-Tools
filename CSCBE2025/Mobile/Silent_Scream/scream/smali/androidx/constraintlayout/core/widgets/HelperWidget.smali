.class public Landroidx/constraintlayout/core/widgets/HelperWidget;
.super Landroidx/constraintlayout/core/widgets/ConstraintWidget;
.source "HelperWidget.java"

# interfaces
.implements Landroidx/constraintlayout/core/widgets/Helper;


# instance fields
.field public mWidgets:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

.field public mWidgetsCount:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;-><init>()V

    .line 30
    const/4 v0, 0x4

    new-array v0, v0, [Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iput-object v0, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 31
    const/4 v0, 0x0

    iput v0, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgetsCount:I

    return-void
.end method


# virtual methods
.method public add(Landroidx/constraintlayout/core/widgets/ConstraintWidget;)V
    .locals 2
    .param p1, "widget"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 45
    if-eq p1, p0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    .line 48
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgetsCount:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    array-length v1, v1

    if-le v0, v1, :cond_1

    .line 49
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iput-object v0, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 51
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iget v1, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgetsCount:I

    aput-object p1, v0, v1

    .line 52
    iget v0, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgetsCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgetsCount:I

    .line 53
    return-void

    .line 46
    :cond_2
    :goto_0
    return-void
.end method

.method public addDependents(Ljava/util/ArrayList;ILandroidx/constraintlayout/core/widgets/analyzer/WidgetGroup;)V
    .locals 2
    .param p2, "orientation"    # I
    .param p3, "group"    # Landroidx/constraintlayout/core/widgets/analyzer/WidgetGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/core/widgets/analyzer/WidgetGroup;",
            ">;I",
            "Landroidx/constraintlayout/core/widgets/analyzer/WidgetGroup;",
            ")V"
        }
    .end annotation

    .line 79
    .local p1, "dependencyLists":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/analyzer/WidgetGroup;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgetsCount:I

    if-ge v0, v1, :cond_0

    .line 80
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    aget-object v1, v1, v0

    .line 81
    .local v1, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    invoke-virtual {p3, v1}, Landroidx/constraintlayout/core/widgets/analyzer/WidgetGroup;->add(Landroidx/constraintlayout/core/widgets/ConstraintWidget;)Z

    .line 79
    .end local v1    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 83
    .end local v0    # "i":I
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    iget v1, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgetsCount:I

    if-ge v0, v1, :cond_1

    .line 84
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    aget-object v1, v1, v0

    .line 85
    .restart local v1    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    invoke-static {v1, p2, p1, p3}, Landroidx/constraintlayout/core/widgets/analyzer/Grouping;->findDependents(Landroidx/constraintlayout/core/widgets/ConstraintWidget;ILjava/util/ArrayList;Landroidx/constraintlayout/core/widgets/analyzer/WidgetGroup;)Landroidx/constraintlayout/core/widgets/analyzer/WidgetGroup;

    .line 83
    .end local v1    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 87
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method public copy(Landroidx/constraintlayout/core/widgets/ConstraintWidget;Ljava/util/HashMap;)V
    .locals 4
    .param p1, "src"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/constraintlayout/core/widgets/ConstraintWidget;",
            "Ljava/util/HashMap<",
            "Landroidx/constraintlayout/core/widgets/ConstraintWidget;",
            "Landroidx/constraintlayout/core/widgets/ConstraintWidget;",
            ">;)V"
        }
    .end annotation

    .line 57
    .local p2, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    invoke-super {p0, p1, p2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->copy(Landroidx/constraintlayout/core/widgets/ConstraintWidget;Ljava/util/HashMap;)V

    .line 58
    move-object v0, p1

    check-cast v0, Landroidx/constraintlayout/core/widgets/HelperWidget;

    .line 59
    .local v0, "srcHelper":Landroidx/constraintlayout/core/widgets/HelperWidget;
    const/4 v1, 0x0

    iput v1, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgetsCount:I

    .line 60
    iget v1, v0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgetsCount:I

    .line 61
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 62
    iget-object v3, v0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    aget-object v3, v3, v2

    invoke-virtual {p2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {p0, v3}, Landroidx/constraintlayout/core/widgets/HelperWidget;->add(Landroidx/constraintlayout/core/widgets/ConstraintWidget;)V

    .line 61
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 64
    .end local v2    # "i":I
    :cond_0
    return-void
.end method

.method public findGroupInDependents(I)I
    .locals 4
    .param p1, "orientation"    # I

    .line 91
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgetsCount:I

    const/4 v2, -0x1

    if-ge v0, v1, :cond_2

    .line 92
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    aget-object v1, v1, v0

    .line 93
    .local v1, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    if-nez p1, :cond_0

    iget v3, v1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->horizontalGroup:I

    if-eq v3, v2, :cond_0

    .line 94
    iget v2, v1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->horizontalGroup:I

    return v2

    .line 96
    :cond_0
    const/4 v3, 0x1

    if-ne p1, v3, :cond_1

    iget v3, v1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->verticalGroup:I

    if-eq v3, v2, :cond_1

    .line 97
    iget v2, v1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->verticalGroup:I

    return v2

    .line 91
    .end local v1    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 100
    .end local v0    # "i":I
    :cond_2
    return v2
.end method

.method public removeAllIds()V
    .locals 2

    .line 71
    const/4 v0, 0x0

    iput v0, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgetsCount:I

    .line 72
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 73
    return-void
.end method

.method public updateConstraints(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;)V
    .locals 0
    .param p1, "container"    # Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    .line 36
    return-void
.end method
