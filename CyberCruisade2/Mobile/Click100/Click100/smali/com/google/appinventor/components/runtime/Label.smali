.class public final Lcom/google/appinventor/components/runtime/Label;
.super Lcom/google/appinventor/components/runtime/AndroidViewComponent;
.source "Label.java"

# interfaces
.implements Lcom/google/appinventor/components/runtime/AccessibleComponent;


# annotations
.annotation runtime Lcom/google/appinventor/components/annotations/DesignerComponent;
    category = .enum Lcom/google/appinventor/components/common/ComponentCategory;->USERINTERFACE:Lcom/google/appinventor/components/common/ComponentCategory;
    description = "A Label displays a piece of text, which is specified through the <code>Text</code> property.  Other properties, all of which can be set in the Designer or Blocks Editor, control the appearance and placement of the text."
    iconName = "images/label.png"
    version = 0x5
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/SimpleObject;
.end annotation


# static fields
.field private static final DEFAULT_LABEL_MARGIN:I = 0x2


# instance fields
.field private backgroundColor:I

.field private bold:Z

.field private defaultLabelMarginInDp:I

.field private fontTypeface:Ljava/lang/String;

.field private hasMargins:Z

.field private htmlContent:Ljava/lang/String;

.field private htmlFormat:Z

.field private isBigText:Z

.field private italic:Z

.field private final linearLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

.field private textAlignment:I

.field private textColor:I

.field private final view:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V
    .locals 7
    .param p1, "container"    # Lcom/google/appinventor/components/runtime/ComponentContainer;

    .line 92
    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/AndroidViewComponent;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V

    .line 50
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/appinventor/components/runtime/Label;->defaultLabelMarginInDp:I

    .line 84
    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/Label;->isBigText:Z

    .line 93
    new-instance v1, Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    .line 96
    invoke-interface {p1, p0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$add(Lcom/google/appinventor/components/runtime/AndroidViewComponent;)V

    .line 102
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 105
    .local v2, "lp":Ljava/lang/Object;
    instance-of v3, v2, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v3, :cond_0

    .line 106
    move-object v3, v2

    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    iput-object v3, p0, Lcom/google/appinventor/components/runtime/Label;->linearLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    .line 107
    const/4 v3, 0x2

    invoke-static {v1, v3}, Lcom/google/appinventor/components/runtime/Label;->dpToPx(Landroid/view/View;I)I

    move-result v3

    iput v3, p0, Lcom/google/appinventor/components/runtime/Label;->defaultLabelMarginInDp:I

    goto :goto_0

    .line 109
    :cond_0
    iput v0, p0, Lcom/google/appinventor/components/runtime/Label;->defaultLabelMarginInDp:I

    .line 110
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/google/appinventor/components/runtime/Label;->linearLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    .line 111
    const-string v3, "Label"

    const-string v4, "Error: The label\'s view does not have linear layout parameters"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3}, Ljava/lang/RuntimeException;-><init>()V

    invoke-virtual {v3}, Ljava/lang/RuntimeException;->printStackTrace()V

    .line 116
    :goto_0
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Label;->TextAlignment(I)V

    .line 117
    const v3, 0xffffff

    invoke-virtual {p0, v3}, Lcom/google/appinventor/components/runtime/Label;->BackgroundColor(I)V

    .line 118
    const-string v3, "0"

    iput-object v3, p0, Lcom/google/appinventor/components/runtime/Label;->fontTypeface:Ljava/lang/String;

    .line 119
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v3

    iget-object v4, p0, Lcom/google/appinventor/components/runtime/Label;->fontTypeface:Ljava/lang/String;

    iget-boolean v5, p0, Lcom/google/appinventor/components/runtime/Label;->bold:Z

    iget-boolean v6, p0, Lcom/google/appinventor/components/runtime/Label;->italic:Z

    invoke-static {v3, v1, v4, v5, v6}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setFontTypeface(Lcom/google/appinventor/components/runtime/Form;Landroid/widget/TextView;Ljava/lang/String;ZZ)V

    .line 120
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/Label;->FontSize(F)V

    .line 121
    const-string v1, ""

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/Label;->Text(Ljava/lang/String;)V

    .line 122
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Label;->TextColor(I)V

    .line 123
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Label;->HTMLFormat(Z)V

    .line 124
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/Label;->HasMargins(Z)V

    .line 125
    return-void
.end method

.method private static dpToPx(Landroid/view/View;I)I
    .locals 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "dp"    # I

    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 130
    .local v0, "density":F
    int-to-float v1, p1

    mul-float v1, v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    return v1
.end method

.method private setLabelMargins(Z)V
    .locals 2
    .param p1, "hasMargins"    # Z

    .line 294
    if-eqz p1, :cond_0

    iget v0, p0, Lcom/google/appinventor/components/runtime/Label;->defaultLabelMarginInDp:I

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 295
    .local v0, "m":I
    :goto_0
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Label;->linearLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v1, v0, v0, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 296
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->invalidate()V

    .line 297
    return-void
.end method


# virtual methods
.method public BackgroundColor()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
    .end annotation

    .line 182
    iget v0, p0, Lcom/google/appinventor/components/runtime/Label;->backgroundColor:I

    return v0
.end method

.method public BackgroundColor(I)V
    .locals 2
    .param p1, "argb"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "&H00FFFFFF"
        editorType = "color"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 195
    iput p1, p0, Lcom/google/appinventor/components/runtime/Label;->backgroundColor:I

    .line 196
    if-eqz p1, :cond_0

    .line 197
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setBackgroundColor(Landroid/widget/TextView;I)V

    goto :goto_0

    .line 199
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    const v1, 0xffffff

    invoke-static {v0, v1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setBackgroundColor(Landroid/widget/TextView;I)V

    .line 201
    :goto_0
    return-void
.end method

.method public FontBold(Z)V
    .locals 4
    .param p1, "bold"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        userVisible = false
    .end annotation

    .line 228
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Label;->bold:Z

    .line 229
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Label;->fontTypeface:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/google/appinventor/components/runtime/Label;->italic:Z

    invoke-static {v0, v1, v2, p1, v3}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setFontTypeface(Lcom/google/appinventor/components/runtime/Form;Landroid/widget/TextView;Ljava/lang/String;ZZ)V

    .line 230
    return-void
.end method

.method public FontBold()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 214
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Label;->bold:Z

    return v0
.end method

.method public FontItalic(Z)V
    .locals 4
    .param p1, "italic"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        userVisible = false
    .end annotation

    .line 257
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Label;->italic:Z

    .line 258
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Label;->fontTypeface:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/google/appinventor/components/runtime/Label;->bold:Z

    invoke-static {v0, v1, v2, v3, p1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setFontTypeface(Lcom/google/appinventor/components/runtime/Form;Landroid/widget/TextView;Ljava/lang/String;ZZ)V

    .line 259
    return-void
.end method

.method public FontItalic()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 243
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Label;->italic:Z

    return v0
.end method

.method public FontSize()F
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
    .end annotation

    .line 307
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Label;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->getFontSize(Landroid/widget/TextView;Landroid/content/Context;)F

    move-result v0

    return v0
.end method

.method public FontSize(F)V
    .locals 2
    .param p1, "size"    # F
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "14.0"
        editorType = "non_negative_float"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 320
    const/high16 v0, 0x41600000    # 14.0f

    cmpl-float v0, p1, v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Label;->isBigText:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/Form;->BigDefaultText()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 321
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-static {v0, v1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setFontSize(Landroid/widget/TextView;F)V

    goto :goto_0

    .line 323
    :cond_1
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setFontSize(Landroid/widget/TextView;F)V

    .line 325
    :goto_0
    return-void
.end method

.method public FontTypeface()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 340
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->fontTypeface:Ljava/lang/String;

    return-object v0
.end method

.method public FontTypeface(Ljava/lang/String;)V
    .locals 5
    .param p1, "typeface"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "0"
        editorType = "typeface"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        userVisible = false
    .end annotation

    .line 357
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Label;->fontTypeface:Ljava/lang/String;

    .line 358
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/Label;->fontTypeface:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/google/appinventor/components/runtime/Label;->bold:Z

    iget-boolean v4, p0, Lcom/google/appinventor/components/runtime/Label;->italic:Z

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setFontTypeface(Lcom/google/appinventor/components/runtime/Form;Landroid/widget/TextView;Ljava/lang/String;ZZ)V

    .line 359
    return-void
.end method

.method public HTMLContent()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 397
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Label;->htmlFormat:Z

    if-eqz v0, :cond_0

    .line 398
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->htmlContent:Ljava/lang/String;

    return-object v0

    .line 400
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->getText(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public HTMLFormat(Z)V
    .locals 2
    .param p1, "fmt"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        userVisible = false
    .end annotation

    .line 429
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Label;->htmlFormat:Z

    .line 430
    if-eqz p1, :cond_0

    .line 431
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->getText(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object v0

    .line 432
    .local v0, "txt":Ljava/lang/String;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    invoke-static {v1, v0}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setTextHTML(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 433
    .end local v0    # "txt":Ljava/lang/String;
    goto :goto_0

    .line 434
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->getText(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object v0

    .line 435
    .restart local v0    # "txt":Ljava/lang/String;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    invoke-static {v1, v0}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setText(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 437
    .end local v0    # "txt":Ljava/lang/String;
    :goto_0
    return-void
.end method

.method public HTMLFormat()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "If true, then this label will show html text else it will show plain text. Note: Not all HTML is supported."
    .end annotation

    .line 416
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Label;->htmlFormat:Z

    return v0
.end method

.method public HasMargins(Z)V
    .locals 0
    .param p1, "hasMargins"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "True"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        userVisible = true
    .end annotation

    .line 289
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/Label;->hasMargins:Z

    .line 290
    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/Label;->setLabelMargins(Z)V

    .line 291
    return-void
.end method

.method public HasMargins()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Reports whether or not the label appears with margins.  All four margins (left, right, top, bottom) are the same.  This property has no effect in the designer, where labels are always shown with margins."
        userVisible = true
    .end annotation

    .line 273
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Label;->hasMargins:Z

    return v0
.end method

.method public Text()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
    .end annotation

    .line 369
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->getText(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public Text(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = ""
        editorType = "textArea"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 381
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Label;->htmlFormat:Z

    if-eqz v0, :cond_0

    .line 382
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setTextHTML(Landroid/widget/TextView;Ljava/lang/String;)V

    goto :goto_0

    .line 384
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setText(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 386
    :goto_0
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/Label;->htmlContent:Ljava/lang/String;

    .line 387
    return-void
.end method

.method public TextAlignment()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 151
    iget v0, p0, Lcom/google/appinventor/components/runtime/Label;->textAlignment:I

    return v0
.end method

.method public TextAlignment(I)V
    .locals 2
    .param p1, "alignment"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "0"
        editorType = "textalignment"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        userVisible = false
    .end annotation

    .line 168
    iput p1, p0, Lcom/google/appinventor/components/runtime/Label;->textAlignment:I

    .line 169
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setAlignment(Landroid/widget/TextView;IZ)V

    .line 170
    return-void
.end method

.method public TextColor()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
    .end annotation

    .line 449
    iget v0, p0, Lcom/google/appinventor/components/runtime/Label;->textColor:I

    return v0
.end method

.method public TextColor(I)V
    .locals 2
    .param p1, "argb"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "&HFF000000"
        editorType = "color"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 462
    iput p1, p0, Lcom/google/appinventor/components/runtime/Label;->textColor:I

    .line 463
    if-eqz p1, :cond_0

    .line 464
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setTextColor(Landroid/widget/TextView;I)V

    goto :goto_1

    .line 466
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Label;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/appinventor/components/runtime/Form;->isDarkTheme()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, -0x1

    goto :goto_0

    :cond_1
    const/high16 v1, -0x1000000

    :goto_0
    invoke-static {v0, v1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setTextColor(Landroid/widget/TextView;I)V

    .line 468
    :goto_1
    return-void
.end method

.method public getHighContrast()Z
    .locals 1

    .line 477
    const/4 v0, 0x0

    return v0
.end method

.method public getLargeFont()Z
    .locals 1

    .line 493
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/Label;->isBigText:Z

    return v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    return-object v0
.end method

.method public setHighContrast(Z)V
    .locals 0
    .param p1, "isHighContrast"    # Z

    .line 473
    return-void
.end method

.method public setLargeFont(Z)V
    .locals 6
    .param p1, "isLargeFont"    # Z

    .line 482
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Label;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->getFontSize(Landroid/widget/TextView;Landroid/content/Context;)F

    move-result v0

    float-to-double v0, v0

    const-wide/high16 v2, 0x4038000000000000L    # 24.0

    const/high16 v4, 0x41600000    # 14.0f

    cmpl-double v5, v0, v2

    if-eqz v5, :cond_0

    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/Label;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->getFontSize(Landroid/widget/TextView;Landroid/content/Context;)F

    move-result v0

    cmpl-float v0, v0, v4

    if-nez v0, :cond_2

    .line 483
    :cond_0
    if-eqz p1, :cond_1

    .line 484
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-static {v0, v1}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setFontSize(Landroid/widget/TextView;F)V

    goto :goto_0

    .line 486
    :cond_1
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/Label;->view:Landroid/widget/TextView;

    invoke-static {v0, v4}, Lcom/google/appinventor/components/runtime/util/TextViewUtil;->setFontSize(Landroid/widget/TextView;F)V

    .line 489
    :cond_2
    :goto_0
    return-void
.end method
