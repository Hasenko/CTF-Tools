package com.google.appinventor.components.runtime.util;

import java.util.Locale;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public interface ITextToSpeech {

    public interface TextToSpeechCallback {
        void onFailure();

        void onSuccess();
    }

    boolean isInitialized();

    int isLanguageAvailable(Locale locale);

    void onDestroy();

    void onResume();

    void onStop();

    void setPitch(float f);

    void setSpeechRate(float f);

    void speak(String str, Locale locale);

    void stop();
}
