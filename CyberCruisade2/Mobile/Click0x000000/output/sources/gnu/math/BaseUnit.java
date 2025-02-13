package gnu.math;

import androidx.appcompat.widget.ActivityChooserView;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.io.ObjectStreamException;

/* loaded from: classes.dex */
public class BaseUnit extends NamedUnit implements Externalizable {
    static int base_count = 0;
    private static final String unitName = "(name)";
    String dimension;
    int index;

    public String getDimension() {
        return this.dimension;
    }

    public BaseUnit() {
        this.name = unitName;
        this.index = ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED;
        this.dims = Dimensions.Empty;
    }

    @Override // gnu.math.NamedUnit
    protected void init() {
        this.base = this;
        this.scale = 1.0d;
        this.dims = new Dimensions(this);
        super.init();
        int i = base_count;
        base_count = i + 1;
        this.index = i;
    }

    public BaseUnit(String name) {
        this.name = name;
        init();
    }

    public BaseUnit(String name, String dimension) {
        this.name = name;
        this.dimension = dimension;
        init();
    }

    @Override // gnu.math.Unit
    public int hashCode() {
        return this.name.hashCode();
    }

    @Override // gnu.math.Unit, gnu.math.Quantity
    public Unit unit() {
        return this;
    }

    public static BaseUnit lookup(String name, String dimension) {
        String name2 = name.intern();
        if (name2 == unitName && dimension == null) {
            return Unit.Empty;
        }
        int hash = name2.hashCode();
        int index = (Integer.MAX_VALUE & hash) % table.length;
        for (NamedUnit unit = table[index]; unit != null; unit = unit.chain) {
            if (unit.name == name2 && (unit instanceof BaseUnit)) {
                BaseUnit bunit = (BaseUnit) unit;
                if (bunit.dimension == dimension) {
                    return bunit;
                }
            }
        }
        return null;
    }

    public static BaseUnit make(String name, String dimension) {
        BaseUnit old = lookup(name, dimension);
        return old == null ? new BaseUnit(name, dimension) : old;
    }

    public static int compare(BaseUnit unit1, BaseUnit unit2) {
        int code = unit1.name.compareTo(unit2.name);
        if (code != 0) {
            return code;
        }
        String dim1 = unit1.dimension;
        String dim2 = unit2.dimension;
        if (dim1 == dim2) {
            return 0;
        }
        if (dim1 == null) {
            return -1;
        }
        if (dim2 == null) {
            return 1;
        }
        return dim1.compareTo(dim2);
    }

    @Override // gnu.math.NamedUnit, java.io.Externalizable
    public void writeExternal(ObjectOutput out) throws IOException {
        out.writeUTF(this.name);
        out.writeObject(this.dimension);
    }

    @Override // gnu.math.NamedUnit, java.io.Externalizable
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        this.name = in.readUTF();
        this.dimension = (String) in.readObject();
    }

    @Override // gnu.math.NamedUnit
    public Object readResolve() throws ObjectStreamException {
        BaseUnit unit = lookup(this.name, this.dimension);
        if (unit != null) {
            return unit;
        }
        init();
        return this;
    }
}
