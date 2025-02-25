package gnu.kawa.reflect;

import gnu.bytecode.ClassType;
import gnu.expr.Declaration;
import gnu.mapping.Environment;
import gnu.mapping.Symbol;
import java.lang.reflect.Field;
import kawa.lang.Macro;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class StaticFieldLocation extends FieldLocation {
    public StaticFieldLocation(String cname, String fname) {
        super((Object) null, ClassType.make(cname), fname);
    }

    public StaticFieldLocation(ClassType type, String mname) {
        super((Object) null, type, mname);
    }

    public StaticFieldLocation(Field field) {
        super(null, field);
    }

    @Override // gnu.kawa.reflect.FieldLocation, gnu.kawa.reflect.ClassMemberLocation, gnu.mapping.Location
    public Object get(Object defaultValue) {
        Object val = super.get(defaultValue);
        if (val instanceof Macro) {
            getDeclaration();
        }
        return val;
    }

    public static StaticFieldLocation define(Environment environ, Symbol sym, Object property, String cname, String fname) {
        StaticFieldLocation loc = new StaticFieldLocation(cname, fname);
        environ.addLocation(sym, property, loc);
        return loc;
    }

    public static StaticFieldLocation make(Declaration decl) {
        gnu.bytecode.Field fld = decl.field;
        ClassType ctype = fld.getDeclaringClass();
        StaticFieldLocation loc = new StaticFieldLocation(ctype, fld.getName());
        loc.setDeclaration(decl);
        return loc;
    }

    public static StaticFieldLocation make(String cname, String fldName) {
        return new StaticFieldLocation(cname, fldName);
    }
}
