package com.google.appinventor.components.runtime;

import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.common.ComponentCategory;
import com.google.appinventor.components.common.ComponentConstants;

@DesignerComponent(category = ComponentCategory.LAYOUT, description = "<p>A formatting element in which to place components that should be displayed one below another.  (The first child component is stored on top, the second beneath it, etc.)  If you wish to have components displayed next to one another, use <code>HorizontalArrangement</code> instead.</p>", iconName = "images/vertical.png", version = 4)
@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class VerticalArrangement extends HVArrangement {
    public VerticalArrangement(ComponentContainer container) {
        super(container, 0, ComponentConstants.NONSCROLLABLE_ARRANGEMENT);
    }
}
