.class Landroidx/appcompat/widget/SwitchCompat$EmojiCompatInitCallback;
.super Landroidx/emoji2/text/EmojiCompat$InitCallback;
.source "SwitchCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/SwitchCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "EmojiCompatInitCallback"
.end annotation


# instance fields
.field private final mOuterWeakRef:Ljava/lang/ref/Reference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/Reference<",
            "Landroidx/appcompat/widget/SwitchCompat;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/appcompat/widget/SwitchCompat;)V
    .locals 1
    .param p1, "view"    # Landroidx/appcompat/widget/SwitchCompat;

    .line 1670
    invoke-direct {p0}, Landroidx/emoji2/text/EmojiCompat$InitCallback;-><init>()V

    .line 1671
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/appcompat/widget/SwitchCompat$EmojiCompatInitCallback;->mOuterWeakRef:Ljava/lang/ref/Reference;

    .line 1672
    return-void
.end method


# virtual methods
.method public onFailed(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .line 1685
    iget-object v0, p0, Landroidx/appcompat/widget/SwitchCompat$EmojiCompatInitCallback;->mOuterWeakRef:Ljava/lang/ref/Reference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    .line 1686
    .local v0, "view":Landroidx/appcompat/widget/SwitchCompat;
    if-eqz v0, :cond_0

    .line 1687
    invoke-virtual {v0}, Landroidx/appcompat/widget/SwitchCompat;->onEmojiCompatInitializedForSwitchText()V

    .line 1689
    :cond_0
    return-void
.end method

.method public onInitialized()V
    .locals 1

    .line 1677
    iget-object v0, p0, Landroidx/appcompat/widget/SwitchCompat$EmojiCompatInitCallback;->mOuterWeakRef:Ljava/lang/ref/Reference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    .line 1678
    .local v0, "view":Landroidx/appcompat/widget/SwitchCompat;
    if-eqz v0, :cond_0

    .line 1679
    invoke-virtual {v0}, Landroidx/appcompat/widget/SwitchCompat;->onEmojiCompatInitializedForSwitchText()V

    .line 1681
    :cond_0
    return-void
.end method
