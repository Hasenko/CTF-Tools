.class public final Landroidx/core/content/pm/PermissionInfoCompat;
.super Ljava/lang/Object;
.source "PermissionInfoCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/content/pm/PermissionInfoCompat$Api28Impl;,
        Landroidx/core/content/pm/PermissionInfoCompat$ProtectionFlags;,
        Landroidx/core/content/pm/PermissionInfoCompat$Protection;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getProtection(Landroid/content/pm/PermissionInfo;)I
    .locals 2

    .line 73
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 74
    invoke-static {p0}, Landroidx/core/content/pm/PermissionInfoCompat$Api28Impl;->getProtection(Landroid/content/pm/PermissionInfo;)I

    move-result p0

    return p0

    .line 76
    :cond_0
    iget p0, p0, Landroid/content/pm/PermissionInfo;->protectionLevel:I

    and-int/lit8 p0, p0, 0xf

    return p0
.end method

.method public static getProtectionFlags(Landroid/content/pm/PermissionInfo;)I
    .locals 2

    .line 87
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 88
    invoke-static {p0}, Landroidx/core/content/pm/PermissionInfoCompat$Api28Impl;->getProtectionFlags(Landroid/content/pm/PermissionInfo;)I

    move-result p0

    return p0

    .line 90
    :cond_0
    iget p0, p0, Landroid/content/pm/PermissionInfo;->protectionLevel:I

    and-int/lit8 p0, p0, -0x10

    return p0
.end method
