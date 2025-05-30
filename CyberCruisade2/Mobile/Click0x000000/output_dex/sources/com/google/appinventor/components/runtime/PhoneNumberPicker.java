package com.google.appinventor.components.runtime;

import android.content.ContentUris;
import android.database.Cursor;
import android.net.Uri;
import android.provider.Contacts;
import android.util.Log;
import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.PropertyCategory;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.annotations.UsesPermissions;
import com.google.appinventor.components.common.ComponentCategory;
import com.google.appinventor.components.runtime.util.HoneycombMR1Util;
import java.util.ArrayList;
import java.util.List;

@UsesPermissions(permissionNames = "android.permission.READ_CONTACTS")
@DesignerComponent(category = ComponentCategory.SOCIAL, description = "A button that, when clicked on, displays a list of the contacts' phone numbers to choose among. After the user has made a selection, the following properties will be set to information about the chosen contact: <ul>\n<li> <code>ContactName</code>: the contact's name </li>\n <li> <code>PhoneNumber</code>: the contact's phone number </li>\n <li> <code>EmailAddress</code>: the contact's email address </li> <li> <code>Picture</code>: the name of the file containing the contact's image, which can be used as a <code>Picture</code> property value for the <code>Image</code> or <code>ImageSprite</code> component.</li></ul>\n</p><p>Other properties affect the appearance of the button (<code>TextAlignment</code>, <code>BackgroundColor</code>, etc.) and whether it can be clicked on (<code>Enabled</code>).</p>\n<p>The PhoneNumberPicker component may not work on all Android devices. For example, on Android systems before system 3.0, the returned lists of phone numbers and email addresses will be empty.\n", iconName = "images/phoneNumberPicker.png", version = 4)
@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class PhoneNumberPicker extends ContactPicker {
    private static String[] DATA_PROJECTION = null;
    private static final int EMAIL_INDEX = 3;
    private static final String LOG_TAG = "PhoneNumberPicker";
    private static final int NAME_INDEX = 0;
    private static String[] NAME_PROJECTION = null;
    private static final int NUMBER_INDEX = 1;
    private static final int PERSON_INDEX = 2;
    private static final String[] PROJECTION = {"name", "number", "person", "primary_email"};

    public PhoneNumberPicker(ComponentContainer container) {
        super(container, Contacts.Phones.CONTENT_URI);
    }

    @Override // com.google.appinventor.components.runtime.ContactPicker
    @SimpleProperty(category = PropertyCategory.BEHAVIOR)
    public String PhoneNumber() {
        return ensureNotNull(this.phoneNumber);
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x00c5, code lost:
    
        if (r10 != null) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x00dc, code lost:
    
        r10.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x00da, code lost:
    
        if (r10 != null) goto L29;
     */
    @Override // com.google.appinventor.components.runtime.ContactPicker, com.google.appinventor.components.runtime.ActivityResultListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void resultReturned(int r12, int r13, android.content.Intent r14) {
        /*
            Method dump skipped, instructions count: 239
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.appinventor.components.runtime.PhoneNumberPicker.resultReturned(int, int, android.content.Intent):void");
    }

    public void preHoneycombGetContactInfo(Cursor cursor) {
        if (cursor.moveToFirst()) {
            this.contactName = guardCursorGetString(cursor, 0);
            this.phoneNumber = guardCursorGetString(cursor, 1);
            int contactId = cursor.getInt(2);
            Uri cUri = ContentUris.withAppendedId(Contacts.People.CONTENT_URI, contactId);
            this.contactPictureUri = cUri.toString();
            String emailId = guardCursorGetString(cursor, 3);
            this.emailAddress = getEmailAddress(emailId);
        }
    }

    @Override // com.google.appinventor.components.runtime.ContactPicker
    public String postHoneycombGetContactNameAndPicture(Cursor contactCursor) {
        if (!contactCursor.moveToFirst()) {
            return "";
        }
        int CONTACT_ID_INDEX = HoneycombMR1Util.getContactIdIndex(contactCursor);
        int NAME_INDEX2 = HoneycombMR1Util.getNameIndex(contactCursor);
        int PHOTO_INDEX = HoneycombMR1Util.getThumbnailIndex(contactCursor);
        int PHONE_INDEX = HoneycombMR1Util.getPhoneIndex(contactCursor);
        this.phoneNumber = guardCursorGetString(contactCursor, PHONE_INDEX);
        String id = guardCursorGetString(contactCursor, CONTACT_ID_INDEX);
        this.contactName = guardCursorGetString(contactCursor, NAME_INDEX2);
        this.contactPictureUri = guardCursorGetString(contactCursor, PHOTO_INDEX);
        return id;
    }

    public void postHoneycombGetContactEmailsAndPhones(Cursor dataCursor) {
        List<String> phoneListToStore = new ArrayList<>();
        List<String> emailListToStore = new ArrayList<>();
        if (dataCursor.moveToFirst()) {
            int PHONE_INDEX = HoneycombMR1Util.getPhoneIndex(dataCursor);
            int EMAIL_INDEX2 = HoneycombMR1Util.getEmailIndex(dataCursor);
            int MIME_INDEX = HoneycombMR1Util.getMimeIndex(dataCursor);
            String phoneType = HoneycombMR1Util.getPhoneType();
            String emailType = HoneycombMR1Util.getEmailType();
            while (!dataCursor.isAfterLast()) {
                String type = guardCursorGetString(dataCursor, MIME_INDEX);
                if (type.contains(phoneType)) {
                    phoneListToStore.add(guardCursorGetString(dataCursor, PHONE_INDEX));
                } else if (type.contains(emailType)) {
                    emailListToStore.add(guardCursorGetString(dataCursor, EMAIL_INDEX2));
                } else {
                    Log.i("ContactPicker", "Type mismatch: " + type + " not " + phoneType + " or " + emailType);
                }
                dataCursor.moveToNext();
            }
            this.phoneNumberList = phoneListToStore;
            this.emailAddressList = emailListToStore;
            if (!this.emailAddressList.isEmpty()) {
                this.emailAddress = (String) this.emailAddressList.get(0);
            } else {
                this.emailAddress = "";
            }
        }
    }
}
