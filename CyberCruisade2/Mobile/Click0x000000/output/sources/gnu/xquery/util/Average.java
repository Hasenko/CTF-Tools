package gnu.xquery.util;

import gnu.lists.Sequence;
import gnu.lists.TreeList;
import gnu.mapping.Procedure1;
import gnu.mapping.Values;
import gnu.math.IntNum;

/* loaded from: classes2.dex */
public class Average extends Procedure1 {
    public static final Average avg = new Average("avg");

    public Average(String name) {
        super(name);
    }

    @Override // gnu.mapping.Procedure1, gnu.mapping.Procedure
    public Object apply1(Object arg) throws Throwable {
        Object sum = Values.empty;
        int count = 0;
        if (arg instanceof Values) {
            TreeList tlist = (TreeList) arg;
            int index = 0;
            while (true) {
                Object next = tlist.getPosNext(index);
                if (next == Sequence.eofValue) {
                    break;
                }
                count++;
                sum = sum == Values.empty ? next : ArithOp.add.apply2(sum, next);
                index = tlist.nextPos(index);
            }
        } else {
            count = 1;
            sum = arg;
        }
        if (sum == Values.empty) {
            return sum;
        }
        return ArithOp.div.apply2(sum, IntNum.make(count));
    }
}
