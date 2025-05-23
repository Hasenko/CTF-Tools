package kawa.lib;

import androidx.fragment.app.FragmentTransaction;
import gnu.bytecode.ClassType;
import gnu.bytecode.Type;
import gnu.expr.Compilation;
import gnu.expr.ModuleBody;
import gnu.expr.ModuleInfo;
import gnu.expr.ModuleMethod;
import gnu.kawa.lispexpr.LangObjType;
import gnu.lists.Consumer;
import gnu.lists.LList;
import gnu.lists.PairWithPosition;
import gnu.mapping.CallContext;
import gnu.mapping.Procedure;
import gnu.mapping.SimpleSymbol;
import gnu.mapping.WrongType;
import gnu.math.IntNum;
import kawa.lang.GetFieldProc;
import kawa.lang.Macro;
import kawa.lang.Record;
import kawa.lang.RecordConstructor;
import kawa.lang.SetFieldProc;
import kawa.lang.SyntaxPattern;
import kawa.lang.SyntaxRule;
import kawa.lang.SyntaxRules;
import kawa.lang.SyntaxTemplate;
import kawa.lang.TemplateScope;
import kawa.standard.syntax_case;

/* compiled from: reflection.scm */
/* loaded from: classes.dex */
public class reflection extends ModuleBody {
    public static final reflection $instance;
    static final SimpleSymbol Lit0;
    static final SyntaxPattern Lit1;
    static final SimpleSymbol Lit10;
    static final SimpleSymbol Lit11;
    static final SimpleSymbol Lit12;
    static final SimpleSymbol Lit13;
    static final SimpleSymbol Lit14;
    static final SyntaxRules Lit15;
    static final SimpleSymbol Lit16;
    static final SyntaxRules Lit17;
    static final SimpleSymbol Lit18;
    static final SyntaxRules Lit19;
    static final SyntaxTemplate Lit2;
    static final SimpleSymbol Lit20;
    static final SyntaxRules Lit21;
    static final SimpleSymbol Lit22;
    static final SyntaxRules Lit23;
    static final SimpleSymbol Lit24;
    static final SyntaxRules Lit25;
    static final SimpleSymbol Lit26;
    static final SyntaxRules Lit27;
    static final SimpleSymbol Lit28;
    static final SyntaxRules Lit29;
    static final SyntaxPattern Lit3;
    static final SimpleSymbol Lit30;
    static final SimpleSymbol Lit31;
    static final SimpleSymbol Lit32;
    static final IntNum Lit33;
    static final IntNum Lit34;
    static final SyntaxTemplate Lit4;
    static final SimpleSymbol Lit5;
    static final SimpleSymbol Lit6;
    static final SimpleSymbol Lit7;
    static final SimpleSymbol Lit8;
    static final SimpleSymbol Lit9;
    public static final ModuleMethod make$Mnrecord$Mntype;
    public static final Macro primitive$Mnarray$Mnget;
    public static final Macro primitive$Mnarray$Mnlength;
    public static final Macro primitive$Mnarray$Mnnew;
    public static final Macro primitive$Mnarray$Mnset;
    public static final Macro primitive$Mnconstructor;
    public static final Macro primitive$Mnget$Mnfield;
    public static final Macro primitive$Mnget$Mnstatic;
    public static final Macro primitive$Mnset$Mnfield;
    public static final Macro primitive$Mnset$Mnstatic;
    public static final ModuleMethod record$Mnaccessor;
    public static final ModuleMethod record$Mnconstructor;
    public static final ModuleMethod record$Mnmodifier;
    public static final ModuleMethod record$Mnpredicate;
    public static final ModuleMethod record$Mntype$Mndescriptor;
    public static final ModuleMethod record$Mntype$Mnfield$Mnnames;
    public static final ModuleMethod record$Mntype$Mnname;
    public static final ModuleMethod record$Qu;
    public static final ModuleMethod subtype$Qu;

    static {
        IntNum make = IntNum.make(1);
        Lit34 = make;
        IntNum make2 = IntNum.make(9);
        Lit33 = make2;
        SimpleSymbol simpleSymbol = (SimpleSymbol) new SimpleSymbol("make").readResolve();
        Lit32 = simpleSymbol;
        SimpleSymbol simpleSymbol2 = (SimpleSymbol) new SimpleSymbol("constant-fold").readResolve();
        Lit31 = simpleSymbol2;
        SimpleSymbol simpleSymbol3 = (SimpleSymbol) new SimpleSymbol("subtype?").readResolve();
        Lit30 = simpleSymbol3;
        SimpleSymbol simpleSymbol4 = (SimpleSymbol) new SimpleSymbol("primitive-set-static").readResolve();
        Lit28 = simpleSymbol4;
        SyntaxRules syntaxRules = new SyntaxRules(new Object[]{simpleSymbol4}, new SyntaxRule[]{new SyntaxRule(new SyntaxPattern("\f\u0018\f\u0007\f\u000f\f\u0017\b", new Object[0], 3), "\u0001\u0001\u0001", "\u0011\u0018\u0004\u0011\u0018\f\u0011\u0018\u0014\t\u0003\t\u000b\t\u0013\u0018\u001c", new Object[]{simpleSymbol2, simpleSymbol, (SimpleSymbol) new SimpleSymbol("<gnu.kawa.reflect.StaticSet>").readResolve(), PairWithPosition.make(make2, LList.Empty, "/u2/home/jis/ai2-kawa/kawa/lib/reflection.scm", 454679)}, 0)}, 3);
        Lit29 = syntaxRules;
        SimpleSymbol simpleSymbol5 = (SimpleSymbol) new SimpleSymbol("primitive-get-static").readResolve();
        Lit26 = simpleSymbol5;
        SyntaxRules syntaxRules2 = new SyntaxRules(new Object[]{simpleSymbol5}, new SyntaxRule[]{new SyntaxRule(new SyntaxPattern("\f\u0018\f\u0007\f\u000f\f\u0017\b", new Object[0], 3), "\u0001\u0001\u0001", "\u0011\u0018\u0004\u0011\u0018\f\u0011\u0018\u0014\t\u0003\t\u000b\t\u0013\u0018\u001c", new Object[]{simpleSymbol2, simpleSymbol, (SimpleSymbol) new SimpleSymbol("<gnu.kawa.reflect.StaticGet>").readResolve(), PairWithPosition.make(make2, LList.Empty, "/u2/home/jis/ai2-kawa/kawa/lib/reflection.scm", 430103)}, 0)}, 3);
        Lit27 = syntaxRules2;
        SimpleSymbol simpleSymbol6 = (SimpleSymbol) new SimpleSymbol("primitive-set-field").readResolve();
        Lit24 = simpleSymbol6;
        SyntaxRules syntaxRules3 = new SyntaxRules(new Object[]{simpleSymbol6}, new SyntaxRule[]{new SyntaxRule(new SyntaxPattern("\f\u0018\f\u0007\f\u000f\f\u0017\b", new Object[0], 3), "\u0001\u0001\u0001", "\u0011\u0018\u0004\u0011\u0018\f\u0011\u0018\u0014\t\u0003\t\u000b\t\u0013\u0018\u001c", new Object[]{simpleSymbol2, simpleSymbol, (SimpleSymbol) new SimpleSymbol("<kawa.lang.SetFieldProc>").readResolve(), PairWithPosition.make(make, LList.Empty, "/u2/home/jis/ai2-kawa/kawa/lib/reflection.scm", 401431)}, 0)}, 3);
        Lit25 = syntaxRules3;
        SimpleSymbol simpleSymbol7 = (SimpleSymbol) new SimpleSymbol("primitive-get-field").readResolve();
        Lit22 = simpleSymbol7;
        SyntaxRules syntaxRules4 = new SyntaxRules(new Object[]{simpleSymbol7}, new SyntaxRule[]{new SyntaxRule(new SyntaxPattern("\f\u0018\f\u0007\f\u000f\f\u0017\b", new Object[0], 3), "\u0001\u0001\u0001", "\u0011\u0018\u0004\u0011\u0018\f\u0011\u0018\u0014\t\u0003\t\u000b\t\u0013\u0018\u001c", new Object[]{simpleSymbol2, simpleSymbol, (SimpleSymbol) new SimpleSymbol("<kawa.lang.GetFieldProc>").readResolve(), PairWithPosition.make(make, LList.Empty, "/u2/home/jis/ai2-kawa/kawa/lib/reflection.scm", 376855)}, 0)}, 3);
        Lit23 = syntaxRules4;
        SimpleSymbol simpleSymbol8 = (SimpleSymbol) new SimpleSymbol("primitive-array-length").readResolve();
        Lit20 = simpleSymbol8;
        SyntaxRules syntaxRules5 = new SyntaxRules(new Object[]{simpleSymbol8}, new SyntaxRule[]{new SyntaxRule(new SyntaxPattern("\f\u0018\f\u0007\b", new Object[0], 1), "\u0001", "\u0011\u0018\u0004\u0011\u0018\f\u0011\u0018\u0014\b\u0003", new Object[]{simpleSymbol2, simpleSymbol, (SimpleSymbol) new SimpleSymbol("<gnu.kawa.reflect.ArrayLength>").readResolve()}, 0)}, 1);
        Lit21 = syntaxRules5;
        SimpleSymbol simpleSymbol9 = (SimpleSymbol) new SimpleSymbol("primitive-array-get").readResolve();
        Lit18 = simpleSymbol9;
        SyntaxRules syntaxRules6 = new SyntaxRules(new Object[]{simpleSymbol9}, new SyntaxRule[]{new SyntaxRule(new SyntaxPattern("\f\u0018\f\u0007\b", new Object[0], 1), "\u0001", "\u0011\u0018\u0004\u0011\u0018\f\u0011\u0018\u0014\b\u0003", new Object[]{simpleSymbol2, simpleSymbol, (SimpleSymbol) new SimpleSymbol("<gnu.kawa.reflect.ArrayGet>").readResolve()}, 0)}, 1);
        Lit19 = syntaxRules6;
        SimpleSymbol simpleSymbol10 = (SimpleSymbol) new SimpleSymbol("primitive-array-set").readResolve();
        Lit16 = simpleSymbol10;
        SyntaxRules syntaxRules7 = new SyntaxRules(new Object[]{simpleSymbol10}, new SyntaxRule[]{new SyntaxRule(new SyntaxPattern("\f\u0018\f\u0007\b", new Object[0], 1), "\u0001", "\u0011\u0018\u0004\u0011\u0018\f\u0011\u0018\u0014\b\u0003", new Object[]{simpleSymbol2, simpleSymbol, (SimpleSymbol) new SimpleSymbol("<gnu.kawa.reflect.ArraySet>").readResolve()}, 0)}, 1);
        Lit17 = syntaxRules7;
        SimpleSymbol simpleSymbol11 = (SimpleSymbol) new SimpleSymbol("primitive-array-new").readResolve();
        Lit14 = simpleSymbol11;
        SyntaxRules syntaxRules8 = new SyntaxRules(new Object[]{simpleSymbol11}, new SyntaxRule[]{new SyntaxRule(new SyntaxPattern("\f\u0018\f\u0007\b", new Object[0], 1), "\u0001", "\u0011\u0018\u0004\u0011\u0018\f\u0011\u0018\u0014\b\u0003", new Object[]{simpleSymbol2, simpleSymbol, (SimpleSymbol) new SimpleSymbol("<gnu.kawa.reflect.ArrayNew>").readResolve()}, 0)}, 1);
        Lit15 = syntaxRules8;
        SimpleSymbol simpleSymbol12 = (SimpleSymbol) new SimpleSymbol("record-type-field-names").readResolve();
        Lit13 = simpleSymbol12;
        SimpleSymbol simpleSymbol13 = (SimpleSymbol) new SimpleSymbol("record-type-name").readResolve();
        Lit12 = simpleSymbol13;
        SimpleSymbol simpleSymbol14 = (SimpleSymbol) new SimpleSymbol("record-type-descriptor").readResolve();
        Lit11 = simpleSymbol14;
        SimpleSymbol simpleSymbol15 = (SimpleSymbol) new SimpleSymbol("record-predicate").readResolve();
        Lit10 = simpleSymbol15;
        SimpleSymbol simpleSymbol16 = (SimpleSymbol) new SimpleSymbol("record?").readResolve();
        Lit9 = simpleSymbol16;
        SimpleSymbol simpleSymbol17 = (SimpleSymbol) new SimpleSymbol("record-modifier").readResolve();
        Lit8 = simpleSymbol17;
        SimpleSymbol simpleSymbol18 = (SimpleSymbol) new SimpleSymbol("record-accessor").readResolve();
        Lit7 = simpleSymbol18;
        SimpleSymbol simpleSymbol19 = (SimpleSymbol) new SimpleSymbol("record-constructor").readResolve();
        Lit6 = simpleSymbol19;
        SimpleSymbol simpleSymbol20 = (SimpleSymbol) new SimpleSymbol("make-record-type").readResolve();
        Lit5 = simpleSymbol20;
        Lit4 = new SyntaxTemplate("\u0001\u0001\u0003\u0003", "\u0011\u0018\u0004\u0019\b\u001d\u001b\u0011\u0018\f\t\u000b\b\u0011\u0018\u0014\t\u000b\b\u0015\u0011\u0018\u001c\t\u0013\b\u001b", new Object[]{(SimpleSymbol) new SimpleSymbol("lambda").readResolve(), (SimpleSymbol) new SimpleSymbol("::").readResolve(), simpleSymbol, (SimpleSymbol) new SimpleSymbol("as").readResolve()}, 1);
        Lit3 = new SyntaxPattern("\r\u001f\u0018\b\b", new Object[0], 4);
        Lit2 = new SyntaxTemplate("\u0001\u0001\u0003", "\b\u0015\u0013", new Object[0], 1);
        Lit1 = new SyntaxPattern("\f\u0007\f\u000f,\r\u0017\u0010\b\b\b", new Object[0], 3);
        SimpleSymbol simpleSymbol21 = (SimpleSymbol) new SimpleSymbol("primitive-constructor").readResolve();
        Lit0 = simpleSymbol21;
        reflection reflectionVar = new reflection();
        $instance = reflectionVar;
        primitive$Mnconstructor = Macro.make(simpleSymbol21, new ModuleMethod(reflectionVar, 2, null, FragmentTransaction.TRANSIT_FRAGMENT_OPEN), reflectionVar);
        make$Mnrecord$Mntype = new ModuleMethod(reflectionVar, 3, simpleSymbol20, 8194);
        record$Mnconstructor = new ModuleMethod(reflectionVar, 4, simpleSymbol19, 8193);
        record$Mnaccessor = new ModuleMethod(reflectionVar, 6, simpleSymbol18, 8194);
        record$Mnmodifier = new ModuleMethod(reflectionVar, 7, simpleSymbol17, 8194);
        record$Qu = new ModuleMethod(reflectionVar, 8, simpleSymbol16, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        record$Mnpredicate = new ModuleMethod(reflectionVar, 9, simpleSymbol15, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        record$Mntype$Mndescriptor = new ModuleMethod(reflectionVar, 10, simpleSymbol14, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        record$Mntype$Mnname = new ModuleMethod(reflectionVar, 11, simpleSymbol13, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        record$Mntype$Mnfield$Mnnames = new ModuleMethod(reflectionVar, 12, simpleSymbol12, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        primitive$Mnarray$Mnnew = Macro.make(simpleSymbol11, syntaxRules8, reflectionVar);
        primitive$Mnarray$Mnset = Macro.make(simpleSymbol10, syntaxRules7, reflectionVar);
        primitive$Mnarray$Mnget = Macro.make(simpleSymbol9, syntaxRules6, reflectionVar);
        primitive$Mnarray$Mnlength = Macro.make(simpleSymbol8, syntaxRules5, reflectionVar);
        primitive$Mnget$Mnfield = Macro.make(simpleSymbol7, syntaxRules4, reflectionVar);
        primitive$Mnset$Mnfield = Macro.make(simpleSymbol6, syntaxRules3, reflectionVar);
        primitive$Mnget$Mnstatic = Macro.make(simpleSymbol5, syntaxRules2, reflectionVar);
        primitive$Mnset$Mnstatic = Macro.make(simpleSymbol4, syntaxRules, reflectionVar);
        subtype$Qu = new ModuleMethod(reflectionVar, 13, simpleSymbol3, 8194);
        reflectionVar.run();
    }

    public reflection() {
        ModuleInfo.register(this);
    }

    public static RecordConstructor recordConstructor(ClassType classType) {
        return recordConstructor(classType, null);
    }

    @Override // gnu.expr.ModuleBody
    public final void run(CallContext $ctx) {
        Consumer $result = $ctx.consumer;
    }

    static Object lambda2(Object form) {
        Object[] allocVars = SyntaxPattern.allocVars(3, null);
        if (!Lit1.match(form, allocVars, 0)) {
            return syntax_case.error("syntax-case", form);
        }
        Object generateTemporaries = std_syntax.generateTemporaries(Lit2.execute(allocVars, TemplateScope.make()));
        Object[] allocVars2 = SyntaxPattern.allocVars(4, allocVars);
        if (!Lit3.match(generateTemporaries, allocVars2, 0)) {
            return syntax_case.error("syntax-case", generateTemporaries);
        }
        return Lit4.execute(allocVars2, TemplateScope.make());
    }

    public static ClassType makeRecordType(String name, LList fnames) {
        return Record.makeRecordType(name, fnames);
    }

    @Override // gnu.expr.ModuleBody
    public int match2(ModuleMethod moduleMethod, Object obj, Object obj2, CallContext callContext) {
        switch (moduleMethod.selector) {
            case 3:
                callContext.value1 = obj;
                if (!(obj2 instanceof LList)) {
                    return -786430;
                }
                callContext.value2 = obj2;
                callContext.proc = moduleMethod;
                callContext.pc = 2;
                return 0;
            case 4:
                if (LangObjType.coerceToClassTypeOrNull(obj) == null) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.proc = moduleMethod;
                callContext.pc = 2;
                return 0;
            case 6:
                if (LangObjType.coerceToClassTypeOrNull(obj) == null) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.proc = moduleMethod;
                callContext.pc = 2;
                return 0;
            case 7:
                if (LangObjType.coerceToClassTypeOrNull(obj) == null) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.proc = moduleMethod;
                callContext.pc = 2;
                return 0;
            case 13:
                if (LangObjType.coerceToTypeOrNull(obj) == null) {
                    return -786431;
                }
                callContext.value1 = obj;
                if (LangObjType.coerceToTypeOrNull(obj2) == null) {
                    return -786430;
                }
                callContext.value2 = obj2;
                callContext.proc = moduleMethod;
                callContext.pc = 2;
                return 0;
            default:
                return super.match2(moduleMethod, obj, obj2, callContext);
        }
    }

    public static RecordConstructor recordConstructor(ClassType cl, Object flds) {
        return new RecordConstructor(cl, flds);
    }

    @Override // gnu.expr.ModuleBody
    public int match1(ModuleMethod moduleMethod, Object obj, CallContext callContext) {
        switch (moduleMethod.selector) {
            case 2:
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 3:
            case 5:
            case 6:
            case 7:
            default:
                return super.match1(moduleMethod, obj, callContext);
            case 4:
                if (LangObjType.coerceToClassTypeOrNull(obj) == null) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 8:
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 9:
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 10:
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 11:
                if (LangObjType.coerceToClassTypeOrNull(obj) == null) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 12:
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
        }
    }

    public static GetFieldProc recordAccessor(ClassType classType, String fname) {
        return new GetFieldProc(classType, fname);
    }

    public static SetFieldProc recordModifier(ClassType classType, String fname) {
        return new SetFieldProc(classType, fname);
    }

    public static boolean isRecord(Object obj) {
        return obj instanceof Record;
    }

    /* compiled from: reflection.scm */
    public class frame extends ModuleBody {
        final ModuleMethod lambda$Fn1;
        Object rtype;

        public frame() {
            ModuleMethod moduleMethod = new ModuleMethod(this, 1, null, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
            moduleMethod.setProperty("source-location", "/u2/home/jis/ai2-kawa/kawa/lib/reflection.scm:30");
            this.lambda$Fn1 = moduleMethod;
        }

        @Override // gnu.expr.ModuleBody
        public Object apply1(ModuleMethod moduleMethod, Object obj) {
            return moduleMethod.selector == 1 ? lambda1(obj) ? Boolean.TRUE : Boolean.FALSE : super.apply1(moduleMethod, obj);
        }

        boolean lambda1(Object object) {
            Object obj = this.rtype;
            try {
                return ((Type) obj).isInstance(object);
            } catch (ClassCastException e) {
                throw new WrongType(e, "gnu.bytecode.Type.isInstance(java.lang.Object)", 1, obj);
            }
        }

        @Override // gnu.expr.ModuleBody
        public int match1(ModuleMethod moduleMethod, Object obj, CallContext callContext) {
            if (moduleMethod.selector != 1) {
                return super.match1(moduleMethod, obj, callContext);
            }
            callContext.value1 = obj;
            callContext.proc = moduleMethod;
            callContext.pc = 1;
            return 0;
        }
    }

    public static Procedure recordPredicate(Object rtype) {
        frame frameVar = new frame();
        frameVar.rtype = rtype;
        return frameVar.lambda$Fn1;
    }

    public static Type recordTypeDescriptor(Object object) {
        return Type.make(object.getClass());
    }

    public static String recordTypeName(ClassType rtd) {
        return Compilation.demangleName(rtd.getName(), true);
    }

    public static LList recordTypeFieldNames(Object rtd) {
        try {
            return Record.typeFieldNames(LangObjType.coerceToClassType(rtd));
        } catch (ClassCastException e) {
            throw new WrongType(e, "kawa.lang.Record.typeFieldNames(class-type)", 1, rtd);
        }
    }

    @Override // gnu.expr.ModuleBody
    public Object apply1(ModuleMethod moduleMethod, Object obj) {
        switch (moduleMethod.selector) {
            case 2:
                return lambda2(obj);
            case 3:
            case 5:
            case 6:
            case 7:
            default:
                return super.apply1(moduleMethod, obj);
            case 4:
                try {
                    return recordConstructor(LangObjType.coerceToClassType(obj));
                } catch (ClassCastException e) {
                    throw new WrongType(e, "record-constructor", 1, obj);
                }
            case 8:
                return isRecord(obj) ? Boolean.TRUE : Boolean.FALSE;
            case 9:
                return recordPredicate(obj);
            case 10:
                return recordTypeDescriptor(obj);
            case 11:
                try {
                    return recordTypeName(LangObjType.coerceToClassType(obj));
                } catch (ClassCastException e2) {
                    throw new WrongType(e2, "record-type-name", 1, obj);
                }
            case 12:
                return recordTypeFieldNames(obj);
        }
    }

    public static boolean isSubtype(Type t1, Type t2) {
        return t1.isSubtype(t2);
    }

    @Override // gnu.expr.ModuleBody
    public Object apply2(ModuleMethod moduleMethod, Object obj, Object obj2) {
        switch (moduleMethod.selector) {
            case 3:
                try {
                    return makeRecordType(obj != null ? obj.toString() : null, (LList) obj2);
                } catch (ClassCastException e) {
                    throw new WrongType(e, "make-record-type", 2, obj2);
                }
            case 4:
                try {
                    return recordConstructor(LangObjType.coerceToClassType(obj), obj2);
                } catch (ClassCastException e2) {
                    throw new WrongType(e2, "record-constructor", 1, obj);
                }
            case 6:
                try {
                    return recordAccessor(LangObjType.coerceToClassType(obj), obj2 != null ? obj2.toString() : null);
                } catch (ClassCastException e3) {
                    throw new WrongType(e3, "record-accessor", 1, obj);
                }
            case 7:
                try {
                    return recordModifier(LangObjType.coerceToClassType(obj), obj2 != null ? obj2.toString() : null);
                } catch (ClassCastException e4) {
                    throw new WrongType(e4, "record-modifier", 1, obj);
                }
            case 13:
                try {
                    try {
                        return isSubtype(LangObjType.coerceToType(obj), LangObjType.coerceToType(obj2)) ? Boolean.TRUE : Boolean.FALSE;
                    } catch (ClassCastException e5) {
                        throw new WrongType(e5, "subtype?", 2, obj2);
                    }
                } catch (ClassCastException e6) {
                    throw new WrongType(e6, "subtype?", 1, obj);
                }
            default:
                return super.apply2(moduleMethod, obj, obj2);
        }
    }
}
