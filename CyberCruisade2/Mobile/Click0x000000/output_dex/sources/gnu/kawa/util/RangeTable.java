package gnu.kawa.util;

import gnu.kawa.servlet.HttpRequestContext;
import java.util.Hashtable;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class RangeTable implements Cloneable {
    Object[] index = new Object[128];
    Hashtable hash = new Hashtable(HttpRequestContext.HTTP_OK);

    public Object lookup(int key, Object defaultValue) {
        if ((key & 127) == key) {
            return this.index[key];
        }
        return this.hash.get(new Integer(key));
    }

    public void set(int lo, int hi, Object value) {
        if (lo > hi) {
            return;
        }
        int i = lo;
        while (true) {
            if ((i & 127) == i) {
                this.index[i] = value;
            } else {
                this.hash.put(new Integer(i), value);
            }
            if (i != hi) {
                i++;
            } else {
                return;
            }
        }
    }

    public void set(int key, Object value) {
        set(key, key, value);
    }

    public void remove(int lo, int hi) {
        if (lo > hi) {
            return;
        }
        int i = lo;
        while (true) {
            if ((i & 127) == i) {
                this.index[i] = null;
            } else {
                this.hash.remove(new Integer(i));
            }
            if (i != hi) {
                i++;
            } else {
                return;
            }
        }
    }

    public void remove(int key) {
        remove(key, key);
    }

    public RangeTable copy() {
        RangeTable copy = new RangeTable();
        copy.index = (Object[]) this.index.clone();
        copy.hash = (Hashtable) this.hash.clone();
        return copy;
    }

    public Object clone() {
        return copy();
    }
}
