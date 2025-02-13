package kawa.lang;

import gnu.expr.Declaration;
import gnu.expr.LetExp;
import java.util.Vector;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class PatternScope extends LetExp {
    public Declaration matchArray;
    public StringBuffer patternNesting;
    public Vector pattern_names;
    PatternScope previousSyntax;

    public PatternScope() {
        super(null);
    }

    public static PatternScope push(Translator tr) {
        PatternScope newScope = new PatternScope();
        PatternScope oldScope = tr.patternScope;
        newScope.previousSyntax = oldScope;
        tr.patternScope = newScope;
        if (oldScope == null) {
            newScope.pattern_names = new Vector();
            newScope.patternNesting = new StringBuffer();
        } else {
            newScope.pattern_names = (Vector) oldScope.pattern_names.clone();
            newScope.patternNesting = new StringBuffer(oldScope.patternNesting.toString());
        }
        newScope.outer = tr.currentScope();
        return newScope;
    }

    public static void pop(Translator tr) {
        tr.patternScope = tr.patternScope.previousSyntax;
    }
}
