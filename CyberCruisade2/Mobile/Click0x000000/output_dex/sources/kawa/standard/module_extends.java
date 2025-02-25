package kawa.standard;

import gnu.bytecode.ClassType;
import gnu.bytecode.Type;
import gnu.expr.ModuleExp;
import gnu.expr.ScopeExp;
import gnu.lists.Pair;
import kawa.lang.Syntax;
import kawa.lang.Translator;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class module_extends extends Syntax {
    public static final module_extends module_extends;

    static {
        module_extends module_extendsVar = new module_extends();
        module_extends = module_extendsVar;
        module_extendsVar.setName("module-extends");
    }

    @Override // kawa.lang.Syntax
    public void scanForm(Pair form, ScopeExp defs, Translator tr) {
        Type base = tr.exp2Type((Pair) form.getCdr());
        ModuleExp module = tr.getModule();
        module.setSuperType((ClassType) base);
        module.setFlag(131072);
    }
}
