package com.google.appinventor.components.common;

import java.util.HashMap;
import java.util.Map;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public enum FileScope implements OptionList<String> {
    App,
    Asset,
    Cache,
    Legacy,
    Private,
    Shared;

    private static final Map<String, FileScope> LOOKUP = new HashMap();

    static {
        for (FileScope scope : values()) {
            LOOKUP.put(scope.toUnderlyingValue(), scope);
        }
    }

    public static FileScope fromUnderlyingValue(String scope) {
        return LOOKUP.get(scope);
    }

    @Override // com.google.appinventor.components.common.OptionList
    public String toUnderlyingValue() {
        return name();
    }
}
