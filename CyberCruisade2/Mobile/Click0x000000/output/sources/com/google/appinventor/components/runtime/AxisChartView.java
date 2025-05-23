package com.google.appinventor.components.runtime;

import com.github.mikephil.charting.charts.BarLineChartBase;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.data.BarLineScatterCandleBubbleData;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.formatter.ValueFormatter;
import com.github.mikephil.charting.interfaces.datasets.IBarLineScatterCandleBubbleDataSet;
import com.google.appinventor.components.runtime.AxisChartView;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public abstract class AxisChartView<E extends Entry, T extends IBarLineScatterCandleBubbleDataSet<E>, D extends BarLineScatterCandleBubbleData<T>, C extends BarLineChartBase<D>, V extends AxisChartView<E, T, D, C, V>> extends ChartView<E, T, D, C, V> {
    private List<String> axisLabels;

    protected AxisChartView(Chart chartComponent) {
        super(chartComponent);
        this.axisLabels = new ArrayList();
    }

    @Override // com.google.appinventor.components.runtime.ChartView
    protected void initializeDefaultSettings() {
        super.initializeDefaultSettings();
        this.chart.getXAxis().setPosition(XAxis.XAxisPosition.BOTTOM);
        this.chart.getAxisRight().setEnabled(false);
        this.chart.getAxisLeft().setGranularity(1.0f);
        this.chart.getXAxis().setGranularity(1.0f);
        this.chart.getXAxis().setValueFormatter(new ValueFormatter() { // from class: com.google.appinventor.components.runtime.AxisChartView.1
            public String getFormattedValue(float value) {
                int integerValue = Math.round(value) - ((int) AxisChartView.this.chart.getXAxis().getAxisMinimum());
                if (integerValue >= 0 && integerValue < AxisChartView.this.axisLabels.size()) {
                    return (String) AxisChartView.this.axisLabels.get(integerValue);
                }
                return super.getFormattedValue(value);
            }
        });
        if (this.chartComponent.XFromZero()) {
            this.chart.getXAxis().setAxisMaximum(0.0f);
        }
        if (this.chartComponent.YFromZero()) {
            this.chart.getAxisLeft().setAxisMinimum(0.0f);
        }
    }

    public void resetAxes() {
        this.chart.getXAxis().resetAxisMaximum();
        this.chart.getXAxis().resetAxisMinimum();
        this.chart.getAxisLeft().resetAxisMaximum();
        this.chart.getAxisLeft().resetAxisMinimum();
        this.chart.invalidate();
    }

    public void setXMinimum(boolean zero) {
        if (zero) {
            this.chart.getXAxis().setAxisMinimum(0.0f);
        } else {
            this.chart.getXAxis().resetAxisMinimum();
        }
        this.chart.invalidate();
    }

    public void setYMinimum(boolean zero) {
        if (zero) {
            this.chart.getAxisLeft().setAxisMinimum(0.0f);
        } else {
            this.chart.getAxisLeft().resetAxisMinimum();
        }
        this.chart.invalidate();
    }

    public double[] getXBounds() {
        return new double[]{this.chart.getXAxis().getAxisMinimum(), this.chart.getXAxis().getAxisMaximum()};
    }

    public void setXBounds(double minimum, double maximum) {
        this.chart.getXAxis().setAxisMinimum((float) minimum);
        this.chart.getXAxis().setAxisMaximum((float) maximum);
        this.chart.invalidate();
    }

    public double[] getYBounds() {
        return new double[]{this.chart.getAxisLeft().getAxisMinimum(), this.chart.getAxisLeft().getAxisMaximum()};
    }

    public void setYBounds(double minimum, double maximum) {
        this.chart.getAxisLeft().setAxisMinimum((float) minimum);
        this.chart.getAxisLeft().setAxisMaximum((float) maximum);
        this.chart.invalidate();
    }

    public void setGridEnabled(boolean enabled) {
        this.chart.getXAxis().setDrawGridLines(enabled);
        this.chart.getAxisLeft().setDrawGridLines(enabled);
        this.chart.invalidate();
    }

    public void setLabels(List<String> labels) {
        this.axisLabels = labels;
    }
}
