package kawa.standard;

import gnu.expr.Special;
import kawa.lang.Lambda;
import kawa.repl;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class SchemeCompilation {
    public static final Lambda lambda;
    public static final repl repl;

    static {
        Lambda lambda2 = new Lambda();
        lambda = lambda2;
        repl = new repl(Scheme.instance);
        lambda2.setKeywords(Special.optional, Special.rest, Special.key);
    }
}
