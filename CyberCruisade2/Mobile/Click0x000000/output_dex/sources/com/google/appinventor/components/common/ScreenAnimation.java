package com.google.appinventor.components.common;

import java.util.HashMap;
import java.util.Map;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public enum ScreenAnimation implements OptionList<String> {
    Default("default"),
    Fade("fade"),
    Zoom("zoom"),
    SlideHorizontal("slidehorizontal"),
    SlideVertical("slidevertical"),
    None("none");

    private static final Map<String, ScreenAnimation> lookup = new HashMap();
    private final String value;

    static {
        for (ScreenAnimation anim : values()) {
            lookup.put(anim.toUnderlyingValue(), anim);
        }
    }

    ScreenAnimation(String anim) {
        this.value = anim;
    }

    @Override // com.google.appinventor.components.common.OptionList
    public String toUnderlyingValue() {
        return this.value;
    }

    public static ScreenAnimation fromUnderlyingValue(String anim) {
        return lookup.get(anim);
    }
}
