package com.google.appinventor.components.runtime;

import com.github.mikephil.charting.charts.Chart;
import com.github.mikephil.charting.data.ChartData;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.interfaces.datasets.IDataSet;
import com.google.appinventor.components.runtime.ChartView;
import com.google.appinventor.components.runtime.util.YailList;
import java.util.Arrays;
import java.util.List;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public abstract class Chart2DDataModel<E extends Entry, T extends IDataSet<E>, D extends ChartData<T>, C extends com.github.mikephil.charting.charts.Chart<D>, V extends ChartView<E, T, D, C, V>> extends ChartDataModel<E, T, D, C, V> {
    protected Chart2DDataModel(D data, V view) {
        super(data, view);
    }

    @Override // com.google.appinventor.components.runtime.ChartDataModel, com.google.appinventor.components.runtime.DataModel
    protected int getTupleSize() {
        return 2;
    }

    @Override // com.google.appinventor.components.runtime.DataModel
    public YailList getTupleFromEntry(Entry entry) {
        List<?> tupleEntries = Arrays.asList(Float.valueOf(entry.getX()), Float.valueOf(entry.getY()));
        return YailList.makeList((List) tupleEntries);
    }
}
