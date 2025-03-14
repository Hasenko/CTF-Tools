package kawa.standard;

import gnu.expr.Compilation;
import gnu.expr.Expression;
import gnu.lists.LList;
import gnu.lists.Pair;
import kawa.lang.Syntax;
import kawa.lang.Translator;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class syntax_error extends Syntax {
    public static final syntax_error syntax_error;

    static {
        syntax_error syntax_errorVar = new syntax_error();
        syntax_error = syntax_errorVar;
        syntax_errorVar.setName("%syntax-error");
    }

    @Override // kawa.lang.Syntax
    public Expression rewrite(Object obj, Translator tr) {
        StringBuffer buffer = new StringBuffer();
        int words = 0;
        while (obj instanceof Pair) {
            Pair pair = (Pair) obj;
            if (words > 0) {
                buffer.append(' ');
            }
            buffer.append(pair.getCar());
            obj = pair.getCdr();
            words++;
        }
        if (obj != LList.Empty) {
            if (words > 0) {
                buffer.append(' ');
            }
            buffer.append(obj);
        }
        return tr.syntaxError(buffer.toString());
    }

    public static Expression error(Object form, Object[] message) {
        StringBuffer buffer = new StringBuffer();
        int len = message.length;
        if (message == null || len == 0) {
            buffer.append("invalid syntax");
        } else {
            for (Object obj : message) {
                buffer.append(obj);
            }
        }
        Translator tr = (Translator) Compilation.getCurrent();
        if (tr == null) {
            throw new RuntimeException(buffer.toString());
        }
        Object savePos = tr.pushPositionOf(form);
        try {
            return tr.syntaxError(buffer.toString());
        } finally {
            tr.popPositionOf(savePos);
        }
    }
}
