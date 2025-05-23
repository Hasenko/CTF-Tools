package gnu.kawa.lispexpr;

import androidx.appcompat.R$styleable;
import gnu.bytecode.ClassType;
import gnu.bytecode.CodeAttr;
import gnu.bytecode.Method;
import gnu.bytecode.PrimType;
import gnu.bytecode.Type;
import gnu.bytecode.Variable;
import gnu.expr.Compilation;
import gnu.expr.Declaration;
import gnu.expr.Expression;
import gnu.expr.Language;
import gnu.expr.Target;
import gnu.expr.TypeValue;
import gnu.kawa.reflect.InstanceOf;
import gnu.mapping.Procedure;
import gnu.mapping.Values;
import gnu.text.Char;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class LangPrimType extends PrimType implements TypeValue {
    PrimType implementationType;
    Language language;
    public static final PrimType byteType = Type.byteType;
    public static final PrimType shortType = Type.shortType;
    public static final PrimType intType = Type.intType;
    public static final PrimType longType = Type.longType;
    public static final PrimType floatType = Type.floatType;
    public static final PrimType doubleType = Type.doubleType;
    public static final LangPrimType charType = new LangPrimType(Type.charType);
    public static final LangPrimType voidType = new LangPrimType(Type.voidType);

    public LangPrimType(PrimType type) {
        super(type);
        this.implementationType = type;
    }

    public LangPrimType(PrimType type, Language language) {
        super(type);
        this.language = language;
        this.implementationType = type;
    }

    public LangPrimType(String nam, String sig, int siz, Class reflectClass) {
        super(nam, sig, siz, reflectClass);
    }

    public LangPrimType(String nam, String sig, int siz, Class reflectClass, Language language) {
        this(nam, sig, siz, reflectClass);
        this.implementationType = Type.signatureToPrimitive(sig.charAt(0));
        this.language = language;
    }

    @Override // gnu.bytecode.Type
    public Type getImplementationType() {
        return this.implementationType;
    }

    @Override // gnu.bytecode.PrimType, gnu.bytecode.Type
    public Object coerceFromObject(Object obj) {
        if (obj.getClass() == this.reflectClass) {
            return obj;
        }
        char sig1 = getSignature().charAt(0);
        switch (sig1) {
            case R$styleable.AppCompatTheme_textAppearanceSearchResultTitle /* 67 */:
                return new Character(((Char) obj).charValue());
            case R$styleable.AppCompatTheme_colorPrimaryDark /* 86 */:
                return Values.empty;
            case R$styleable.AppCompatTheme_colorControlHighlight /* 90 */:
                return this.language.isTrue(obj) ? Boolean.TRUE : Boolean.FALSE;
            default:
                return super.coerceFromObject(obj);
        }
    }

    @Override // gnu.bytecode.PrimType
    public char charValue(Object value) {
        if (value instanceof Character) {
            return ((Character) value).charValue();
        }
        return ((Char) value).charValue();
    }

    @Override // gnu.bytecode.PrimType, gnu.bytecode.Type
    public void emitIsInstance(CodeAttr code) {
        char sig1 = getSignature().charAt(0);
        switch (sig1) {
            case R$styleable.AppCompatTheme_textAppearanceSearchResultTitle /* 67 */:
                ClassType scmCharType = ClassType.make("gnu.text.Char");
                code.emitInstanceof(scmCharType);
                break;
            case R$styleable.AppCompatTheme_colorControlHighlight /* 90 */:
                code.emitPop(1);
                code.emitPushInt(1);
                break;
            default:
                super.emitIsInstance(code);
                break;
        }
    }

    @Override // gnu.bytecode.PrimType, gnu.bytecode.Type
    public void emitCoerceFromObject(CodeAttr code) {
        char sig1 = getSignature().charAt(0);
        switch (sig1) {
            case R$styleable.AppCompatTheme_textAppearanceSearchResultTitle /* 67 */:
                ClassType scmCharType = ClassType.make("gnu.text.Char");
                Method charValueMethod = scmCharType.getDeclaredMethod("charValue", 0);
                code.emitCheckcast(scmCharType);
                code.emitInvokeVirtual(charValueMethod);
                break;
            case R$styleable.AppCompatTheme_colorControlHighlight /* 90 */:
                this.language.emitCoerceToBoolean(code);
                break;
            default:
                super.emitCoerceFromObject(code);
                break;
        }
    }

    @Override // gnu.bytecode.Type
    public Object coerceToObject(Object obj) {
        char sig1 = getSignature().charAt(0);
        switch (sig1) {
            case R$styleable.AppCompatTheme_textAppearanceSearchResultTitle /* 67 */:
                if (obj instanceof Char) {
                    return obj;
                }
                return Char.make(((Character) obj).charValue());
            case R$styleable.AppCompatTheme_colorPrimaryDark /* 86 */:
                return Values.empty;
            case R$styleable.AppCompatTheme_colorControlHighlight /* 90 */:
                return this.language.booleanObject(((Boolean) obj).booleanValue());
            default:
                return super.coerceToObject(obj);
        }
    }

    @Override // gnu.bytecode.PrimType, gnu.bytecode.Type
    public void emitCoerceToObject(CodeAttr code) {
        char sig1 = getSignature().charAt(0);
        switch (sig1) {
            case R$styleable.AppCompatTheme_textAppearanceSearchResultTitle /* 67 */:
                ClassType scmCharType = ClassType.make("gnu.text.Char");
                Method makeCharMethod = scmCharType.getDeclaredMethod("make", 1);
                code.emitInvokeStatic(makeCharMethod);
                break;
            case R$styleable.AppCompatTheme_colorControlHighlight /* 90 */:
                code.emitIfIntNotZero();
                this.language.emitPushBoolean(true, code);
                code.emitElse();
                this.language.emitPushBoolean(false, code);
                code.emitFi();
                break;
            default:
                super.emitCoerceToObject(code);
                break;
        }
        if (0 != 0) {
            ClassType clas = ClassType.make((String) null);
            Type[] args = {null};
            code.emitInvokeStatic(clas.getDeclaredMethod("make", args));
        }
    }

    @Override // gnu.bytecode.PrimType, gnu.bytecode.Type
    public int compare(Type other) {
        char sig1 = getSignature().charAt(0);
        if (other instanceof PrimType) {
            char sig2 = other.getSignature().charAt(0);
            if (sig1 == sig2) {
                return 0;
            }
            if (sig1 == 'V') {
                return 1;
            }
            if (sig2 == 'V' || sig2 == 'Z') {
                return -1;
            }
        }
        if (sig1 == 'V' || sig1 == 'Z') {
            return 1;
        }
        if (sig1 == 'C' && other.getName().equals("gnu.text.Char")) {
            return -1;
        }
        if (other instanceof LangObjType) {
            return swappedCompareResult(other.compare(this));
        }
        return super.compare(other);
    }

    @Override // gnu.expr.TypeValue
    public void emitTestIf(Variable incoming, Declaration decl, Compilation comp) {
        getSignature().charAt(0);
        CodeAttr code = comp.getCode();
        if (incoming != null) {
            code.emitLoad(incoming);
        }
        if (decl != null) {
            code.emitDup();
            decl.compileStore(comp);
        }
        emitIsInstance(code);
        code.emitIfIntNotZero();
    }

    @Override // gnu.expr.TypeValue
    public Expression convertValue(Expression value) {
        return null;
    }

    @Override // gnu.expr.TypeValue
    public void emitIsInstance(Variable incoming, Compilation comp, Target target) {
        InstanceOf.emitIsInstance(this, incoming, comp, target);
    }

    @Override // gnu.expr.TypeValue
    public Procedure getConstructor() {
        return null;
    }
}
