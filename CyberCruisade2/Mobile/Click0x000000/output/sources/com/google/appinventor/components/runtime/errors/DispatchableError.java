package com.google.appinventor.components.runtime.errors;

import com.google.appinventor.components.runtime.util.ErrorMessages;
import java.util.Arrays;

/* loaded from: classes.dex */
public class DispatchableError extends RuntimeError {
    private final Object[] arguments;
    private final int errorCode;

    public DispatchableError(int errorCode) {
        super(ErrorMessages.formatMessage(errorCode, null));
        this.errorCode = errorCode;
        this.arguments = new Object[0];
    }

    public DispatchableError(int errorCode, Object... arguments) {
        super(ErrorMessages.formatMessage(errorCode, arguments));
        this.errorCode = errorCode;
        this.arguments = arguments;
    }

    public int getErrorCode() {
        return this.errorCode;
    }

    public Object[] getArguments() {
        Object[] objArr = this.arguments;
        return Arrays.copyOf(objArr, objArr.length);
    }
}
