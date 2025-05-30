package kawa.standard;

import gnu.bytecode.ClassType;
import gnu.expr.ApplyExp;
import gnu.expr.Declaration;
import gnu.expr.Expression;
import gnu.expr.ReferenceExp;
import gnu.kawa.functions.ApplyToArgs;
import gnu.kawa.reflect.Invoke;
import gnu.lists.LList;
import gnu.lists.Pair;
import gnu.mapping.Location;
import gnu.mapping.LocationProc;
import gnu.mapping.ProcLocation;
import gnu.mapping.Procedure;
import kawa.lang.Syntax;
import kawa.lang.Translator;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class location extends Syntax {
    public static final location location;
    private static ClassType thisType;

    static {
        location locationVar = new location();
        location = locationVar;
        locationVar.setName("location");
        thisType = ClassType.make("kawa.standard.location");
    }

    @Override // kawa.lang.Syntax
    public Expression rewrite(Object obj, Translator tr) {
        if (!(obj instanceof Pair)) {
            return tr.syntaxError("missing argument to location");
        }
        Pair pair = (Pair) obj;
        if (pair.getCdr() != LList.Empty) {
            return tr.syntaxError("extra arguments to location");
        }
        Expression[] args = {rewrite(tr.rewrite(pair.getCar()), tr)};
        return Invoke.makeInvokeStatic(thisType, "makeLocationProc", args);
    }

    public static Expression rewrite(Expression arg, Translator tr) {
        if (arg instanceof ReferenceExp) {
            ReferenceExp rexp = (ReferenceExp) arg;
            rexp.setDontDereference(true);
            Declaration decl = rexp.getBinding();
            if (decl != null) {
                decl.maybeIndirectBinding(tr);
                Declaration decl2 = Declaration.followAliases(decl);
                decl2.setCanRead(true);
                decl2.setCanWrite(true);
            }
            return rexp;
        }
        if (arg instanceof ApplyExp) {
            ApplyExp aexp = (ApplyExp) arg;
            Expression[] args = new Expression[aexp.getArgs().length + 1];
            args[0] = aexp.getFunction();
            System.arraycopy(aexp.getArgs(), 0, args, 1, args.length - 1);
            return Invoke.makeInvokeStatic(thisType, "makeProcLocation", args);
        }
        return tr.syntaxError("invalid argument to location");
    }

    public static Location makeProcLocation$V(Procedure proc, Object[] args) {
        int nargs = args.length;
        if ((proc instanceof ApplyToArgs) && nargs > 0 && (args[0] instanceof Procedure)) {
            Procedure proc2 = (Procedure) args[0];
            if ((proc2 instanceof LocationProc) && nargs == 1) {
                return ((LocationProc) proc2).getLocation();
            }
            Object[] rargs = new Object[nargs - 1];
            System.arraycopy(args, 1, rargs, 0, rargs.length);
            return new ProcLocation(proc2, rargs);
        }
        if ((proc instanceof LocationProc) && nargs == 0) {
            return ((LocationProc) proc).getLocation();
        }
        return new ProcLocation(proc, args);
    }

    public static Procedure makeLocationProc(Location loc) {
        return new LocationProc(loc);
    }
}
