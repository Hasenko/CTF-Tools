package gnu.mapping;

import java.util.AbstractSet;
import java.util.Iterator;

/* compiled from: SimpleEnvironment.java */
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class EnvironmentMappings extends AbstractSet {
    SimpleEnvironment env;

    public EnvironmentMappings(SimpleEnvironment env) {
        this.env = env;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public int size() {
        return this.env.size();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public Iterator iterator() {
        return new LocationEnumeration(this.env);
    }
}
