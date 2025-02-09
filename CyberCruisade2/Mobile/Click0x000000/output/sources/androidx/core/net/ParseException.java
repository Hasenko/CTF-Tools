package androidx.core.net;

/* loaded from: classes2.dex */
public class ParseException extends RuntimeException {
    public final String response;

    ParseException(String response) {
        super(response);
        this.response = response;
    }
}
