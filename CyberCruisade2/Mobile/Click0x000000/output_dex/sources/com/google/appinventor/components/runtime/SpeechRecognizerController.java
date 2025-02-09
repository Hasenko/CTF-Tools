package com.google.appinventor.components.runtime;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
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
