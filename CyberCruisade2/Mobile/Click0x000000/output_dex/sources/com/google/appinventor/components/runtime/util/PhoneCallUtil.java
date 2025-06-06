package com.google.appinventor.components.runtime.util;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class PhoneCallUtil {
    private PhoneCallUtil() {
    }

    public static void makePhoneCall(Context context, String phoneNumber) {
        if (phoneNumber != null && phoneNumber.length() > 0) {
            Uri phoneUri = Uri.parse("tel:" + phoneNumber);
            Intent intent = new Intent("android.intent.action.CALL", phoneUri);
            context.startActivity(intent);
        }
    }
}
