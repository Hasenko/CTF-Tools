package com.google.appinventor.components.runtime;

import android.widget.AutoCompleteTextView;
import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.SimpleEvent;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.UsesPermissions;
import com.google.appinventor.components.common.ComponentCategory;

@UsesPermissions(permissionNames = "android.permission.READ_CONTACTS")
@DesignerComponent(category = ComponentCategory.SOCIAL, description = "An EmailPicker is a kind of text box.  If the user begins entering the name or email address of a contact, the phone will show a dropdown menu of choices that complete the entry.  If there are many contacts, the dropdown can take several seconds to appear, and can show intermediate results while the matches are being computed. <p>The initial contents of the text box and the contents< after user entry is in the <code>Text</code> property.  If the <code>Text</code> property is initially empty, the contents of the <code>Hint</code> property will be faintly shown in the text box as a hint to the user.</p>\n <p>Other properties affect the appearance of the text box (<code>TextAlignment</code>, <code>BackgroundColor</code>, etc.) and whether it can be used (<code>Enabled</code>).</p>\n<p>Text boxes like this are usually used with <code>Button</code> components, with the user clicking on the button when text entry is complete.", iconName = "images/emailPicker.png", version = 7)
@SimpleObject
/* loaded from: classes.dex */
public class EmailPicker extends TextBoxBase {
    private final EmailAddressAdapter addressAdapter;

    public EmailPicker(ComponentContainer container) {
        super(container, new AutoCompleteTextView(container.$context()));
        this.addressAdapter = new EmailAddressAdapter(container.$context());
    }

    public void Initialize() {
        this.container.$form().askPermission("android.permission.READ_CONTACTS", new PermissionResultHandler() { // from class: com.google.appinventor.components.runtime.EmailPicker.1
            @Override // com.google.appinventor.components.runtime.PermissionResultHandler
            public void HandlePermissionResponse(String permission, boolean granted) {
                if (granted) {
                    ((AutoCompleteTextView) EmailPicker.this.view).setAdapter(EmailPicker.this.addressAdapter);
                } else {
                    EmailPicker.this.container.$form().dispatchPermissionDeniedEvent(EmailPicker.this, "Initialize", permission);
                }
            }
        });
    }

    @Override // com.google.appinventor.components.runtime.TextBoxBase
    @SimpleEvent
    public void GotFocus() {
        EventDispatcher.dispatchEvent(this, "GotFocus", new Object[0]);
    }
}
