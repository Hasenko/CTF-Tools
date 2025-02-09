package com.google.appinventor.components.common;

import java.util.HashMap;
import java.util.Map;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public enum Sensitivity implements OptionList<Integer> {
    Weak(1),
    Moderate(2),
    Strong(3);

    private static final Map<Integer, Sensitivity> lookup = new HashMap();
    private final int value;

    static {
        for (Sensitivity sensitivity : values()) {
            lookup.put(sensitivity.toUnderlyingValue(), sensitivity);
        }
    }

    Sensitivity(int sensitivity) {
        this.value = sensitivity;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.appinventor.components.common.OptionList
    public Integer toUnderlyingValue() {
        return Integer.valueOf(this.value);
    }

    public static Sensitivity fromUnderlyingValue(Integer sensitivity) {
        return lookup.get(sensitivity);
    }
}
