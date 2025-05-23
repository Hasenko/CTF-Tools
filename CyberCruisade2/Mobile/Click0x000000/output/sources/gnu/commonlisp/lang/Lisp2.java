package gnu.commonlisp.lang;

import gnu.bytecode.ClassType;
import gnu.bytecode.CodeAttr;
import gnu.expr.Compilation;
import gnu.expr.Declaration;
import gnu.expr.Expression;
import gnu.expr.Keyword;
import gnu.expr.QuoteExp;
import gnu.kawa.lispexpr.LangObjType;
import gnu.kawa.lispexpr.LispLanguage;
import gnu.kawa.lispexpr.ReadTable;
import gnu.kawa.reflect.FieldLocation;
import gnu.lists.FString;
import gnu.lists.LList;
import gnu.mapping.Environment;
import gnu.mapping.EnvironmentKey;
import gnu.mapping.Location;
import gnu.mapping.Named;
import gnu.mapping.NamedLocation;
import gnu.mapping.Namespace;
import gnu.mapping.Procedure;
import gnu.mapping.Symbol;
import java.lang.reflect.Field;
import kawa.lang.Syntax;

/* loaded from: classes2.dex */
public abstract class Lisp2 extends LispLanguage {
    public static final LList FALSE;
    public static final Symbol TRUE;
    public static final Expression nilExpr;

    static {
        LList lList = LList.Empty;
        FALSE = lList;
        TRUE = Namespace.getDefault().getSymbol("t");
        nilExpr = new QuoteExp(lList);
    }

    @Override // gnu.expr.Language
    public boolean isTrue(Object value) {
        return value != FALSE;
    }

    @Override // gnu.expr.Language
    public Object booleanObject(boolean b) {
        return b ? TRUE : FALSE;
    }

    @Override // gnu.expr.Language
    public void emitPushBoolean(boolean value, CodeAttr code) {
        if (value) {
            code.emitGetStatic(ClassType.make("gnu.commonlisp.lang.Lisp2").getDeclaredField("TRUE"));
        } else {
            code.emitGetStatic(Compilation.scmListType.getDeclaredField("Empty"));
        }
    }

    @Override // gnu.expr.Language
    public Object noValue() {
        return FALSE;
    }

    @Override // gnu.expr.Language
    public boolean hasSeparateFunctionNamespace() {
        return true;
    }

    @Override // gnu.kawa.lispexpr.LispLanguage
    public boolean selfEvaluatingSymbol(Object obj) {
        return (obj instanceof Keyword) || obj == TRUE || obj == FALSE;
    }

    @Override // gnu.expr.Language
    public Object getEnvPropertyFor(Field fld, Object value) {
        if (Compilation.typeProcedure.getReflectClass().isAssignableFrom(fld.getType()) || (value instanceof Syntax)) {
            return EnvironmentKey.FUNCTION;
        }
        return null;
    }

    @Override // gnu.expr.Language
    public int getNamespaceOf(Declaration decl) {
        if (decl.isAlias()) {
            return 3;
        }
        return decl.isProcedureDecl() ? 2 : 1;
    }

    public static Object asSymbol(String name) {
        if (name == "nil") {
            return FALSE;
        }
        return Environment.getCurrent().getSymbol(name);
    }

    @Override // gnu.kawa.lispexpr.LispLanguage
    protected Symbol fromLangSymbol(Object obj) {
        if (obj == LList.Empty) {
            return this.environ.getSymbol("nil");
        }
        return super.fromLangSymbol(obj);
    }

    public static Object getString(String name) {
        return new FString(name);
    }

    public static Object getString(Symbol symbol) {
        return getString(symbol.getName());
    }

    protected void defun(String name, Object value) {
        this.environ.define(getSymbol(name), EnvironmentKey.FUNCTION, value);
        if (value instanceof Named) {
            Named n = (Named) value;
            if (n.getName() == null) {
                n.setName(name);
            }
        }
    }

    protected void defun(Symbol sym, Object value) {
        this.environ.define(sym, EnvironmentKey.FUNCTION, value);
        if (value instanceof Procedure) {
            Procedure n = (Procedure) value;
            if (n.getSymbol() == null) {
                n.setSymbol(sym);
            }
        }
    }

    private void defun(Procedure proc) {
        defun(proc.getName(), proc);
    }

    protected void importLocation(Location loc) {
        Symbol name = ((NamedLocation) loc).getKeySymbol();
        if (this.environ.isBound(name, EnvironmentKey.FUNCTION)) {
            return;
        }
        Location loc2 = loc.getBase();
        if ((loc2 instanceof FieldLocation) && ((FieldLocation) loc2).isProcedureOrSyntax()) {
            this.environ.addLocation(name, EnvironmentKey.FUNCTION, loc2);
            return;
        }
        Object val = loc2.get(null);
        if (val != null) {
            if ((val instanceof Procedure) || (val instanceof Syntax)) {
                defun(name, val);
            } else if (val instanceof LangObjType) {
                defun(name, ((LangObjType) val).getConstructor());
            } else {
                define(name.getName(), val);
            }
        }
    }

    @Override // gnu.kawa.lispexpr.LispLanguage
    public ReadTable createReadTable() {
        ReadTable tab = new Lisp2ReadTable();
        tab.initialize();
        tab.setInitialColonIsKeyword(true);
        return tab;
    }
}
