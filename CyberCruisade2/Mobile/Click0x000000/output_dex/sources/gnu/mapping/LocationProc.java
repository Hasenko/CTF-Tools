package gnu.mapping;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class LocationProc extends Procedure0or1 implements HasSetter {
    Location loc;

    public LocationProc(Location loc) {
        this.loc = loc;
    }

    public static LocationProc makeNamed(Symbol name, Location loc) {
        LocationProc lproc = new LocationProc(loc);
        lproc.setSymbol(name);
        return lproc;
    }

    public LocationProc(Location loc, Procedure converter) {
        this.loc = loc;
        if (converter != null) {
            pushConverter(converter);
        }
    }

    public void pushConverter(Procedure converter) {
        this.loc = ConstrainedLocation.make(this.loc, converter);
    }

    @Override // gnu.mapping.Procedure0or1, gnu.mapping.Procedure
    public Object apply0() throws Throwable {
        return this.loc.get();
    }

    @Override // gnu.mapping.Procedure0or1, gnu.mapping.Procedure
    public Object apply1(Object value) throws Throwable {
        set0(value);
        return Values.empty;
    }

    @Override // gnu.mapping.Procedure
    public void set0(Object value) throws Throwable {
        this.loc.set(value);
    }

    @Override // gnu.mapping.Procedure, gnu.mapping.HasSetter
    public Procedure getSetter() {
        return new Setter0(this);
    }

    public final Location getLocation() {
        return this.loc;
    }

    @Override // gnu.mapping.Procedure
    public String toString() {
        Object n = getSymbol();
        if (n != null) {
            return super.toString();
        }
        return "#<location-proc " + this.loc + ">";
    }
}
