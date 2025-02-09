.class public abstract Lcom/google/appinventor/components/runtime/DataCollection;
.super Ljava/lang/Object;
.source "DataCollection.java"

# interfaces
.implements Lcom/google/appinventor/components/runtime/Component;
.implements Lcom/google/appinventor/components/runtime/DataSource;
.implements Lcom/google/appinventor/components/runtime/DataSourceChangeListener;


# annotations
.annotation runtime Lcom/google/appinventor/components/annotations/SimpleObject;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C::",
        "Lcom/google/appinventor/components/runtime/ComponentContainer;",
        "M:",
        "Lcom/google/appinventor/components/runtime/DataModel<",
        "*>;>",
        "Ljava/lang/Object;",
        "Lcom/google/appinventor/components/runtime/Component;",
        "Lcom/google/appinventor/components/runtime/DataSource<",
        "Ljava/lang/Object;",
        "Ljava/util/List<",
        "*>;>;",
        "Lcom/google/appinventor/components/runtime/DataSourceChangeListener;"
    }
.end annotation


# instance fields
.field protected final container:Lcom/google/appinventor/components/runtime/ComponentContainer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TC;"
        }
    .end annotation
.end field

.field protected dataFileColumns:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected dataModel:Lcom/google/appinventor/components/runtime/DataModel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TM;"
        }
    .end annotation
.end field

.field private dataSource:Lcom/google/appinventor/components/runtime/DataSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/appinventor/components/runtime/DataSource<",
            "**>;"
        }
    .end annotation
.end field

.field protected dataSourceKey:Ljava/lang/String;

.field private elements:Ljava/lang/String;

.field private initialized:Z

.field private lastDataSourceValue:Ljava/lang/Object;

.field protected final listeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/appinventor/components/runtime/DataSourceChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field protected sheetsColumns:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected threadRunner:Ljava/util/concurrent/ExecutorService;

.field private tick:I

.field protected useSheetHeaders:Z

.field protected webColumns:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$fgetdataSource(Lcom/google/appinventor/components/runtime/DataCollection;)Lcom/google/appinventor/components/runtime/DataSource;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSource:Lcom/google/appinventor/components/runtime/DataSource;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetlastDataSourceValue(Lcom/google/appinventor/components/runtime/DataCollection;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->lastDataSourceValue:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgettick(Lcom/google/appinventor/components/runtime/DataCollection;)I
    .locals 0

    iget p0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->tick:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fputlastDataSourceValue(Lcom/google/appinventor/components/runtime/DataCollection;Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->lastDataSourceValue:Ljava/lang/Object;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputtick(Lcom/google/appinventor/components/runtime/DataCollection;I)V
    .locals 0

    iput p1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->tick:I

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateCurrentDataSourceValue(Lcom/google/appinventor/components/runtime/DataCollection;Lcom/google/appinventor/components/runtime/DataSource;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/appinventor/components/runtime/DataCollection;->updateCurrentDataSourceValue(Lcom/google/appinventor/components/runtime/DataSource;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)V"
        }
    .end annotation

    .line 98
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    .local p1, "container":Lcom/google/appinventor/components/runtime/ComponentContainer;, "TC;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->listeners:Ljava/util/Set;

    .line 91
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->initialized:Z

    .line 93
    iput v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->tick:I

    .line 99
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    .line 102
    const-string v1, ""

    invoke-virtual {p0, v1}, Lcom/google/appinventor/components/runtime/DataCollection;->DataSourceKey(Ljava/lang/String;)V

    .line 103
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    iput-object v2, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    .line 105
    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/String;

    aput-object v1, v3, v0

    const/4 v4, 0x1

    aput-object v1, v3, v4

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataFileColumns:Ljava/util/List;

    .line 106
    new-array v3, v2, [Ljava/lang/String;

    aput-object v1, v3, v0

    aput-object v1, v3, v4

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/google/appinventor/components/runtime/DataCollection;->sheetsColumns:Ljava/util/List;

    .line 107
    new-array v2, v2, [Ljava/lang/String;

    aput-object v1, v2, v0

    aput-object v1, v2, v4

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->webColumns:Ljava/util/List;

    .line 108
    return-void
.end method

.method public static castToDouble(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;)",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 1062
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<*>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1063
    .local v0, "listDoubles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 1064
    .local v2, "o":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/Number;

    if-eqz v3, :cond_0

    .line 1065
    move-object v3, v2

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1068
    :cond_0
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1071
    goto :goto_1

    .line 1069
    :catch_0
    move-exception v3

    .line 1073
    .end local v2    # "o":Ljava/lang/Object;
    :goto_1
    goto :goto_0

    .line 1074
    :cond_1
    return-object v0
.end method

.method private isKeyValid(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 1054
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSourceKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private updateCurrentDataSourceValue(Lcom/google/appinventor/components/runtime/DataSource;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "newValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/appinventor/components/runtime/DataSource<",
            "**>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 1025
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    .local p1, "source":Lcom/google/appinventor/components/runtime/DataSource;, "Lcom/google/appinventor/components/runtime/DataSource<**>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSource:Lcom/google/appinventor/components/runtime/DataSource;

    if-ne p1, v0, :cond_2

    invoke-direct {p0, p2}, Lcom/google/appinventor/components/runtime/DataCollection;->isKeyValid(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1026
    instance-of v0, p1, Lcom/google/appinventor/components/runtime/Web;

    if-eqz v0, :cond_0

    .line 1028
    move-object v0, p1

    check-cast v0, Lcom/google/appinventor/components/runtime/Web;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->webColumns:Ljava/util/List;

    invoke-static {v1}, Lcom/google/appinventor/components/runtime/util/YailList;->makeList(Ljava/util/List;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/appinventor/components/runtime/Web;->getColumns(Lcom/google/appinventor/components/runtime/util/YailList;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v0

    .line 1033
    .local v0, "columns":Lcom/google/appinventor/components/runtime/util/YailList;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataModel:Lcom/google/appinventor/components/runtime/DataModel;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lcom/google/appinventor/components/runtime/DataModel;->getTuplesFromColumns(Lcom/google/appinventor/components/runtime/util/YailList;Z)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v1

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->lastDataSourceValue:Ljava/lang/Object;

    .line 1034
    .end local v0    # "columns":Lcom/google/appinventor/components/runtime/util/YailList;
    goto :goto_0

    :cond_0
    instance-of v0, p1, Lcom/google/appinventor/components/runtime/Spreadsheet;

    if-eqz v0, :cond_1

    .line 1035
    move-object v0, p1

    check-cast v0, Lcom/google/appinventor/components/runtime/Spreadsheet;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->sheetsColumns:Ljava/util/List;

    invoke-static {v1}, Lcom/google/appinventor/components/runtime/util/YailList;->makeList(Ljava/util/List;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v1

    iget-boolean v2, p0, Lcom/google/appinventor/components/runtime/DataCollection;->useSheetHeaders:Z

    invoke-virtual {v0, v1, v2}, Lcom/google/appinventor/components/runtime/Spreadsheet;->getColumns(Lcom/google/appinventor/components/runtime/util/YailList;Z)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v0

    .line 1037
    .restart local v0    # "columns":Lcom/google/appinventor/components/runtime/util/YailList;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataModel:Lcom/google/appinventor/components/runtime/DataModel;

    iget-boolean v2, p0, Lcom/google/appinventor/components/runtime/DataCollection;->useSheetHeaders:Z

    invoke-virtual {v1, v0, v2}, Lcom/google/appinventor/components/runtime/DataModel;->getTuplesFromColumns(Lcom/google/appinventor/components/runtime/util/YailList;Z)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v1

    iput-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->lastDataSourceValue:Ljava/lang/Object;

    .line 1038
    .end local v0    # "columns":Lcom/google/appinventor/components/runtime/util/YailList;
    goto :goto_0

    .line 1040
    :cond_1
    iput-object p3, p0, Lcom/google/appinventor/components/runtime/DataCollection;->lastDataSourceValue:Ljava/lang/Object;

    .line 1043
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public ChangeDataSource(Lcom/google/appinventor/components/runtime/DataSource;Ljava/lang/String;)V
    .locals 2
    .param p2, "keyValue"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/appinventor/components/runtime/DataSource<",
            "TK;TV;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 451
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    .local p1, "source":Lcom/google/appinventor/components/runtime/DataSource;, "Lcom/google/appinventor/components/runtime/DataSource<TK;TV;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/appinventor/components/runtime/DataCollection$4;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/appinventor/components/runtime/DataCollection$4;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;Lcom/google/appinventor/components/runtime/DataSource;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 507
    return-void
.end method

.method public Clear()V
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Clears all of the data."
    .end annotation

    .line 427
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/appinventor/components/runtime/DataCollection$3;

    invoke-direct {v1, p0}, Lcom/google/appinventor/components/runtime/DataCollection$3;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 434
    return-void
.end method

.method public DataFileXColumn(Ljava/lang/String;)V
    .locals 2
    .param p1, "column"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "data_file_column"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 214
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataFileColumns:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 215
    return-void
.end method

.method public DataFileYColumn(Ljava/lang/String;)V
    .locals 2
    .param p1, "column"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "data_file_column"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 264
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataFileColumns:Ljava/util/List;

    const/4 v1, 0x1

    invoke-interface {v0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 265
    return-void
.end method

.method public DataSourceKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "string"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 331
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSourceKey:Ljava/lang/String;

    .line 332
    return-void
.end method

.method public ElementsFromPairs(Ljava/lang/String;)V
    .locals 2
    .param p1, "elements"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "string"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 166
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->elements:Ljava/lang/String;

    .line 172
    if-eqz p1, :cond_1

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->initialized:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 177
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/appinventor/components/runtime/DataCollection$1;

    invoke-direct {v1, p0, p1}, Lcom/google/appinventor/components/runtime/DataCollection$1;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 184
    return-void

    .line 173
    :cond_1
    :goto_0
    return-void
.end method

.method public GetAllEntries()Lcom/google/appinventor/components/runtime/util/YailList;
    .locals 3
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Returns all the entries of the Data Series. A single entry is represented as a List of values of the entry."
    .end annotation

    .line 609
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    :try_start_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/appinventor/components/runtime/DataCollection$8;

    invoke-direct {v1, p0}, Lcom/google/appinventor/components/runtime/DataCollection$8;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 614
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/runtime/util/YailList;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 609
    return-object v0

    .line 617
    :catch_0
    move-exception v0

    .line 618
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 615
    .end local v0    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_1
    move-exception v0

    .line 616
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 619
    .end local v0    # "e":Ljava/lang/InterruptedException;
    nop

    .line 621
    :goto_0
    new-instance v0, Lcom/google/appinventor/components/runtime/util/YailList;

    invoke-direct {v0}, Lcom/google/appinventor/components/runtime/util/YailList;-><init>()V

    return-object v0
.end method

.method public GetEntriesWithXValue(Ljava/lang/String;)Lcom/google/appinventor/components/runtime/util/YailList;
    .locals 3
    .param p1, "x"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Returns a List of entries with x values matching the specified x value. A single entry is represented as a List of values of the entry."
    .end annotation

    .line 552
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    :try_start_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/appinventor/components/runtime/DataCollection$6;

    invoke-direct {v1, p0, p1}, Lcom/google/appinventor/components/runtime/DataCollection$6;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 558
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/runtime/util/YailList;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 552
    return-object v0

    .line 561
    :catch_0
    move-exception v0

    .line 562
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 559
    .end local v0    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_1
    move-exception v0

    .line 560
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 563
    .end local v0    # "e":Ljava/lang/InterruptedException;
    nop

    .line 566
    :goto_0
    new-instance v0, Lcom/google/appinventor/components/runtime/util/YailList;

    invoke-direct {v0}, Lcom/google/appinventor/components/runtime/util/YailList;-><init>()V

    return-object v0
.end method

.method public GetEntriesWithYValue(Ljava/lang/String;)Lcom/google/appinventor/components/runtime/util/YailList;
    .locals 3
    .param p1, "y"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Returns a List of entries with y values matching the specified y value. A single entry is represented as a List of values of the entry."
    .end annotation

    .line 581
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    :try_start_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/appinventor/components/runtime/DataCollection$7;

    invoke-direct {v1, p0, p1}, Lcom/google/appinventor/components/runtime/DataCollection$7;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 587
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/runtime/util/YailList;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 581
    return-object v0

    .line 590
    :catch_0
    move-exception v0

    .line 591
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 588
    .end local v0    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_1
    move-exception v0

    .line 589
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    .end local v0    # "e":Ljava/lang/InterruptedException;
    nop

    .line 594
    :goto_0
    new-instance v0, Lcom/google/appinventor/components/runtime/util/YailList;

    invoke-direct {v0}, Lcom/google/appinventor/components/runtime/util/YailList;-><init>()V

    return-object v0
.end method

.method public ImportFromCloudDB(Lcom/google/appinventor/components/runtime/CloudDB;Ljava/lang/String;)V
    .locals 3
    .param p1, "cloudDB"    # Lcom/google/appinventor/components/runtime/CloudDB;
    .param p2, "tag"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
    .end annotation

    .line 668
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    invoke-virtual {p1, p2}, Lcom/google/appinventor/components/runtime/CloudDB;->getDataValue(Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 671
    .local v0, "list":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/google/appinventor/components/runtime/util/YailList;>;"
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/google/appinventor/components/runtime/DataCollection$10;

    invoke-direct {v2, p0, v0, p1, p2}, Lcom/google/appinventor/components/runtime/DataCollection$10;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;Ljava/util/concurrent/Future;Lcom/google/appinventor/components/runtime/CloudDB;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 693
    return-void
.end method

.method public ImportFromDataFile(Lcom/google/appinventor/components/runtime/DataFile;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "dataFile"    # Lcom/google/appinventor/components/runtime/DataFile;
    .param p2, "xValueColumn"    # Ljava/lang/String;
    .param p3, "yValueColumn"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
    .end annotation

    .line 824
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/YailList;->makeList(Ljava/util/List;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v0

    .line 826
    .local v0, "columns":Lcom/google/appinventor/components/runtime/util/YailList;
    invoke-virtual {p0, p1, v0}, Lcom/google/appinventor/components/runtime/DataCollection;->importFromDataFileAsync(Lcom/google/appinventor/components/runtime/DataFile;Lcom/google/appinventor/components/runtime/util/YailList;)V

    .line 827
    return-void
.end method

.method public ImportFromList(Lcom/google/appinventor/components/runtime/util/YailList;)V
    .locals 2
    .param p1, "list"    # Lcom/google/appinventor/components/runtime/util/YailList;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
    .end annotation

    .line 410
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/appinventor/components/runtime/DataCollection$2;

    invoke-direct {v1, p0, p1}, Lcom/google/appinventor/components/runtime/DataCollection$2;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;Lcom/google/appinventor/components/runtime/util/YailList;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 417
    return-void
.end method

.method public ImportFromSpreadsheet(Lcom/google/appinventor/components/runtime/Spreadsheet;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .param p1, "spreadsheet"    # Lcom/google/appinventor/components/runtime/Spreadsheet;
    .param p2, "xColumn"    # Ljava/lang/String;
    .param p3, "yColumn"    # Ljava/lang/String;
    .param p4, "useHeaders"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
    .end annotation

    .line 845
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/YailList;->makeList(Ljava/util/List;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v0

    .line 847
    .local v0, "columns":Lcom/google/appinventor/components/runtime/util/YailList;
    invoke-virtual {p0, p1, v0, p4}, Lcom/google/appinventor/components/runtime/DataCollection;->importFromSpreadsheetAsync(Lcom/google/appinventor/components/runtime/Spreadsheet;Lcom/google/appinventor/components/runtime/util/YailList;Z)V

    .line 848
    return-void
.end method

.method public ImportFromTinyDB(Lcom/google/appinventor/components/runtime/TinyDB;Ljava/lang/String;)V
    .locals 3
    .param p1, "tinyDB"    # Lcom/google/appinventor/components/runtime/TinyDB;
    .param p2, "tag"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
    .end annotation

    .line 638
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    invoke-virtual {p1, p2}, Lcom/google/appinventor/components/runtime/TinyDB;->getDataValue(Ljava/lang/String;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v0

    .line 641
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-direct {p0, p1, p2, v0}, Lcom/google/appinventor/components/runtime/DataCollection;->updateCurrentDataSourceValue(Lcom/google/appinventor/components/runtime/DataSource;Ljava/lang/String;Ljava/lang/Object;)V

    .line 644
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/google/appinventor/components/runtime/DataCollection$9;

    invoke-direct {v2, p0, v0}, Lcom/google/appinventor/components/runtime/DataCollection$9;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;Ljava/util/List;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 651
    return-void
.end method

.method public ImportFromWeb(Lcom/google/appinventor/components/runtime/Web;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "web"    # Lcom/google/appinventor/components/runtime/Web;
    .param p2, "xValueColumn"    # Ljava/lang/String;
    .param p3, "yValueColumn"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Imports data from the specified Web component, given the names of the X and Y value columns. Empty columns are filled with default values (1, 2, 3, ... for Entry 1, 2, ...). In order for the data importing to be successful, to load the data, and then this block should be used on that Web component. The usage of the gotValue event in the Web component is unnecessary."
    .end annotation

    .line 872
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/YailList;->makeList(Ljava/util/List;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v0

    .line 874
    .local v0, "columns":Lcom/google/appinventor/components/runtime/util/YailList;
    invoke-virtual {p0, p1, v0}, Lcom/google/appinventor/components/runtime/DataCollection;->importFromWebAsync(Lcom/google/appinventor/components/runtime/Web;Lcom/google/appinventor/components/runtime/util/YailList;)V

    .line 875
    return-void
.end method

.method public Initialize()V
    .locals 1

    .line 886
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->initialized:Z

    .line 891
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSource:Lcom/google/appinventor/components/runtime/DataSource;

    if-eqz v0, :cond_0

    .line 892
    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/DataCollection;->Source(Lcom/google/appinventor/components/runtime/DataSource;)V

    goto :goto_0

    .line 897
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->elements:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/DataCollection;->ElementsFromPairs(Ljava/lang/String;)V

    .line 899
    :goto_0
    return-void
.end method

.method public RemoveDataSource()V
    .locals 2
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleFunction;
        description = "Un-links the currently associated Data Source component from the Chart."
    .end annotation

    .line 519
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/appinventor/components/runtime/DataCollection$5;

    invoke-direct {v1, p0}, Lcom/google/appinventor/components/runtime/DataCollection$5;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 538
    return-void
.end method

.method public Source(Lcom/google/appinventor/components/runtime/DataSource;)V
    .locals 3
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "chart_data_source"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/appinventor/components/runtime/DataSource<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 356
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    .local p1, "dataSource":Lcom/google/appinventor/components/runtime/DataSource;, "Lcom/google/appinventor/components/runtime/DataSource<TK;TV;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSource:Lcom/google/appinventor/components/runtime/DataSource;

    if-eq v0, p1, :cond_0

    instance-of v1, v0, Lcom/google/appinventor/components/runtime/ObservableDataSource;

    if-eqz v1, :cond_0

    .line 357
    check-cast v0, Lcom/google/appinventor/components/runtime/ObservableDataSource;

    invoke-interface {v0, p0}, Lcom/google/appinventor/components/runtime/ObservableDataSource;->removeDataObserver(Lcom/google/appinventor/components/runtime/DataSourceChangeListener;)V

    .line 360
    :cond_0
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSource:Lcom/google/appinventor/components/runtime/DataSource;

    .line 365
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->initialized:Z

    if-eqz v0, :cond_6

    .line 366
    instance-of v0, p1, Lcom/google/appinventor/components/runtime/ObservableDataSource;

    if-eqz v0, :cond_1

    .line 368
    move-object v0, p1

    check-cast v0, Lcom/google/appinventor/components/runtime/ObservableDataSource;

    invoke-interface {v0, p0}, Lcom/google/appinventor/components/runtime/ObservableDataSource;->addDataObserver(Lcom/google/appinventor/components/runtime/DataSourceChangeListener;)V

    .line 371
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSourceKey:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 372
    return-void

    .line 376
    :cond_1
    instance-of v0, p1, Lcom/google/appinventor/components/runtime/DataFile;

    if-eqz v0, :cond_2

    .line 377
    move-object v0, p1

    check-cast v0, Lcom/google/appinventor/components/runtime/DataFile;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataFileColumns:Ljava/util/List;

    invoke-static {v1}, Lcom/google/appinventor/components/runtime/util/YailList;->makeList(Ljava/util/List;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/appinventor/components/runtime/DataCollection;->importFromDataFileAsync(Lcom/google/appinventor/components/runtime/DataFile;Lcom/google/appinventor/components/runtime/util/YailList;)V

    goto :goto_0

    .line 378
    :cond_2
    instance-of v0, p1, Lcom/google/appinventor/components/runtime/TinyDB;

    if-eqz v0, :cond_3

    .line 379
    move-object v0, p1

    check-cast v0, Lcom/google/appinventor/components/runtime/TinyDB;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSourceKey:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/google/appinventor/components/runtime/DataCollection;->ImportFromTinyDB(Lcom/google/appinventor/components/runtime/TinyDB;Ljava/lang/String;)V

    goto :goto_0

    .line 380
    :cond_3
    instance-of v0, p1, Lcom/google/appinventor/components/runtime/CloudDB;

    if-eqz v0, :cond_4

    .line 381
    move-object v0, p1

    check-cast v0, Lcom/google/appinventor/components/runtime/CloudDB;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSourceKey:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/google/appinventor/components/runtime/DataCollection;->ImportFromCloudDB(Lcom/google/appinventor/components/runtime/CloudDB;Ljava/lang/String;)V

    goto :goto_0

    .line 382
    :cond_4
    instance-of v0, p1, Lcom/google/appinventor/components/runtime/Spreadsheet;

    if-eqz v0, :cond_5

    .line 383
    move-object v0, p1

    check-cast v0, Lcom/google/appinventor/components/runtime/Spreadsheet;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->sheetsColumns:Ljava/util/List;

    invoke-static {v1}, Lcom/google/appinventor/components/runtime/util/YailList;->makeList(Ljava/util/List;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v1

    iget-boolean v2, p0, Lcom/google/appinventor/components/runtime/DataCollection;->useSheetHeaders:Z

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/appinventor/components/runtime/DataCollection;->importFromSpreadsheetAsync(Lcom/google/appinventor/components/runtime/Spreadsheet;Lcom/google/appinventor/components/runtime/util/YailList;Z)V

    goto :goto_0

    .line 385
    :cond_5
    instance-of v0, p1, Lcom/google/appinventor/components/runtime/Web;

    if-eqz v0, :cond_6

    .line 386
    move-object v0, p1

    check-cast v0, Lcom/google/appinventor/components/runtime/Web;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->webColumns:Ljava/util/List;

    invoke-static {v1}, Lcom/google/appinventor/components/runtime/util/YailList;->makeList(Ljava/util/List;)Lcom/google/appinventor/components/runtime/util/YailList;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/appinventor/components/runtime/DataCollection;->importFromWebAsync(Lcom/google/appinventor/components/runtime/Web;Lcom/google/appinventor/components/runtime/util/YailList;)V

    .line 389
    :cond_6
    :goto_0
    return-void
.end method

.method public SpreadsheetUseHeaders(Z)V
    .locals 0
    .param p1, "useHeaders"    # Z
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "boolean"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 196
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iput-boolean p1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->useSheetHeaders:Z

    .line 197
    return-void
.end method

.method public SpreadsheetXColumn(Ljava/lang/String;)V
    .locals 2
    .param p1, "column"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "string"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 246
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->sheetsColumns:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 247
    return-void
.end method

.method public SpreadsheetYColumn(Ljava/lang/String;)V
    .locals 2
    .param p1, "column"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "string"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        userVisible = false
    .end annotation

    .line 296
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->sheetsColumns:Ljava/util/List;

    const/4 v1, 0x1

    invoke-interface {v0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 297
    return-void
.end method

.method public WebXColumn(Ljava/lang/String;)V
    .locals 2
    .param p1, "column"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "string"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Sets the column to parse from the attached Web component for the x values. If a column is not specified, default values for the x values will be generated instead."
        userVisible = false
    .end annotation

    .line 234
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->webColumns:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 235
    return-void
.end method

.method public WebYColumn(Ljava/lang/String;)V
    .locals 2
    .param p1, "column"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/DesignerProperty;
        editorType = "string"
    .end annotation

    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        category = .enum Lcom/google/appinventor/components/annotations/PropertyCategory;->BEHAVIOR:Lcom/google/appinventor/components/annotations/PropertyCategory;
        description = "Sets the column to parse from the attached Web component for the y values. If a column is not specified, default values for the y values will be generated instead."
        userVisible = false
    .end annotation

    .line 284
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->webColumns:Ljava/util/List;

    const/4 v1, 0x1

    invoke-interface {v0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 285
    return-void
.end method

.method public addDataSourceChangeListener(Lcom/google/appinventor/components/runtime/DataSourceChangeListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/appinventor/components/runtime/DataSourceChangeListener;

    .line 123
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->listeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 125
    const/4 v0, 0x0

    invoke-interface {p1, p0, v0, v0}, Lcom/google/appinventor/components/runtime/DataSourceChangeListener;->onDataSourceValueChange(Lcom/google/appinventor/components/runtime/DataSource;Ljava/lang/String;Ljava/lang/Object;)V

    .line 126
    return-void
.end method

.method public bridge synthetic getDataValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 37
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    invoke-virtual {p0, p1}, Lcom/google/appinventor/components/runtime/DataCollection;->getDataValue(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getDataValue(Ljava/lang/Object;)Ljava/util/List;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    .line 136
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataModel:Lcom/google/appinventor/components/runtime/DataModel;

    iget-object v0, v0, Lcom/google/appinventor/components/runtime/DataModel;->entries:Ljava/util/List;

    return-object v0
.end method

.method public getDispatchDelegate()Lcom/google/appinventor/components/runtime/HandlesEventDispatching;
    .locals 1

    .line 903
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v0}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$form()Lcom/google/appinventor/components/runtime/Form;

    move-result-object v0

    return-object v0
.end method

.method protected importFromDataFileAsync(Lcom/google/appinventor/components/runtime/DataFile;Lcom/google/appinventor/components/runtime/util/YailList;)V
    .locals 3
    .param p1, "dataFile"    # Lcom/google/appinventor/components/runtime/DataFile;
    .param p2, "columns"    # Lcom/google/appinventor/components/runtime/util/YailList;

    .line 708
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    invoke-virtual {p1, p2}, Lcom/google/appinventor/components/runtime/DataFile;->getDataValue(Lcom/google/appinventor/components/runtime/util/YailList;)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 711
    .local v0, "dataFileColumns":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/google/appinventor/components/runtime/util/YailList;>;"
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/google/appinventor/components/runtime/DataCollection$11;

    invoke-direct {v2, p0, v0}, Lcom/google/appinventor/components/runtime/DataCollection$11;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;Ljava/util/concurrent/Future;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 734
    return-void
.end method

.method protected importFromSpreadsheetAsync(Lcom/google/appinventor/components/runtime/Spreadsheet;Lcom/google/appinventor/components/runtime/util/YailList;Z)V
    .locals 3
    .param p1, "sheets"    # Lcom/google/appinventor/components/runtime/Spreadsheet;
    .param p2, "columns"    # Lcom/google/appinventor/components/runtime/util/YailList;
    .param p3, "useHeaders"    # Z

    .line 739
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    invoke-virtual {p1, p2, p3}, Lcom/google/appinventor/components/runtime/Spreadsheet;->getDataValue(Lcom/google/appinventor/components/runtime/util/YailList;Z)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 741
    .local v0, "sheetColumns":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/google/appinventor/components/runtime/util/YailList;>;"
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/google/appinventor/components/runtime/DataCollection$12;

    invoke-direct {v2, p0, v0, p1, p3}, Lcom/google/appinventor/components/runtime/DataCollection$12;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;Ljava/util/concurrent/Future;Lcom/google/appinventor/components/runtime/Spreadsheet;Z)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 763
    return-void
.end method

.method protected importFromWebAsync(Lcom/google/appinventor/components/runtime/Web;Lcom/google/appinventor/components/runtime/util/YailList;)V
    .locals 3
    .param p1, "webComponent"    # Lcom/google/appinventor/components/runtime/Web;
    .param p2, "columns"    # Lcom/google/appinventor/components/runtime/util/YailList;

    .line 775
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    invoke-virtual {p1, p2}, Lcom/google/appinventor/components/runtime/Web;->getDataValue(Lcom/google/appinventor/components/runtime/util/YailList;)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 778
    .local v0, "webColumns":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/google/appinventor/components/runtime/util/YailList;>;"
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/google/appinventor/components/runtime/DataCollection$13;

    invoke-direct {v2, p0, v0, p1}, Lcom/google/appinventor/components/runtime/DataCollection$13;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;Ljava/util/concurrent/Future;Lcom/google/appinventor/components/runtime/Web;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 804
    return-void
.end method

.method public abstract onDataChange()V
.end method

.method public onDataSourceValueChange(Lcom/google/appinventor/components/runtime/DataSource;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "newValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/appinventor/components/runtime/DataSource<",
            "**>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 924
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    .local p1, "component":Lcom/google/appinventor/components/runtime/DataSource;, "Lcom/google/appinventor/components/runtime/DataSource<**>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSource:Lcom/google/appinventor/components/runtime/DataSource;

    if-ne p1, v0, :cond_1

    .line 925
    invoke-direct {p0, p2}, Lcom/google/appinventor/components/runtime/DataCollection;->isKeyValid(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 930
    :cond_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/appinventor/components/runtime/DataCollection$14;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/appinventor/components/runtime/DataCollection$14;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;Lcom/google/appinventor/components/runtime/DataSource;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 948
    return-void

    .line 926
    :cond_1
    :goto_0
    return-void
.end method

.method public onReceiveValue(Lcom/google/appinventor/components/runtime/RealTimeDataSource;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 4
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/appinventor/components/runtime/RealTimeDataSource<",
            "**>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 953
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    .local p1, "component":Lcom/google/appinventor/components/runtime/RealTimeDataSource;, "Lcom/google/appinventor/components/runtime/RealTimeDataSource<**>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSource:Lcom/google/appinventor/components/runtime/DataSource;

    if-eq p1, v0, :cond_0

    .line 954
    return-void

    .line 963
    :cond_0
    instance-of v0, p1, Lcom/google/appinventor/components/runtime/BluetoothClient;

    if-eqz v0, :cond_2

    .line 965
    move-object v0, p3

    check-cast v0, Ljava/lang/String;

    .line 969
    .local v0, "valueString":Ljava/lang/String;
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSourceKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    .line 972
    .local v1, "importData":Z
    if-eqz v1, :cond_1

    .line 975
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/DataCollection;->dataSourceKey:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p3

    .line 977
    .end local v0    # "valueString":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 980
    .end local v1    # "importData":Z
    :cond_2
    invoke-direct {p0, p2}, Lcom/google/appinventor/components/runtime/DataCollection;->isKeyValid(Ljava/lang/String;)Z

    move-result v1

    .line 983
    .restart local v1    # "importData":Z
    :goto_0
    if-eqz v1, :cond_3

    .line 985
    move-object v0, p3

    .line 991
    .local v0, "finalValue":Ljava/lang/Object;
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/DataCollection;->container:Lcom/google/appinventor/components/runtime/ComponentContainer;

    invoke-interface {v2}, Lcom/google/appinventor/components/runtime/ComponentContainer;->$context()Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Lcom/google/appinventor/components/runtime/DataCollection$15;

    invoke-direct {v3, p0, v0}, Lcom/google/appinventor/components/runtime/DataCollection$15;-><init>(Lcom/google/appinventor/components/runtime/DataCollection;Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1012
    .end local v0    # "finalValue":Ljava/lang/Object;
    :cond_3
    return-void
.end method

.method public removeDataSourceChangeListener(Lcom/google/appinventor/components/runtime/DataSourceChangeListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/appinventor/components/runtime/DataSourceChangeListener;

    .line 129
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/DataCollection;->listeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 130
    return-void
.end method

.method public setExecutorService(Ljava/util/concurrent/ExecutorService;)V
    .locals 0
    .param p1, "service"    # Ljava/util/concurrent/ExecutorService;

    .line 119
    .local p0, "this":Lcom/google/appinventor/components/runtime/DataCollection;, "Lcom/google/appinventor/components/runtime/DataCollection<TC;TM;>;"
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/DataCollection;->threadRunner:Ljava/util/concurrent/ExecutorService;

    .line 120
    return-void
.end method
