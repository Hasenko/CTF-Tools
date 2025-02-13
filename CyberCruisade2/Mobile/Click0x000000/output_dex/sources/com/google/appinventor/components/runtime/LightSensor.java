package com.google.appinventor.components.runtime;

import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.SimpleEvent;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.common.ComponentCategory;
import kawa.lang.SyntaxForms;

@DesignerComponent(category = ComponentCategory.SENSORS, description = "A sensor component that can measure the light level.", iconName = "images/lightsensor.png", nonVisible = SyntaxForms.DEBUGGING, version = 1)
@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class LightSensor extends BufferedSingleValueSensor {
    private static final int BUFFER_SIZE = 10;

    public LightSensor(ComponentContainer container) {
        super(container.$form(), 5, 10);
    }

    @Override // com.google.appinventor.components.runtime.SingleValueSensor
    protected void onValueChanged(float value) {
        LightChanged(value);
    }

    @SimpleEvent(description = "Called when a change is detected in the light level.")
    public void LightChanged(float lux) {
        EventDispatcher.dispatchEvent(this, "LightChanged", Float.valueOf(lux));
    }

    @SimpleProperty(description = "The most recent light level, in lux, if the sensor is available and enabled.")
    public float Lux() {
        return getValue();
    }

    @SimpleProperty(description = "The average of the 10 most recent light levels measured, in lux.")
    public float AverageLux() {
        return getAverageValue();
    }
}
