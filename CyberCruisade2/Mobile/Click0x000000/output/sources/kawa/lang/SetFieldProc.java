package kawa.lang;

import gnu.bytecode.ArrayClassLoader;
import gnu.bytecode.ClassType;
import gnu.bytecode.CodeAttr;
import gnu.bytecode.Field;
import gnu.bytecode.Type;
import gnu.expr.ApplyExp;
import gnu.expr.Compilation;
import gnu.expr.Expression;
import gnu.expr.Inlineable;
import gnu.expr.Target;
import gnu.mapping.Procedure2;
import gnu.mapping.Values;

/* loaded from: classes.dex */
public class SetFieldProc extends Procedure2 implements Inlineable {
    ClassType ctype;
    Field field;

    public SetFieldProc(Class clas, String fname) {
        this((ClassType) Type.make(clas), fname);
    }

    public SetFieldProc(ClassType ctype, String fname) {
        this.ctype = ctype;
        this.field = Field.searchField(ctype.getFields(), fname);
    }

    public SetFieldProc(ClassType ctype, String name, Type ftype, int flags) {
        this.ctype = ctype;
        Field field = ctype.getField(name);
        this.field = field;
        if (field == null) {
            this.field = ctype.addField(name, ftype, flags);
        }
    }

    @Override // gnu.mapping.Procedure2, gnu.mapping.Procedure
    public Object apply2(Object arg1, Object arg2) {
        try {
            java.lang.reflect.Field reflectField = this.field.getReflectField();
            reflectField.set(arg1, this.field.getType().coerceFromObject(arg2));
            return Values.empty;
        } catch (IllegalAccessException e) {
            throw new RuntimeException("illegal access for field " + this.field.getSourceName());
        } catch (NoSuchFieldException e2) {
            throw new RuntimeException("no such field " + this.field.getSourceName() + " in " + this.ctype.getName());
        }
    }

    @Override // gnu.expr.Inlineable
    public void compile(ApplyExp exp, Compilation comp, Target target) {
        ClassLoader loader = this.ctype.getReflectClass().getClassLoader();
        if (loader instanceof ArrayClassLoader) {
            ApplyExp.compile(exp, comp, target);
            return;
        }
        Expression[] args = exp.getArgs();
        args[0].compile(comp, this.ctype);
        args[1].compile(comp, this.field.getType());
        CodeAttr code = comp.getCode();
        code.emitPutField(this.field);
        comp.compileConstant(Values.empty, target);
    }

    @Override // gnu.mapping.Procedure
    public Type getReturnType(Expression[] args) {
        return Type.voidType;
    }
}
