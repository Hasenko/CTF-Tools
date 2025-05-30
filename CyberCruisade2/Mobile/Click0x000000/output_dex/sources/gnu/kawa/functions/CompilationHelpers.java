package gnu.kawa.functions;

import gnu.bytecode.ArrayType;
import gnu.bytecode.ClassType;
import gnu.bytecode.Field;
import gnu.bytecode.Method;
import gnu.bytecode.Type;
import gnu.expr.ApplyExp;
import gnu.expr.Compilation;
import gnu.expr.Declaration;
import gnu.expr.Expression;
import gnu.expr.InlineCalls;
import gnu.expr.LambdaExp;
import gnu.expr.Language;
import gnu.expr.QuoteExp;
import gnu.expr.ReferenceExp;
import gnu.kawa.reflect.ArrayGet;
import gnu.kawa.reflect.CompileReflect;
import gnu.kawa.reflect.Invoke;
import gnu.mapping.Procedure;
import gnu.mapping.Symbol;
import gnu.math.Numeric;
import gnu.text.Char;
import java.io.Externalizable;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class CompilationHelpers {
    public static final Declaration setterDecl;
    static final Field setterField;
    static final ClassType setterType;
    static final ClassType typeList = ClassType.make("java.util.List");

    private static boolean nonNumeric(Expression exp) {
        if (!(exp instanceof QuoteExp)) {
            return false;
        }
        Object value = ((QuoteExp) exp).getValue();
        return ((value instanceof Numeric) || (value instanceof Char) || (value instanceof Symbol)) ? false : true;
    }

    static {
        ClassType make = ClassType.make("gnu.kawa.functions.Setter");
        setterType = make;
        Field declaredField = make.getDeclaredField("setter");
        setterField = declaredField;
        Declaration declaration = new Declaration("setter", declaredField);
        setterDecl = declaration;
        declaration.noteValue(new QuoteExp(Setter.setter));
    }

    public static Expression validateApplyToArgs(ApplyExp exp, InlineCalls visitor, Type required, Procedure applyToArgs) {
        Expression[] args = exp.getArgs();
        int nargs = args.length - 1;
        if (nargs >= 0) {
            Expression proc = args[0];
            if (!proc.getFlag(1)) {
                if (proc instanceof LambdaExp) {
                    Expression[] rargs = new Expression[nargs];
                    System.arraycopy(args, 1, rargs, 0, nargs);
                    return visitor.visit(new ApplyExp(proc, rargs).setLine(exp), required);
                }
                proc = visitor.visit(proc, (Type) null);
                args[0] = proc;
            }
            Type ptype = proc.getType().getRealType();
            Compilation comp = visitor.getCompilation();
            Language language = comp.getLanguage();
            if (ptype.isSubtype(Compilation.typeProcedure)) {
                Expression[] rargs2 = new Expression[nargs];
                System.arraycopy(args, 1, rargs2, 0, nargs);
                ApplyExp nexp = new ApplyExp(proc, rargs2);
                nexp.setLine(exp);
                return proc.validateApply(nexp, visitor, required, null);
            }
            ApplyExp result = null;
            if (CompileReflect.checkKnownClass(ptype, comp) >= 0) {
                if (ptype.isSubtype(Compilation.typeType) || language.getTypeFor(proc, false) != null) {
                    result = new ApplyExp(Invoke.make, args);
                } else if (ptype instanceof ArrayType) {
                    Type elementType = ((ArrayType) ptype).getComponentType();
                    result = new ApplyExp(new ArrayGet(elementType), args);
                } else if (ptype instanceof ClassType) {
                    ClassType ctype = (ClassType) ptype;
                    if (ctype.isSubclass(typeList) && nargs == 1) {
                        Method get = ctype.getMethod("get", new Type[]{Type.intType});
                        result = new ApplyExp(get, args);
                    }
                }
            }
            if (result != null) {
                result.setLine(exp);
                return visitor.visitApplyOnly(result, required);
            }
        }
        exp.visitArgs(visitor);
        return exp;
    }

    public static Expression validateSetter(ApplyExp exp, InlineCalls visitor, Type required, Procedure proc) {
        Declaration decl;
        exp.visitArgs(visitor);
        Expression[] args = exp.getArgs();
        if (args.length == 1) {
            Expression arg = args[0];
            Type argType = arg.getType();
            if (argType instanceof ArrayType) {
                return new SetArrayExp(arg, (ArrayType) argType);
            }
            if ((argType instanceof ClassType) && ((ClassType) argType).isSubclass(typeList)) {
                if (exp instanceof SetListExp) {
                    return exp;
                }
                return new SetListExp(exp.getFunction(), args);
            }
            if ((arg instanceof ReferenceExp) && (decl = ((ReferenceExp) arg).getBinding()) != null) {
                arg = decl.getValue();
            }
            if (arg instanceof QuoteExp) {
                Object value = ((QuoteExp) arg).getValue();
                if (value instanceof Procedure) {
                    Object setter = ((Procedure) value).getSetter();
                    if (setter instanceof Procedure) {
                        if (setter instanceof Externalizable) {
                            return new QuoteExp(setter);
                        }
                        Declaration decl2 = Declaration.getDeclaration((Procedure) setter);
                        if (decl2 != null) {
                            return new ReferenceExp(decl2);
                        }
                    }
                }
            }
        }
        return exp;
    }

    public static Expression validateIsEqv(ApplyExp exp, InlineCalls visitor, Type required, Procedure proc) {
        exp.visitArgs(visitor);
        Expression[] args = exp.getArgs();
        if (nonNumeric(args[0]) || nonNumeric(args[1])) {
            return new ApplyExp(((IsEqv) proc).isEq, args);
        }
        return exp;
    }
}
