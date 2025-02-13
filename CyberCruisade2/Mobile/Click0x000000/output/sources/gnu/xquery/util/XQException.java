package gnu.xquery.util;

import androidx.core.app.NotificationCompat;
import gnu.mapping.Symbol;
import gnu.mapping.Values;

/* loaded from: classes2.dex */
public class XQException extends RuntimeException {
    public static Symbol FOER0000_QNAME = Symbol.make("http://www.w3.org/2005/xqt-errors", "FOER0000", NotificationCompat.CATEGORY_ERROR);
    public Symbol code;
    public String description;
    public Object errorValue;

    public XQException(Symbol code, String description, Object errorValue) {
        super(description);
        this.code = code;
        this.description = description;
        this.errorValue = errorValue;
    }

    public static void error() {
        throw new XQException(FOER0000_QNAME, null, null);
    }

    public static void error(Symbol error) {
        throw new XQException(error, null, null);
    }

    public static void error(Object error, String description) {
        if (error == null || error == Values.empty) {
            error = FOER0000_QNAME;
        }
        throw new XQException((Symbol) error, description, null);
    }

    public static void error(Object error, String description, Object errorValue) {
        if (error == null || error == Values.empty) {
            error = FOER0000_QNAME;
        }
        throw new XQException((Symbol) error, description, errorValue);
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        StringBuffer sbuf = new StringBuffer(100);
        String str = this.description;
        if (str == null) {
            sbuf.append("XQuery-error");
        } else {
            sbuf.append(str);
        }
        if (this.code != null) {
            sbuf.append(" [");
            String prefix = this.code.getPrefix();
            if (prefix != null && prefix.length() > 0) {
                sbuf.append(prefix);
                sbuf.append(':');
            }
            sbuf.append(this.code.getLocalName());
            sbuf.append(']');
        }
        Object obj = this.errorValue;
        if (obj != null && obj != Values.empty) {
            sbuf.append(" value: ");
            sbuf.append(this.errorValue);
        }
        return sbuf.toString();
    }
}
