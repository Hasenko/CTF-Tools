package com.google.appinventor.components.runtime;

import android.app.Activity;
import android.content.Intent;
import android.nfc.NfcAdapter;
import android.util.Log;
import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.DesignerProperty;
import com.google.appinventor.components.annotations.PropertyCategory;
import com.google.appinventor.components.annotations.SimpleEvent;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.annotations.UsesPermissions;
import com.google.appinventor.components.common.ComponentCategory;
import com.google.appinventor.components.runtime.util.GingerbreadUtil;
import com.google.appinventor.components.runtime.util.SdkLevel;
import kawa.lang.SyntaxForms;

@UsesPermissions(permissionNames = "android.permission.NFC")
@DesignerComponent(category = ComponentCategory.SENSORS, description = "<p>Non-visible component to provide NFC capabilities.  For now this component supports the reading and writing of text tags only (if supported by the device)</p><p>In order to read and write text tags, the component must have its <code>ReadMode</code> property set to True or False respectively.</p><p><strong>Note:</strong> This component will only work on Screen1 of any App Inventor app.</p>", iconName = "images/nearfield.png", nonVisible = SyntaxForms.DEBUGGING, version = 1)
@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class NearField extends AndroidNonvisibleComponent implements OnStopListener, OnResumeListener, OnPauseListener, OnNewIntentListener, Deleteable {
    private static final String TAG = "nearfield";
    private Activity activity;
    private NfcAdapter nfcAdapter;
    private boolean readMode;
    protected int requestCode;
    private String tagContent;
    private String textToWrite;
    private int writeType;

    public NearField(ComponentContainer container) {
        super(container.$form());
        NfcAdapter nfcAdapter;
        this.readMode = true;
        this.tagContent = "";
        this.textToWrite = "";
        this.activity = container.$context();
        this.writeType = 1;
        if (SdkLevel.getLevel() >= 9) {
            nfcAdapter = GingerbreadUtil.newNfcAdapter(this.activity);
        } else {
            nfcAdapter = null;
        }
        this.nfcAdapter = nfcAdapter;
        this.form.registerForOnResume(this);
        this.form.registerForOnNewIntent(this);
        this.form.registerForOnPause(this);
        Log.d(TAG, "Nearfield component created");
    }

    @SimpleEvent
    public void TagRead(String message) {
        Log.d(TAG, "Tag read: got message " + message);
        this.tagContent = message;
        EventDispatcher.dispatchEvent(this, "TagRead", message);
    }

    @SimpleEvent
    public void TagWritten() {
        Log.d(TAG, "Tag written: " + this.textToWrite);
        EventDispatcher.dispatchEvent(this, "TagWritten", new Object[0]);
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR)
    public String LastMessage() {
        Log.d(TAG, "String message method stared");
        return this.tagContent;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR)
    @DesignerProperty(defaultValue = "True", editorType = "boolean")
    public boolean ReadMode() {
        Log.d(TAG, "boolean method stared");
        return this.readMode;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR)
    public String TextToWrite() {
        Log.d(TAG, "String message method stared");
        return this.textToWrite;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR)
    public int WriteType() {
        return this.writeType;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Specifies whether the NFC hardware should operate in read or write mode.")
    public void ReadMode(boolean newMode) {
        Log.d(TAG, "Read mode set to" + newMode);
        this.readMode = newMode;
        if (!newMode && SdkLevel.getLevel() >= 9) {
            GingerbreadUtil.enableNFCWriteMode(this.activity, this.nfcAdapter, this.textToWrite);
        }
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Specifies the content that will be written to the tag when in write mode. This method has no effect if ReadMode is true.")
    public void TextToWrite(String newText) {
        Log.d(TAG, "Text to write set to" + newText);
        this.textToWrite = newText;
        if (!this.readMode && this.writeType == 1 && SdkLevel.getLevel() >= 9) {
            GingerbreadUtil.enableNFCWriteMode(this.activity, this.nfcAdapter, this.textToWrite);
        }
    }

    @Override // com.google.appinventor.components.runtime.OnNewIntentListener
    public void onNewIntent(Intent intent) {
        Log.d(TAG, "Nearfield on onNewIntent.  Intent is: " + intent);
        resolveIntent(intent);
    }

    @Override // com.google.appinventor.components.runtime.OnResumeListener
    public void onResume() {
        Intent intent = this.activity.getIntent();
        Log.d(TAG, "Nearfield on onResume.  Intent is: " + intent);
    }

    void resolveIntent(Intent intent) {
        Log.d(TAG, "resolve intent. Intent is: " + intent);
        if (SdkLevel.getLevel() >= 9) {
            GingerbreadUtil.resolveNFCIntent(intent, this);
        }
    }

    @Override // com.google.appinventor.components.runtime.OnPauseListener
    public void onPause() {
        Log.d(TAG, "OnPause method started.");
        NfcAdapter nfcAdapter = this.nfcAdapter;
        if (nfcAdapter != null) {
            GingerbreadUtil.disableNFCAdapter(this.activity, nfcAdapter);
        }
    }

    @Override // com.google.appinventor.components.runtime.Deleteable
    public void onDelete() {
    }

    @Override // com.google.appinventor.components.runtime.OnStopListener
    public void onStop() {
    }
}
