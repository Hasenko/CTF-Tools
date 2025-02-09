package com.google.appinventor.components.annotations.androidmanifest;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public @interface IntentFilterElement {
    ActionElement[] actionElements();

    CategoryElement[] categoryElements() default {};

    DataElement[] dataElements() default {};

    String icon() default "";

    String label() default "";

    String order() default "";

    String priority() default "";
}
