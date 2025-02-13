package gnu.mapping;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class WrappedException extends RuntimeException {
    public WrappedException() {
    }

    public WrappedException(String message) {
        super(message);
    }

    public WrappedException(Throwable e) {
        this(e.toString(), e);
    }

    public WrappedException(String message, Throwable e) {
        super(message, e);
    }

    public Throwable getException() {
        return getCause();
    }

    @Override // java.lang.Throwable
    public String toString() {
        return getMessage();
    }

    public static RuntimeException wrapIfNeeded(Throwable ex) {
        if (ex instanceof RuntimeException) {
            return (RuntimeException) ex;
        }
        return new WrappedException(ex);
    }
}
