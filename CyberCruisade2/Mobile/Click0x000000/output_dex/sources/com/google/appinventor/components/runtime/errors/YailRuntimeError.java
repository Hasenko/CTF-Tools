package com.google.appinventor.components.runtime.errors;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class YailRuntimeError extends RuntimeError {
    private String errorType;

    public YailRuntimeError(String message, String errorType) {
        super(message);
        this.errorType = errorType;
    }

    public String getErrorType() {
        return this.errorType;
    }
}
