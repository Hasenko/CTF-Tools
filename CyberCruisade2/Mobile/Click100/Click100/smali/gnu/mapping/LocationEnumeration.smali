.class public Lgnu/mapping/LocationEnumeration;
.super Ljava/lang/Object;
.source "LocationEnumeration.java"

# interfaces
.implements Ljava/util/Iterator;
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lgnu/mapping/Location;",
        ">;",
        "Ljava/util/Enumeration<",
        "Lgnu/mapping/Location;",
        ">;"
    }
.end annotation


# instance fields
.field bindings:[Lgnu/mapping/NamedLocation;

.field env:Lgnu/mapping/SimpleEnvironment;

.field index:I

.field inherited:Lgnu/mapping/LocationEnumeration;

.field nextLoc:Lgnu/mapping/NamedLocation;

.field prevLoc:Lgnu/mapping/NamedLocation;


# direct methods
.method public constructor <init>(Lgnu/mapping/SimpleEnvironment;)V
    .locals 3
    .param p1, "env"    # Lgnu/mapping/SimpleEnvironment;

    .line 30
    iget-object v0, p1, Lgnu/mapping/SimpleEnvironment;->table:[Lgnu/mapping/NamedLocation;

    const/4 v1, 0x1

    iget v2, p1, Lgnu/mapping/SimpleEnvironment;->log2Size:I

    shl-int/2addr v1, v2

    invoke-direct {p0, v0, v1}, Lgnu/mapping/LocationEnumeration;-><init>([Lgnu/mapping/NamedLocation;I)V

    .line 31
    return-void
.end method

.method public constructor <init>([Lgnu/mapping/NamedLocation;I)V
    .locals 0
    .param p1, "bindings"    # [Lgnu/mapping/NamedLocation;
    .param p2, "count"    # I

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lgnu/mapping/LocationEnumeration;->bindings:[Lgnu/mapping/NamedLocation;

    .line 25
    iput p2, p0, Lgnu/mapping/LocationEnumeration;->index:I

    .line 26
    return-void
.end method


# virtual methods
.method public hasMoreElements()Z
    .locals 1

    .line 35
    iget-object v0, p0, Lgnu/mapping/LocationEnumeration;->env:Lgnu/mapping/SimpleEnvironment;

    invoke-virtual {v0, p0}, Lgnu/mapping/SimpleEnvironment;->hasMoreElements(Lgnu/mapping/LocationEnumeration;)Z

    move-result v0

    return v0
.end method

.method public hasNext()Z
    .locals 1

    .line 63
    invoke-virtual {p0}, Lgnu/mapping/LocationEnumeration;->hasMoreElements()Z

    move-result v0

    return v0
.end method

.method public next()Lgnu/mapping/Location;
    .locals 1

    .line 68
    invoke-virtual {p0}, Lgnu/mapping/LocationEnumeration;->nextElement()Lgnu/mapping/Location;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lgnu/mapping/LocationEnumeration;->next()Lgnu/mapping/Location;

    move-result-object v0

    return-object v0
.end method

.method public nextElement()Lgnu/mapping/Location;
    .locals 1

    .line 40
    invoke-virtual {p0}, Lgnu/mapping/LocationEnumeration;->nextLocation()Lgnu/mapping/Location;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic nextElement()Ljava/lang/Object;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lgnu/mapping/LocationEnumeration;->nextElement()Lgnu/mapping/Location;

    move-result-object v0

    return-object v0
.end method

.method public nextLocation()Lgnu/mapping/Location;
    .locals 3

    .line 45
    iget-object v0, p0, Lgnu/mapping/LocationEnumeration;->nextLoc:Lgnu/mapping/NamedLocation;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lgnu/mapping/LocationEnumeration;->hasMoreElements()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 46
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 47
    :cond_1
    :goto_0
    iget-object v0, p0, Lgnu/mapping/LocationEnumeration;->prevLoc:Lgnu/mapping/NamedLocation;

    .line 48
    .local v0, "oldPrev":Lgnu/mapping/NamedLocation;
    iget-object v1, p0, Lgnu/mapping/LocationEnumeration;->prevLoc:Lgnu/mapping/NamedLocation;

    if-nez v1, :cond_2

    .line 50
    iget-object v1, p0, Lgnu/mapping/LocationEnumeration;->bindings:[Lgnu/mapping/NamedLocation;

    iget v2, p0, Lgnu/mapping/LocationEnumeration;->index:I

    aget-object v1, v1, v2

    .line 51
    .local v1, "first":Lgnu/mapping/NamedLocation;
    iget-object v2, p0, Lgnu/mapping/LocationEnumeration;->nextLoc:Lgnu/mapping/NamedLocation;

    if-eq v2, v1, :cond_2

    .line 52
    iput-object v1, p0, Lgnu/mapping/LocationEnumeration;->prevLoc:Lgnu/mapping/NamedLocation;

    .line 54
    .end local v1    # "first":Lgnu/mapping/NamedLocation;
    :cond_2
    :goto_1
    iget-object v1, p0, Lgnu/mapping/LocationEnumeration;->prevLoc:Lgnu/mapping/NamedLocation;

    if-eqz v1, :cond_3

    iget-object v1, v1, Lgnu/mapping/NamedLocation;->next:Lgnu/mapping/NamedLocation;

    iget-object v2, p0, Lgnu/mapping/LocationEnumeration;->nextLoc:Lgnu/mapping/NamedLocation;

    if-eq v1, v2, :cond_3

    .line 55
    iget-object v1, p0, Lgnu/mapping/LocationEnumeration;->prevLoc:Lgnu/mapping/NamedLocation;

    iget-object v1, v1, Lgnu/mapping/NamedLocation;->next:Lgnu/mapping/NamedLocation;

    iput-object v1, p0, Lgnu/mapping/LocationEnumeration;->prevLoc:Lgnu/mapping/NamedLocation;

    goto :goto_1

    .line 56
    :cond_3
    iget-object v1, p0, Lgnu/mapping/LocationEnumeration;->nextLoc:Lgnu/mapping/NamedLocation;

    .line 57
    .local v1, "r":Lgnu/mapping/Location;
    iget-object v2, p0, Lgnu/mapping/LocationEnumeration;->nextLoc:Lgnu/mapping/NamedLocation;

    iget-object v2, v2, Lgnu/mapping/NamedLocation;->next:Lgnu/mapping/NamedLocation;

    iput-object v2, p0, Lgnu/mapping/LocationEnumeration;->nextLoc:Lgnu/mapping/NamedLocation;

    .line 58
    return-object v1
.end method

.method public remove()V
    .locals 4

    .line 73
    iget-object v0, p0, Lgnu/mapping/LocationEnumeration;->prevLoc:Lgnu/mapping/NamedLocation;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lgnu/mapping/NamedLocation;->next:Lgnu/mapping/NamedLocation;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lgnu/mapping/LocationEnumeration;->bindings:[Lgnu/mapping/NamedLocation;

    iget v1, p0, Lgnu/mapping/LocationEnumeration;->index:I

    aget-object v0, v0, v1

    .line 74
    .local v0, "curLoc":Lgnu/mapping/NamedLocation;
    :goto_0
    if-eqz v0, :cond_2

    iget-object v1, v0, Lgnu/mapping/NamedLocation;->next:Lgnu/mapping/NamedLocation;

    iget-object v2, p0, Lgnu/mapping/LocationEnumeration;->nextLoc:Lgnu/mapping/NamedLocation;

    if-ne v1, v2, :cond_2

    .line 76
    const/4 v1, 0x0

    iput-object v1, v0, Lgnu/mapping/NamedLocation;->next:Lgnu/mapping/NamedLocation;

    .line 77
    iget-object v1, p0, Lgnu/mapping/LocationEnumeration;->prevLoc:Lgnu/mapping/NamedLocation;

    if-eqz v1, :cond_1

    .line 78
    iget-object v2, p0, Lgnu/mapping/LocationEnumeration;->nextLoc:Lgnu/mapping/NamedLocation;

    iput-object v2, v1, Lgnu/mapping/NamedLocation;->next:Lgnu/mapping/NamedLocation;

    goto :goto_1

    .line 80
    :cond_1
    iget-object v1, p0, Lgnu/mapping/LocationEnumeration;->bindings:[Lgnu/mapping/NamedLocation;

    iget v2, p0, Lgnu/mapping/LocationEnumeration;->index:I

    iget-object v3, p0, Lgnu/mapping/LocationEnumeration;->nextLoc:Lgnu/mapping/NamedLocation;

    aput-object v3, v1, v2

    .line 81
    :goto_1
    iget-object v1, p0, Lgnu/mapping/LocationEnumeration;->env:Lgnu/mapping/SimpleEnvironment;

    iget v2, v1, Lgnu/mapping/SimpleEnvironment;->num_bindings:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v1, Lgnu/mapping/SimpleEnvironment;->num_bindings:I

    .line 82
    return-void

    .line 75
    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1
.end method
