package com.google.appinventor.components.runtime;

import com.github.mikephil.charting.charts.ScatterChart;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.ScatterData;
import com.github.mikephil.charting.interfaces.datasets.IScatterDataSet;
import com.google.appinventor.components.runtime.util.ScatterWithTrendlineRenderer;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ScatterChartView extends PointChartView<Entry, IScatterDataSet, ScatterData, ScatterChart, ScatterChartView> {
    public ScatterChartView(Chart chartComponent) {
        super(chartComponent);
        this.chart = new ScatterChart(this.form);
        this.chart.setRenderer(new ScatterWithTrendlineRenderer(this.chart, this.chart.getAnimator(), this.chart.getViewPortHandler()));
        this.data = new ScatterData();
        this.chart.setData(this.data);
        initializeDefaultSettings();
    }

    @Override // com.google.appinventor.components.runtime.ChartView
    public ChartDataModel<Entry, IScatterDataSet, ScatterData, ScatterChart, ScatterChartView> createChartModel() {
        return new ScatterChartDataModel(this.data, this);
    }
}
