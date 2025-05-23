package com.google.appinventor.components.common;

import java.util.HashMap;
import java.util.Map;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public enum NxtMotorPort implements OptionList<String> {
    PortA("A", 0),
    PortB("B", 1),
    PortC("C", 2);

    private static final Map<String, NxtMotorPort> lookup = new HashMap();
    private final int intValue;
    private final String value;

    static {
        for (NxtMotorPort port : values()) {
            String str = port.toUnderlyingValue();
            Map<String, NxtMotorPort> map = lookup;
            map.put(str, port);
            map.put(str.toLowerCase(), port);
        }
    }

    NxtMotorPort(String port, int intPort) {
        this.value = port;
        this.intValue = intPort;
    }

    @Override // com.google.appinventor.components.common.OptionList
    public String toUnderlyingValue() {
        return this.value;
    }

    public Integer toInt() {
        return Integer.valueOf(this.intValue);
    }

    public static NxtMotorPort fromUnderlyingValue(String port) {
        return lookup.get(port);
    }
}
