package gnu.kawa.xml;

import gnu.lists.AbstractSequence;
import gnu.lists.Consumer;
import gnu.mapping.CallContext;
import gnu.mapping.MethodProc;
import gnu.mapping.Values;
import java.util.List;

/* loaded from: classes2.dex */
public class ListItems extends MethodProc {
    public static ListItems listItems = new ListItems();

    @Override // gnu.mapping.Procedure
    public void apply(CallContext ctx) {
        Consumer out = ctx.consumer;
        Object arg = ctx.getNextArg();
        ctx.lastArg();
        List list = (List) arg;
        if (arg instanceof AbstractSequence) {
            ((AbstractSequence) arg).consumePosRange(0, -1, out);
            return;
        }
        for (Object val : list) {
            Values.writeValues(val, out);
        }
    }
}
