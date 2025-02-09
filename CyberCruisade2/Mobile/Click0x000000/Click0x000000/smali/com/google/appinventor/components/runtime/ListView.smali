.class public final Lcom/google/appinventor/components/runtime/ListView;
.super Lcom/google/appinventor/components/runtime/AndroidViewComponent;
.source "ListView.java"


# annotations
.annotation runtime Lcom/google/appinventor/components/annotations/DesignerComponent;
    category = .enum Lcom/google/appinventor/components/common/ComponentCategory;->USERINTERFACE:Lcom/google/appinventor/components/common/ComponentCategory;
    description = "<p>This is a visible component that displays a list of text and image elements.</p> <p>Simple lists of strings may be set using the ElementsFromString property. More complex lists of elements containing multiple strings and/or images can be created using the ListData and ListViewLayout properties. </p>"
    iconName = "images/listView.png"
    nonVisible = false
    version = 0x9
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/SimpleObject;
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/UsesLibraries;
    value = {
        "recyclerview.jar",
        "recyclerview.aar",
        "cardview.jar",
        "cardview.aar",
        "dynamicanimation.jar"
    }
.end annotation

.annotation runtime Lcom/google/appinventor/components/annotations/UsesPermissions;
    permissionNames = "android.permission.INTERNET,android.permission.READ_EXTERNAL_STORAGE"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;
    }
.end annotation


# static fields
.field private static final DEFAULT_BACKGROUND_COLOR:I = -0x1000000

.field private static final DEFAULT_DIVIDER_SIZE:I = 0x0

.field private static final DEFAULT_ENABLED:Z = false

.field private static final DEFAULT_IMAGE_WIDTH:I = 0xc8

.field private static final DEFAULT_MARGINS_SIZE:I = 0x0

.field private static final DEFAULT_RADIUS:I = 0x0

.field private static final DEFAULT_TEXT_SIZE:I = 0x16

.field private static final LOG_TAG:Ljava/lang/String; = "ListView"


# instance fields
.field private backgroundColor:I

.field private bounceEdgeEffectFactory:Lcom/google/appinventor/components/runtime/ListBounceEdgeEffectFactory;

.field private bounceEffect:Z

.field protected final container:Lcom/google/appinventor/components/runtime/ComponentContainer;

.field private detailTextColor:I

.field private divider:Z

.field private dividerColor:I

.field private dividerPaint:Landroid/graphics/Paint;

.field private dividerSize:I

.field private edgeEffectFactory:Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;

.field private elementColor:I

.field private first:Z

.field private fontSizeDetail:F

.field private fontSizeMain:F

.field private fontTypeDetail:Ljava/lang/String;

.field private fontTypeface:Ljava/lang/String;

.field private hint:Ljava/lang/String;

.field private imageHeight:I

.field private imageWidth:I

.field private items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private layout:I

.field private layoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

.field private final linearLayout:Landroid/widget/LinearLayout;

.field private listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

.field private final listLayout:Landroid/widget/LinearLayout;

.field private margins:I

.field private multiSelect:Z

.field private orientation:I

.field private propertyValue:Ljava/lang/String;

.field private radius:I

.field private recyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private selection:Ljava/lang/String;

.field private selectionColor:I

.field private selectionDetailText:Ljava/lang/String;

.field private selectionIndex:I

.field private showFilter:Z

.field private textColor:I

.field private txtSearchBox:Landroid/widget/EditText;


# direct methods
.method static bridge synthetic -$$Nest$fgetdividerPaint(Lcom/google/appinventor/components/runtime/ListView;)Landroid/graphics/Paint;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/ListView;->dividerPaint:Landroid/graphics/Paint;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdividerSize(Lcom/google/appinventor/components/runtime/ListView;)I
    .locals 0

    iget p0, p0, Lcom/google/appinventor/components/runtime/ListView;->dividerSize:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetfirst(Lcom/google/appinventor/components/runtime/ListView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/appinventor/components/runtime/ListView;->first:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetlistAdapterWithRecyclerView(Lcom/google/appinventor/components/runtime/ListView;)Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmargins(Lcom/google/appinventor/components/runtime/ListView;)I
    .locals 0

    iget p0, p0, Lcom/google/appinventor/components/runtime/ListView;->margins:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetorientation(Lcom/google/appinventor/components/runtime/ListView;)I
    .locals 0

    iget p0, p0, Lcom/google/appinventor/components/runtime/ListView;->orientation:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fputfirst(Lcom/google/appinventor/components/runtime/ListView;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/ListView;->first:Z

    return-void
.end method

.method public constructor <init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V
    .locals 10
    .param p1, "container"    # Lcom/google/appinventor/components/runtime/ComponentContainer;

    .line 149
    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/AndroidViewComponent;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V

    .line 93
    const-string v0, "Uninitialized"

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionDetailText:Ljava/lang/String;

    .line 94
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/ListView;->showFilter:Z

    .line 101
    const v1, 0xffffff

    iput v1, p0, Lcom/google/appinventor/components/runtime/ListView;->elementColor:I

    .line 132
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/appinventor/components/runtime/ListView;->first:Z

    .line 150
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    .line 151
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    .line 153
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/google/appinventor/components/runtime/ListView;->linearLayout:Landroid/widget/LinearLayout;

    .line 154
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 155
    iput v0, p0, Lcom/google/appinventor/components/runtime/ListView;->orientation:I

    .line 156
    iput v0, p0, Lcom/google/appinventor/components/runtime/ListView;->layout:I

    .line 158
    new-instance v3, Landroidx/recyclerview/widget/RecyclerView;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 159
    new-instance v3, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V

    .line 160
    .local v3, "params":Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    iget-object v5, p0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 162
    new-instance v5, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v5, v6, v1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    iput-object v5, p0, Lcom/google/appinventor/components/runtime/ListView;->layoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 163
    iget-object v6, p0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v6, v5}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 165
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/google/appinventor/components/runtime/ListView;->listLayout:Landroid/widget/LinearLayout;

    .line 166
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 167
    .local v6, "paramsList":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 168
    invoke-virtual {v5, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 170
    iput v4, p0, Lcom/google/appinventor/components/runtime/ListView;->dividerColor:I

    .line 171
    iput v0, p0, Lcom/google/appinventor/components/runtime/ListView;->dividerSize:I

    .line 172
    iput v0, p0, Lcom/google/appinventor/components/runtime/ListView;->margins:I

    .line 174
    iget-object v7, p0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView;->getEdgeEffectFactory()Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;

    move-result-object v7

    iput-object v7, p0, Lcom/google/appinventor/components/runtime/ListView;->edgeEffectFactory:Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;

    .line 175
    new-instance v7, Lcom/google/appinventor/components/runtime/ListBounceEdgeEffectFactory;

    invoke-direct {v7}, Lcom/google/appinventor/components/runtime/ListBounceEdgeEffectFactory;-><init>()V

    iput-object v7, p0, Lcom/google/appinventor/components/runtime/ListView;->bounceEdgeEffectFactory:Lcom/google/appinventor/components/runtime/ListBounceEdgeEffectFactory;

    .line 177
    new-instance v7, Landroid/widget/EditText;

    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/google/appinventor/components/runtime/ListView;->txtSearchBox:Landroid/widget/EditText;

    .line 178
    invoke-virtual {v7, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 179
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->txtSearchBox:Landroid/widget/EditText;

    const/4 v7, -0x2

    invoke-virtual {v1, v7}, Landroid/widget/EditText;->setWidth(I)V

    .line 180
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->txtSearchBox:Landroid/widget/EditText;

    const/16 v8, 0xa

    invoke-virtual {v1, v8, v8, v8, v8}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 181
    const-string v1, "Search list..."

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/ListView;->HintText(Ljava/lang/String;)V

    .line 182
    invoke-static {}, Lcom/google/appinventor/components/runtime/AppInventorCompatActivity;->isClassicMode()Z

    move-result v1

    if-nez v1, :cond_0

    .line 183
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->txtSearchBox:Landroid/widget/EditText;

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setBackgroundColor(I)V

    .line 186
    :cond_0
    invoke-interface {p1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/appinventor/components/runtime/Form;->isDarkTheme()Z

    move-result v1

    const/high16 v8, -0x1000000

    if-eqz v1, :cond_1

    .line 187
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->txtSearchBox:Landroid/widget/EditText;

    invoke-virtual {v1, v8}, Landroid/widget/EditText;->setTextColor(I)V

    .line 188
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->txtSearchBox:Landroid/widget/EditText;

    invoke-virtual {v1, v8}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 192
    :cond_1
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->txtSearchBox:Landroid/widget/EditText;

    new-instance v9, Lcom/google/appinventor/components/runtime/ListView$1;

    invoke-direct {v9, p0}, Lcom/google/appinventor/components/runtime/ListView$1;-><init>(Lcom/google/appinventor/components/runtime/ListView;)V

    invoke-virtual {v1, v9}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 210
    iget-boolean v1, p0, Lcom/google/appinventor/components/runtime/ListView;->showFilter:Z

    if-eqz v1, :cond_2

    .line 211
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->txtSearchBox:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setVisibility(I)V

    goto :goto_0

    .line 213
    :cond_2
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->txtSearchBox:Landroid/widget/EditText;

    const/16 v9, 0x8

    invoke-virtual {v1, v9}, Landroid/widget/EditText;->setVisibility(I)V

    .line 220
    :goto_0
    invoke-virtual {p0, v8}, Lcom/google/appinventor/components/runtime/ListView;->BackgroundColor(I)V

    .line 221
    const v1, -0x333334

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/ListView;->SelectionColor(I)V

    .line 222
    invoke-virtual {p0, v4}, Lcom/google/appinventor/components/runtime/ListView;->TextColor(I)V

    .line 223
    invoke-virtual {p0, v4}, Lcom/google/appinventor/components/runtime/ListView;->TextColorDetail(I)V

    .line 224
    invoke-virtual {p0, v4}, Lcom/google/appinventor/components/runtime/ListView;->DividerColor(I)V

    .line 225
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ListView;->DividerThickness(I)V

    .line 226
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ListView;->ElementMarginsWidth(I)V

    .line 227
    const/high16 v1, 0x41b00000    # 22.0f

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/ListView;->FontSize(F)V

    .line 228
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/ListView;->FontSizeDetail(F)V

    .line 229
    const-string v1, "0"

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/ListView;->FontTypeface(Ljava/lang/String;)V

    .line 230
    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/ListView;->FontTypefaceDetail(Ljava/lang/String;)V

    .line 232
    const/16 v1, 0xc8

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/ListView;->ImageWidth(I)V

    .line 233
    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/ListView;->ImageHeight(I)V

    .line 234
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ListView;->ElementCornerRadius(I)V

    .line 235
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ListView;->MultiSelect(Z)V

    .line 236
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ListView;->BounceEdgeEffect(Z)V

    .line 237
    const-string v1, ""

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/ListView;->ElementsFromString(Ljava/lang/String;)V

    .line 238
    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/ListView;->ListData(Ljava/lang/String;)V

    .line 240
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 241
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->txtSearchBox:Landroid/widget/EditText;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 242
    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 243
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 244
    invoke-interface {p1, p0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$add(Lcom/google/appinventor/components/runtime/AndroidViewComponent;)V

    .line 245
    invoke-virtual {p0, v7}, Lcom/google/appinventor/components/runtime/ListView;->Width(I)V

    .line 246
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ListView;->ListViewLayout(I)V

    .line 248
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ListView;->SelectionIndex(I)V

    .line 249
    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/ListView;->setDivider()V

    .line 250
    return-void
.end method

.method private setDivider()V
    .locals 4

    .line 1299
    new-instance v0, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;-><init>(Lcom/google/appinventor/components/runtime/ListView;)V

    .line 1300
    .local v0, "dividerDecoration":Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->getItemDecorationCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 1301
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->getItemDecorationAt(I)Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    move-result-object v2

    .line 1302
    .local v2, "decoration":Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
    instance-of v3, v2, Lcom/google/appinventor/components/runtime/ListView$DividerItemDecoration;

    if-eqz v3, :cond_0

    .line 1303
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3, v1}, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecorationAt(I)V

    .line 1304
    goto :goto_1

    .line 1300
    .end local v2    # "decoration":Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1307
    .end local v1    # "i":I
    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 1308
    return-void
.end method


# virtual methods
.method public AddItem(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "mainText"    # Ljava/lang/String;
    .param p2, "detailText"    # Ljava/lang/String;
    .param p3, "imageName"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Add new Item to list at the end."
    .end annotation

    .line 1183
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1184
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 1185
    .local v0, "o":Ljava/lang/Object;
    instance-of v1, v0, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    if-eqz v1, :cond_1

    .line 1186
    move-object v1, v0

    check-cast v1, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    const-string v2, "Text1"

    invoke-virtual {v1, v2}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1187
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/appinventor/components/runtime/ListView;->CreateElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/appinventor/components/runtime/util/YailDictionary;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1189
    :cond_0
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1192
    :cond_1
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1194
    .end local v0    # "o":Ljava/lang/Object;
    :goto_0
    goto :goto_1

    .line 1195
    :cond_2
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->layout:I

    if-nez v0, :cond_3

    .line 1196
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1198
    :cond_3
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/appinventor/components/runtime/ListView;->CreateElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/appinventor/components/runtime/util/YailDictionary;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1201
    :goto_1
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->updateAdapterData()V

    .line 1202
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyItemChanged(I)V

    .line 1203
    return-void
.end method

.method public AddItemAtIndex(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "mainText"    # Ljava/lang/String;
    .param p3, "detailText"    # Ljava/lang/String;
    .param p4, "imageName"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Add new Item to list at a given index."
    .end annotation

    .line 1224
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-lt p1, v1, :cond_5

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v2, v1

    if-le p1, v2, :cond_0

    goto :goto_2

    .line 1229
    :cond_0
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 1230
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 1231
    .local v0, "o":Ljava/lang/Object;
    instance-of v1, v0, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    if-eqz v1, :cond_2

    .line 1232
    move-object v1, v0

    check-cast v1, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    const-string v2, "Text1"

    invoke-virtual {v1, v2}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1233
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    add-int/lit8 v2, p1, -0x1

    invoke-virtual {p0, p2, p3, p4}, Lcom/google/appinventor/components/runtime/ListView;->CreateElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/appinventor/components/runtime/util/YailDictionary;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 1235
    :cond_1
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    add-int/lit8 v2, p1, -0x1

    invoke-interface {v1, v2, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 1238
    :cond_2
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    add-int/lit8 v2, p1, -0x1

    invoke-interface {v1, v2, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 1240
    .end local v0    # "o":Ljava/lang/Object;
    :goto_0
    goto :goto_1

    .line 1241
    :cond_3
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->layout:I

    if-nez v0, :cond_4

    .line 1242
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_1

    .line 1244
    :cond_4
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {p0, p2, p3, p4}, Lcom/google/appinventor/components/runtime/ListView;->CreateElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/appinventor/components/runtime/util/YailDictionary;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 1247
    :goto_1
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->updateAdapterData()V

    .line 1248
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyItemInserted(I)V

    .line 1249
    return-void

    .line 1225
    :cond_5
    :goto_2
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v2}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v2

    new-array v1, v1, [Ljava/lang/Object;

    .line 1226
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v0

    .line 1225
    const-string v0, "AddItemAtIndex"

    const/16 v3, 0x11f9

    invoke-virtual {v2, p0, v0, v3, v1}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 1227
    return-void
.end method

.method public AddItems(Ljava/util/List;)V
    .locals 3
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Add new Items to list at the end."
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1210
    .local p1, "itemsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1211
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 1212
    .local v0, "positionStart":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    .line 1213
    .local v1, "itemCount":I
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1214
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->updateAdapterData()V

    .line 1215
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-virtual {v2, v0, v1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyItemRangeChanged(II)V

    .line 1217
    .end local v0    # "positionStart":I
    .end local v1    # "itemCount":I
    :cond_0
    return-void
.end method

.method public AddItemsAtIndex(ILcom/google/appinventor/components/runtime/util/YailList;)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "itemsList"    # Lcom/google/appinventor/components/runtime/util/YailList;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Add new Items to list at specific index."
    .end annotation

    .line 1256
    const/4 v0, 0x1

    if-lt p1, v0, :cond_2

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v1, v0

    if-le p1, v1, :cond_0

    goto :goto_0

    .line 1261
    :cond_0
    invoke-virtual {p2}, Lcom/google/appinventor/components/runtime/util/YailList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1262
    add-int/lit8 v0, p1, -0x1

    .line 1263
    .local v0, "positionStart":I
    invoke-virtual {p2}, Lcom/google/appinventor/components/runtime/util/YailList;->size()I

    move-result v1

    .line 1264
    .local v1, "itemCount":I
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v2, v0, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 1265
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->updateAdapterData()V

    .line 1266
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-virtual {v2, v0, v1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyItemRangeChanged(II)V

    .line 1268
    .end local v0    # "positionStart":I
    .end local v1    # "itemCount":I
    :cond_1
    return-void

    .line 1257
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v1

    new-array v0, v0, [Ljava/lang/Object;

    .line 1258
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v0, v3

    .line 1257
    const-string v2, "AddItemsAtIndex"

    const/16 v3, 0x11f9

    invoke-virtual {v1, p0, v2, v3, v0}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 1259
    return-void
.end method

.method public AfterPicking()V
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleEvent;
        description = "Simple event to be raised after the an element has been chosen in the list. The selected element is available in the Selection property."
    .end annotation

    .line 493
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "AfterPicking"

    invoke-static {p0, v1, v0}, Lcom/google/appinventor/components/runtime/EventDispatcher;->dispatchEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 494
    return-void
.end method

.method public BackgroundColor()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The color of the listview background."
    .end annotation

    .line 508
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->backgroundColor:I

    return v0
.end method

.method public BackgroundColor(I)V
    .locals 2
    .param p1, "argb"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "&HFF000000"
        editorType = "color"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 524
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->backgroundColor:I

    .line 525
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setBackgroundColor(I)V

    .line 526
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->linearLayout:Landroid/widget/LinearLayout;

    iget v1, p0, Lcom/google/appinventor/components/runtime/ListView;->backgroundColor:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 527
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 528
    return-void
.end method

.method public BounceEdgeEffect(Z)V
    .locals 2
    .param p1, "bounce"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 1155
    if-eqz p1, :cond_0

    .line 1156
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->bounceEdgeEffectFactory:Lcom/google/appinventor/components/runtime/ListBounceEdgeEffectFactory;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setEdgeEffectFactory(Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;)V

    goto :goto_0

    .line 1158
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->edgeEffectFactory:Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setEdgeEffectFactory(Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;)V

    .line 1160
    :goto_0
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/ListView;->bounceEffect:Z

    .line 1161
    return-void
.end method

.method public BounceEdgeEffect()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The effect of bounce from the edge after scrolling the list to the end.  True will enable the bounce effect, false will disable it."
    .end annotation

    .line 1142
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/ListView;->bounceEffect:Z

    return v0
.end method

.method public CreateElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/appinventor/components/runtime/util/YailDictionary;
    .locals 2
    .param p1, "mainText"    # Ljava/lang/String;
    .param p2, "detailText"    # Ljava/lang/String;
    .param p3, "imageName"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Create a ListView entry. MainText is required. DetailText and ImageName are optional."
    .end annotation

    .line 1003
    new-instance v0, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    invoke-direct {v0}, Lcom/google/appinventor/components/runtime/util/YailDictionary;-><init>()V

    .line 1004
    .local v0, "dictItem":Lcom/google/appinventor/components/runtime/util/YailDictionary;
    const-string v1, "Text1"

    invoke-virtual {v0, v1, p1}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1005
    const-string v1, "Text2"

    invoke-virtual {v0, v1, p2}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1006
    const-string v1, "Image"

    invoke-virtual {v0, v1, p3}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1007
    return-object v0
.end method

.method public DividerColor()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The color of the list view divider."
    .end annotation

    .line 1037
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->dividerColor:I

    return v0
.end method

.method public DividerColor(I)V
    .locals 1
    .param p1, "argb"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "&HFFFFFFFF"
        editorType = "color"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 1053
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->dividerColor:I

    .line 1054
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->dividerPaint:Landroid/graphics/Paint;

    .line 1055
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1056
    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/ListView;->setDivider()V

    .line 1057
    return-void
.end method

.method public DividerThickness()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The thickness of the element divider in the list view. If the thickness is 0, the divider is not visible."
    .end annotation

    .line 1068
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->dividerSize:I

    return v0
.end method

.method public DividerThickness(I)V
    .locals 0
    .param p1, "size"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "0"
        editorType = "non_negative_integer"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 1080
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->dividerSize:I

    .line 1081
    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/ListView;->setDivider()V

    .line 1082
    return-void
.end method

.method public ElementColor()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The color of the listview background."
    .end annotation

    .line 542
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->elementColor:I

    return v0
.end method

.method public ElementColor(I)V
    .locals 0
    .param p1, "argb"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "&H00FFFFFF"
        editorType = "color"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 558
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->elementColor:I

    .line 559
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 560
    return-void
.end method

.method public ElementCornerRadius()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The radius of the rounded corners of a list view item."
    .end annotation

    .line 1116
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->radius:I

    return v0
.end method

.method public ElementCornerRadius(I)V
    .locals 0
    .param p1, "radius"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "0"
        editorType = "non_negative_integer"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 1128
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->radius:I

    .line 1129
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 1130
    return-void
.end method

.method public ElementMarginsWidth()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The margins width of the list view element."
    .end annotation

    .line 1092
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->margins:I

    return v0
.end method

.method public ElementMarginsWidth(I)V
    .locals 0
    .param p1, "width"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "0"
        editorType = "non_negative_integer"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 1104
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->margins:I

    .line 1105
    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/ListView;->setDivider()V

    .line 1106
    return-void
.end method

.method public Elements()Ljava/util/List;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "List of elements to show in the ListView. Depending on the ListView, this may be a list of strings or a list of 3-element sub-lists containing Text, Description, and Image file name."
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 355
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    return-object v0
.end method

.method public Elements(Ljava/util/List;)V
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 339
    .local p1, "itemsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    .line 340
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->updateAdapterData()V

    .line 341
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyDataSetChanged()V

    .line 342
    return-void
.end method

.method public ElementsFromString(Ljava/lang/String;)V
    .locals 2
    .param p1, "itemstring"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = ""
        editorType = "textArea"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The TextView elements specified as a string with the stringItems separated by commas such as: Cheese,Fruit,Bacon,Radish. Each word before the comma will be an element in the list."
    .end annotation

    .line 370
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/google/appinventor/components/runtime/util/ElementsUtil;->elementsListFromString(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    .line 371
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->updateAdapterData()V

    .line 372
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyDataSetChanged()V

    .line 373
    return-void
.end method

.method public FontSize()F
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The text size of the listview stringItems."
        userVisible = false
    .end annotation

    .line 692
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->fontSizeMain:F

    return v0
.end method

.method public FontSize(F)V
    .locals 1
    .param p1, "fontSize"    # F
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 706
    const/high16 v0, 0x447a0000    # 1000.0f

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    goto :goto_0

    .line 709
    :cond_0
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->fontSizeMain:F

    goto :goto_1

    .line 707
    :cond_1
    :goto_0
    const v0, 0x4479c000    # 999.0f

    iput v0, p0, Lcom/google/appinventor/components/runtime/ListView;->fontSizeMain:F

    .line 710
    :goto_1
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 711
    return-void
.end method

.method public FontSizeDetail()F
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The text size of the listview stringItems."
    .end annotation

    .line 721
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->fontSizeDetail:F

    return v0
.end method

.method public FontSizeDetail(F)V
    .locals 1
    .param p1, "fontSize"    # F
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "14.0"
        editorType = "non_negative_float"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 734
    const/high16 v0, 0x447a0000    # 1000.0f

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    goto :goto_0

    .line 737
    :cond_0
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->fontSizeDetail:F

    goto :goto_1

    .line 735
    :cond_1
    :goto_0
    const v0, 0x4479c000    # 999.0f

    iput v0, p0, Lcom/google/appinventor/components/runtime/ListView;->fontSizeDetail:F

    .line 738
    :goto_1
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 739
    return-void
.end method

.method public FontTypeface()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 753
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->fontTypeface:Ljava/lang/String;

    return-object v0
.end method

.method public FontTypeface(Ljava/lang/String;)V
    .locals 0
    .param p1, "typeface"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "0"
        editorType = "typeface"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        userVisible = false
    .end annotation

    .line 769
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListView;->fontTypeface:Ljava/lang/String;

    .line 770
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 771
    return-void
.end method

.method public FontTypefaceDetail()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 785
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->fontTypeDetail:Ljava/lang/String;

    return-object v0
.end method

.method public FontTypefaceDetail(Ljava/lang/String;)V
    .locals 0
    .param p1, "typeface"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "0"
        editorType = "typeface"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        userVisible = false
    .end annotation

    .line 801
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListView;->fontTypeDetail:Ljava/lang/String;

    .line 802
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 803
    return-void
.end method

.method public GetDetailText(Lcom/google/appinventor/components/runtime/util/YailDictionary;)Ljava/lang/String;
    .locals 1
    .param p1, "listElement"    # Lcom/google/appinventor/components/runtime/util/YailDictionary;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Get the Detail Text of a ListView element."
    .end annotation

    .line 1017
    const-string v0, "Text2"

    invoke-virtual {p1, v0}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public GetImageName(Lcom/google/appinventor/components/runtime/util/YailDictionary;)Ljava/lang/String;
    .locals 1
    .param p1, "listElement"    # Lcom/google/appinventor/components/runtime/util/YailDictionary;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Get the filename of the image of a ListView element that has been uploaded to Media."
    .end annotation

    .line 1022
    const-string v0, "Image"

    invoke-virtual {p1, v0}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public GetMainText(Lcom/google/appinventor/components/runtime/util/YailDictionary;)Ljava/lang/String;
    .locals 1
    .param p1, "listElement"    # Lcom/google/appinventor/components/runtime/util/YailDictionary;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Get the Main Text of a ListView element."
    .end annotation

    .line 1012
    const-string v0, "Text1"

    invoke-virtual {p1, v0}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public Height(I)V
    .locals 1
    .param p1, "height"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Determines the height of the list on the view."
    .end annotation

    .line 266
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 267
    const/4 p1, -0x2

    .line 269
    :cond_0
    invoke-super {p0, p1}, Lcom/google/appinventor/components/runtime/AndroidViewComponent;->Height(I)V

    .line 270
    return-void
.end method

.method public HintText()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 283
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->hint:Ljava/lang/String;

    return-object v0
.end method

.method public HintText(Ljava/lang/String;)V
    .locals 1
    .param p1, "hint"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "Search list..."
        editorType = "string"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Sets hint on the filter bar."
    .end annotation

    .line 277
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListView;->hint:Ljava/lang/String;

    .line 278
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->txtSearchBox:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 279
    return-void
.end method

.method public ImageHeight()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The image height of the listview image stringItems."
    .end annotation

    .line 837
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->imageHeight:I

    return v0
.end method

.method public ImageHeight(I)V
    .locals 0
    .param p1, "height"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "200"
        editorType = "non_negative_integer"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 849
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->imageHeight:I

    .line 850
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 851
    return-void
.end method

.method public ImageWidth()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The image width of the listview image."
    .end annotation

    .line 813
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->imageWidth:I

    return v0
.end method

.method public ImageWidth(I)V
    .locals 0
    .param p1, "width"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "200"
        editorType = "non_negative_integer"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 825
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->imageWidth:I

    .line 826
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 827
    return-void
.end method

.method public ListData()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 950
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->propertyValue:Ljava/lang/String;

    return-object v0
.end method

.method public ListData(Ljava/lang/String;)V
    .locals 9
    .param p1, "propertyValue"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "ListViewAddData"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        userVisible = false
    .end annotation

    .line 965
    const-string v0, "Image"

    const-string v1, "Text2"

    const-string v2, "Text1"

    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListView;->propertyValue:Ljava/lang/String;

    .line 966
    if-eqz p1, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "[]"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 968
    :try_start_0
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 972
    .local v3, "arr":Lorg/json/JSONArray;
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 974
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_3

    .line 975
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 976
    .local v5, "jsonItem":Lorg/json/JSONObject;
    new-instance v6, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    invoke-direct {v6}, Lcom/google/appinventor/components/runtime/util/YailDictionary;-><init>()V

    .line 977
    .local v6, "yailItem":Lcom/google/appinventor/components/runtime/util/YailDictionary;
    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 978
    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v2, v7}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 979
    invoke-virtual {v5, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v8, ""

    if-eqz v7, :cond_0

    :try_start_1
    invoke-virtual {v5, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    :cond_0
    move-object v7, v8

    :goto_1
    invoke-virtual {v6, v1, v7}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 980
    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 981
    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_2

    :cond_1
    nop

    .line 980
    :goto_2
    invoke-virtual {v6, v0, v8}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 982
    iget-object v7, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 974
    .end local v5    # "jsonItem":Lorg/json/JSONObject;
    .end local v6    # "yailItem":Lcom/google/appinventor/components/runtime/util/YailDictionary;
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 988
    .end local v3    # "arr":Lorg/json/JSONArray;
    .end local v4    # "i":I
    :cond_3
    goto :goto_3

    .line 985
    :catch_0
    move-exception v0

    .line 986
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "ListView"

    const-string v2, "Malformed JSON in ListView.ListData"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 987
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "ListView.ListData"

    invoke-virtual {v1, p0, v3, v4, v2}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 989
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_3
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->updateAdapterData()V

    .line 990
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyDataSetChanged()V

    .line 992
    :cond_4
    return-void
.end method

.method public ListViewLayout()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Selecting the text and image layout in the ListView element."
    .end annotation

    .line 861
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->layout:I

    return v0
.end method

.method public ListViewLayout(I)V
    .locals 0
    .param p1, "value"    # I
        .annotation runtime Lcom/google/appinventor/components/annotations/Options;
            value = Lcom/google/appinventor/components/common/LayoutType;
        .end annotation
    .end param
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "0"
        editorType = "ListViewLayout"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 873
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->layout:I

    .line 874
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 875
    return-void
.end method

.method public MultiSelect(Z)V
    .locals 1
    .param p1, "multi"    # Z

    .line 902
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionIndex:I

    if-lez v0, :cond_0

    .line 903
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->clearSelections()V

    .line 904
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyDataSetChanged()V

    .line 906
    :cond_0
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/ListView;->multiSelect:Z

    .line 907
    return-void
.end method

.method public MultiSelect()Z
    .locals 1

    .line 888
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/ListView;->multiSelect:Z

    return v0
.end method

.method public Orientation()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Specifies the layout\'s orientation (vertical, horizontal)."
    .end annotation

    .line 918
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->orientation:I

    return v0
.end method

.method public Orientation(I)V
    .locals 2
    .param p1, "orientation"    # I
        .annotation runtime Lcom/google/appinventor/components/annotations/Options;
            value = Lcom/google/appinventor/components/common/ListOrientation;
        .end annotation
    .end param
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "0"
        editorType = "recyclerview_orientation"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 933
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->orientation:I

    .line 934
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 935
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->layoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    goto :goto_0

    .line 937
    :cond_0
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->layoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 939
    :goto_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    .line 940
    return-void
.end method

.method public Refresh()V
    .locals 0
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Reload the ListView to reflect any changes in the data."
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1379
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 1380
    return-void
.end method

.method public RemoveItemAtIndex(I)V
    .locals 4
    .param p1, "index"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Removes Item from list at a given index."
    .end annotation

    .line 1168
    const/4 v0, 0x1

    if-lt p1, v0, :cond_1

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le p1, v1, :cond_0

    goto :goto_0

    .line 1173
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1174
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->updateAdapterData()V

    .line 1175
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyItemRemoved(I)V

    .line 1176
    return-void

    .line 1169
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v1}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v1

    new-array v0, v0, [Ljava/lang/Object;

    .line 1170
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v0, v3

    .line 1169
    const-string v2, "RemoveItemAtIndex"

    const/16 v3, 0x11f9

    invoke-virtual {v1, p0, v2, v3, v0}, Lcom/google/appinventor/components/runtime/Form;->dispatchErrorOccurredEvent(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 1171
    return-void
.end method

.method public Selection()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The text value of the most recently selected item in the ListView."
    .end annotation

    .line 430
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->selection:Ljava/lang/String;

    return-object v0
.end method

.method public Selection(Ljava/lang/String;)V
    .locals 5
    .param p1, "value"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = ""
        editorType = "string"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 442
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListView;->selection:Ljava/lang/String;

    .line 444
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    .line 445
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_5

    .line 446
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 447
    .local v1, "item":Ljava/lang/Object;
    instance-of v2, v1, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    const/4 v3, 0x0

    if-eqz v2, :cond_3

    .line 448
    move-object v2, v1

    check-cast v2, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    const-string v4, "Text1"

    invoke-virtual {v2, v4}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 449
    move-object v2, v1

    check-cast v2, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    invoke-virtual {v2, v4}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    if-ne v2, p1, :cond_0

    .line 450
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionIndex:I

    .line 451
    move-object v2, v1

    check-cast v2, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    .line 452
    const-string v3, "Text2"

    invoke-virtual {v2, v3}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 451
    invoke-static {v2}, Lcom/google/appinventor/components/runtime/util/ElementsUtil;->toStringEmptyIfNull(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionDetailText:Ljava/lang/String;

    .line 453
    goto :goto_2

    .line 456
    :cond_0
    iput v3, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionIndex:I

    .line 457
    const-string v2, "Not Found"

    iput-object v2, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionDetailText:Ljava/lang/String;

    goto :goto_1

    .line 459
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 460
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionIndex:I

    .line 461
    goto :goto_2

    .line 463
    :cond_2
    iput v3, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionIndex:I

    goto :goto_1

    .line 466
    :cond_3
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 467
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionIndex:I

    .line 468
    goto :goto_2

    .line 470
    :cond_4
    iput v3, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionIndex:I

    .line 445
    .end local v1    # "item":Ljava/lang/Object;
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 473
    .end local v0    # "i":I
    :cond_5
    :goto_2
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionIndex:I

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ListView;->SelectionIndex(I)V

    .line 475
    :cond_6
    return-void
.end method

.method public SelectionColor()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The color of the item when it is selected."
    .end annotation

    .line 575
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionColor:I

    return v0
.end method

.method public SelectionColor(I)V
    .locals 0
    .param p1, "argb"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "&HFFCCCCCC"
        editorType = "color"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 592
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionColor:I

    .line 593
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 594
    return-void
.end method

.method public SelectionDetailText()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Returns the secondary text of the selected row in the ListView."
    .end annotation

    .line 483
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionDetailText:Ljava/lang/String;

    return-object v0
.end method

.method public SelectionIndex()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The index of the currently selected item, starting at 1. If no item is selected, the value will be 0. If an attempt is made to set this to a number less than 1 or greater than the number of stringItems in the ListView, SelectionIndex will be set to 0, and Selection will be set to the empty text."
    .end annotation

    .line 387
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionIndex:I

    return v0
.end method

.method public SelectionIndex(I)V
    .locals 3
    .param p1, "index"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 398
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionIndex:I

    .line 399
    if-lez p1, :cond_3

    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gt p1, v0, :cond_3

    .line 400
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 401
    .local v0, "o":Ljava/lang/Object;
    instance-of v1, v0, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    if-eqz v1, :cond_1

    .line 402
    move-object v1, v0

    check-cast v1, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    const-string v2, "Text1"

    invoke-virtual {v1, v2}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 403
    move-object v1, v0

    check-cast v1, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    invoke-virtual {v1, v2}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->selection:Ljava/lang/String;

    .line 404
    move-object v1, v0

    check-cast v1, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    .line 405
    const-string v2, "Text2"

    invoke-virtual {v1, v2}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 404
    invoke-static {v1}, Lcom/google/appinventor/components/runtime/util/ElementsUtil;->toStringEmptyIfNull(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionDetailText:Ljava/lang/String;

    goto :goto_0

    .line 407
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->selection:Ljava/lang/String;

    goto :goto_0

    .line 410
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->selection:Ljava/lang/String;

    .line 412
    :goto_0
    iget-boolean v1, p0, Lcom/google/appinventor/components/runtime/ListView;->multiSelect:Z

    if-eqz v1, :cond_2

    .line 413
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    iget v2, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionIndex:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->changeSelections(I)V

    goto :goto_1

    .line 415
    :cond_2
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    iget v2, p0, Lcom/google/appinventor/components/runtime/ListView;->selectionIndex:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->toggleSelection(I)V

    .line 417
    .end local v0    # "o":Ljava/lang/Object;
    :goto_1
    goto :goto_2

    .line 418
    :cond_3
    const-string v0, ""

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->selection:Ljava/lang/String;

    .line 419
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->clearSelections()V

    .line 420
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyDataSetChanged()V

    .line 422
    :goto_2
    return-void
.end method

.method public ShowFilterBar(Z)V
    .locals 2
    .param p1, "showFilter"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "False"
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 311
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/ListView;->showFilter:Z

    .line 312
    if-eqz p1, :cond_0

    .line 313
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->txtSearchBox:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    goto :goto_0

    .line 315
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->txtSearchBox:Landroid/widget/EditText;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 317
    :goto_0
    return-void
.end method

.method public ShowFilterBar()Z
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "List filter bar, allows to search the list for relevant items. True will display the bar, False will hide it."
    .end annotation

    .line 329
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/ListView;->showFilter:Z

    return v0
.end method

.method public TextColor()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The text color of the listview stringItems."
    .end annotation

    .line 608
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->textColor:I

    return v0
.end method

.method public TextColor(I)V
    .locals 0
    .param p1, "argb"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "&HFFFFFFFF"
        editorType = "color"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 624
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->textColor:I

    .line 625
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 626
    return-void
.end method

.method public TextColorDetail()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The text color of DetailText of listview stringItems. "
    .end annotation

    .line 636
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->detailTextColor:I

    return v0
.end method

.method public TextColorDetail(I)V
    .locals 0
    .param p1, "argb"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "&HFFFFFFFF"
        editorType = "color"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 649
    iput p1, p0, Lcom/google/appinventor/components/runtime/ListView;->detailTextColor:I

    .line 650
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ListView;->setAdapterData()V

    .line 651
    return-void
.end method

.method public TextSize()I
    .locals 1
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "The text size of the listview items."
    .end annotation

    .line 665
    iget v0, p0, Lcom/google/appinventor/components/runtime/ListView;->fontSizeMain:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method public TextSize(I)V
    .locals 1
    .param p1, "textSize"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        defaultValue = "22"
        editorType = "non_negative_integer"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
    .end annotation

    .line 677
    const/16 v0, 0x3e8

    if-le p1, v0, :cond_0

    .line 678
    const/16 p1, 0x3e7

    .line 680
    :cond_0
    int-to-float v0, p1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ListView;->FontSize(F)V

    .line 681
    return-void
.end method

.method public Width(I)V
    .locals 1
    .param p1, "width"    # I
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->APPEARANCE:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Determines the width of the list on the view."
    .end annotation

    .line 295
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 296
    const/4 p1, -0x2

    .line 298
    :cond_0
    invoke-super {p0, p1}, Lcom/google/appinventor/components/runtime/AndroidViewComponent;->Width(I)V

    .line 299
    return-void
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .line 254
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->linearLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method public setAdapterData()V
    .locals 18

    .line 1274
    move-object/from16 v0, p0

    new-instance v15, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    iget-object v2, v0, Lcom/google/appinventor/components/runtime/ListView;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    iget-object v3, v0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    iget v4, v0, Lcom/google/appinventor/components/runtime/ListView;->layout:I

    iget v5, v0, Lcom/google/appinventor/components/runtime/ListView;->textColor:I

    iget v6, v0, Lcom/google/appinventor/components/runtime/ListView;->detailTextColor:I

    iget v7, v0, Lcom/google/appinventor/components/runtime/ListView;->fontSizeMain:F

    iget v8, v0, Lcom/google/appinventor/components/runtime/ListView;->fontSizeDetail:F

    iget-object v9, v0, Lcom/google/appinventor/components/runtime/ListView;->fontTypeface:Ljava/lang/String;

    iget-object v10, v0, Lcom/google/appinventor/components/runtime/ListView;->fontTypeDetail:Ljava/lang/String;

    iget v11, v0, Lcom/google/appinventor/components/runtime/ListView;->elementColor:I

    iget v12, v0, Lcom/google/appinventor/components/runtime/ListView;->selectionColor:I

    iget v13, v0, Lcom/google/appinventor/components/runtime/ListView;->imageWidth:I

    iget v14, v0, Lcom/google/appinventor/components/runtime/ListView;->imageHeight:I

    iget v1, v0, Lcom/google/appinventor/components/runtime/ListView;->radius:I

    move/from16 v16, v1

    move-object v1, v15

    move-object/from16 v17, v15

    move/from16 v15, v16

    invoke-direct/range {v1 .. v15}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;Ljava/util/List;IIIFFLjava/lang/String;Ljava/lang/String;IIIII)V

    move-object/from16 v1, v17

    iput-object v1, v0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    .line 1277
    new-instance v2, Lcom/google/appinventor/components/runtime/ListView$2;

    invoke-direct {v2, v0}, Lcom/google/appinventor/components/runtime/ListView$2;-><init>(Lcom/google/appinventor/components/runtime/ListView;)V

    invoke-virtual {v1, v2}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->setOnItemClickListener(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$ClickListener;)V

    .line 1284
    iget-object v1, v0, Lcom/google/appinventor/components/runtime/ListView;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 1285
    return-void
.end method

.method public updateAdapterData()V
    .locals 2

    .line 1291
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ListView;->SelectionIndex(I)V

    .line 1292
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListView;->listAdapterWithRecyclerView:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ListView;->items:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->updateData(Ljava/util/List;)V

    .line 1293
    return-void
.end method
