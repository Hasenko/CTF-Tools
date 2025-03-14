package com.google.appinventor.components.runtime;

import android.os.AsyncTask;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import com.github.mikephil.charting.charts.Chart;
import com.github.mikephil.charting.components.Legend;
import com.github.mikephil.charting.data.ChartData;
import com.github.mikephil.charting.data.DataSet;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.interfaces.datasets.IDataSet;
import com.google.appinventor.components.runtime.ChartView;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public abstract class ChartView<E extends Entry, T extends IDataSet<E>, D extends ChartData<T>, C extends com.github.mikephil.charting.charts.Chart<D>, V extends ChartView<E, T, D, C, V>> {
    protected C chart;
    protected Chart chartComponent;
    protected D data;
    protected Form form;
    protected Handler uiHandler = new Handler(Looper.myLooper());

    public abstract ChartDataModel<E, T, D, C, V> createChartModel();

    public abstract View getView();

    protected ChartView(Chart chartComponent) {
        this.chartComponent = chartComponent;
        this.form = chartComponent.$form();
    }

    public Form getForm() {
        return this.form;
    }

    public void setBackgroundColor(int argb) {
        this.chart.setBackgroundColor(argb);
    }

    public void setDescription(String text) {
        this.chart.getDescription().setText(text);
    }

    public void setLegendEnabled(boolean enabled) {
        this.chart.getLegend().setEnabled(enabled);
    }

    protected void initializeDefaultSettings() {
        this.chart.getLegend().setHorizontalAlignment(Legend.LegendHorizontalAlignment.CENTER);
        this.chart.getLegend().setWordWrapEnabled(true);
    }

    public void refresh() {
        this.chart.notifyDataSetChanged();
        this.chart.invalidate();
    }

    public void refresh(ChartDataModel<E, T, D, C, V> model) {
        ChartView<E, T, D, C, V>.RefreshTask refreshTask = new RefreshTask(model.getEntries());
        refreshTask.execute(model);
    }

    private class RefreshTask extends AsyncTask<ChartDataModel<E, T, D, C, V>, Void, ChartDataModel<E, T, D, C, V>> {
        private final List<E> entries;

        public RefreshTask(List<E> entries) {
            this.entries = new ArrayList(entries);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        @SafeVarargs
        public final ChartDataModel<E, T, D, C, V> doInBackground(ChartDataModel<E, T, D, C, V>... chartDataModels) {
            return chartDataModels[0];
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(ChartDataModel<E, T, D, C, V> result) {
            ChartView.this.refresh(result, this.entries);
        }
    }

    protected void refresh(ChartDataModel<E, T, D, C, V> model, List<E> entries) {
        DataSet dataset = model.getDataset();
        if (dataset instanceof DataSet) {
            dataset.setValues(entries);
        }
        this.chart.getData().notifyDataChanged();
        this.chart.notifyDataSetChanged();
        this.chart.invalidate();
    }
}
