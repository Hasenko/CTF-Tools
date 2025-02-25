package com.google.appinventor.components.common;

import com.google.appinventor.components.runtime.util.FullScreenVideoUtil;
import java.util.HashMap;
import java.util.Map;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public enum NxtSensorMode implements OptionList<Integer> {
    Raw(0),
    Boolean(32),
    TransitionCount(96),
    PeriodCount(96),
    Percentage(128),
    RcxCelsius(ComponentConstants.TEXTBOX_PREFERRED_WIDTH),
    RcxFahrenheit(FullScreenVideoUtil.FULLSCREEN_VIDEO_ACTION_PAUSE),
    RcxAngleSteps(224);

    private static final Map<Integer, NxtSensorMode> lookup = new HashMap();
    private final int value;

    static {
        for (NxtSensorMode mode : values()) {
            lookup.put(mode.toUnderlyingValue(), mode);
        }
    }

    NxtSensorMode(int mode) {
        this.value = mode;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.appinventor.components.common.OptionList
    public Integer toUnderlyingValue() {
        return Integer.valueOf(this.value);
    }

    public static NxtSensorMode fromUnderlyingValue(Integer mode) {
        return lookup.get(mode);
    }
}
