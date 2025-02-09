package gnu.mapping;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public interface EnvironmentKey {
    public static final Object FUNCTION = Symbol.FUNCTION;

    Object getKeyProperty();

    Symbol getKeySymbol();

    boolean matches(EnvironmentKey environmentKey);

    boolean matches(Symbol symbol, Object obj);
}
