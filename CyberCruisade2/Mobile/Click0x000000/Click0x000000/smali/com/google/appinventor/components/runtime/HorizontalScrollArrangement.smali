.class public Lcom/google/appinventor/components/runtime/HorizontalScrollArrangement;
.super Lcom/google/appinventor/components/runtime/HVArrangement;
.source "HorizontalScrollArrangement.java"


# annotations
.annotation runtime Lcom/google/appinventor/components/annotations/DesignerComponent;
    category = .enum Lcom/google/appinventor/components/common/ComponentCategory;->LAYOUT:Lcom/google/appinventor/components/common/ComponentCategory;
    description = "<p>A formatting element in which to place components that should be displayed from left to right.  If you wish to have components displayed one over another, use <code>VerticalArrangement</code> instead.</p><p>This version is scrollable."
    iconName = "images/horizontal.png"
    version = 0x2
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/SimpleObject;
.end annotation


# direct methods
.method public constructor <init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V
    .locals 2
    .param p1, "container"    # Lcom/google/appinventor/components/runtime/ComponentContainer;

    .line 36
    const/4 v0, 0x1

    sget-boolean v1, Lcom/google/appinventor/components/common/ComponentConstants;->SCROLLABLE_ARRANGEMENT:Z

    invoke-direct {p0, p1, v0, v1}, Lcom/google/appinventor/components/runtime/HVArrangement;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;IZ)V

    .line 38
    return-void
.end method
