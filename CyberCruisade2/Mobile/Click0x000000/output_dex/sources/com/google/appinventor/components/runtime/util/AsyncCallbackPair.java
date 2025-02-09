package com.google.appinventor.components.runtime.util;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public interface AsyncCallbackPair<T> {
    void onFailure(String str);

    void onSuccess(T t);
}
