package com.google.appinventor.components.runtime;

import android.content.Context;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TableLayout;
import android.widget.TableRow;
import android.widget.TextView;
import com.google.appinventor.components.annotations.SimpleObject;

@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class TableLayout implements Layout {
    private final Handler handler = new Handler();
    private final android.widget.TableLayout layoutManager;
    private int numColumns;
    private int numRows;

    TableLayout(Context context, int numColumns, int numRows) {
        this.layoutManager = new android.widget.TableLayout(context);
        this.numColumns = numColumns;
        this.numRows = numRows;
        for (int row = 0; row < numRows; row++) {
            TableRow tableRow = new TableRow(context);
            for (int col = 0; col < numColumns; col++) {
                tableRow.addView(newEmptyCellView(), col, newEmptyCellLayoutParams());
            }
            this.layoutManager.addView(tableRow, row, new TableLayout.LayoutParams());
        }
    }

    int getNumColumns() {
        return this.numColumns;
    }

    void setNumColumns(int newNumColumns) {
        int i = this.numColumns;
        if (newNumColumns > i) {
            this.layoutManager.getContext();
            for (int row = 0; row < this.numRows; row++) {
                TableRow tableRow = (TableRow) this.layoutManager.getChildAt(row);
                for (int col = this.numColumns; col < newNumColumns; col++) {
                    tableRow.addView(newEmptyCellView(), col, newEmptyCellLayoutParams());
                }
            }
            this.numColumns = newNumColumns;
            return;
        }
        if (newNumColumns < i) {
            for (int row2 = 0; row2 < this.numRows; row2++) {
                TableRow tableRow2 = (TableRow) this.layoutManager.getChildAt(row2);
                tableRow2.removeViews(newNumColumns, this.numColumns - newNumColumns);
            }
            this.numColumns = newNumColumns;
        }
    }

    int getNumRows() {
        return this.numRows;
    }

    void setNumRows(int newNumRows) {
        int i = this.numRows;
        if (newNumRows > i) {
            Context context = this.layoutManager.getContext();
            for (int row = this.numRows; row < newNumRows; row++) {
                TableRow tableRow = new TableRow(context);
                for (int col = 0; col < this.numColumns; col++) {
                    tableRow.addView(newEmptyCellView(), col, newEmptyCellLayoutParams());
                }
                this.layoutManager.addView(tableRow, row, new TableLayout.LayoutParams());
            }
            this.numRows = newNumRows;
            return;
        }
        if (newNumRows < i) {
            this.layoutManager.removeViews(newNumRows, i - newNumRows);
            this.numRows = newNumRows;
        }
    }

    @Override // com.google.appinventor.components.runtime.Layout
    public ViewGroup getLayoutManager() {
        return this.layoutManager;
    }

    @Override // com.google.appinventor.components.runtime.Layout
    public void add(AndroidViewComponent child) {
        child.getView().setLayoutParams(newCellLayoutParams());
        addChildLater(child);
    }

    private void addChildLater(final AndroidViewComponent child) {
        this.handler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.TableLayout.1
            @Override // java.lang.Runnable
            public void run() {
                TableLayout.this.addChild(child);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addChild(AndroidViewComponent child) {
        int row = child.Row();
        int col = child.Column();
        if (row == -1 || col == -1) {
            addChildLater(child);
            return;
        }
        if (row < 0 || row >= this.numRows) {
            Log.e("TableLayout", "Child has illegal Row property: " + child);
            return;
        }
        if (col < 0 || col >= this.numColumns) {
            Log.e("TableLayout", "Child has illegal Column property: " + child);
            return;
        }
        TableRow tableRow = (TableRow) this.layoutManager.getChildAt(row);
        tableRow.removeViewAt(col);
        View cellView = child.getView();
        tableRow.addView(cellView, col, cellView.getLayoutParams());
    }

    private View newEmptyCellView() {
        return new TextView(this.layoutManager.getContext());
    }

    private static TableRow.LayoutParams newEmptyCellLayoutParams() {
        return new TableRow.LayoutParams(0, 0);
    }

    private static TableRow.LayoutParams newCellLayoutParams() {
        return new TableRow.LayoutParams();
    }
}
