package com.google.appinventor.components.runtime;

import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.SimpleEvent;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.common.ComponentCategory;
import kawa.lang.SyntaxForms;

@DesignerComponent(category = ComponentCategory.SENSORS, description = "A sensor component that can measure the relative ambient air humidity. Most Android devices do not have this sensor.", iconName = "images/hygrometer.png", nonVisible = SyntaxForms.DEBUGGING, version = 1)
@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class Hygrometer extends SingleValueSensor {
    public Hygrometer(ComponentContainer container) {
        super(container.$form(), 12);
    }

    @Override // com.google.appinventor.components.runtime.SingleValueSensor
    protected void onValueChanged(float value) {
        HumidityChanged(value);
    }

    @SimpleEvent(description = "Called when a change is detected in the ambient air humidity (expressed as a percentage).")
    public void HumidityChanged(float humidity) {
        EventDispatcher.dispatchEvent(this, "HumidityChanged", Float.valueOf(humidity));
    }

    @SimpleProperty(description = "The relative ambient humidity as a percentage, if the sensor is available and enabled.")
    public float Humidity() {
        return getValue();
    }
}
