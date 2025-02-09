package com.google.appinventor.components.runtime;

/* loaded from: classes.dex */
public abstract class SpeechRecognizerController {
    SpeechListener speechListener;

    void addListener(SpeechListener speechListener) {
        this.speechListener = speechListener;
    }

    void start() {
    }

    void stop() {
    }
}
