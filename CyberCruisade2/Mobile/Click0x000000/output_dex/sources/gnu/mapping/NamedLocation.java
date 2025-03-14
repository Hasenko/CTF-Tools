package gnu.mapping;

import java.util.Map;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public abstract class NamedLocation extends IndirectableLocation implements Map.Entry, EnvironmentKey {
    final Symbol name;
    NamedLocation next;
    final Object property;

    @Override // gnu.mapping.Location
    public boolean entered() {
        return this.next != null;
    }

    @Override // gnu.mapping.IndirectableLocation
    public Environment getEnvironment() {
        Environment env;
        for (NamedLocation loc = this; loc != null; loc = loc.next) {
            if (loc.name == null && (env = (Environment) loc.value) != null) {
                return env;
            }
        }
        return super.getEnvironment();
    }

    public NamedLocation(NamedLocation loc) {
        this.name = loc.name;
        this.property = loc.property;
    }

    public NamedLocation(Symbol name, Object property) {
        this.name = name;
        this.property = property;
    }

    @Override // gnu.mapping.IndirectableLocation, gnu.mapping.Location
    public final Symbol getKeySymbol() {
        return this.name;
    }

    @Override // gnu.mapping.IndirectableLocation, gnu.mapping.Location
    public final Object getKeyProperty() {
        return this.property;
    }

    @Override // gnu.mapping.EnvironmentKey
    public final boolean matches(EnvironmentKey key) {
        return Symbol.equals(key.getKeySymbol(), this.name) && key.getKeyProperty() == this.property;
    }

    @Override // gnu.mapping.EnvironmentKey
    public final boolean matches(Symbol symbol, Object property) {
        return Symbol.equals(symbol, this.name) && property == this.property;
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        if (this.property == null) {
            return this.name;
        }
        return this;
    }

    @Override // java.util.Map.Entry
    public boolean equals(Object x) {
        if (!(x instanceof NamedLocation)) {
            return false;
        }
        NamedLocation e2 = (NamedLocation) x;
        Symbol symbol = this.name;
        if (symbol != null ? !symbol.equals(e2.name) : e2.name != null) {
            return false;
        }
        if (this.property != e2.property) {
            return false;
        }
        Object val1 = getValue();
        Object val2 = e2.getValue();
        if (val1 == val2) {
            return true;
        }
        if (val1 == null || val2 == null) {
            return false;
        }
        return val1.equals(val2);
    }

    @Override // java.util.Map.Entry
    public int hashCode() {
        int h = this.name.hashCode() ^ System.identityHashCode(this.property);
        Object val = getValue();
        if (val != null) {
            return h ^ val.hashCode();
        }
        return h;
    }

    @Override // gnu.mapping.Location
    public synchronized Object setWithSave(Object newValue) {
        if (this.value == INDIRECT_FLUIDS) {
            return this.base.setWithSave(newValue);
        }
        ThreadLocation thloc = ThreadLocation.makeAnonymous(this.name);
        thloc.global.base = this.base;
        thloc.global.value = this.value;
        setAlias(thloc);
        NamedLocation entry = thloc.getLocation();
        entry.value = newValue;
        entry.base = null;
        return thloc.global;
    }

    @Override // gnu.mapping.Location
    public synchronized void setRestore(Object oldValue) {
        if (this.value == INDIRECT_FLUIDS) {
            this.base.setRestore(oldValue);
        } else if (oldValue instanceof Location) {
            this.value = null;
            this.base = (Location) oldValue;
        } else {
            this.value = oldValue;
            this.base = null;
        }
    }
}
