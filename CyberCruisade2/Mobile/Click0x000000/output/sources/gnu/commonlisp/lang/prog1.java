package gnu.commonlisp.lang;

import gnu.expr.BeginExp;
import gnu.expr.Declaration;
import gnu.expr.Expression;
import gnu.expr.LetExp;
import gnu.expr.ReferenceExp;
import gnu.lists.LList;
import gnu.lists.Pair;
import kawa.lang.Syntax;
import kawa.lang.Translator;

/* loaded from: classes2.dex */
public class prog1 extends Syntax {
    public static final prog1 prog1 = new prog1("prog1", 1);
    public static final prog1 prog2 = new prog1("prog2", 2);
    int index;

    public prog1(String name, int index) {
        this.index = index;
        setName(name);
    }

    @Override // kawa.lang.Syntax
    public Expression rewrite(Object obj, Translator tr) {
        int nexps = LList.length(obj);
        int i = this.index;
        if (nexps < i) {
            return tr.syntaxError("too few expressions in " + getName());
        }
        if (i == 2) {
            Pair pair = (Pair) obj;
            return new BeginExp(tr.rewrite(pair.getCar()), prog1.rewrite(pair.getCdr(), tr));
        }
        Expression[] inits = {tr.rewrite(pair.getCar())};
        LetExp let = new LetExp(inits);
        Expression[] body = new Expression[nexps];
        Pair pair2 = (Pair) obj;
        Object obj2 = pair2.getCdr();
        for (int i2 = 0; i2 < nexps - 1; i2++) {
            Pair pair3 = (Pair) obj2;
            body[i2] = tr.rewrite(pair3.getCar());
            obj2 = pair3.getCdr();
        }
        Declaration decl = let.addDeclaration((Object) null);
        body[nexps - 1] = new ReferenceExp(decl);
        let.body = BeginExp.canonicalize(body);
        tr.mustCompileHere();
        return let;
    }
}
