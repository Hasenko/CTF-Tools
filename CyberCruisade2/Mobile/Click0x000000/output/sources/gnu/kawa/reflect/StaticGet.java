package gnu.kawa.reflect;

import gnu.bytecode.ClassType;
import gnu.bytecode.CodeAttr;
import gnu.bytecode.Field;
import gnu.bytecode.Type;
import gnu.expr.ApplyExp;
import gnu.expr.Compilation;
import gnu.expr.Expression;
import gnu.expr.Inlineable;
import gnu.expr.Target;
import gnu.mapping.Procedure0;

/* loaded from: classes2.dex */
public class StaticGet extends Procedure0 implements Inlineable {
    ClassType ctype;
    Field field;
    String fname;
    java.lang.reflect.Field reflectField;

    StaticGet(Class clas, String fname) {
        this.ctype = (ClassType) Type.make(clas);
        this.fname = fname;
    }

    public StaticGet(ClassType ctype, String name, Type ftype, int flags) {
        this.ctype = ctype;
        this.fname = name;
        Field field = ctype.getField(name);
        this.field = field;
        if (field == null) {
            this.field = ctype.addField(name, ftype, flags);
        }
    }

    @Override // gnu.mapping.Procedure0, gnu.mapping.Procedure
    public Object apply0() {
        if (this.reflectField == null) {
            Class clas = this.ctype.getReflectClass();
            try {
                this.reflectField = clas.getField(this.fname);
            } catch (NoSuchFieldException e) {
                throw new RuntimeException("no such field " + this.fname + " in " + clas.getName());
            }
        }
        try {
            return this.reflectField.get(null);
        } catch (IllegalAccessException e2) {
            throw new RuntimeException("illegal access for field " + this.fname);
        }
    }

    private Field getField() {
        if (this.field == null) {
            Field field = this.ctype.getField(this.fname);
            this.field = field;
            if (field == null) {
                this.field = this.ctype.addField(this.fname, Type.make(this.reflectField.getType()), this.reflectField.getModifiers());
            }
        }
        return this.field;
    }

    @Override // gnu.expr.Inlineable
    public void compile(ApplyExp exp, Compilation comp, Target target) {
        getField();
        CodeAttr code = comp.getCode();
        code.emitGetStatic(this.field);
        target.compileFromStack(comp, this.field.getType());
    }

    @Override // gnu.mapping.Procedure
    public Type getReturnType(Expression[] args) {
        return getField().getType();
    }
}
