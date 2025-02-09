package gnu.lists;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ImmutablePair extends Pair {
    public ImmutablePair(Object carval, Object cdrval) {
        this.car = carval;
        this.cdr = cdrval;
    }

    public ImmutablePair() {
    }

    @Override // gnu.lists.Pair
    public void setCar(Object car) {
        throw new UnsupportedOperationException("cannot modify read-only pair");
    }

    @Override // gnu.lists.Pair
    public void setCdr(Object cdr) {
        throw new UnsupportedOperationException("cannot modify read-only pair");
    }
}
