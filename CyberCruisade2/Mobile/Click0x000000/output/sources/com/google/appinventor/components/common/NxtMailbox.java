package com.google.appinventor.components.common;

import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public enum NxtMailbox implements OptionList<Integer> {
    Box1(1, 0),
    Box2(2, 1),
    Box3(3, 2),
    Box4(4, 3),
    Box5(5, 4),
    Box6(6, 5),
    Box7(7, 6),
    Box8(8, 7),
    Box9(9, 8),
    Box10(10, 9);

    private static final Map<Integer, NxtMailbox> lookup = new HashMap();
    private int intValue;
    private Integer value;

    static {
        for (NxtMailbox box : values()) {
            lookup.put(box.toUnderlyingValue(), box);
        }
    }

    NxtMailbox(Integer box, int intBox) {
        this.value = box;
        this.intValue = intBox;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.appinventor.components.common.OptionList
    public Integer toUnderlyingValue() {
        return this.value;
    }

    public Integer toInt() {
        return Integer.valueOf(this.intValue);
    }

    public static NxtMailbox fromUnderlyingValue(Integer box) {
        return lookup.get(box);
    }
}
