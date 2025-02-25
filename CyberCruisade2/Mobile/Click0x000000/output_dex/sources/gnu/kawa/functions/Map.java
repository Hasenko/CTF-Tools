package gnu.kawa.functions;

import gnu.expr.Declaration;
import gnu.lists.LList;
import gnu.lists.Pair;
import gnu.mapping.Procedure;
import gnu.mapping.ProcedureN;
import gnu.mapping.Values;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class Map extends ProcedureN {
    final Declaration applyFieldDecl;
    final ApplyToArgs applyToArgs;
    boolean collect;
    final IsEq isEq;

    public Map(boolean collect, ApplyToArgs applyToArgs, Declaration applyFieldDecl, IsEq isEq) {
        super(collect ? "map" : "for-each");
        this.collect = collect;
        this.applyToArgs = applyToArgs;
        this.applyFieldDecl = applyFieldDecl;
        this.isEq = isEq;
        setProperty(Procedure.validateApplyKey, "gnu.kawa.functions.CompileMisc:validateApplyMap");
    }

    public static Object map1(Procedure proc, Object list) throws Throwable {
        Object result = LList.Empty;
        Pair last = null;
        while (list != LList.Empty) {
            Pair pair = (Pair) list;
            Pair new_pair = new Pair(proc.apply1(pair.getCar()), LList.Empty);
            if (last == null) {
                result = new_pair;
            } else {
                last.setCdr(new_pair);
            }
            last = new_pair;
            list = pair.getCdr();
        }
        return result;
    }

    public static void forEach1(Procedure proc, Object list) throws Throwable {
        while (list != LList.Empty) {
            Pair pair = (Pair) list;
            proc.apply1(pair.getCar());
            list = pair.getCdr();
        }
    }

    @Override // gnu.mapping.ProcedureN, gnu.mapping.Procedure
    public Object apply2(Object arg1, Object arg2) throws Throwable {
        if (!(arg1 instanceof Procedure)) {
            return applyN(new Object[]{arg1, arg2});
        }
        Procedure proc = (Procedure) arg1;
        if (this.collect) {
            return map1(proc, arg2);
        }
        forEach1(proc, arg2);
        return Values.empty;
    }

    @Override // gnu.mapping.ProcedureN, gnu.mapping.Procedure
    public Object applyN(Object[] args) throws Throwable {
        Object result;
        int need_apply;
        Object[] each_args;
        Procedure proc;
        int arity = args.length - 1;
        if (arity == 1 && (args[0] instanceof Procedure)) {
            Procedure proc2 = (Procedure) args[0];
            if (this.collect) {
                return map1(proc2, args[1]);
            }
            forEach1(proc2, args[1]);
            return Values.empty;
        }
        Pair last = null;
        if (this.collect) {
            result = LList.Empty;
        } else {
            result = Values.empty;
        }
        Object[] rest = new Object[arity];
        System.arraycopy(args, 1, rest, 0, arity);
        if (args[0] instanceof Procedure) {
            need_apply = 0;
            each_args = new Object[arity];
            proc = (Procedure) args[0];
        } else {
            need_apply = 1;
            each_args = new Object[arity + 1];
            each_args[0] = args[0];
            proc = this.applyToArgs;
        }
        while (true) {
            for (int i = 0; i < arity; i++) {
                Object list = rest[i];
                if (list == LList.Empty) {
                    return result;
                }
                Pair pair = (Pair) list;
                each_args[need_apply + i] = pair.getCar();
                rest[i] = pair.getCdr();
            }
            Object value = proc.applyN(each_args);
            if (this.collect) {
                Pair new_pair = new Pair(value, LList.Empty);
                if (last == null) {
                    result = new_pair;
                } else {
                    last.setCdr(new_pair);
                }
                last = new_pair;
            }
        }
    }
}
