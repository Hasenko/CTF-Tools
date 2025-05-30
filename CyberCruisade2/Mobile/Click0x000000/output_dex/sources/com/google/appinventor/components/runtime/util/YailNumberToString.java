package com.google.appinventor.components.runtime.util;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public final class YailNumberToString {
    private static final double BIGBOUND = 1000000.0d;
    static final String LOG_TAG = "YailNumberToString";
    private static final double SMALLBOUND = 1.0E-6d;
    static Locale locale = Locale.US;
    static DecimalFormatSymbols symbols = new DecimalFormatSymbols(locale);
    private static final String decPattern = "#####0.0####";
    static DecimalFormat decimalFormat = new DecimalFormat(decPattern, symbols);
    private static final String sciPattern = "0.####E0";
    static DecimalFormat sciFormat = new DecimalFormat(sciPattern, symbols);

    public static String format(double number) {
        if (Double.isInfinite(number)) {
            if (number < 0.0d) {
                return "-infinity";
            }
            return "+infinity";
        }
        if (number == Math.rint(number)) {
            return String.valueOf((long) number);
        }
        double mag = Math.abs(number);
        if (mag < BIGBOUND && mag > SMALLBOUND) {
            return decimalFormat.format(number);
        }
        return sciFormat.format(number);
    }
}
