package com.google.appinventor.components.runtime.errors;

import com.google.appinventor.components.annotations.SimpleObject;

@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public abstract class RuntimeError extends RuntimeException {
    protected RuntimeError() {
    }

    protected RuntimeError(String message) {
        super(message);
    }

    public static RuntimeError convertToRuntimeError(Throwable throwable) {
        if (throwable instanceof RuntimeError) {
            return (RuntimeError) throwable;
        }
        if (throwable instanceof ArrayIndexOutOfBoundsException) {
            return new ArrayIndexOutOfBoundsError();
        }
        if (throwable instanceof IllegalArgumentException) {
            return new IllegalArgumentError();
        }
        if (throwable instanceof NullPointerException) {
            return new UninitializedInstanceError();
        }
        throw new UnsupportedOperationException(throwable);
    }
}
