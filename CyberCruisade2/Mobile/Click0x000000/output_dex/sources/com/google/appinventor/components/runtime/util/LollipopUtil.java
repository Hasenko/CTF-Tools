package com.google.appinventor.components.runtime.util;

import android.telephony.PhoneNumberUtils;
import java.util.Locale;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public final class LollipopUtil {
    private LollipopUtil() {
    }

    public static String formatNumber(String number) {
        return PhoneNumberUtils.formatNumber(number, Locale.getDefault().getCountry());
    }
}
