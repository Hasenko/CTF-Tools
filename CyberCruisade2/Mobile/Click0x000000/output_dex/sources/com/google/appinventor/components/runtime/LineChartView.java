package com.google.appinventor.components.runtime;

import com.github.mikephil.charting.charts.LineChart;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.interfaces.datasets.ILineDataSet;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class LineChartView extends LineChartViewBase<LineChartView> {
    public LineChartView(Chart chartComponent) {
        super(chartComponent);
    }

    @Override // com.google.appinventor.components.runtime.ChartView
    public ChartDataModel<Entry, ILineDataSet, LineData, LineChart, LineChartView> createChartModel() {
        return new LineChartDataModel(this.data, this);
    }
}
