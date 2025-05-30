package com.google.appinventor.components.runtime;

import android.R;
import android.app.Activity;
import android.content.res.ColorStateList;
import android.widget.CompoundButton;
import androidx.appcompat.widget.SwitchCompat;
import androidx.core.graphics.drawable.DrawableCompat;
import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.DesignerProperty;
import com.google.appinventor.components.annotations.PropertyCategory;
import com.google.appinventor.components.annotations.SimpleEvent;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.common.ComponentCategory;
import com.google.appinventor.components.runtime.util.SdkLevel;
import kawa.lang.SyntaxForms;

@DesignerComponent(category = ComponentCategory.USERINTERFACE, description = "Toggle switch that raises an event when the user clicks on it. There are many properties affecting its appearance that can be set in the Designer or Blocks Editor.", iconName = "images/switch.png", version = 1)
@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public final class Switch extends ToggleBase<CompoundButton> {
    private final Activity activity;
    private final SwitchCompat switchView;
    private int thumbColorActive;
    private int thumbColorInactive;
    private int trackColorActive;
    private int trackColorInactive;

    public Switch(ComponentContainer container) {
        super(container);
        Activity $context = container.$context();
        this.activity = $context;
        if (SdkLevel.getLevel() < 14) {
            this.switchView = null;
            this.view = new android.widget.CheckBox($context);
        } else {
            SwitchCompat switchCompat = new SwitchCompat($context);
            this.switchView = switchCompat;
            this.view = switchCompat;
        }
        On(false);
        ThumbColorActive(-1);
        ThumbColorInactive(Component.COLOR_LTGRAY);
        TrackColorActive(Component.COLOR_GREEN);
        TrackColorInactive(Component.COLOR_GRAY);
        initToggle();
    }

    private ColorStateList createSwitchColors(int active_color, int inactive_color) {
        return new ColorStateList(new int[][]{new int[]{R.attr.state_checked}, new int[0]}, new int[]{active_color, inactive_color});
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE)
    public int ThumbColorActive() {
        return this.thumbColorActive;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_WHITE, editorType = "color")
    public void ThumbColorActive(int argb) {
        this.thumbColorActive = argb;
        SwitchCompat switchCompat = this.switchView;
        if (switchCompat != null) {
            DrawableCompat.setTintList(switchCompat.getThumbDrawable(), createSwitchColors(argb, this.thumbColorInactive));
            this.view.invalidate();
        }
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, userVisible = SyntaxForms.DEBUGGING)
    public int ThumbColorInactive() {
        return this.thumbColorInactive;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_LTGRAY, editorType = "color")
    public void ThumbColorInactive(int argb) {
        this.thumbColorInactive = argb;
        SwitchCompat switchCompat = this.switchView;
        if (switchCompat != null) {
            DrawableCompat.setTintList(switchCompat.getThumbDrawable(), createSwitchColors(this.thumbColorActive, argb));
            this.view.invalidate();
        }
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, userVisible = SyntaxForms.DEBUGGING)
    public int TrackColorActive() {
        return this.trackColorActive;
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, userVisible = SyntaxForms.DEBUGGING)
    public int TrackColorInactive() {
        return this.trackColorInactive;
    }

    @SimpleProperty(description = "Color of the toggle track when switched on", userVisible = SyntaxForms.DEBUGGING)
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_GREEN, editorType = "color")
    public void TrackColorActive(int argb) {
        this.trackColorActive = argb;
        SwitchCompat switchCompat = this.switchView;
        if (switchCompat != null) {
            DrawableCompat.setTintList(switchCompat.getTrackDrawable(), createSwitchColors(argb, this.trackColorInactive));
            this.view.invalidate();
        }
    }

    @SimpleProperty(description = "Color of the toggle track when switched off", userVisible = SyntaxForms.DEBUGGING)
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_DKGRAY, editorType = "color")
    public void TrackColorInactive(int argb) {
        this.trackColorInactive = argb;
        SwitchCompat switchCompat = this.switchView;
        if (switchCompat != null) {
            DrawableCompat.setTintList(switchCompat.getTrackDrawable(), createSwitchColors(this.trackColorActive, argb));
            this.view.invalidate();
        }
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR)
    public boolean On() {
        return this.view.isChecked();
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "False", editorType = "boolean")
    public void On(boolean value) {
        this.view.setChecked(value);
        this.view.invalidate();
    }

    @Override // com.google.appinventor.components.runtime.ToggleBase
    @SimpleEvent(description = "User change the state of the `Switch` from On to Off or back.")
    public void Changed() {
        super.Changed();
    }
}
