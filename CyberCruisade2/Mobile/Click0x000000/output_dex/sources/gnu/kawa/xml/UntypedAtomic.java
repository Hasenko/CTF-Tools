package gnu.kawa.xml;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class UntypedAtomic {
    String text;

    public String toString() {
        return this.text;
    }

    public UntypedAtomic(String text) {
        this.text = text;
    }

    public int hashCode() {
        return this.text.hashCode();
    }

    public boolean equals(Object arg) {
        return (arg instanceof UntypedAtomic) && this.text.equals(((UntypedAtomic) arg).text);
    }
}
