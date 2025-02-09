package com.google.appinventor.components.common;

import java.util.HashMap;
import java.util.Map;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public enum StartedStatus implements OptionList<Integer> {
    Incoming(1),
    Outgoing(2);

    private static final Map<Integer, StartedStatus> lookup = new HashMap();
    private final int value;

    static {
        for (StartedStatus status : values()) {
            lookup.put(status.toUnderlyingValue(), status);
        }
    }

    StartedStatus(int status) {
        this.value = status;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.appinventor.components.common.OptionList
    public Integer toUnderlyingValue() {
        return Integer.valueOf(this.value);
    }

    public static StartedStatus fromUnderlyingValue(Integer status) {
        return lookup.get(status);
    }
}
