.class Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;
.super Ljava/lang/Object;
.source "LocationManagerCompat.java"

# interfaces
.implements Landroid/location/LocationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/location/LocationManagerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LocationListenerTransport"
.end annotation


# instance fields
.field final mExecutor:Ljava/util/concurrent/Executor;

.field volatile mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;


# direct methods
.method constructor <init>(Landroidx/core/location/LocationManagerCompat$LocationListenerKey;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 727
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 728
    iput-object p1, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    .line 729
    iput-object p2, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method


# virtual methods
.method public getKey()Landroidx/core/location/LocationManagerCompat$LocationListenerKey;
    .locals 1

    .line 733
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    invoke-static {v0}, Landroidx/core/util/ObjectsCompat;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    return-object v0
.end method

.method synthetic lambda$onFlushComplete$2$androidx-core-location-LocationManagerCompat$LocationListenerTransport(I)V
    .locals 1

    .line 777
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    if-nez v0, :cond_0

    return-void

    .line 781
    :cond_0
    iget-object v0, v0, Landroidx/core/location/LocationManagerCompat$LocationListenerKey;->mListener:Landroidx/core/location/LocationListenerCompat;

    invoke-interface {v0, p1}, Landroidx/core/location/LocationListenerCompat;->onFlushComplete(I)V

    return-void
.end method

.method synthetic lambda$onLocationChanged$0$androidx-core-location-LocationManagerCompat$LocationListenerTransport(Landroid/location/Location;)V
    .locals 1

    .line 747
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    if-nez v0, :cond_0

    return-void

    .line 751
    :cond_0
    iget-object v0, v0, Landroidx/core/location/LocationManagerCompat$LocationListenerKey;->mListener:Landroidx/core/location/LocationListenerCompat;

    invoke-interface {v0, p1}, Landroidx/core/location/LocationListenerCompat;->onLocationChanged(Landroid/location/Location;)V

    return-void
.end method

.method synthetic lambda$onLocationChanged$1$androidx-core-location-LocationManagerCompat$LocationListenerTransport(Ljava/util/List;)V
    .locals 1

    .line 762
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    if-nez v0, :cond_0

    return-void

    .line 766
    :cond_0
    iget-object v0, v0, Landroidx/core/location/LocationManagerCompat$LocationListenerKey;->mListener:Landroidx/core/location/LocationListenerCompat;

    invoke-interface {v0, p1}, Landroidx/core/location/LocationListenerCompat;->onLocationChanged(Ljava/util/List;)V

    return-void
.end method

.method synthetic lambda$onProviderDisabled$5$androidx-core-location-LocationManagerCompat$LocationListenerTransport(Ljava/lang/String;)V
    .locals 1

    .line 822
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    if-nez v0, :cond_0

    return-void

    .line 826
    :cond_0
    iget-object v0, v0, Landroidx/core/location/LocationManagerCompat$LocationListenerKey;->mListener:Landroidx/core/location/LocationListenerCompat;

    invoke-interface {v0, p1}, Landroidx/core/location/LocationListenerCompat;->onProviderDisabled(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onProviderEnabled$4$androidx-core-location-LocationManagerCompat$LocationListenerTransport(Ljava/lang/String;)V
    .locals 1

    .line 807
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    if-nez v0, :cond_0

    return-void

    .line 811
    :cond_0
    iget-object v0, v0, Landroidx/core/location/LocationManagerCompat$LocationListenerKey;->mListener:Landroidx/core/location/LocationListenerCompat;

    invoke-interface {v0, p1}, Landroidx/core/location/LocationListenerCompat;->onProviderEnabled(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onStatusChanged$3$androidx-core-location-LocationManagerCompat$LocationListenerTransport(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 1

    .line 792
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    if-nez v0, :cond_0

    return-void

    .line 796
    :cond_0
    iget-object v0, v0, Landroidx/core/location/LocationManagerCompat$LocationListenerKey;->mListener:Landroidx/core/location/LocationListenerCompat;

    invoke-interface {v0, p1, p2, p3}, Landroidx/core/location/LocationListenerCompat;->onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V

    return-void
.end method

.method public onFlushComplete(I)V
    .locals 2

    .line 772
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    if-nez v0, :cond_0

    return-void

    .line 776
    :cond_0
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport$$ExternalSyntheticLambda4;-><init>(Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .locals 2

    .line 742
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    if-nez v0, :cond_0

    return-void

    .line 746
    :cond_0
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport$$ExternalSyntheticLambda3;-><init>(Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;Landroid/location/Location;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onLocationChanged(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/location/Location;",
            ">;)V"
        }
    .end annotation

    .line 757
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    if-nez v0, :cond_0

    return-void

    .line 761
    :cond_0
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport$$ExternalSyntheticLambda2;-><init>(Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;Ljava/util/List;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .locals 2

    .line 817
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    if-nez v0, :cond_0

    return-void

    .line 821
    :cond_0
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport$$ExternalSyntheticLambda1;-><init>(Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .locals 2

    .line 802
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    if-nez v0, :cond_0

    return-void

    .line 806
    :cond_0
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport$$ExternalSyntheticLambda0;-><init>(Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 2

    .line 787
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    if-nez v0, :cond_0

    return-void

    .line 791
    :cond_0
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1, p2, p3}, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport$$ExternalSyntheticLambda5;-><init>(Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;Ljava/lang/String;ILandroid/os/Bundle;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public unregister()V
    .locals 1

    const/4 v0, 0x0

    .line 737
    iput-object v0, p0, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->mKey:Landroidx/core/location/LocationManagerCompat$LocationListenerKey;

    return-void
.end method
