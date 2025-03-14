package gnu.mapping;

import androidx.appcompat.widget.ActivityChooserView;
import java.util.Hashtable;

/* loaded from: classes.dex */
public abstract class Environment extends PropertySet {
    static final int CAN_DEFINE = 1;
    static final int CAN_IMPLICITLY_DEFINE = 4;
    static final int CAN_REDEFINE = 2;
    static final int DIRECT_INHERITED_ON_SET = 16;
    public static final int INDIRECT_DEFINES = 32;
    static final int THREAD_SAFE = 8;
    static Environment global;
    int flags = 23;
    static final Hashtable envTable = new Hashtable(50);
    protected static final InheritedLocal curEnvironment = new InheritedLocal();

    public abstract NamedLocation addLocation(Symbol symbol, Object obj, Location location);

    public abstract void define(Symbol symbol, Object obj, Object obj2);

    public abstract LocationEnumeration enumerateAllLocations();

    public abstract LocationEnumeration enumerateLocations();

    public abstract NamedLocation getLocation(Symbol symbol, Object obj, int i, boolean z);

    protected abstract boolean hasMoreElements(LocationEnumeration locationEnumeration);

    public abstract NamedLocation lookup(Symbol symbol, Object obj, int i);

    public static void setGlobal(Environment env) {
        global = env;
    }

    public static Environment getGlobal() {
        return global;
    }

    public int getFlags() {
        return this.flags;
    }

    public void setFlag(boolean setting, int flag) {
        if (!setting) {
            this.flags &= flag ^ (-1);
        } else {
            this.flags |= flag;
        }
    }

    public boolean getCanDefine() {
        return (this.flags & 1) != 0;
    }

    public void setCanDefine(boolean canDefine) {
        int i = this.flags;
        this.flags = canDefine ? i | 1 : i & (-2);
    }

    public boolean getCanRedefine() {
        return (this.flags & 2) != 0;
    }

    public void setCanRedefine(boolean canRedefine) {
        int i = this.flags;
        this.flags = canRedefine ? i | 2 : i & (-3);
    }

    public final boolean isLocked() {
        return (this.flags & 3) == 0;
    }

    public void setLocked() {
        this.flags &= -8;
    }

    public final void setIndirectDefines() {
        this.flags |= 32;
        ((InheritingEnvironment) this).baseTimestamp = ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED;
    }

    public final Location getLocation(Symbol key, Object property) {
        return getLocation(key, property, true);
    }

    public final Location getLocation(Symbol key) {
        return getLocation(key, null, true);
    }

    public final Location lookup(Symbol key, Object property) {
        return getLocation(key, property, false);
    }

    public final Location lookup(Symbol key) {
        return getLocation(key, null, false);
    }

    public final NamedLocation getLocation(Symbol name, Object property, boolean create) {
        int hash = name.hashCode() ^ System.identityHashCode(property);
        return getLocation(name, property, hash, create);
    }

    public final Location getLocation(Object key, boolean create) {
        Object property = null;
        if (key instanceof EnvironmentKey) {
            EnvironmentKey k = (EnvironmentKey) key;
            key = k.getKeySymbol();
            property = k.getKeyProperty();
        }
        Symbol sym = key instanceof Symbol ? (Symbol) key : getSymbol((String) key);
        return getLocation(sym, property, create);
    }

    public boolean isBound(Symbol key, Object property) {
        Location loc = lookup(key, property);
        if (loc == null) {
            return false;
        }
        return loc.isBound();
    }

    public final boolean isBound(Symbol key) {
        return isBound(key, null);
    }

    public final boolean containsKey(Object key) {
        Object property = null;
        if (key instanceof EnvironmentKey) {
            EnvironmentKey k = (EnvironmentKey) key;
            key = k.getKeySymbol();
            property = k.getKeyProperty();
        }
        Symbol sym = key instanceof Symbol ? (Symbol) key : getSymbol((String) key);
        return isBound(sym, property);
    }

    public final Object getChecked(String name) {
        Object value = get(name, Location.UNBOUND);
        if (value == Location.UNBOUND) {
            throw new UnboundLocationException(name + " in " + this);
        }
        return value;
    }

    public Object get(Symbol key, Object property, Object defaultValue) {
        Location loc = lookup(key, property);
        if (loc == null) {
            return defaultValue;
        }
        return loc.get(defaultValue);
    }

    public final Object get(EnvironmentKey key, Object defaultValue) {
        Symbol symbol = key.getKeySymbol();
        Object property = key.getKeyProperty();
        return get(symbol, property, defaultValue);
    }

    public final Object get(String key, Object defaultValue) {
        return get(getSymbol(key), null, defaultValue);
    }

    public Object get(Symbol sym) {
        Object unb = Location.UNBOUND;
        Object val = get(sym, null, unb);
        if (val == unb) {
            throw new UnboundLocationException(sym);
        }
        return val;
    }

    public final Object getFunction(Symbol key, Object defaultValue) {
        return get(key, EnvironmentKey.FUNCTION, defaultValue);
    }

    public final Object getFunction(Symbol sym) {
        Object unb = Location.UNBOUND;
        Object val = get(sym, EnvironmentKey.FUNCTION, unb);
        if (val == unb) {
            throw new UnboundLocationException(sym);
        }
        return val;
    }

    public final Object get(Object key) {
        Object property = null;
        if (key instanceof EnvironmentKey) {
            EnvironmentKey k = (EnvironmentKey) key;
            key = k.getKeySymbol();
            property = k.getKeyProperty();
        }
        Symbol sym = key instanceof Symbol ? (Symbol) key : getSymbol((String) key);
        return get(sym, property, null);
    }

    public void put(Symbol key, Object property, Object newValue) {
        Location loc = getLocation(key, property);
        if (loc.isConstant()) {
            define(key, property, newValue);
        } else {
            loc.set(newValue);
        }
    }

    public final void put(Symbol key, Object newValue) {
        put(key, null, newValue);
    }

    public final Object put(Object key, Object newValue) {
        Location loc = getLocation(key, true);
        Object oldValue = loc.get(null);
        loc.set(newValue);
        return oldValue;
    }

    public final void putFunction(Symbol key, Object newValue) {
        put(key, EnvironmentKey.FUNCTION, newValue);
    }

    public final Object put(String key, Object value) {
        return put((Object) key, value);
    }

    public Location unlink(Symbol key, Object property, int hash) {
        throw new RuntimeException("unsupported operation: unlink (aka undefine)");
    }

    public Object remove(Symbol key, Object property, int hash) {
        Location loc = unlink(key, property, hash);
        if (loc == null) {
            return null;
        }
        Object value = loc.get(null);
        loc.undefine();
        return value;
    }

    public final Object remove(EnvironmentKey key) {
        Symbol symbol = key.getKeySymbol();
        Object property = key.getKeyProperty();
        int hash = symbol.hashCode() ^ System.identityHashCode(property);
        return remove(symbol, property, hash);
    }

    public final Object remove(Symbol symbol, Object property) {
        int hash = symbol.hashCode() ^ System.identityHashCode(property);
        return remove(symbol, property, hash);
    }

    public final void remove(Symbol sym) {
        remove(sym, null, sym.hashCode());
    }

    public final void removeFunction(Symbol sym) {
        remove(sym, EnvironmentKey.FUNCTION);
    }

    public final Object remove(Object key) {
        if (key instanceof EnvironmentKey) {
            EnvironmentKey k = (EnvironmentKey) key;
            return remove(k.getKeySymbol(), k.getKeyProperty());
        }
        Symbol symbol = key instanceof Symbol ? (Symbol) key : getSymbol((String) key);
        int hash = symbol.hashCode() ^ System.identityHashCode(null);
        return remove(symbol, null, hash);
    }

    public Namespace defaultNamespace() {
        return Namespace.getDefault();
    }

    public Symbol getSymbol(String name) {
        return defaultNamespace().getSymbol(name);
    }

    public static Environment getInstance(String name) {
        if (name == null) {
            name = "";
        }
        Hashtable hashtable = envTable;
        synchronized (hashtable) {
            Environment env = (Environment) hashtable.get(name);
            if (env != null) {
                return env;
            }
            SimpleEnvironment simpleEnvironment = new SimpleEnvironment();
            simpleEnvironment.setName(name);
            hashtable.put(name, simpleEnvironment);
            return simpleEnvironment;
        }
    }

    public static Environment current() {
        return getCurrent();
    }

    public static Environment getCurrent() {
        InheritedLocal inheritedLocal = curEnvironment;
        Environment env = (Environment) inheritedLocal.get();
        if (env == null) {
            Environment env2 = make(Thread.currentThread().getName(), global);
            env2.flags |= 8;
            inheritedLocal.set(env2);
            return env2;
        }
        return env;
    }

    public static void setCurrent(Environment env) {
        curEnvironment.set(env);
    }

    public static Environment setSaveCurrent(Environment env) {
        InheritedLocal inheritedLocal = curEnvironment;
        Environment save = (Environment) inheritedLocal.get();
        inheritedLocal.set(env);
        return save;
    }

    public static void restoreCurrent(Environment saved) {
        curEnvironment.set(saved);
    }

    public static Environment user() {
        return getCurrent();
    }

    public final void addLocation(NamedLocation loc) {
        addLocation(loc.getKeySymbol(), loc.getKeyProperty(), loc);
    }

    public final void addLocation(EnvironmentKey key, Location loc) {
        addLocation(key.getKeySymbol(), key.getKeyProperty(), loc);
    }

    public static SimpleEnvironment make() {
        return new SimpleEnvironment();
    }

    public static SimpleEnvironment make(String name) {
        return new SimpleEnvironment(name);
    }

    public static InheritingEnvironment make(String name, Environment parent) {
        return new InheritingEnvironment(name, parent);
    }

    public String toString() {
        return "#<environment " + getName() + '>';
    }

    public String toStringVerbose() {
        return toString();
    }

    SimpleEnvironment cloneForThread() {
        InheritingEnvironment env = new InheritingEnvironment(null, this);
        if (this instanceof InheritingEnvironment) {
            InheritingEnvironment p = (InheritingEnvironment) this;
            int numInherited = p.numInherited;
            env.numInherited = numInherited;
            env.inherited = new Environment[numInherited];
            for (int i = 0; i < numInherited; i++) {
                env.inherited[i] = p.inherited[i];
            }
        }
        LocationEnumeration e = enumerateLocations();
        while (e.hasMoreElements()) {
            Location loc = e.nextLocation();
            Symbol name = loc.getKeySymbol();
            Object property = loc.getKeyProperty();
            if (name != null && (loc instanceof NamedLocation)) {
                NamedLocation nloc = (NamedLocation) loc;
                if (nloc.base == null) {
                    SharedLocation sloc = new SharedLocation(name, property, 0);
                    sloc.value = nloc.value;
                    nloc.base = sloc;
                    nloc.value = null;
                    nloc = sloc;
                }
                int hash = name.hashCode() ^ System.identityHashCode(property);
                NamedLocation xloc = env.addUnboundLocation(name, property, hash);
                xloc.base = nloc;
            }
        }
        return env;
    }

    static class InheritedLocal extends InheritableThreadLocal<Environment> {
        InheritedLocal() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // java.lang.InheritableThreadLocal
        public Environment childValue(Environment parentValue) {
            if (parentValue == null) {
                parentValue = Environment.getCurrent();
            }
            SimpleEnvironment env = parentValue.cloneForThread();
            env.flags |= 8;
            env.flags &= -17;
            return env;
        }
    }
}
