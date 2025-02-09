package com.google.appinventor.components.runtime;

import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.interfaces.datasets.ILineDataSet;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class LineChartDataModel extends LineChartBaseDataModel<LineChartView> {
    public LineChartDataModel(LineData data, LineChartView view) {
        super(data, view);
    }

    protected LineChartDataModel(LineData data, LineChartView view, ILineDataSet dataset) {
        super(data, view, dataset);
    }
}
