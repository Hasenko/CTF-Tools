.class public Lkawa/lang/NamedException;
.super Ljava/lang/RuntimeException;
.source "NamedException.java"


# instance fields
.field args:[Ljava/lang/Object;

.field name:Lgnu/mapping/Symbol;


# direct methods
.method public constructor <init>(Lgnu/mapping/Symbol;[Ljava/lang/Object;)V
    .locals 0
    .param p1, "name"    # Lgnu/mapping/Symbol;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 16
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 17
    iput-object p1, p0, Lkawa/lang/NamedException;->name:Lgnu/mapping/Symbol;

    .line 18
    iput-object p2, p0, Lkawa/lang/NamedException;->args:[Ljava/lang/Object;

    .line 19
    return-void
.end method


# virtual methods
.method public applyHandler(Ljava/lang/Object;Lgnu/mapping/Procedure;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "handler"    # Lgnu/mapping/Procedure;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 29
    invoke-virtual {p0, p1}, Lkawa/lang/NamedException;->checkMatch(Ljava/lang/Object;)V

    .line 30
    iget-object v0, p0, Lkawa/lang/NamedException;->args:[Ljava/lang/Object;

    invoke-virtual {p2, v0}, Lgnu/mapping/Procedure;->applyN([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public checkMatch(Ljava/lang/Object;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 23
    iget-object v0, p0, Lkawa/lang/NamedException;->name:Lgnu/mapping/Symbol;

    if-eq p1, v0, :cond_1

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 24
    :cond_0
    throw p0

    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 35
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 36
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v1, "#<ERROR"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 37
    const/4 v1, 0x0

    .line 38
    .local v1, "i":I
    iget-object v2, p0, Lkawa/lang/NamedException;->args:[Ljava/lang/Object;

    array-length v3, v2

    .line 40
    .local v3, "len":I
    const/4 v4, 0x1

    if-le v3, v4, :cond_0

    const/4 v4, 0x0

    aget-object v2, v2, v4

    const-string v4, "misc-error"

    if-ne v2, v4, :cond_0

    .line 41
    add-int/lit8 v1, v1, 0x1

    .line 42
    :cond_0
    :goto_0
    if-ge v1, v3, :cond_1

    .line 44
    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 45
    iget-object v2, p0, Lkawa/lang/NamedException;->args:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 42
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 47
    :cond_1
    const-string v2, ">"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
