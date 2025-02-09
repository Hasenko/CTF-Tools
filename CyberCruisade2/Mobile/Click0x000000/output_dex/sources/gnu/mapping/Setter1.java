package gnu.mapping;

import androidx.fragment.app.FragmentTransaction;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class Setter1 extends Setter {
    public Setter1(Procedure getter) {
        super(getter);
    }

    @Override // gnu.mapping.Setter, gnu.mapping.Procedure
    public int numArgs() {
        return FragmentTransaction.TRANSIT_FRAGMENT_CLOSE;
    }

    @Override // gnu.mapping.ProcedureN, gnu.mapping.Procedure
    public Object apply2(Object arg, Object value) throws Throwable {
        this.getter.set1(arg, value);
        return Values.empty;
    }

    @Override // gnu.mapping.Setter, gnu.mapping.ProcedureN, gnu.mapping.Procedure
    public Object applyN(Object[] args) throws Throwable {
        int nargs = args.length;
        if (nargs != 2) {
            throw new WrongArguments(this, nargs);
        }
        this.getter.set1(args[0], args[1]);
        return Values.empty;
    }
}
