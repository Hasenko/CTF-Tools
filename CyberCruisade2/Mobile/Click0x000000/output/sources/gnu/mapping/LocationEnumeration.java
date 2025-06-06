package gnu.mapping;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes.dex */
public class LocationEnumeration implements Iterator<Location>, Enumeration<Location> {
    NamedLocation[] bindings;
    SimpleEnvironment env;
    int index;
    LocationEnumeration inherited;
    NamedLocation nextLoc;
    NamedLocation prevLoc;

    public LocationEnumeration(NamedLocation[] bindings, int count) {
        this.bindings = bindings;
        this.index = count;
    }

    public LocationEnumeration(SimpleEnvironment env) {
        this(env.table, 1 << env.log2Size);
    }

    @Override // java.util.Enumeration
    public boolean hasMoreElements() {
        return this.env.hasMoreElements(this);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Enumeration
    public Location nextElement() {
        return nextLocation();
    }

    public Location nextLocation() {
        NamedLocation first;
        if (this.nextLoc == null && !hasMoreElements()) {
            throw new NoSuchElementException();
        }
        NamedLocation namedLocation = this.prevLoc;
        if (this.prevLoc == null && this.nextLoc != (first = this.bindings[this.index])) {
            this.prevLoc = first;
        }
        while (true) {
            NamedLocation first2 = this.prevLoc;
            if (first2 == null || first2.next == this.nextLoc) {
                break;
            }
            this.prevLoc = this.prevLoc.next;
        }
        Location r = this.nextLoc;
        this.nextLoc = this.nextLoc.next;
        return r;
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        return hasMoreElements();
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Iterator
    public Location next() {
        return nextElement();
    }

    @Override // java.util.Iterator
    public void remove() {
        NamedLocation namedLocation = this.prevLoc;
        NamedLocation curLoc = namedLocation != null ? namedLocation.next : this.bindings[this.index];
        if (curLoc == null || curLoc.next != this.nextLoc) {
            throw new IllegalStateException();
        }
        curLoc.next = null;
        NamedLocation namedLocation2 = this.prevLoc;
        if (namedLocation2 != null) {
            namedLocation2.next = this.nextLoc;
        } else {
            this.bindings[this.index] = this.nextLoc;
        }
        SimpleEnvironment simpleEnvironment = this.env;
        simpleEnvironment.num_bindings--;
    }
}
