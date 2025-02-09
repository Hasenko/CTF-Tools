package com.google.appinventor.components.common;

import java.util.HashMap;
import java.util.Map;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public enum ScaleUnits implements OptionList<Integer> {
    Metric(1),
    Imperial(2);

    private static final Map<Integer, ScaleUnits> lookup = new HashMap();
    private final Integer value;

    static {
        for (ScaleUnits unit : values()) {
            lookup.put(unit.toUnderlyingValue(), unit);
        }
    }

    ScaleUnits(Integer value) {
        this.value = value;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.appinventor.components.common.OptionList
    public Integer toUnderlyingValue() {
        return this.value;
    }

    public static ScaleUnits fromUnderlyingValue(Integer unit) {
        return lookup.get(unit);
    }
}
