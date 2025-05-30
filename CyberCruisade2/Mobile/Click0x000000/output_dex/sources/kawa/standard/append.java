package kawa.standard;

import gnu.lists.LList;
import gnu.lists.Pair;
import gnu.mapping.ProcedureN;
import gnu.mapping.WrongType;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class append extends ProcedureN {
    public static final append append;

    static {
        append appendVar = new append();
        append = appendVar;
        appendVar.setName("append");
    }

    @Override // gnu.mapping.ProcedureN, gnu.mapping.Procedure
    public Object applyN(Object[] args) {
        return append$V(args);
    }

    public static Object append$V(Object[] args) {
        int count = args.length;
        if (count == 0) {
            return LList.Empty;
        }
        Object result = args[count - 1];
        int i = count - 1;
        while (true) {
            i--;
            if (i >= 0) {
                Object list = args[i];
                Object copy = null;
                Pair last = null;
                while (list instanceof Pair) {
                    Pair list_pair = (Pair) list;
                    Pair new_pair = new Pair(list_pair.getCar(), null);
                    if (last == null) {
                        copy = new_pair;
                    } else {
                        last.setCdr(new_pair);
                    }
                    last = new_pair;
                    list = list_pair.getCdr();
                }
                if (list != LList.Empty) {
                    throw new WrongType(append, i + 1, args[i], "list");
                }
                if (last != null) {
                    last.setCdr(result);
                    result = copy;
                }
            } else {
                return result;
            }
        }
    }
}
