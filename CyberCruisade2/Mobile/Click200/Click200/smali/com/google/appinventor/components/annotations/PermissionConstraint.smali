.class public interface abstract annotation Lcom/google/appinventor/components/annotations/PermissionConstraint;
.super Ljava/lang/Object;
.source "PermissionConstraint.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lcom/google/appinventor/components/annotations/PermissionConstraint;
        maxSdkVersion = -0x1
        usesPermissionFlags = ""
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->TYPE:Ljava/lang/annotation/ElementType;,
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract maxSdkVersion()I
.end method

.method public abstract name()Ljava/lang/String;
.end method

.method public abstract usesPermissionFlags()Ljava/lang/String;
.end method
