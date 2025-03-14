package kawa.standard;

import gnu.expr.Expression;
import gnu.expr.ScopeExp;
import gnu.lists.LList;
import gnu.lists.Pair;
import kawa.lang.Syntax;
import kawa.lang.Translator;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class begin extends Syntax {
    public static final begin begin;

    static {
        begin beginVar = new begin();
        begin = beginVar;
        beginVar.setName("begin");
    }

    @Override // kawa.lang.Syntax
    public Expression rewrite(Object obj, Translator tr) {
        return tr.rewrite_body(obj);
    }

    @Override // kawa.lang.Syntax
    public void scanForm(Pair st, ScopeExp defs, Translator tr) {
        Object body = tr.scanBody(st.getCdr(), defs, true);
        if (body != LList.Empty) {
            tr.formStack.add(Translator.makePair(st, st.getCar(), body));
        }
    }
}
