package com.google.appinventor.components.runtime;

import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.SimpleEvent;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.common.ComponentCategory;

@DesignerComponent(category = ComponentCategory.USERINTERFACE, description = "Button with the ability to detect clicks.  Many aspects of its appearance can be changed, as well as whether it is clickable (<code>Enabled</code>), can be changed in the Designer or in the Blocks Editor.", iconName = "images/button.png", version = 7)
@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public final class Button extends ButtonBase {
    public Button(ComponentContainer container) {
        super(container);
    }

    @Override // com.google.appinventor.components.runtime.ButtonBase
    public void click() {
        Click();
    }

    @SimpleEvent(description = "User tapped and released the button.")
    public void Click() {
        EventDispatcher.dispatchEvent(this, "Click", new Object[0]);
    }

    @Override // com.google.appinventor.components.runtime.ButtonBase
    public boolean longClick() {
        return LongClick();
    }

    @SimpleEvent(description = "User held the button down.")
    public boolean LongClick() {
        return EventDispatcher.dispatchEvent(this, "LongClick", new Object[0]);
    }
}
