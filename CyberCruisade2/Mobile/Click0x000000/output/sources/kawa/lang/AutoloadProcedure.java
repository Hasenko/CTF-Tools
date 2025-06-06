package kawa.lang;

import gnu.expr.Language;
import gnu.expr.ModuleBody;
import gnu.expr.ModuleContext;
import gnu.kawa.reflect.ClassMemberLocation;
import gnu.mapping.Environment;
import gnu.mapping.EnvironmentKey;
import gnu.mapping.HasSetter;
import gnu.mapping.Procedure;
import gnu.mapping.Symbol;
import gnu.mapping.UnboundLocationException;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.io.PrintWriter;

/* loaded from: classes.dex */
public class AutoloadProcedure extends Procedure implements Externalizable {
    static final Class classModuleBody = ModuleBody.class;
    String className;
    Language language;
    Procedure loaded;

    public AutoloadProcedure() {
    }

    public AutoloadProcedure(String name, String className) {
        super(name);
        this.className = className;
    }

    public AutoloadProcedure(String name, String className, Language language) {
        super(name);
        this.className = className;
        this.language = language;
    }

    public void print(PrintWriter ps) {
        ps.print("#<procedure ");
        String name = getName();
        if (name != null) {
            ps.print(name);
        }
        ps.print('>');
    }

    private void throw_error(String prefix) {
        this.loaded = null;
        String name = getName();
        throw new RuntimeException(prefix + this.className + " while autoloading " + (name == null ? "" : name.toString()));
    }

    void load() {
        Object mod;
        Object name = getSymbol();
        Language lang = this.language;
        if (lang == null) {
            lang = Language.getDefaultLanguage();
        }
        Environment env = lang.getLangEnvironment();
        Symbol sym = name instanceof Symbol ? (Symbol) name : env.getSymbol(name.toString());
        try {
            Class procClass = Class.forName(this.className);
            if (classModuleBody.isAssignableFrom(procClass)) {
                ModuleContext context = ModuleContext.getContext();
                Object mod2 = context.searchInstance(procClass);
                if (mod2 == null) {
                    try {
                        mod = procClass.getDeclaredField("$instance").get(null);
                    } catch (NoSuchFieldException e) {
                        mod = procClass.newInstance();
                    }
                    ClassMemberLocation.defineAll(mod, lang, env);
                    if (mod instanceof ModuleBody) {
                        ((ModuleBody) mod).run();
                    }
                }
                Object value = env.getFunction(sym, null);
                if (value == null || !(value instanceof Procedure)) {
                    throw_error("invalid ModuleBody class - does not define " + name);
                }
                this.loaded = (Procedure) value;
            } else {
                Procedure procedure = (Procedure) procClass.newInstance();
                this.loaded = procedure;
                if (procedure == this) {
                    throw_error("circularity detected");
                }
                if (name != null) {
                    try {
                        Object property = lang.hasSeparateFunctionNamespace() ? EnvironmentKey.FUNCTION : null;
                        env.put(sym, property, this.loaded);
                    } catch (UnboundLocationException e2) {
                    }
                }
            }
            if (name != null && this.loaded.getSymbol() == null) {
                this.loaded.setSymbol(name);
            }
        } catch (ClassNotFoundException e3) {
            throw_error("failed to find class ");
        } catch (IllegalAccessException e4) {
            throw_error("illegal access in class ");
        } catch (InstantiationException e5) {
            throw_error("failed to instantiate class ");
        }
    }

    public Procedure getLoaded() {
        if (this.loaded == null) {
            load();
        }
        return this.loaded;
    }

    @Override // gnu.mapping.Procedure
    public int numArgs() {
        return getLoaded().numArgs();
    }

    @Override // gnu.mapping.Procedure
    public Object apply0() throws Throwable {
        return getLoaded().apply0();
    }

    @Override // gnu.mapping.Procedure
    public Object apply1(Object arg1) throws Throwable {
        return getLoaded().apply1(arg1);
    }

    @Override // gnu.mapping.Procedure
    public Object apply2(Object arg1, Object arg2) throws Throwable {
        return getLoaded().apply2(arg1, arg2);
    }

    @Override // gnu.mapping.Procedure
    public Object apply3(Object arg1, Object arg2, Object arg3) throws Throwable {
        return getLoaded().apply3(arg1, arg2, arg3);
    }

    @Override // gnu.mapping.Procedure
    public Object apply4(Object arg1, Object arg2, Object arg3, Object arg4) throws Throwable {
        return getLoaded().apply4(arg1, arg2, arg3, arg4);
    }

    @Override // gnu.mapping.Procedure
    public Object applyN(Object[] args) throws Throwable {
        if (this.loaded == null) {
            load();
        }
        Procedure procedure = this.loaded;
        if (procedure instanceof AutoloadProcedure) {
            throw new InternalError("circularity in autoload of " + getName());
        }
        return procedure.applyN(args);
    }

    @Override // gnu.mapping.Procedure, gnu.mapping.HasSetter
    public Procedure getSetter() {
        if (this.loaded == null) {
            load();
        }
        Procedure procedure = this.loaded;
        if (procedure instanceof HasSetter) {
            return procedure.getSetter();
        }
        return super.getSetter();
    }

    @Override // java.io.Externalizable
    public void writeExternal(ObjectOutput out) throws IOException {
        out.writeObject(getName());
        out.writeObject(this.className);
    }

    @Override // java.io.Externalizable
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        setName((String) in.readObject());
        this.className = (String) in.readObject();
    }

    @Override // gnu.mapping.PropertySet
    public Object getProperty(Object key, Object defaultValue) {
        Object value = super.getProperty(key, null);
        if (value != null) {
            return value;
        }
        return getLoaded().getProperty(key, defaultValue);
    }
}
