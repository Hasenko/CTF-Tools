package com.google.appinventor.components.runtime;

import com.google.appinventor.components.annotations.SimpleObject;

@SimpleObject
/* loaded from: classes.dex */
public abstract class AndroidNonvisibleComponent implements Component {
    protected final Form form;

    protected AndroidNonvisibleComponent(Form form) {
        this.form = form;
    }

    @Override // com.google.appinventor.components.runtime.Component
    public HandlesEventDispatching getDispatchDelegate() {
        return this.form;
    }
}
