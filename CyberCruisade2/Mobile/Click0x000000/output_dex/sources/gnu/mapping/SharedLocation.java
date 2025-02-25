package gnu.mapping;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class SharedLocation extends NamedLocation {
    int timestamp;

    public SharedLocation(Symbol symbol, Object property, int timestamp) {
        super(symbol, property);
        this.timestamp = timestamp;
    }

    @Override // gnu.mapping.Location
    public final synchronized Object get(Object defaultValue) {
        return this.base != null ? this.base.get(defaultValue) : this.value == Location.UNBOUND ? defaultValue : this.value;
    }

    @Override // gnu.mapping.Location
    public synchronized boolean isBound() {
        return this.base != null ? this.base.isBound() : this.value != Location.UNBOUND;
    }

    @Override // gnu.mapping.Location
    public final synchronized void set(Object newValue) {
        if (this.base == null) {
            this.value = newValue;
        } else if (this.value == DIRECT_ON_SET) {
            this.base = null;
            this.value = newValue;
        } else if (this.base.isConstant()) {
            getEnvironment().put(getKeySymbol(), getKeyProperty(), newValue);
        } else {
            this.base.set(newValue);
        }
    }
}
