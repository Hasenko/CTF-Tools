package com.google.appinventor.components.runtime;

import android.content.Intent;
import android.net.Uri;
import android.webkit.MimeTypeMap;
import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.SimpleFunction;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.UsesPermissions;
import com.google.appinventor.components.common.ComponentCategory;
import com.google.appinventor.components.runtime.util.ErrorMessages;
import com.google.appinventor.components.runtime.util.NanoHTTPD;
import com.google.appinventor.components.runtime.util.NougatUtil;
import kawa.lang.SyntaxForms;

@UsesPermissions(permissionNames = "android.permission.READ_EXTERNAL_STORAGE")
@DesignerComponent(category = ComponentCategory.SOCIAL, description = "Sharing is a non-visible component that enables sharing files and/or messages between your app and other apps installed on a device. The component will display a list of the installed apps that can handle the information provided, and will allow the user to choose one to share the content with, for instance a mail app, a social network app, a texting app, and so on.<br>The file path can be taken directly from other components such as the Camera or the ImagePicker, but can also be specified directly to read from storage. The default behaviour is to share files from the private data directory associated with your app. If the file path starts with a slash (/), the the file relative to / is shared.<br>Be aware that different devices treat storage differently, so a few things to try if, for instance, you have a file called arrow.gif in the folder <code>Appinventor/assets</code>, would be: <ul><li><code>\"file:///sdcard/Appinventor/assets/arrow.gif\"</code></li> or <li><code>\"/storage/Appinventor/assets/arrow.gif\"</code></li></ul>", iconName = "images/sharing.png", nonVisible = SyntaxForms.DEBUGGING, version = 1)
@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class Sharing extends AndroidNonvisibleComponent {
    public Sharing(ComponentContainer container) {
        super(container.$form());
    }

    @SimpleFunction(description = "Shares a message through any capable application installed on the phone by displaying a list of the available apps and allowing the user to choose one from the list. The selected app will open with the message inserted on it.")
    public void ShareMessage(String message) {
        Intent shareIntent = new Intent("android.intent.action.SEND");
        shareIntent.putExtra("android.intent.extra.TEXT", message);
        shareIntent.setType(NanoHTTPD.MIME_PLAINTEXT);
        this.form.startActivity(shareIntent);
    }

    @SimpleFunction(description = "Shares a file through any capable application installed on the phone by displaying a list of the available apps and allowing the user to choose one from the list. The selected app will open with the file inserted on it.")
    public void ShareFile(String file) {
        ShareFileWithMessage(file, "");
    }

    @SimpleFunction(description = "Shares both a file and a message through any capable application installed on the phone by displaying a list of available apps and allowing the user to  choose one from the list. The selected app will open with the file and message inserted on it.")
    public void ShareFileWithMessage(String file, String message) {
        if (!file.startsWith("file://")) {
            if (file.startsWith("/")) {
                file = "file://" + file;
            } else {
                file = this.form.getDefaultPath(file);
            }
        }
        Uri uri = Uri.parse(file);
        java.io.File imageFile = new java.io.File(uri.getPath());
        if (imageFile.isFile()) {
            String fileExtension = file.substring(file.lastIndexOf(".") + 1).toLowerCase();
            MimeTypeMap mime = MimeTypeMap.getSingleton();
            String type = mime.getMimeTypeFromExtension(fileExtension);
            if (type == null) {
                type = NanoHTTPD.MIME_DEFAULT_BINARY;
            }
            Uri shareableUri = NougatUtil.getPackageUri(this.form, imageFile);
            Intent shareIntent = new Intent("android.intent.action.SEND");
            shareIntent.putExtra("android.intent.extra.STREAM", shareableUri);
            shareIntent.setFlags(1);
            shareIntent.setType(type);
            if (message.length() > 0) {
                shareIntent.putExtra("android.intent.extra.TEXT", message);
            }
            this.form.startActivity(shareIntent);
            return;
        }
        String eventName = "ShareFile";
        if (message.equals("")) {
            eventName = "ShareFileWithMessage";
        }
        this.form.dispatchErrorOccurredEvent(this, eventName, ErrorMessages.ERROR_FILE_NOT_FOUND_FOR_SHARING, file);
    }
}
