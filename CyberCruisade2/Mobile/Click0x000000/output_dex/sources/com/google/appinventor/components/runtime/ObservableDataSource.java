package com.google.appinventor.components.runtime;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public interface ObservableDataSource<K, V> extends DataSource<K, V> {
    void addDataObserver(DataSourceChangeListener dataSourceChangeListener);

    void notifyDataObservers(K k, Object obj);

    void removeDataObserver(DataSourceChangeListener dataSourceChangeListener);
}
