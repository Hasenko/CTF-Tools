package gnu.mapping;

import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.io.ObjectStreamException;
import java.util.Set;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class SimpleEnvironment extends Environment {
    int currentTimestamp;
    int log2Size;
    private int mask;
    int num_bindings;
    NamedLocation sharedTail;
    NamedLocation[] table;

    public int size() {
        return this.num_bindings;
    }

    public static Location getCurrentLocation(String name) {
        return getCurrent().getLocation((Object) name, true);
    }

    public static Object lookup_global(Symbol name) throws UnboundLocationException {
        Location binding = getCurrent().lookup(name);
        if (binding == null) {
            throw new UnboundLocationException(name);
        }
        return binding.get();
    }

    public SimpleEnvironment() {
        this(64);
    }

    public SimpleEnvironment(String name) {
        this();
        setName(name);
    }

    public SimpleEnvironment(int capacity) {
        this.log2Size = 4;
        while (true) {
            int i = this.log2Size;
            if (capacity > (1 << i)) {
                this.log2Size = i + 1;
            } else {
                int capacity2 = 1 << i;
                this.table = new NamedLocation[capacity2];
                this.mask = capacity2 - 1;
                this.sharedTail = new PlainLocation(null, null, this);
                return;
            }
        }
    }

    @Override // gnu.mapping.Environment
    public NamedLocation lookup(Symbol name, Object property, int hash) {
        return lookupDirect(name, property, hash);
    }

    public NamedLocation lookupDirect(Symbol name, Object property, int hash) {
        int index = this.mask & hash;
        for (NamedLocation loc = this.table[index]; loc != null; loc = loc.next) {
            if (loc.matches(name, property)) {
                return loc;
            }
        }
        return null;
    }

    @Override // gnu.mapping.Environment
    public synchronized NamedLocation getLocation(Symbol name, Object property, int hash, boolean create) {
        NamedLocation loc = lookup(name, property, hash);
        if (loc != null) {
            return loc;
        }
        if (!create) {
            return null;
        }
        return addUnboundLocation(name, property, hash);
    }

    protected NamedLocation addUnboundLocation(Symbol name, Object property, int hash) {
        int index = this.mask & hash;
        NamedLocation loc = newEntry(name, property, index);
        loc.base = null;
        loc.value = Location.UNBOUND;
        return loc;
    }

    @Override // gnu.mapping.Environment
    public void put(Symbol key, Object property, Object newValue) {
        boolean create = (this.flags & 4) != 0;
        Location loc = getLocation(key, property, create);
        if (loc == null) {
            throw new UnboundLocationException(key);
        }
        if (loc.isConstant()) {
            throw new IllegalStateException("attempt to modify read-only location: " + key + " in " + this + " loc:" + loc);
        }
        loc.set(newValue);
    }

    NamedLocation newLocation(Symbol name, Object property) {
        if ((this.flags & 8) != 0) {
            return new SharedLocation(name, property, this.currentTimestamp);
        }
        return new PlainLocation(name, property);
    }

    NamedLocation newEntry(Symbol name, Object property, int index) {
        NamedLocation loc = newLocation(name, property);
        NamedLocation first = this.table[index];
        loc.next = first == null ? this.sharedTail : first;
        NamedLocation[] namedLocationArr = this.table;
        namedLocationArr[index] = loc;
        int i = this.num_bindings + 1;
        this.num_bindings = i;
        if (i >= namedLocationArr.length) {
            rehash();
        }
        return loc;
    }

    public NamedLocation define(Symbol sym, Object property, int hash, Object newValue) {
        int index = this.mask & hash;
        NamedLocation first = this.table[index];
        for (NamedLocation loc = first; loc != null; loc = loc.next) {
            if (loc.matches(sym, property)) {
                if (!loc.isBound() ? !getCanRedefine() : !getCanDefine()) {
                    redefineError(sym, property, loc);
                }
                loc.base = null;
                loc.value = newValue;
                return loc;
            }
        }
        NamedLocation loc2 = newEntry(sym, property, index);
        loc2.set(newValue);
        return loc2;
    }

    @Override // gnu.mapping.Environment
    public void define(Symbol sym, Object property, Object newValue) {
        int hash = sym.hashCode() ^ System.identityHashCode(property);
        define(sym, property, hash, newValue);
    }

    protected void redefineError(Symbol name, Object property, Location loc) {
        throw new IllegalStateException("prohibited define/redefine of " + name + " in " + this);
    }

    @Override // gnu.mapping.Environment
    public NamedLocation addLocation(Symbol name, Object property, Location loc) {
        return addLocation(name, property, name.hashCode() ^ System.identityHashCode(property), loc);
    }

    NamedLocation addLocation(Symbol name, Object property, int hash, Location loc) {
        if ((loc instanceof ThreadLocation) && ((ThreadLocation) loc).property == property) {
            loc = ((ThreadLocation) loc).getLocation();
        }
        NamedLocation nloc = lookupDirect(name, property, hash);
        if (loc == nloc) {
            return nloc;
        }
        boolean bound = nloc != null;
        if (!bound) {
            nloc = addUnboundLocation(name, property, hash);
        }
        if ((this.flags & 3) != 3) {
            if (bound) {
                bound = nloc.isBound();
            }
            if (!bound ? !((1 & this.flags) != 0 || !loc.isBound()) : (this.flags & 2) == 0) {
                redefineError(name, property, nloc);
            }
        }
        if ((this.flags & 32) != 0) {
            nloc.base = ((SimpleEnvironment) ((InheritingEnvironment) this).getParent(0)).addLocation(name, property, hash, loc);
        } else {
            nloc.base = loc;
        }
        nloc.value = IndirectableLocation.INDIRECT_FLUIDS;
        return nloc;
    }

    void rehash() {
        NamedLocation[] oldTable = this.table;
        int oldCapacity = oldTable.length;
        int newCapacity = oldCapacity * 2;
        NamedLocation[] newTable = new NamedLocation[newCapacity];
        int newMask = newCapacity - 1;
        int i = oldCapacity;
        while (true) {
            i--;
            if (i >= 0) {
                NamedLocation element = oldTable[i];
                while (element != null && element != this.sharedTail) {
                    NamedLocation next = element.next;
                    Symbol name = element.name;
                    Object property = element.property;
                    int hash = name.hashCode() ^ System.identityHashCode(property);
                    int j = hash & newMask;
                    NamedLocation head = newTable[j];
                    if (head == null) {
                        head = this.sharedTail;
                    }
                    element.next = head;
                    newTable[j] = element;
                    element = next;
                }
            } else {
                this.table = newTable;
                this.log2Size++;
                this.mask = newMask;
                return;
            }
        }
    }

    @Override // gnu.mapping.Environment
    public Location unlink(Symbol symbol, Object property, int hash) {
        int index = this.mask & hash;
        NamedLocation prev = null;
        NamedLocation loc = this.table[index];
        while (loc != null) {
            NamedLocation next = loc.next;
            if (loc.matches(symbol, property)) {
                if (!getCanRedefine()) {
                    redefineError(symbol, property, loc);
                }
                if (prev == null) {
                    this.table[index] = next;
                } else {
                    prev.next = loc;
                }
                this.num_bindings--;
                return loc;
            }
            prev = loc;
            loc = next;
        }
        return null;
    }

    @Override // gnu.mapping.Environment
    public LocationEnumeration enumerateLocations() {
        LocationEnumeration it = new LocationEnumeration(this.table, 1 << this.log2Size);
        it.env = this;
        return it;
    }

    @Override // gnu.mapping.Environment
    public LocationEnumeration enumerateAllLocations() {
        return enumerateLocations();
    }

    @Override // gnu.mapping.Environment
    protected boolean hasMoreElements(LocationEnumeration it) {
        while (true) {
            if (it.nextLoc == null) {
                it.prevLoc = null;
                int i = it.index - 1;
                it.index = i;
                if (i < 0) {
                    return false;
                }
                it.nextLoc = it.bindings[it.index];
                if (it.nextLoc == null) {
                    continue;
                }
            }
            if (it.nextLoc.name != null) {
                return true;
            }
            it.nextLoc = it.nextLoc.next;
        }
    }

    public void writeExternal(ObjectOutput out) throws IOException {
        out.writeObject(getSymbol());
    }

    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        setSymbol(in.readObject());
    }

    public Object readResolve() throws ObjectStreamException {
        String name = getName();
        Environment env = (Environment) envTable.get(name);
        if (env != null) {
            return env;
        }
        envTable.put(name, this);
        return this;
    }

    public Set entrySet() {
        return new EnvironmentMappings(this);
    }

    @Override // gnu.mapping.Environment
    public String toStringVerbose() {
        StringBuffer sbuf = new StringBuffer();
        toStringBase(sbuf);
        return "#<environment " + getName() + " num:" + this.num_bindings + " ts:" + this.currentTimestamp + ((Object) sbuf) + '>';
    }

    protected void toStringBase(StringBuffer sbuf) {
    }
}
