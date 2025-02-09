package gnu.expr;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public abstract class ModuleSet {
    public static final String MODULES_MAP = "$ModulesMap$";
    ModuleSet next;

    public abstract void register(ModuleManager moduleManager);
}
