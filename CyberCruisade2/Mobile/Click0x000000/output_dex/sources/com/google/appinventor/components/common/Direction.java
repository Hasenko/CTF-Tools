package com.google.appinventor.components.common;

import java.util.HashMap;
import java.util.Map;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public enum Direction implements OptionList<Integer> {
    North(1),
    Northeast(2),
    East(3),
    Southeast(4),
    South(-1),
    Southwest(-2),
    West(-3),
    Northwest(-4);

    private static final Map<Integer, Direction> lookup = new HashMap();
    private final int value;

    static {
        for (Direction dir : values()) {
            lookup.put(dir.toUnderlyingValue(), dir);
        }
    }

    Direction(int dir) {
        this.value = dir;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.appinventor.components.common.OptionList
    public Integer toUnderlyingValue() {
        return Integer.valueOf(this.value);
    }

    public static Direction fromUnderlyingValue(Integer dir) {
        return lookup.get(dir);
    }
}
