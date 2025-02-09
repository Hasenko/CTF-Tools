package com.google.appinventor.components.common;

import java.util.HashMap;
import java.util.Map;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public enum EndedStatus implements OptionList<Integer> {
    IncomingRejected(1),
    IncomingEnded(2),
    OutgoingEnded(3);

    private static final Map<Integer, EndedStatus> lookup = new HashMap();
    private final int value;

    static {
        for (EndedStatus status : values()) {
            lookup.put(status.toUnderlyingValue(), status);
        }
    }

    EndedStatus(int status) {
        this.value = status;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.appinventor.components.common.OptionList
    public Integer toUnderlyingValue() {
        return Integer.valueOf(this.value);
    }

    public static EndedStatus fromUnderlyingValue(Integer status) {
        return lookup.get(status);
    }
}
