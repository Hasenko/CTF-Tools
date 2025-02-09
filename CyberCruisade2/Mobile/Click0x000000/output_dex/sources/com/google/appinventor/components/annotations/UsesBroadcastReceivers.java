package com.google.appinventor.components.annotations;

import com.google.appinventor.components.annotations.androidmanifest.ReceiverElement;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public @interface UsesBroadcastReceivers {
    ReceiverElement[] receivers();
}
