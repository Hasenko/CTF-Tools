package com.google.appinventor.components.runtime;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public interface DataSourceChangeListener {
    void onDataSourceValueChange(DataSource<?, ?> dataSource, String str, Object obj);

    void onReceiveValue(RealTimeDataSource<?, ?> realTimeDataSource, String str, Object obj);
}
