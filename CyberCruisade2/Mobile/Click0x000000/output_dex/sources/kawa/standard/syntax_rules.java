package kawa.standard;

import gnu.expr.Expression;
import gnu.expr.QuoteExp;
import gnu.lists.Pair;
import kawa.lang.Syntax;
import kawa.lang.SyntaxPattern;
import kawa.lang.SyntaxRules;
import kawa.lang.Translator;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class syntax_rules extends Syntax {
    public static final syntax_rules syntax_rules;

    static {
        syntax_rules syntax_rulesVar = new syntax_rules();
        syntax_rules = syntax_rulesVar;
        syntax_rulesVar.setName("syntax-rules");
    }

    @Override // kawa.lang.Syntax
    public Expression rewriteForm(Pair form, Translator tr) {
        Pair pair = (Pair) form.getCdr();
        Object[] literal_identifiers = SyntaxPattern.getLiteralsList(pair.getCar(), null, tr);
        SyntaxRules rules = new SyntaxRules(literal_identifiers, pair.getCdr(), tr);
        return new QuoteExp(rules);
    }
}
