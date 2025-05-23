package gnu.expr;

import gnu.kawa.util.AbstractWeakHashTable;
import gnu.mapping.WrappedException;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ModuleContext {
    int flags;
    ModuleManager manager;
    private ClassToInstanceMap table = new ClassToInstanceMap();
    static ModuleContext global = new ModuleContext(ModuleManager.instance);
    public static int IN_HTTP_SERVER = 1;
    public static int IN_SERVLET = 2;

    public int getFlags() {
        return this.flags;
    }

    public void setFlags(int flags) {
        this.flags = flags;
    }

    public void addFlags(int flags) {
        this.flags |= flags;
    }

    public ModuleContext(ModuleManager manager) {
        this.manager = manager;
    }

    public static ModuleContext getContext() {
        return global;
    }

    public ModuleManager getManager() {
        return this.manager;
    }

    public synchronized Object findInstance(ModuleInfo info) {
        Class clas;
        try {
            clas = info.getModuleClass();
        } catch (ClassNotFoundException ex) {
            String cname = info.getClassName();
            throw new WrappedException("cannot find module " + cname, ex);
        }
        return findInstance(clas);
    }

    public synchronized Object searchInstance(Class clas) {
        return this.table.get(clas);
    }

    public synchronized Object findInstance(Class clas) {
        Object inst;
        inst = this.table.get(clas);
        if (inst == null) {
            try {
                inst = clas.getDeclaredField("$instance").get(null);
            } catch (NoSuchFieldException e) {
                try {
                    inst = clas.newInstance();
                } catch (Throwable th) {
                    ex = th;
                    throw new WrappedException("exception while initializing module " + clas.getName(), ex);
                }
            } catch (Throwable th2) {
                ex = th2;
                throw new WrappedException("exception while initializing module " + clas.getName(), ex);
            }
            setInstance(inst);
        }
        return inst;
    }

    public synchronized void setInstance(Object instance) {
        this.table.put(instance.getClass(), instance);
    }

    public ModuleInfo findFromInstance(Object instance) {
        ModuleInfo info;
        Class instanceClass = instance.getClass();
        synchronized (this) {
            info = ModuleManager.findWithClass(instanceClass);
            setInstance(instance);
        }
        return info;
    }

    public synchronized void clear() {
        this.table.clear();
    }

    static class ClassToInstanceMap extends AbstractWeakHashTable<Class, Object> {
        ClassToInstanceMap() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // gnu.kawa.util.AbstractWeakHashTable
        public Class getKeyFromValue(Object instance) {
            return instance.getClass();
        }

        protected boolean matches(Class oldValue, Class newValue) {
            return oldValue == newValue;
        }
    }
}
