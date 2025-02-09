package com.google.appinventor.components.runtime.util;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public abstract class AsyncCallbackFacade<S, T> implements AsyncCallbackPair<S> {
    protected final AsyncCallbackPair<T> callback;

    public AsyncCallbackFacade(AsyncCallbackPair<T> target) {
        this.callback = target;
    }

    @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
    public void onFailure(String message) {
        this.callback.onFailure(message);
    }
}
