package com.google.appinventor.components.runtime;

import android.view.View;
import android.view.ViewGroup;
import com.github.mikephil.charting.charts.BarLineChartBase;
import com.github.mikephil.charting.data.BarLineScatterCandleBubbleData;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.interfaces.datasets.IBarLineScatterCandleBubbleDataSet;
import com.google.appinventor.components.runtime.PointChartView;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public abstract class PointChartView<E extends Entry, T extends IBarLineScatterCandleBubbleDataSet<E>, D extends BarLineScatterCandleBubbleData<T>, C extends BarLineChartBase<D>, V extends PointChartView<E, T, D, C, V>> extends AxisChartView<E, T, D, C, V> {
    protected PointChartView(Chart chartComponent) {
        super(chartComponent);
    }

    @Override // com.google.appinventor.components.runtime.AxisChartView, com.google.appinventor.components.runtime.ChartView
    protected void initializeDefaultSettings() {
        super.initializeDefaultSettings();
        this.chart.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
    }

    @Override // com.google.appinventor.components.runtime.ChartView
    public View getView() {
        return this.chart;
    }
}
