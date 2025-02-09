package com.google.appinventor.common.version;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public final class GitBuildId {
    public static final String ACRA_URI = "${acra.uri}";
    public static final String ANT_BUILD_DATE = "January 16 2025";
    public static final String GIT_BUILD_FINGERPRINT = "a1060e79191f895e0ff8eb0557e676185e43bff2";
    public static final String GIT_BUILD_VERSION = "nb200";

    private GitBuildId() {
    }

    public static String getVersion() {
        if (GIT_BUILD_VERSION != "" && !GIT_BUILD_VERSION.contains(" ")) {
            return GIT_BUILD_VERSION;
        }
        return "none";
    }

    public static String getFingerprint() {
        return GIT_BUILD_FINGERPRINT;
    }

    public static String getDate() {
        return ANT_BUILD_DATE;
    }

    public static String getAcraUri() {
        if (ACRA_URI.equals(ACRA_URI)) {
            return "";
        }
        return ACRA_URI.trim();
    }
}
