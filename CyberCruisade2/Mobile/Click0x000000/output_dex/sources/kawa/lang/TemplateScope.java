package kawa.lang;

import gnu.expr.Compilation;
import gnu.expr.Declaration;
import gnu.expr.LetExp;
import gnu.expr.ScopeExp;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class TemplateScope extends LetExp implements Externalizable {
    Declaration macroContext;
    private Syntax syntax;

    public TemplateScope() {
        super(null);
    }

    public TemplateScope(ScopeExp outer) {
        super(null);
        this.outer = outer;
    }

    public static TemplateScope make() {
        return make((Translator) Compilation.getCurrent());
    }

    public static TemplateScope make(Translator tr) {
        TemplateScope templateScope = new TemplateScope();
        Syntax curSyntax = tr.getCurrentSyntax();
        if (curSyntax instanceof Macro) {
            templateScope.outer = ((Macro) curSyntax).getCapturedScope();
            templateScope.macroContext = tr.macroContext;
        }
        templateScope.syntax = curSyntax;
        return templateScope;
    }

    @Override // gnu.expr.ScopeExp, gnu.expr.Expression, gnu.mapping.Procedure
    public String toString() {
        return super.toString() + "(for " + this.syntax + ")";
    }

    @Override // java.io.Externalizable
    public void writeExternal(ObjectOutput out) throws IOException {
        out.writeObject(this.outer);
    }

    @Override // java.io.Externalizable
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        this.outer = (ScopeExp) in.readObject();
    }
}
