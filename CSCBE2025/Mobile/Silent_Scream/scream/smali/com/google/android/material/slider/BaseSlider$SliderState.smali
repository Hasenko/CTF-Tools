.class Lcom/google/android/material/slider/BaseSlider$SliderState;
.super Landroid/view/View$BaseSavedState;
.source "BaseSlider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/slider/BaseSlider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SliderState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/material/slider/BaseSlider$SliderState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field hasFocus:Z

.field stepSize:F

.field valueFrom:F

.field valueTo:F

.field values:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 3154
    new-instance v0, Lcom/google/android/material/slider/BaseSlider$SliderState$1;

    invoke-direct {v0}, Lcom/google/android/material/slider/BaseSlider$SliderState$1;-><init>()V

    sput-object v0, Lcom/google/android/material/slider/BaseSlider$SliderState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "source"    # Landroid/os/Parcel;

    .line 3175
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 3176
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/google/android/material/slider/BaseSlider$SliderState;->valueFrom:F

    .line 3177
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/google/android/material/slider/BaseSlider$SliderState;->valueTo:F

    .line 3178
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/slider/BaseSlider$SliderState;->values:Ljava/util/ArrayList;

    .line 3179
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider$SliderState;->values:Ljava/util/ArrayList;

    const-class v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    .line 3180
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/google/android/material/slider/BaseSlider$SliderState;->stepSize:F

    .line 3181
    invoke-virtual {p1}, Landroid/os/Parcel;->createBooleanArray()[Z

    move-result-object v0

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    iput-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider$SliderState;->hasFocus:Z

    .line 3182
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/google/android/material/slider/BaseSlider$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/google/android/material/slider/BaseSlider$1;

    .line 3146
    invoke-direct {p0, p1}, Lcom/google/android/material/slider/BaseSlider$SliderState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method constructor <init>(Landroid/os/Parcelable;)V
    .locals 0
    .param p1, "superState"    # Landroid/os/Parcelable;

    .line 3171
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 3172
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 3186
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 3187
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider$SliderState;->valueFrom:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 3188
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider$SliderState;->valueTo:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 3189
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider$SliderState;->values:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    .line 3190
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider$SliderState;->stepSize:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 3191
    const/4 v0, 0x1

    new-array v0, v0, [Z

    .line 3192
    .local v0, "booleans":[Z
    const/4 v1, 0x0

    iget-boolean v2, p0, Lcom/google/android/material/slider/BaseSlider$SliderState;->hasFocus:Z

    aput-boolean v2, v0, v1

    .line 3193
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBooleanArray([Z)V

    .line 3194
    return-void
.end method
