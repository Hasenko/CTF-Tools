package gnu.kawa.lispexpr;

import com.google.appinventor.components.common.PropertyTypeConstants;
import gnu.bytecode.ClassType;
import gnu.bytecode.CodeAttr;
import gnu.bytecode.Field;
import gnu.bytecode.Filter;
import gnu.bytecode.Method;
import gnu.bytecode.ObjectType;
import gnu.bytecode.PrimType;
import gnu.bytecode.Type;
import gnu.bytecode.Variable;
import gnu.expr.ApplyExp;
import gnu.expr.Compilation;
import gnu.expr.Declaration;
import gnu.expr.Expression;
import gnu.expr.Language;
import gnu.expr.PairClassType;
import gnu.expr.PrimProcedure;
import gnu.expr.Target;
import gnu.expr.TypeValue;
import gnu.kawa.functions.MakeList;
import gnu.kawa.reflect.InstanceOf;
import gnu.mapping.Procedure;
import gnu.mapping.WrongType;
import gnu.math.DFloNum;
import gnu.math.IntNum;
import gnu.math.Numeric;
import gnu.math.RatNum;
import gnu.math.RealNum;
import gnu.text.FilePath;
import gnu.text.Path;
import gnu.text.URIPath;
import java.util.List;

/* loaded from: classes.dex */
public class LangObjType extends ObjectType implements TypeValue {
    private static final int CLASSTYPE_TYPE_CODE = 6;
    private static final int CLASS_TYPE_CODE = 4;
    private static final int DFLONUM_TYPE_CODE = 15;
    private static final int FILEPATH_TYPE_CODE = 2;
    private static final int INTEGER_TYPE_CODE = 7;
    private static final int LIST_TYPE_CODE = 11;
    private static final int NUMERIC_TYPE_CODE = 10;
    private static final int PATH_TYPE_CODE = 1;
    private static final int RATIONAL_TYPE_CODE = 8;
    private static final int REAL_TYPE_CODE = 9;
    private static final int REGEX_TYPE_CODE = 14;
    private static final int STRING_TYPE_CODE = 13;
    private static final int TYPE_TYPE_CODE = 5;
    private static final int URI_TYPE_CODE = 3;
    static final String VARARGS_SUFFIX = "";
    private static final int VECTOR_TYPE_CODE = 12;
    ClassType implementationType;
    final int typeCode;
    public static final LangObjType pathType = new LangObjType("path", "gnu.text.Path", 1);
    public static final LangObjType filepathType = new LangObjType("filepath", "gnu.text.FilePath", 2);
    public static final LangObjType URIType = new LangObjType("URI", "gnu.text.URIPath", 3);
    public static final LangObjType typeClass = new LangObjType("class", "java.lang.Class", 4);
    public static final LangObjType typeType = new LangObjType("type", "gnu.bytecode.Type", 5);
    public static final LangObjType typeClassType = new LangObjType("class-type", "gnu.bytecode.ClassType", 6);
    public static final LangObjType numericType = new LangObjType("number", "gnu.math.Numeric", 10);
    public static final LangObjType realType = new LangObjType("real", "gnu.math.RealNum", 9);
    public static final LangObjType rationalType = new LangObjType("rational", "gnu.math.RatNum", 8);
    public static final LangObjType integerType = new LangObjType(PropertyTypeConstants.PROPERTY_TYPE_INTEGER, "gnu.math.IntNum", 7);
    public static final LangObjType dflonumType = new LangObjType("DFloNum", "gnu.math.DFloNum", 15);
    public static final LangObjType vectorType = new LangObjType("vector", "gnu.lists.FVector", 12);
    public static final LangObjType regexType = new LangObjType("regex", "java.util.regex.Pattern", 14);
    public static final LangObjType stringType = new LangObjType(PropertyTypeConstants.PROPERTY_TYPE_STRING, "java.lang.CharSequence", 13);
    public static final LangObjType listType = new LangObjType("list", "gnu.lists.LList", 11);
    static final ClassType typeArithmetic = ClassType.make("gnu.kawa.functions.Arithmetic");
    static PrimProcedure makePathProc = new PrimProcedure("gnu.text.Path", "valueOf", 1);
    static PrimProcedure makeFilepathProc = new PrimProcedure("gnu.text.FilePath", "makeFilePath", 1);
    static PrimProcedure makeURIProc = new PrimProcedure("gnu.text.URIPath", "makeURI", 1);
    public static final ClassType typeLangObjType = ClassType.make("gnu.kawa.lispexpr.LangObjType");

    LangObjType(String name, String implClass, int typeCode) {
        super(name);
        ClassType make = ClassType.make(implClass);
        this.implementationType = make;
        this.typeCode = typeCode;
        setSignature(make.getSignature());
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:11:0x001e  */
    @Override // gnu.bytecode.ObjectType, gnu.bytecode.Type
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int compare(gnu.bytecode.Type r5) {
        /*
            r4 = this;
            int r0 = r4.typeCode
            r1 = -1
            r2 = 0
            r3 = 1
            switch(r0) {
                case 4: goto L4e;
                case 5: goto L2b;
                case 6: goto L3c;
                case 7: goto L9;
                case 9: goto L1a;
                case 15: goto L1a;
                default: goto L8;
            }
        L8:
            goto L5f
        L9:
            boolean r0 = r5 instanceof gnu.bytecode.PrimType
            if (r0 == 0) goto L1a
            java.lang.String r0 = r5.getSignature()
            char r0 = r0.charAt(r2)
            switch(r0) {
                case 66: goto L19;
                case 73: goto L19;
                case 74: goto L19;
                case 83: goto L19;
                default: goto L18;
            }
        L18:
            goto L1a
        L19:
            return r3
        L1a:
            boolean r0 = r5 instanceof gnu.bytecode.PrimType
            if (r0 == 0) goto L5f
            java.lang.String r0 = r5.getSignature()
            char r0 = r0.charAt(r2)
            switch(r0) {
                case 68: goto L2a;
                case 69: goto L29;
                case 70: goto L2a;
                default: goto L29;
            }
        L29:
            goto L5f
        L2a:
            return r3
        L2b:
            gnu.kawa.lispexpr.LangObjType r0 = gnu.kawa.lispexpr.LangObjType.typeClass
            if (r5 == r0) goto L4d
            gnu.kawa.lispexpr.LangObjType r2 = gnu.kawa.lispexpr.LangObjType.typeClassType
            if (r5 == r2) goto L4d
            gnu.bytecode.ClassType r0 = r0.implementationType
            if (r5 == r0) goto L4d
            gnu.bytecode.ClassType r0 = r2.implementationType
            if (r5 != r0) goto L3c
            goto L4d
        L3c:
            gnu.kawa.lispexpr.LangObjType r0 = gnu.kawa.lispexpr.LangObjType.typeClass
            if (r5 == r0) goto L4c
            gnu.bytecode.ClassType r0 = r0.implementationType
            if (r5 != r0) goto L45
            goto L4c
        L45:
            gnu.kawa.lispexpr.LangObjType r2 = gnu.kawa.lispexpr.LangObjType.typeType
            if (r5 == r2) goto L4b
            if (r5 != r0) goto L5f
        L4b:
            return r1
        L4c:
            return r3
        L4d:
            return r3
        L4e:
            gnu.kawa.lispexpr.LangObjType r0 = gnu.kawa.lispexpr.LangObjType.typeType
            if (r5 == r0) goto L5e
            gnu.kawa.lispexpr.LangObjType r2 = gnu.kawa.lispexpr.LangObjType.typeClassType
            if (r5 == r2) goto L5e
            gnu.bytecode.ClassType r0 = r0.implementationType
            if (r5 == r0) goto L5e
            gnu.bytecode.ClassType r0 = r2.implementationType
            if (r5 != r0) goto L5f
        L5e:
            return r1
        L5f:
            gnu.bytecode.Type r0 = r4.getImplementationType()
            gnu.bytecode.Type r1 = r5.getImplementationType()
            int r0 = r0.compare(r1)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: gnu.kawa.lispexpr.LangObjType.compare(gnu.bytecode.Type):int");
    }

    @Override // gnu.bytecode.ObjectType
    public Field getField(String name, int mask) {
        return this.implementationType.getField(name, mask);
    }

    @Override // gnu.bytecode.ObjectType
    public Method getMethod(String name, Type[] arg_types) {
        return this.implementationType.getMethod(name, arg_types);
    }

    public Method getDeclaredMethod(String name, int argCount) {
        return this.implementationType.getDeclaredMethod(name, argCount);
    }

    @Override // gnu.bytecode.ObjectType
    public int getMethods(Filter filter, int searchSupers, List<Method> result) {
        return this.implementationType.getMethods(filter, searchSupers, result);
    }

    @Override // gnu.bytecode.ObjectType, gnu.bytecode.Type
    public Class getReflectClass() {
        return this.implementationType.getReflectClass();
    }

    @Override // gnu.bytecode.Type
    public Type getRealType() {
        return this.implementationType;
    }

    @Override // gnu.bytecode.ObjectType, gnu.bytecode.Type
    public Type getImplementationType() {
        return this.implementationType;
    }

    @Override // gnu.expr.TypeValue
    public void emitIsInstance(Variable incoming, Compilation comp, Target target) {
        switch (this.typeCode) {
            case 11:
            case 12:
            case 13:
            case 14:
                this.implementationType.emitIsInstance(comp.getCode());
                target.compileFromStack(comp, comp.getLanguage().getTypeFor(Boolean.TYPE));
                break;
            default:
                InstanceOf.emitIsInstance(this, incoming, comp, target);
                break;
        }
    }

    public static Numeric coerceNumeric(Object value) {
        Numeric rval = Numeric.asNumericOrNull(value);
        if (rval == null && value != null) {
            throw new WrongType(-4, value, numericType);
        }
        return rval;
    }

    public static RealNum coerceRealNum(Object value) {
        RealNum rval = RealNum.asRealNumOrNull(value);
        if (rval == null && value != null) {
            throw new WrongType(-4, value, realType);
        }
        return rval;
    }

    public static DFloNum coerceDFloNum(Object value) {
        DFloNum rval = DFloNum.asDFloNumOrNull(value);
        if (rval == null && value != null) {
            throw new WrongType(-4, value, dflonumType);
        }
        return rval;
    }

    public static RatNum coerceRatNum(Object value) {
        RatNum rval = RatNum.asRatNumOrNull(value);
        if (rval == null && value != null) {
            throw new WrongType(-4, value, rationalType);
        }
        return rval;
    }

    public static IntNum coerceIntNum(Object value) {
        IntNum ival = IntNum.asIntNumOrNull(value);
        if (ival == null && value != null) {
            throw new WrongType(-4, value, integerType);
        }
        return ival;
    }

    public static Class coerceToClassOrNull(Object type) {
        if (type instanceof Class) {
            return (Class) type;
        }
        if ((type instanceof Type) && (type instanceof ClassType) && !(type instanceof PairClassType)) {
            return ((ClassType) type).getReflectClass();
        }
        return null;
    }

    public static Class coerceToClass(Object obj) {
        Class coerced = coerceToClassOrNull(obj);
        if (coerced == null && obj != null) {
            throw new ClassCastException("cannot cast " + obj + " to type");
        }
        return coerced;
    }

    public static ClassType coerceToClassTypeOrNull(Object type) {
        if (type instanceof ClassType) {
            return (ClassType) type;
        }
        if (type instanceof Class) {
            Language language = Language.getDefaultLanguage();
            Type t = language.getTypeFor((Class) type);
            if (t instanceof ClassType) {
                return (ClassType) t;
            }
            return null;
        }
        return null;
    }

    public static ClassType coerceToClassType(Object obj) {
        ClassType coerced = coerceToClassTypeOrNull(obj);
        if (coerced == null && obj != null) {
            throw new ClassCastException("cannot cast " + obj + " to class-type");
        }
        return coerced;
    }

    public static Type coerceToTypeOrNull(Object type) {
        if (type instanceof Type) {
            return (Type) type;
        }
        if (type instanceof Class) {
            Language language = Language.getDefaultLanguage();
            return language.getTypeFor((Class) type);
        }
        return null;
    }

    public static Type coerceToType(Object obj) {
        Type coerced = coerceToTypeOrNull(obj);
        if (coerced == null && obj != null) {
            throw new ClassCastException("cannot cast " + obj + " to type");
        }
        return coerced;
    }

    Method coercionMethod() {
        switch (this.typeCode) {
            case 4:
                return typeLangObjType.getDeclaredMethod("coerceToClass", 1);
            case 5:
                return typeLangObjType.getDeclaredMethod("coerceToType", 1);
            case 6:
                return typeLangObjType.getDeclaredMethod("coerceToClassType", 1);
            case 7:
                return typeLangObjType.getDeclaredMethod("coerceIntNum", 1);
            case 8:
                return typeLangObjType.getDeclaredMethod("coerceRatNum", 1);
            case 9:
                return typeLangObjType.getDeclaredMethod("coerceRealNum", 1);
            case 10:
                return typeLangObjType.getDeclaredMethod("coerceNumeric", 1);
            case 11:
            case 12:
            case 13:
            case 14:
                return null;
            case 15:
                return typeLangObjType.getDeclaredMethod("coerceDFloNum", 1);
            default:
                return ((PrimProcedure) getConstructor()).getMethod();
        }
    }

    Method coercionOrNullMethod() {
        String mname;
        ClassType methodDeclaringClass = this.implementationType;
        switch (this.typeCode) {
            case 1:
                mname = "coerceToPathOrNull";
                break;
            case 2:
                mname = "coerceToFilePathOrNull";
                break;
            case 3:
                mname = "coerceToURIPathOrNull";
                break;
            case 4:
                methodDeclaringClass = typeLangObjType;
                mname = "coerceToClassOrNull";
                break;
            case 5:
                methodDeclaringClass = typeLangObjType;
                mname = "coerceToTypeOrNull";
                break;
            case 6:
                methodDeclaringClass = typeLangObjType;
                mname = "coerceToClassTypeOrNull";
                break;
            case 7:
                methodDeclaringClass = this.implementationType;
                mname = "asIntNumOrNull";
                break;
            case 8:
                methodDeclaringClass = this.implementationType;
                mname = "asRatNumOrNull";
                break;
            case 9:
                methodDeclaringClass = this.implementationType;
                mname = "asRealNumOrNull";
                break;
            case 10:
                methodDeclaringClass = this.implementationType;
                mname = "asNumericOrNull";
                break;
            case 11:
            case 12:
            case 13:
            case 14:
            default:
                return null;
            case 15:
                methodDeclaringClass = this.implementationType;
                mname = "asDFloNumOrNull";
                break;
        }
        return methodDeclaringClass.getDeclaredMethod(mname, 1);
    }

    @Override // gnu.expr.TypeValue
    public void emitTestIf(Variable incoming, Declaration decl, Compilation comp) {
        CodeAttr code = comp.getCode();
        if (incoming != null) {
            code.emitLoad(incoming);
        }
        Method method = coercionOrNullMethod();
        if (method != null) {
            code.emitInvokeStatic(method);
        }
        if (decl != null) {
            code.emitDup();
            decl.compileStore(comp);
        }
        if (method != null) {
            code.emitIfNotNull();
        } else {
            this.implementationType.emitIsInstance(code);
            code.emitIfIntNotZero();
        }
    }

    @Override // gnu.bytecode.ObjectType, gnu.bytecode.Type
    public Object coerceFromObject(Object obj) {
        switch (this.typeCode) {
            case 1:
                return Path.valueOf(obj);
            case 2:
                return FilePath.makeFilePath(obj);
            case 3:
                return URIPath.makeURI(obj);
            case 4:
                return coerceToClass(obj);
            case 5:
                return coerceToType(obj);
            case 6:
                return coerceToClassType(obj);
            case 7:
                return coerceIntNum(obj);
            case 8:
                return coerceRatNum(obj);
            case 9:
                return coerceRealNum(obj);
            case 10:
                return coerceNumeric(obj);
            case 11:
            case 12:
            case 13:
            case 14:
            default:
                return super.coerceFromObject(obj);
            case 15:
                return coerceDFloNum(obj);
        }
    }

    @Override // gnu.bytecode.Type
    public void emitConvertFromPrimitive(Type stackType, CodeAttr code) {
        Type argType = null;
        String cname = null;
        switch (this.typeCode) {
            case 7:
            case 8:
            case 9:
            case 10:
                if (stackType instanceof PrimType) {
                    if (stackType == Type.intType || stackType == Type.byteType || stackType == Type.shortType) {
                        cname = "gnu.math.IntNum";
                        argType = Type.int_type;
                        break;
                    } else if (stackType == Type.longType) {
                        cname = "gnu.math.IntNum";
                        argType = Type.long_type;
                        break;
                    } else {
                        int i = this.typeCode;
                        if (i == 9 || i == 10) {
                            if (stackType == Type.floatType) {
                                code.emitConvert(Type.float_type, Type.double_type);
                                stackType = Type.doubleType;
                            }
                            if (stackType == Type.doubleType) {
                                cname = "gnu.math.DFloNum";
                                argType = Type.doubleType;
                                break;
                            }
                        }
                    }
                }
                break;
            case 15:
                if (stackType instanceof PrimType) {
                    if (stackType == Type.intType || stackType == Type.byteType || stackType == Type.shortType || stackType == Type.longType || stackType == Type.floatType) {
                        code.emitConvert(stackType, Type.doubleType);
                        stackType = Type.doubleType;
                    }
                    if (stackType == Type.doubleType) {
                        cname = "gnu.math.DFloNum";
                        argType = stackType;
                        break;
                    }
                }
                break;
        }
        if (cname != null) {
            ClassType clas = ClassType.make(cname);
            Type[] args = {argType};
            code.emitInvokeStatic(clas.getDeclaredMethod("make", args));
            return;
        }
        super.emitConvertFromPrimitive(stackType, code);
    }

    @Override // gnu.expr.TypeValue
    public Expression convertValue(Expression value) {
        Method method;
        int i = this.typeCode;
        if (i == 7 || i == 10 || i == 9 || i == 8 || i == 15 || (method = coercionMethod()) == null) {
            return null;
        }
        ApplyExp aexp = new ApplyExp(method, value);
        aexp.setType(this);
        return aexp;
    }

    @Override // gnu.bytecode.ObjectType, gnu.bytecode.Type
    public void emitCoerceFromObject(CodeAttr code) {
        switch (this.typeCode) {
            case 11:
            case 12:
            case 13:
            case 14:
                code.emitCheckcast(this.implementationType);
                break;
            default:
                code.emitInvoke(coercionMethod());
                break;
        }
    }

    @Override // gnu.expr.TypeValue
    public Procedure getConstructor() {
        switch (this.typeCode) {
            case 1:
                return makePathProc;
            case 2:
                return makeFilepathProc;
            case 3:
                return makeURIProc;
            case 11:
                return MakeList.list;
            case 12:
                return new PrimProcedure("gnu.lists.FVector", "make", 1);
            case 13:
                return new PrimProcedure("kawa.lib.strings", "$make$string$", 1);
            case 14:
                return new PrimProcedure("java.util.regex.Pattern", "compile", 1);
            default:
                return null;
        }
    }
}
