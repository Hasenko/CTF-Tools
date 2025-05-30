package gnu.kawa.slib;

import androidx.fragment.app.FragmentTransaction;
import com.google.appinventor.components.common.PropertyTypeConstants;
import gnu.expr.ModuleBody;
import gnu.expr.ModuleInfo;
import gnu.expr.ModuleMethod;
import gnu.kawa.lispexpr.LangObjType;
import gnu.kawa.reflect.StaticFieldLocation;
import gnu.kawa.util.HashNode;
import gnu.lists.Consumer;
import gnu.lists.LList;
import gnu.lists.Pair;
import gnu.mapping.CallContext;
import gnu.mapping.Location;
import gnu.mapping.Procedure;
import gnu.mapping.SimpleSymbol;
import gnu.mapping.Symbol;
import gnu.mapping.Values;
import gnu.mapping.WrongType;
import gnu.math.IntNum;
import kawa.lib.kawa.hashtable;
import kawa.lib.lists;
import kawa.lib.misc;
import kawa.lib.numbers;
import kawa.lib.rnrs.hashtables;
import kawa.lib.rnrs.unicode;
import kawa.lib.strings;
import kawa.standard.Scheme;

/* compiled from: srfi69.scm */
/* loaded from: classes2.dex */
public class srfi69 extends ModuleBody {
    public static final srfi69 $instance;
    static final IntNum Lit0;
    static final SimpleSymbol Lit1;
    static final SimpleSymbol Lit10;
    static final SimpleSymbol Lit11;
    static final SimpleSymbol Lit12;
    static final SimpleSymbol Lit13;
    static final SimpleSymbol Lit14;
    static final SimpleSymbol Lit15;
    static final SimpleSymbol Lit16;
    static final SimpleSymbol Lit17;
    static final SimpleSymbol Lit18;
    static final SimpleSymbol Lit19;
    static final SimpleSymbol Lit2;
    static final SimpleSymbol Lit3;
    static final SimpleSymbol Lit4;
    static final SimpleSymbol Lit5;
    static final SimpleSymbol Lit6;
    static final SimpleSymbol Lit7;
    static final SimpleSymbol Lit8;
    static final SimpleSymbol Lit9;
    public static final ModuleMethod alist$Mn$Grhash$Mntable;
    public static final ModuleMethod hash;
    public static final ModuleMethod hash$Mnby$Mnidentity;
    public static final ModuleMethod hash$Mntable$Mn$Gralist;
    public static final ModuleMethod hash$Mntable$Mncopy;
    public static final Location hash$Mntable$Mndelete$Ex;
    public static final ModuleMethod hash$Mntable$Mnequivalence$Mnfunction;
    public static final Location hash$Mntable$Mnexists$Qu;
    public static final ModuleMethod hash$Mntable$Mnfold;
    public static final ModuleMethod hash$Mntable$Mnhash$Mnfunction;
    public static final ModuleMethod hash$Mntable$Mnkeys;
    public static final ModuleMethod hash$Mntable$Mnmerge$Ex;
    public static final ModuleMethod hash$Mntable$Mnref;
    public static final ModuleMethod hash$Mntable$Mnref$Sldefault;
    public static final Location hash$Mntable$Mnset$Ex;
    public static final Location hash$Mntable$Mnsize;
    public static final ModuleMethod hash$Mntable$Mnupdate$Ex;
    public static final ModuleMethod hash$Mntable$Mnupdate$Ex$Sldefault;
    public static final ModuleMethod hash$Mntable$Mnvalues;
    public static final ModuleMethod hash$Mntable$Mnwalk;
    public static final Location hash$Mntable$Qu;
    static final ModuleMethod lambda$Fn1;
    static final ModuleMethod lambda$Fn2;
    static final ModuleMethod lambda$Fn3;
    public static final ModuleMethod make$Mnhash$Mntable;
    public static final ModuleMethod string$Mnci$Mnhash;
    public static final ModuleMethod string$Mnhash;

    public srfi69() {
        ModuleInfo.register(this);
    }

    public static hashtable.HashTable alist$To$HashTable(Object obj) {
        return alist$To$HashTable(obj, Scheme.isEqual);
    }

    public static hashtable.HashTable alist$To$HashTable(Object obj, Object obj2) {
        return alist$To$HashTable(obj, obj2, appropriateHashFunctionFor(obj2));
    }

    public static Object hash(Object obj) {
        return hash(obj, null);
    }

    public static Object hashByIdentity(Object obj) {
        return hashByIdentity(obj, null);
    }

    public static Object hashTableRef(hashtable.HashTable hashTable, Object obj) {
        return hashTableRef(hashTable, obj, Boolean.FALSE);
    }

    public static void hashTableUpdate$Ex(hashtable.HashTable hashTable, Object obj, Object obj2) {
        hashTableUpdate$Ex(hashTable, obj, obj2, Boolean.FALSE);
    }

    public static hashtable.HashTable makeHashTable() {
        return makeHashTable(Scheme.isEqual);
    }

    public static hashtable.HashTable makeHashTable(Procedure procedure) {
        return makeHashTable(procedure, appropriateHashFunctionFor(procedure), 64);
    }

    public static hashtable.HashTable makeHashTable(Procedure procedure, Procedure procedure2) {
        return makeHashTable(procedure, procedure2, 64);
    }

    public static Object stringCiHash(Object obj) {
        return stringCiHash(obj, null);
    }

    public static Object stringHash(CharSequence charSequence) {
        return stringHash(charSequence, null);
    }

    static Object symbolHash(Symbol symbol) {
        return symbolHash(symbol, null);
    }

    static Object vectorHash(Object obj) {
        return vectorHash(obj, null);
    }

    @Override // gnu.expr.ModuleBody
    public final void run(CallContext $ctx) {
        Consumer $result = $ctx.consumer;
    }

    static {
        SimpleSymbol simpleSymbol = (SimpleSymbol) new SimpleSymbol("hash-table-values").readResolve();
        Lit19 = simpleSymbol;
        SimpleSymbol simpleSymbol2 = (SimpleSymbol) new SimpleSymbol("hash-table-keys").readResolve();
        Lit18 = simpleSymbol2;
        SimpleSymbol simpleSymbol3 = (SimpleSymbol) new SimpleSymbol("hash-table-merge!").readResolve();
        Lit17 = simpleSymbol3;
        SimpleSymbol simpleSymbol4 = (SimpleSymbol) new SimpleSymbol("hash-table-copy").readResolve();
        Lit16 = simpleSymbol4;
        SimpleSymbol simpleSymbol5 = (SimpleSymbol) new SimpleSymbol("hash-table->alist").readResolve();
        Lit15 = simpleSymbol5;
        SimpleSymbol simpleSymbol6 = (SimpleSymbol) new SimpleSymbol("alist->hash-table").readResolve();
        Lit14 = simpleSymbol6;
        SimpleSymbol simpleSymbol7 = (SimpleSymbol) new SimpleSymbol("hash-table-fold").readResolve();
        Lit13 = simpleSymbol7;
        SimpleSymbol simpleSymbol8 = (SimpleSymbol) new SimpleSymbol("hash-table-walk").readResolve();
        Lit12 = simpleSymbol8;
        SimpleSymbol simpleSymbol9 = (SimpleSymbol) new SimpleSymbol("hash-table-update!/default").readResolve();
        Lit11 = simpleSymbol9;
        SimpleSymbol simpleSymbol10 = (SimpleSymbol) new SimpleSymbol("hash-table-update!").readResolve();
        Lit10 = simpleSymbol10;
        SimpleSymbol simpleSymbol11 = (SimpleSymbol) new SimpleSymbol("hash-table-ref/default").readResolve();
        Lit9 = simpleSymbol11;
        SimpleSymbol simpleSymbol12 = (SimpleSymbol) new SimpleSymbol("hash-table-ref").readResolve();
        Lit8 = simpleSymbol12;
        SimpleSymbol simpleSymbol13 = (SimpleSymbol) new SimpleSymbol("make-hash-table").readResolve();
        Lit7 = simpleSymbol13;
        SimpleSymbol simpleSymbol14 = (SimpleSymbol) new SimpleSymbol("hash-table-hash-function").readResolve();
        Lit6 = simpleSymbol14;
        SimpleSymbol simpleSymbol15 = (SimpleSymbol) new SimpleSymbol("hash-table-equivalence-function").readResolve();
        Lit5 = simpleSymbol15;
        SimpleSymbol simpleSymbol16 = (SimpleSymbol) new SimpleSymbol("hash-by-identity").readResolve();
        Lit4 = simpleSymbol16;
        SimpleSymbol simpleSymbol17 = (SimpleSymbol) new SimpleSymbol("hash").readResolve();
        Lit3 = simpleSymbol17;
        SimpleSymbol simpleSymbol18 = (SimpleSymbol) new SimpleSymbol("string-ci-hash").readResolve();
        Lit2 = simpleSymbol18;
        SimpleSymbol simpleSymbol19 = (SimpleSymbol) new SimpleSymbol("string-hash").readResolve();
        Lit1 = simpleSymbol19;
        Lit0 = IntNum.make(64);
        srfi69 srfi69Var = new srfi69();
        $instance = srfi69Var;
        hash$Mntable$Qu = StaticFieldLocation.make("kawa.lib.rnrs.hashtables", "hashtable$Qu");
        hash$Mntable$Mnsize = StaticFieldLocation.make("kawa.lib.rnrs.hashtables", "hashtable$Mnsize");
        hash$Mntable$Mnset$Ex = StaticFieldLocation.make("kawa.lib.rnrs.hashtables", "hashtable$Mnset$Ex");
        hash$Mntable$Mndelete$Ex = StaticFieldLocation.make("kawa.lib.rnrs.hashtables", "hashtable$Mndelete$Ex");
        hash$Mntable$Mnexists$Qu = StaticFieldLocation.make("kawa.lib.rnrs.hashtables", "hashtable$Mncontains$Qu");
        string$Mnhash = new ModuleMethod(srfi69Var, 1, simpleSymbol19, 8193);
        string$Mnci$Mnhash = new ModuleMethod(srfi69Var, 3, simpleSymbol18, 8193);
        hash = new ModuleMethod(srfi69Var, 5, simpleSymbol17, 8193);
        hash$Mnby$Mnidentity = new ModuleMethod(srfi69Var, 7, simpleSymbol16, 8193);
        hash$Mntable$Mnequivalence$Mnfunction = new ModuleMethod(srfi69Var, 9, simpleSymbol15, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        hash$Mntable$Mnhash$Mnfunction = new ModuleMethod(srfi69Var, 10, simpleSymbol14, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        make$Mnhash$Mntable = new ModuleMethod(srfi69Var, 11, simpleSymbol13, 12288);
        hash$Mntable$Mnref = new ModuleMethod(srfi69Var, 15, simpleSymbol12, 12290);
        hash$Mntable$Mnref$Sldefault = new ModuleMethod(srfi69Var, 17, simpleSymbol11, 12291);
        hash$Mntable$Mnupdate$Ex = new ModuleMethod(srfi69Var, 18, simpleSymbol10, 16387);
        hash$Mntable$Mnupdate$Ex$Sldefault = new ModuleMethod(srfi69Var, 20, simpleSymbol9, 16388);
        hash$Mntable$Mnwalk = new ModuleMethod(srfi69Var, 21, simpleSymbol8, 8194);
        hash$Mntable$Mnfold = new ModuleMethod(srfi69Var, 22, simpleSymbol7, 12291);
        ModuleMethod moduleMethod = new ModuleMethod(srfi69Var, 23, null, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        moduleMethod.setProperty("source-location", "/u2/home/jis/ai2-kawa/gnu/kawa/slib/srfi69.scm:166");
        lambda$Fn1 = moduleMethod;
        alist$Mn$Grhash$Mntable = new ModuleMethod(srfi69Var, 24, simpleSymbol6, 16385);
        hash$Mntable$Mn$Gralist = new ModuleMethod(srfi69Var, 28, simpleSymbol5, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        hash$Mntable$Mncopy = new ModuleMethod(srfi69Var, 29, simpleSymbol4, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        hash$Mntable$Mnmerge$Ex = new ModuleMethod(srfi69Var, 30, simpleSymbol3, 8194);
        ModuleMethod moduleMethod2 = new ModuleMethod(srfi69Var, 31, null, 12291);
        moduleMethod2.setProperty("source-location", "/u2/home/jis/ai2-kawa/gnu/kawa/slib/srfi69.scm:183");
        lambda$Fn2 = moduleMethod2;
        hash$Mntable$Mnkeys = new ModuleMethod(srfi69Var, 32, simpleSymbol2, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        ModuleMethod moduleMethod3 = new ModuleMethod(srfi69Var, 33, null, 12291);
        moduleMethod3.setProperty("source-location", "/u2/home/jis/ai2-kawa/gnu/kawa/slib/srfi69.scm:186");
        lambda$Fn3 = moduleMethod3;
        hash$Mntable$Mnvalues = new ModuleMethod(srfi69Var, 34, simpleSymbol, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        srfi69Var.run();
    }

    public static Object stringHash(CharSequence s, IntNum bound) {
        int h = s.hashCode();
        return bound == null ? Integer.valueOf(h) : IntNum.modulo(IntNum.make(h), bound);
    }

    @Override // gnu.expr.ModuleBody
    public int match1(ModuleMethod moduleMethod, Object obj, CallContext callContext) {
        switch (moduleMethod.selector) {
            case 1:
                if (!(obj instanceof CharSequence)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 3:
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 5:
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 7:
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 9:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 10:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 11:
                if (!(obj instanceof Procedure)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 23:
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 24:
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 28:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 29:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 32:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 34:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            default:
                return super.match1(moduleMethod, obj, callContext);
        }
    }

    @Override // gnu.expr.ModuleBody
    public int match2(ModuleMethod moduleMethod, Object obj, Object obj2, CallContext callContext) {
        switch (moduleMethod.selector) {
            case 1:
                if (!(obj instanceof CharSequence)) {
                    return -786431;
                }
                callContext.value1 = obj;
                if (IntNum.asIntNumOrNull(obj2) == null) {
                    return -786430;
                }
                callContext.value2 = obj2;
                callContext.proc = moduleMethod;
                callContext.pc = 2;
                return 0;
            case 3:
                callContext.value1 = obj;
                if (IntNum.asIntNumOrNull(obj2) == null) {
                    return -786430;
                }
                callContext.value2 = obj2;
                callContext.proc = moduleMethod;
                callContext.pc = 2;
                return 0;
            case 5:
                callContext.value1 = obj;
                if (IntNum.asIntNumOrNull(obj2) == null) {
                    return -786430;
                }
                callContext.value2 = obj2;
                callContext.proc = moduleMethod;
                callContext.pc = 2;
                return 0;
            case 7:
                callContext.value1 = obj;
                if (IntNum.asIntNumOrNull(obj2) == null) {
                    return -786430;
                }
                callContext.value2 = obj2;
                callContext.proc = moduleMethod;
                callContext.pc = 2;
                return 0;
            case 11:
                if (!(obj instanceof Procedure)) {
                    return -786431;
                }
                callContext.value1 = obj;
                if (!(obj2 instanceof Procedure)) {
                    return -786430;
                }
                callContext.value2 = obj2;
                callContext.proc = moduleMethod;
                callContext.pc = 2;
                return 0;
            case 15:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.proc = moduleMethod;
                callContext.pc = 2;
                return 0;
            case 21:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                if (!(obj2 instanceof Procedure)) {
                    return -786430;
                }
                callContext.value2 = obj2;
                callContext.proc = moduleMethod;
                callContext.pc = 2;
                return 0;
            case 24:
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.proc = moduleMethod;
                callContext.pc = 2;
                return 0;
            case 30:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                if (!(obj2 instanceof hashtable.HashTable)) {
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

    public static Object stringCiHash(Object s, IntNum bound) {
        int h = s.toString().toLowerCase().hashCode();
        return bound == null ? Integer.valueOf(h) : IntNum.modulo(IntNum.make(h), bound);
    }

    static Object symbolHash(Symbol s, IntNum bound) {
        int h = s.hashCode();
        return bound == null ? Integer.valueOf(h) : IntNum.modulo(IntNum.make(h), bound);
    }

    public static Object hash(Object obj, IntNum bound) {
        int h = obj == null ? 0 : obj.hashCode();
        return bound == null ? Integer.valueOf(h) : IntNum.modulo(IntNum.make(h), bound);
    }

    public static Object hashByIdentity(Object obj, IntNum bound) {
        int h = System.identityHashCode(obj);
        return bound == null ? Integer.valueOf(h) : IntNum.modulo(IntNum.make(h), bound);
    }

    static Object vectorHash(Object v, IntNum bound) {
        int h = v.hashCode();
        return bound == null ? Integer.valueOf(h) : IntNum.modulo(IntNum.make(h), bound);
    }

    public static Procedure hashTableEquivalenceFunction(hashtable.HashTable hash$Mntable) {
        return hash$Mntable.equivalenceFunction;
    }

    public static Procedure hashTableHashFunction(hashtable.HashTable hash$Mntable) {
        return hash$Mntable.hashFunction;
    }

    static Procedure appropriateHashFunctionFor(Object obj) {
        boolean z = obj == Scheme.isEq;
        Object obj2 = z ? hash$Mnby$Mnidentity : z ? Boolean.TRUE : Boolean.FALSE;
        if (obj2 == Boolean.FALSE) {
            boolean z2 = obj == strings.string$Eq$Qu;
            obj2 = z2 ? string$Mnhash : z2 ? Boolean.TRUE : Boolean.FALSE;
            if (obj2 == Boolean.FALSE) {
                boolean z3 = obj == unicode.string$Mnci$Eq$Qu;
                Object obj3 = z3 ? string$Mnci$Mnhash : z3 ? Boolean.TRUE : Boolean.FALSE;
                return obj3 != Boolean.FALSE ? (Procedure) obj3 : hash;
            }
        }
        return (Procedure) obj2;
    }

    public static hashtable.HashTable makeHashTable(Procedure comparison, Procedure hash2, int size) {
        return new hashtable.HashTable(comparison, hash2, size);
    }

    @Override // gnu.expr.ModuleBody
    public Object apply0(ModuleMethod moduleMethod) {
        return moduleMethod.selector == 11 ? makeHashTable() : super.apply0(moduleMethod);
    }

    @Override // gnu.expr.ModuleBody
    public int match0(ModuleMethod moduleMethod, CallContext callContext) {
        if (moduleMethod.selector != 11) {
            return super.match0(moduleMethod, callContext);
        }
        callContext.proc = moduleMethod;
        callContext.pc = 0;
        return 0;
    }

    @Override // gnu.expr.ModuleBody
    public int match3(ModuleMethod moduleMethod, Object obj, Object obj2, Object obj3, CallContext callContext) {
        switch (moduleMethod.selector) {
            case 11:
                if (!(obj instanceof Procedure)) {
                    return -786431;
                }
                callContext.value1 = obj;
                if (!(obj2 instanceof Procedure)) {
                    return -786430;
                }
                callContext.value2 = obj2;
                callContext.value3 = obj3;
                callContext.proc = moduleMethod;
                callContext.pc = 3;
                return 0;
            case 15:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.value3 = obj3;
                callContext.proc = moduleMethod;
                callContext.pc = 3;
                return 0;
            case 17:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.value3 = obj3;
                callContext.proc = moduleMethod;
                callContext.pc = 3;
                return 0;
            case 18:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.value3 = obj3;
                callContext.proc = moduleMethod;
                callContext.pc = 3;
                return 0;
            case 22:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                if (!(obj2 instanceof Procedure)) {
                    return -786430;
                }
                callContext.value2 = obj2;
                callContext.value3 = obj3;
                callContext.proc = moduleMethod;
                callContext.pc = 3;
                return 0;
            case 24:
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.value3 = obj3;
                callContext.proc = moduleMethod;
                callContext.pc = 3;
                return 0;
            case 31:
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.value3 = obj3;
                callContext.proc = moduleMethod;
                callContext.pc = 3;
                return 0;
            case 33:
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.value3 = obj3;
                callContext.proc = moduleMethod;
                callContext.pc = 3;
                return 0;
            default:
                return super.match3(moduleMethod, obj, obj2, obj3, callContext);
        }
    }

    public static Object hashTableRef(hashtable.HashTable hash$Mntable, Object key, Object obj) {
        HashNode node = hash$Mntable.getNode(key);
        return node == null ? obj != Boolean.FALSE ? Scheme.applyToArgs.apply1(obj) : misc.error$V("hash-table-ref: no value associated with", new Object[]{key}) : node.getValue();
    }

    public static void hashTableUpdate$Ex(hashtable.HashTable hash$Mntable, Object key, Object function, Object thunk) {
        hashtable.hashtableCheckMutable(hash$Mntable);
        HashNode node = hash$Mntable.getNode(key);
        if (node == null) {
            if (thunk != Boolean.FALSE) {
                hashtables.hashtableSet$Ex(hash$Mntable, key, Scheme.applyToArgs.apply2(function, Scheme.applyToArgs.apply1(thunk)));
                return;
            } else {
                misc.error$V("hash-table-update!: no value exists for key", new Object[]{key});
                return;
            }
        }
        node.setValue(Scheme.applyToArgs.apply2(function, node.getValue()));
    }

    @Override // gnu.expr.ModuleBody
    public int match4(ModuleMethod moduleMethod, Object obj, Object obj2, Object obj3, Object obj4, CallContext callContext) {
        switch (moduleMethod.selector) {
            case 18:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.value3 = obj3;
                callContext.value4 = obj4;
                callContext.proc = moduleMethod;
                callContext.pc = 4;
                return 0;
            case 20:
                if (!(obj instanceof hashtable.HashTable)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.value3 = obj3;
                callContext.value4 = obj4;
                callContext.proc = moduleMethod;
                callContext.pc = 4;
                return 0;
            case 24:
                callContext.value1 = obj;
                callContext.value2 = obj2;
                callContext.value3 = obj3;
                callContext.value4 = obj4;
                callContext.proc = moduleMethod;
                callContext.pc = 4;
                return 0;
            default:
                return super.match4(moduleMethod, obj, obj2, obj3, obj4, callContext);
        }
    }

    public static void hashTableUpdate$Ex$SlDefault(hashtable.HashTable hash$Mntable, Object key, Object function, Object obj) {
        hashtable.hashtableCheckMutable(hash$Mntable);
        HashNode node = hash$Mntable.getNode(key);
        if (node == null) {
            hashtables.hashtableSet$Ex(hash$Mntable, key, Scheme.applyToArgs.apply2(function, obj));
        } else {
            node.setValue(Scheme.applyToArgs.apply2(function, node.getValue()));
        }
    }

    public static void hashTableWalk(hashtable.HashTable hash$Mntable, Procedure proc) {
        hash$Mntable.walk(proc);
    }

    public static Object hashTableFold(hashtable.HashTable hash$Mntable, Procedure proc, Object acc) {
        return hash$Mntable.fold(proc, acc);
    }

    public static hashtable.HashTable alist$To$HashTable(Object alist, Object comparison, Object hash2, Object size) {
        try {
            try {
                try {
                    hashtable.HashTable hash$Mntable = makeHashTable((Procedure) comparison, (Procedure) hash2, ((Number) size).intValue());
                    Object arg0 = alist;
                    while (arg0 != LList.Empty) {
                        try {
                            Pair arg02 = (Pair) arg0;
                            Object elem = arg02.getCar();
                            hashTableUpdate$Ex$SlDefault(hash$Mntable, lists.car.apply1(elem), lambda$Fn1, lists.cdr.apply1(elem));
                            arg0 = arg02.getCdr();
                        } catch (ClassCastException e) {
                            throw new WrongType(e, "arg0", -2, arg0);
                        }
                    }
                    return hash$Mntable;
                } catch (ClassCastException e2) {
                    throw new WrongType(e2, "make-hash-table", 2, size);
                }
            } catch (ClassCastException e3) {
                throw new WrongType(e3, "make-hash-table", 1, hash2);
            }
        } catch (ClassCastException e4) {
            throw new WrongType(e4, "make-hash-table", 0, comparison);
        }
    }

    @Override // gnu.expr.ModuleBody
    public Object apply4(ModuleMethod moduleMethod, Object obj, Object obj2, Object obj3, Object obj4) {
        switch (moduleMethod.selector) {
            case 18:
                try {
                    hashTableUpdate$Ex((hashtable.HashTable) obj, obj2, obj3, obj4);
                    return Values.empty;
                } catch (ClassCastException e) {
                    throw new WrongType(e, "hash-table-update!", 1, obj);
                }
            case 20:
                try {
                    hashTableUpdate$Ex$SlDefault((hashtable.HashTable) obj, obj2, obj3, obj4);
                    return Values.empty;
                } catch (ClassCastException e2) {
                    throw new WrongType(e2, "hash-table-update!/default", 1, obj);
                }
            case 24:
                return alist$To$HashTable(obj, obj2, obj3, obj4);
            default:
                return super.apply4(moduleMethod, obj, obj2, obj3, obj4);
        }
    }

    public static hashtable.HashTable alist$To$HashTable(Object obj, Object obj2, Object obj3) {
        Object[] objArr = new Object[2];
        objArr[0] = Lit0;
        try {
            objArr[1] = Integer.valueOf(lists.length((LList) obj) * 2);
            return alist$To$HashTable(obj, obj2, obj3, numbers.max(objArr));
        } catch (ClassCastException e) {
            throw new WrongType(e, PropertyTypeConstants.PROPERTY_TYPE_LENGTH, 1, obj);
        }
    }

    static Object lambda1(Object x) {
        return x;
    }

    public static hashtable.HashTable hashTableCopy(hashtable.HashTable hash$Mntable) {
        return new hashtable.HashTable(hash$Mntable, true);
    }

    @Override // gnu.expr.ModuleBody
    public Object apply2(ModuleMethod moduleMethod, Object obj, Object obj2) {
        switch (moduleMethod.selector) {
            case 1:
                try {
                    try {
                        return stringHash((CharSequence) obj, LangObjType.coerceIntNum(obj2));
                    } catch (ClassCastException e) {
                        throw new WrongType(e, "string-hash", 2, obj2);
                    }
                } catch (ClassCastException e2) {
                    throw new WrongType(e2, "string-hash", 1, obj);
                }
            case 3:
                try {
                    return stringCiHash(obj, LangObjType.coerceIntNum(obj2));
                } catch (ClassCastException e3) {
                    throw new WrongType(e3, "string-ci-hash", 2, obj2);
                }
            case 5:
                try {
                    return hash(obj, LangObjType.coerceIntNum(obj2));
                } catch (ClassCastException e4) {
                    throw new WrongType(e4, "hash", 2, obj2);
                }
            case 7:
                try {
                    return hashByIdentity(obj, LangObjType.coerceIntNum(obj2));
                } catch (ClassCastException e5) {
                    throw new WrongType(e5, "hash-by-identity", 2, obj2);
                }
            case 11:
                try {
                    try {
                        return makeHashTable((Procedure) obj, (Procedure) obj2);
                    } catch (ClassCastException e6) {
                        throw new WrongType(e6, "make-hash-table", 2, obj2);
                    }
                } catch (ClassCastException e7) {
                    throw new WrongType(e7, "make-hash-table", 1, obj);
                }
            case 15:
                try {
                    return hashTableRef((hashtable.HashTable) obj, obj2);
                } catch (ClassCastException e8) {
                    throw new WrongType(e8, "hash-table-ref", 1, obj);
                }
            case 21:
                try {
                    try {
                        hashTableWalk((hashtable.HashTable) obj, (Procedure) obj2);
                        return Values.empty;
                    } catch (ClassCastException e9) {
                        throw new WrongType(e9, "hash-table-walk", 2, obj2);
                    }
                } catch (ClassCastException e10) {
                    throw new WrongType(e10, "hash-table-walk", 1, obj);
                }
            case 24:
                return alist$To$HashTable(obj, obj2);
            case 30:
                try {
                    try {
                        ((hashtable.HashTable) obj).putAll((hashtable.HashTable) obj2);
                        return Values.empty;
                    } catch (ClassCastException e11) {
                        throw new WrongType(e11, "hash-table-merge!", 2, obj2);
                    }
                } catch (ClassCastException e12) {
                    throw new WrongType(e12, "hash-table-merge!", 1, obj);
                }
            default:
                return super.apply2(moduleMethod, obj, obj2);
        }
    }

    public static Object hashTableKeys(hashtable.HashTable hash$Mntable) {
        return hashTableFold(hash$Mntable, lambda$Fn2, LList.Empty);
    }

    static Pair lambda2(Object key, Object val, Object acc) {
        return lists.cons(key, acc);
    }

    public static Object hashTableValues(hashtable.HashTable hash$Mntable) {
        return hashTableFold(hash$Mntable, lambda$Fn3, LList.Empty);
    }

    @Override // gnu.expr.ModuleBody
    public Object apply1(ModuleMethod moduleMethod, Object obj) {
        switch (moduleMethod.selector) {
            case 1:
                try {
                    return stringHash((CharSequence) obj);
                } catch (ClassCastException e) {
                    throw new WrongType(e, "string-hash", 1, obj);
                }
            case 3:
                return stringCiHash(obj);
            case 5:
                return hash(obj);
            case 7:
                return hashByIdentity(obj);
            case 9:
                try {
                    return hashTableEquivalenceFunction((hashtable.HashTable) obj);
                } catch (ClassCastException e2) {
                    throw new WrongType(e2, "hash-table-equivalence-function", 1, obj);
                }
            case 10:
                try {
                    return hashTableHashFunction((hashtable.HashTable) obj);
                } catch (ClassCastException e3) {
                    throw new WrongType(e3, "hash-table-hash-function", 1, obj);
                }
            case 11:
                try {
                    return makeHashTable((Procedure) obj);
                } catch (ClassCastException e4) {
                    throw new WrongType(e4, "make-hash-table", 1, obj);
                }
            case 23:
                return lambda1(obj);
            case 24:
                return alist$To$HashTable(obj);
            case 28:
                try {
                    return ((hashtable.HashTable) obj).toAlist();
                } catch (ClassCastException e5) {
                    throw new WrongType(e5, "hash-table->alist", 1, obj);
                }
            case 29:
                try {
                    return hashTableCopy((hashtable.HashTable) obj);
                } catch (ClassCastException e6) {
                    throw new WrongType(e6, "hash-table-copy", 1, obj);
                }
            case 32:
                try {
                    return hashTableKeys((hashtable.HashTable) obj);
                } catch (ClassCastException e7) {
                    throw new WrongType(e7, "hash-table-keys", 1, obj);
                }
            case 34:
                try {
                    return hashTableValues((hashtable.HashTable) obj);
                } catch (ClassCastException e8) {
                    throw new WrongType(e8, "hash-table-values", 1, obj);
                }
            default:
                return super.apply1(moduleMethod, obj);
        }
    }

    static Pair lambda3(Object key, Object val, Object acc) {
        return lists.cons(val, acc);
    }

    @Override // gnu.expr.ModuleBody
    public Object apply3(ModuleMethod moduleMethod, Object obj, Object obj2, Object obj3) {
        switch (moduleMethod.selector) {
            case 11:
                try {
                    try {
                        try {
                            return makeHashTable((Procedure) obj, (Procedure) obj2, ((Number) obj3).intValue());
                        } catch (ClassCastException e) {
                            throw new WrongType(e, "make-hash-table", 3, obj3);
                        }
                    } catch (ClassCastException e2) {
                        throw new WrongType(e2, "make-hash-table", 2, obj2);
                    }
                } catch (ClassCastException e3) {
                    throw new WrongType(e3, "make-hash-table", 1, obj);
                }
            case 15:
                try {
                    return hashTableRef((hashtable.HashTable) obj, obj2, obj3);
                } catch (ClassCastException e4) {
                    throw new WrongType(e4, "hash-table-ref", 1, obj);
                }
            case 17:
                try {
                    return ((hashtable.HashTable) obj).get(obj2, obj3);
                } catch (ClassCastException e5) {
                    throw new WrongType(e5, "hash-table-ref/default", 1, obj);
                }
            case 18:
                try {
                    hashTableUpdate$Ex((hashtable.HashTable) obj, obj2, obj3);
                    return Values.empty;
                } catch (ClassCastException e6) {
                    throw new WrongType(e6, "hash-table-update!", 1, obj);
                }
            case 22:
                try {
                    try {
                        return hashTableFold((hashtable.HashTable) obj, (Procedure) obj2, obj3);
                    } catch (ClassCastException e7) {
                        throw new WrongType(e7, "hash-table-fold", 2, obj2);
                    }
                } catch (ClassCastException e8) {
                    throw new WrongType(e8, "hash-table-fold", 1, obj);
                }
            case 24:
                return alist$To$HashTable(obj, obj2, obj3);
            case 31:
                return lambda2(obj, obj2, obj3);
            case 33:
                return lambda3(obj, obj2, obj3);
            default:
                return super.apply3(moduleMethod, obj, obj2, obj3);
        }
    }
}
