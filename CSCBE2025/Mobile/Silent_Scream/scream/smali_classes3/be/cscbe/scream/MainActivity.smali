.class public Lbe/cscbe/scream/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# instance fields
.field private passwordReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic lambda$onCreate$0(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 5
    .param p0, "v"    # Landroid/view/View;
    .param p1, "insets"    # Landroidx/core/view/WindowInsetsCompat;

    .line 36
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->systemBars()I

    move-result v0

    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v0

    .line 37
    .local v0, "systemBars":Landroidx/core/graphics/Insets;
    iget v1, v0, Landroidx/core/graphics/Insets;->left:I

    iget v2, v0, Landroidx/core/graphics/Insets;->top:I

    iget v3, v0, Landroidx/core/graphics/Insets;->right:I

    iget v4, v0, Landroidx/core/graphics/Insets;->bottom:I

    invoke-virtual {p0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 38
    return-object p1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 32
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 33
    invoke-static {p0}, Landroidx/activity/EdgeToEdge;->enable(Landroidx/activity/ComponentActivity;)V

    .line 34
    sget v0, Lbe/cscbe/scream/R$layout;->activity_main:I

    invoke-virtual {p0, v0}, Lbe/cscbe/scream/MainActivity;->setContentView(I)V

    .line 35
    sget v0, Lbe/cscbe/scream/R$id;->main:I

    invoke-virtual {p0, v0}, Lbe/cscbe/scream/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lbe/cscbe/scream/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lbe/cscbe/scream/MainActivity$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v0, v1}, Landroidx/core/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    .line 40
    new-instance v0, Lbe/cscbe/scream/passwordReceiver;

    invoke-direct {v0}, Lbe/cscbe/scream/passwordReceiver;-><init>()V

    iput-object v0, p0, Lbe/cscbe/scream/MainActivity;->passwordReceiver:Landroid/content/BroadcastReceiver;

    .line 41
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "be.cscbe.scream.OPEN_SESAME"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 42
    .local v0, "filter":Landroid/content/IntentFilter;
    iget-object v1, p0, Lbe/cscbe/scream/MainActivity;->passwordReceiver:Landroid/content/BroadcastReceiver;

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v0, v2}, Lbe/cscbe/scream/MainActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 43
    sget v1, Lbe/cscbe/scream/R$id;->imageButton:I

    invoke-virtual {p0, v1}, Lbe/cscbe/scream/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    .line 44
    .local v1, "button":Landroid/widget/ImageButton;
    new-instance v2, Lbe/cscbe/scream/MainActivity$1;

    invoke-direct {v2, p0}, Lbe/cscbe/scream/MainActivity$1;-><init>(Lbe/cscbe/scream/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    return-void
.end method
