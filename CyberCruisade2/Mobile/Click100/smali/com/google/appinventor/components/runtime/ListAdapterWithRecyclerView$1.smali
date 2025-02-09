.class Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;
.super Landroid/widget/Filter;
.source "ListAdapterWithRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;


# direct methods
.method constructor <init>(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    .line 64
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    return-void
.end method


# virtual methods
.method protected performFiltering(Ljava/lang/CharSequence;)Landroid/widget/Filter$FilterResults;
    .locals 9
    .param p1, "charSequence"    # Ljava/lang/CharSequence;

    .line 67
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fputlastQuery(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;Ljava/lang/String;)V

    .line 68
    new-instance v0, Landroid/widget/Filter$FilterResults;

    invoke-direct {v0}, Landroid/widget/Filter$FilterResults;-><init>()V

    .line 69
    .local v0, "results":Landroid/widget/Filter$FilterResults;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .local v1, "filteredList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v2, v3}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fputoriginalPositions(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;Ljava/util/List;)V

    .line 71
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fgetlastQuery(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fgetlastQuery(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    goto/16 :goto_2

    .line 75
    :cond_0
    const/4 v2, 0x0

    .local v2, "index":I
    :goto_0
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-static {v3}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fgetoriginalItems(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_6

    .line 76
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-static {v3}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fgetoriginalItems(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 78
    .local v3, "item":Ljava/lang/Object;
    instance-of v4, v3, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    if-eqz v4, :cond_3

    .line 79
    move-object v4, v3

    check-cast v4, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    const-string v5, "Text1"

    invoke-virtual {v4, v5}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 80
    move-object v4, v3

    check-cast v4, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    const-string v6, "Text2"

    invoke-virtual {v4, v6}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 81
    .local v4, "o":Ljava/lang/Object;
    move-object v6, v3

    check-cast v6, Lcom/google/appinventor/components/runtime/util/YailDictionary;

    invoke-virtual {v6, v5}, Lcom/google/appinventor/components/runtime/util/YailDictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 82
    .local v5, "filterString":Ljava/lang/String;
    if-eqz v4, :cond_1

    .line 83
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 85
    .end local v4    # "o":Ljava/lang/Object;
    :cond_1
    goto :goto_1

    .line 86
    .end local v5    # "filterString":Ljava/lang/String;
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "filterString":Ljava/lang/String;
    goto :goto_1

    .line 89
    .end local v5    # "filterString":Ljava/lang/String;
    :cond_3
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 91
    .restart local v5    # "filterString":Ljava/lang/String;
    :goto_1
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    iget-object v6, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-static {v6}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fgetlastQuery(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 92
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-static {v4}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fgetoriginalPositions(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Ljava/util/List;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .end local v3    # "item":Ljava/lang/Object;
    .end local v5    # "filterString":Ljava/lang/String;
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 72
    .end local v2    # "index":I
    :cond_5
    :goto_2
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-static {v3}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fgetoriginalItems(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v1, v2

    .line 73
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-static {v4}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fgetoriginalItems(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v2, v3}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fputitems(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;Ljava/util/List;)V

    .line 97
    :cond_6
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    iput v2, v0, Landroid/widget/Filter$FilterResults;->count:I

    .line 98
    iput-object v1, v0, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    .line 99
    return-object v0
.end method

.method protected publishResults(Ljava/lang/CharSequence;Landroid/widget/Filter$FilterResults;)V
    .locals 3
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "filterResults"    # Landroid/widget/Filter$FilterResults;

    .line 104
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0, v1}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->-$$Nest$fputitems(Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;Ljava/util/List;)V

    .line 105
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->clearSelections()V

    .line 106
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView$1;->this$0:Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;

    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/ListAdapterWithRecyclerView;->notifyDataSetChanged()V

    .line 110
    return-void
.end method
