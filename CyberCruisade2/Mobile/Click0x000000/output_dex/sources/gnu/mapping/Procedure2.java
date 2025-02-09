package gnu.mapping;

import androidx.fragment.app.FragmentTransaction;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public abstract class Procedure2 extends Procedure {
    @Override // gnu.mapping.Procedure
    public abstract Object apply2(Object obj, Object obj2) throws Throwable;

    public Procedure2(String n) {
        super(n);
    }

    public Procedure2() {
    }

    @Override // gnu.mapping.Procedure
    public int numArgs() {
        return FragmentTransaction.TRANSIT_FRAGMENT_CLOSE;
    }

    @Override // gnu.mapping.Procedure
    public Object apply0() throws Throwable {
        throw new WrongArguments(getName(), 2, "(?)");
    }

    @Override // gnu.mapping.Procedure
    public Object apply1(Object arg1) throws Throwable {
        throw new WrongArguments(this, 1);
    }

    @Override // gnu.mapping.Procedure
    public Object apply3(Object arg1, Object arg2, Object arg3) {
        throw new WrongArguments(this, 3);
    }

    @Override // gnu.mapping.Procedure
    public Object apply4(Object arg1, Object arg2, Object arg3, Object arg4) throws Throwable {
        throw new WrongArguments(this, 4);
    }

    @Override // gnu.mapping.Procedure
    public Object applyN(Object[] args) throws Throwable {
        if (args.length != 2) {
            throw new WrongArguments(this, args.length);
        }
        return apply2(args[0], args[1]);
    }
}
