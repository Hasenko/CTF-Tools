package gnu.mapping;

import java.lang.ref.WeakReference;

/* compiled from: Namespace.java */
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class SymbolRef extends WeakReference {
    SymbolRef next;

    SymbolRef(Symbol sym, Namespace ns) {
        super(sym);
    }

    Symbol getSymbol() {
        return (Symbol) get();
    }

    public String toString() {
        return "SymbolRef[" + getSymbol() + "]";
    }
}
