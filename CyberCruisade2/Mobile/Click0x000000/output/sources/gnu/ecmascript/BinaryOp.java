package gnu.ecmascript;

import gnu.mapping.Procedure2;

/* loaded from: classes2.dex */
public class BinaryOp extends Procedure2 {
    int op;

    public BinaryOp(String name, int op) {
        setName(name);
        this.op = op;
    }

    @Override // gnu.mapping.Procedure2, gnu.mapping.Procedure
    public Object apply2(Object arg1, Object arg2) {
        if (this.op == 5) {
            return Convert.toNumber(arg1) < Convert.toNumber(arg2) ? Boolean.TRUE : Boolean.FALSE;
        }
        return new Double(apply(Convert.toNumber(arg1), Convert.toNumber(arg2)));
    }

    public double apply(double arg1, double arg2) {
        switch (this.op) {
            case 1:
                return arg1 + arg2;
            case 2:
                return arg1 - arg2;
            case 3:
                return arg1 * arg2;
            case 4:
                return ((int) arg1) << (((int) arg2) & 31);
            default:
                return Double.NaN;
        }
    }
}
