package gnu.mapping;

import java.lang.ref.WeakReference;

/* compiled from: Table2D.java */
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class Entry {
    Entry chain;
    Object key1;
    Object key2;
    Object value;

    Entry() {
    }

    public Object getKey1() {
        Object obj = this.key1;
        if (obj instanceof WeakReference) {
            return ((WeakReference) obj).get();
        }
        return obj;
    }

    public Object getKey2() {
        Object obj = this.key2;
        if (obj instanceof WeakReference) {
            return ((WeakReference) obj).get();
        }
        return obj;
    }

    public boolean matches(Object key1, Object key2) {
        return key1 == getKey1() && key2 == getKey2();
    }

    public Object getValue() {
        Object obj = this.value;
        if (obj == this) {
            return null;
        }
        return obj;
    }
}
