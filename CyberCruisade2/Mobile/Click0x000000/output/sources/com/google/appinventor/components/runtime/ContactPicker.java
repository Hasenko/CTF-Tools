package com.google.appinventor.components.runtime;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.provider.Contacts;
import android.util.Log;
import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.PropertyCategory;
import com.google.appinventor.components.annotations.SimpleFunction;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.annotations.UsesPermissions;
import com.google.appinventor.components.common.ComponentCategory;
import com.google.appinventor.components.runtime.util.ErrorMessages;
import com.google.appinventor.components.runtime.util.HoneycombMR1Util;
import com.google.appinventor.components.runtime.util.SdkLevel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@UsesPermissions(permissionNames = "android.permission.READ_CONTACTS")
@DesignerComponent(category = ComponentCategory.SOCIAL, description = "A button that, when clicked on, displays a list of the contacts to choose among. After the user has made a selection, the following properties will be set to information about the chosen contact: <ul>\n<li> <code>ContactName</code>: the contact's name </li>\n <li> <code>EmailAddress</code>: the contact's primary email address </li>\n <li> <code>ContactUri</code>: the contact's URI on the device </li>\n<li> <code>EmailAddressList</code>: a list of the contact's email addresses </li>\n <li> <code>PhoneNumber</code>: the contact's primary phone number (on Later Android Verisons)</li>\n <li> <code>PhoneNumberList</code>: a list of the contact's phone numbers (on Later Android Versions)</li>\n <li> <code>Picture</code>: the name of the file containing the contact's image, which can be used as a <code>Picture</code> property value for the <code>Image</code> or <code>ImageSprite</code> component.</li></ul>\n</p><p>Other properties affect the appearance of the button (<code>TextAlignment</code>, <code>BackgroundColor</code>, etc.) and whether it can be clicked on (<code>Enabled</code>).\n</p><p>The ContactPicker component might not work on all phones. For example, on Android systems before system 3.0, it cannot pick phone numbers, and the list of email addresses will contain only one email.", iconName = "images/contactPicker.png", version = 6)
@SimpleObject
/* loaded from: classes.dex */
public class ContactPicker extends Picker implements ActivityResultListener {
    private static String[] CONTACT_PROJECTION = null;
    private static String[] DATA_PROJECTION = null;
    private static final int EMAIL_INDEX = 1;
    private static final int NAME_INDEX = 0;
    private static final int PHONE_INDEX = 2;
    private static final String[] PROJECTION = {"name", "primary_email"};
    protected final Activity activityContext;
    protected String contactName;
    protected String contactPictureUri;
    protected String contactUri;
    protected String emailAddress;
    protected List emailAddressList;
    private boolean havePermission;
    private final Uri intentUri;
    protected String phoneNumber;
    protected List phoneNumberList;

    public ContactPicker(ComponentContainer container) {
        this(container, Contacts.People.CONTENT_URI);
    }

    protected ContactPicker(ComponentContainer container, Uri intentUri) {
        super(container);
        this.havePermission = false;
        this.activityContext = container.$context();
        if (SdkLevel.getLevel() >= 12 && intentUri.equals(Contacts.People.CONTENT_URI)) {
            this.intentUri = HoneycombMR1Util.getContentUri();
        } else if (SdkLevel.getLevel() >= 12 && intentUri.equals(Contacts.Phones.CONTENT_URI)) {
            this.intentUri = HoneycombMR1Util.getPhoneContentUri();
        } else {
            this.intentUri = intentUri;
        }
    }

    @Override // com.google.appinventor.components.runtime.Picker, com.google.appinventor.components.runtime.ButtonBase
    public void click() {
        if (!this.havePermission) {
            this.container.$form().askPermission("android.permission.READ_CONTACTS", new PermissionResultHandler() { // from class: com.google.appinventor.components.runtime.ContactPicker.1
                @Override // com.google.appinventor.components.runtime.PermissionResultHandler
                public void HandlePermissionResponse(String permission, boolean granted) {
                    if (granted) {
                        ContactPicker.this.havePermission = true;
                        ContactPicker.this.click();
                    } else {
                        ContactPicker.this.container.$form().dispatchPermissionDeniedEvent(ContactPicker.this, "Click", "android.permission.READ_CONTACTS");
                    }
                }
            });
        } else {
            super.click();
        }
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR)
    public String Picture() {
        return ensureNotNull(this.contactPictureUri);
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR)
    public String ContactName() {
        return ensureNotNull(this.contactName);
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR)
    public String EmailAddress() {
        return ensureNotNull(this.emailAddress);
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "URI that specifies the location of the contact on the device.")
    public String ContactUri() {
        return ensureNotNull(this.contactUri);
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR)
    public List EmailAddressList() {
        return ensureNotNull(this.emailAddressList);
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR)
    public String PhoneNumber() {
        return ensureNotNull(this.phoneNumber);
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR)
    public List PhoneNumberList() {
        return ensureNotNull(this.phoneNumberList);
    }

    @SimpleFunction(description = "view a contact via its URI")
    public void ViewContact(String uri) {
        if (this.contactUri != null) {
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(uri));
            if (intent.resolveActivity(this.activityContext.getPackageManager()) != null) {
                this.activityContext.startActivity(intent);
            }
        }
    }

    @Override // com.google.appinventor.components.runtime.Picker
    protected Intent getIntent() {
        return new Intent("android.intent.action.PICK", this.intentUri);
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x00d5, code lost:
    
        if (r10 != null) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x00ec, code lost:
    
        r10.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x00ea, code lost:
    
        if (r10 != null) goto L29;
     */
    @Override // com.google.appinventor.components.runtime.ActivityResultListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void resultReturned(int r13, int r14, android.content.Intent r15) {
        /*
            Method dump skipped, instructions count: 255
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.appinventor.components.runtime.ContactPicker.resultReturned(int, int, android.content.Intent):void");
    }

    public void preHoneycombGetContactInfo(Cursor contactCursor, Uri theContactUri) {
        if (contactCursor.moveToFirst()) {
            this.contactName = guardCursorGetString(contactCursor, 0);
            String emailId = guardCursorGetString(contactCursor, 1);
            this.emailAddress = getEmailAddress(emailId);
            this.contactUri = theContactUri.toString();
            this.contactPictureUri = theContactUri.toString();
            this.emailAddressList = this.emailAddress.equals("") ? new ArrayList() : Arrays.asList(this.emailAddress);
        }
    }

    public String postHoneycombGetContactNameAndPicture(Cursor contactCursor) {
        if (!contactCursor.moveToFirst()) {
            return "";
        }
        int ID_INDEX = HoneycombMR1Util.getIdIndex(contactCursor);
        int NAME_INDEX2 = HoneycombMR1Util.getNameIndex(contactCursor);
        int THUMBNAIL_INDEX = HoneycombMR1Util.getThumbnailIndex(contactCursor);
        int PHOTO_INDEX = HoneycombMR1Util.getPhotoIndex(contactCursor);
        String id = guardCursorGetString(contactCursor, ID_INDEX);
        this.contactName = guardCursorGetString(contactCursor, NAME_INDEX2);
        this.contactPictureUri = guardCursorGetString(contactCursor, THUMBNAIL_INDEX);
        Log.i("ContactPicker", "photo_uri=" + guardCursorGetString(contactCursor, PHOTO_INDEX));
        return id;
    }

    public void postHoneycombGetContactEmailAndPhone(Cursor dataCursor) {
        this.phoneNumber = "";
        this.emailAddress = "";
        List<String> phoneListToStore = new ArrayList<>();
        List<String> emailListToStore = new ArrayList<>();
        if (dataCursor.moveToFirst()) {
            int PHONE_INDEX2 = HoneycombMR1Util.getPhoneIndex(dataCursor);
            int EMAIL_INDEX2 = HoneycombMR1Util.getEmailIndex(dataCursor);
            int MIME_INDEX = HoneycombMR1Util.getMimeIndex(dataCursor);
            String phoneType = HoneycombMR1Util.getPhoneType();
            String emailType = HoneycombMR1Util.getEmailType();
            while (!dataCursor.isAfterLast()) {
                String type = guardCursorGetString(dataCursor, MIME_INDEX);
                if (type.contains(phoneType)) {
                    phoneListToStore.add(guardCursorGetString(dataCursor, PHONE_INDEX2));
                } else if (type.contains(emailType)) {
                    emailListToStore.add(guardCursorGetString(dataCursor, EMAIL_INDEX2));
                } else {
                    Log.i("ContactPicker", "Type mismatch: " + type + " not " + phoneType + " or " + emailType);
                }
                dataCursor.moveToNext();
            }
        }
        if (!phoneListToStore.isEmpty()) {
            this.phoneNumber = phoneListToStore.get(0);
        }
        if (!emailListToStore.isEmpty()) {
            this.emailAddress = emailListToStore.get(0);
        }
        this.phoneNumberList = phoneListToStore;
        this.emailAddressList = emailListToStore;
    }

    protected boolean checkContactUri(Uri suspectUri, String requiredPattern) {
        Log.i("ContactPicker", "contactUri is " + suspectUri);
        if (suspectUri == null || !"content".equals(suspectUri.getScheme())) {
            Log.i("ContactPicker", "checkContactUri failed: A");
            puntContactSelection(ErrorMessages.ERROR_PHONE_UNSUPPORTED_CONTACT_PICKER);
            return false;
        }
        String UriSpecific = suspectUri.getSchemeSpecificPart();
        if (!UriSpecific.startsWith(requiredPattern)) {
            Log.i("ContactPicker", "checkContactUri failed: C");
            Log.i("ContactPicker", suspectUri.getPath());
            puntContactSelection(ErrorMessages.ERROR_PHONE_UNSUPPORTED_CONTACT_PICKER);
            return false;
        }
        return true;
    }

    protected void puntContactSelection(int errorNumber) {
        this.contactName = "";
        this.emailAddress = "";
        this.contactPictureUri = "";
        this.container.$form().dispatchErrorOccurredEvent(this, "", errorNumber, new Object[0]);
    }

    protected String getEmailAddress(String emailId) {
        try {
            int id = Integer.parseInt(emailId);
            String data = "";
            String where = "contact_methods._id = " + id;
            String[] projection = {"data"};
            Cursor cursor = this.activityContext.getContentResolver().query(Contacts.ContactMethods.CONTENT_EMAIL_URI, projection, where, null, null);
            try {
                if (cursor.moveToFirst()) {
                    data = guardCursorGetString(cursor, 0);
                }
                cursor.close();
                return ensureNotNull(data);
            } catch (Throwable th) {
                cursor.close();
                throw th;
            }
        } catch (NumberFormatException e) {
            return "";
        }
    }

    protected String guardCursorGetString(Cursor cursor, int index) {
        String result;
        try {
            result = cursor.getString(index);
        } catch (Exception e) {
            result = "";
        }
        return ensureNotNull(result);
    }

    protected String ensureNotNull(String value) {
        if (value == null) {
            return "";
        }
        return value;
    }

    protected List ensureNotNull(List value) {
        if (value == null) {
            return new ArrayList();
        }
        return value;
    }
}
