package gnu.bytecode;

import java.io.DataOutputStream;
import java.io.IOException;

/* loaded from: classes.dex */
public class ConstantValueAttr extends Attribute {
    Object value;
    int value_index;

    public Object getValue(ConstantPool cpool) {
        Object obj = this.value;
        if (obj != null) {
            return obj;
        }
        CpoolEntry entry = cpool.getPoolEntry(this.value_index);
        switch (entry.getTag()) {
            case 3:
                this.value = new Integer(((CpoolValue1) entry).value);
                break;
            case 4:
                float f = Float.intBitsToFloat(((CpoolValue1) entry).value);
                this.value = new Float(f);
                break;
            case 5:
                this.value = new Long(((CpoolValue2) entry).value);
                break;
            case 6:
                double d = Double.longBitsToDouble(((CpoolValue2) entry).value);
                this.value = new Double(d);
                break;
            case 8:
                this.value = ((CpoolString) entry).getString().getString();
                break;
        }
        return this.value;
    }

    public ConstantValueAttr(Object value) {
        super("ConstantValue");
        this.value = value;
    }

    public ConstantValueAttr(int index) {
        super("ConstantValue");
        this.value_index = index;
    }

    @Override // gnu.bytecode.Attribute
    public void assignConstants(ClassType cl) {
        super.assignConstants(cl);
        if (this.value_index == 0) {
            ConstantPool cpool = cl.getConstants();
            CpoolEntry entry = null;
            Object obj = this.value;
            if (obj instanceof String) {
                entry = cpool.addString((String) obj);
            } else if (obj instanceof Integer) {
                entry = cpool.addInt(((Integer) obj).intValue());
            } else if (obj instanceof Long) {
                entry = cpool.addLong(((Long) obj).longValue());
            } else if (obj instanceof Float) {
                entry = cpool.addFloat(((Float) obj).floatValue());
            } else if (obj instanceof Long) {
                entry = cpool.addDouble(((Double) obj).doubleValue());
            }
            this.value_index = entry.getIndex();
        }
    }

    @Override // gnu.bytecode.Attribute
    public final int getLength() {
        return 2;
    }

    @Override // gnu.bytecode.Attribute
    public void write(DataOutputStream dstr) throws IOException {
        dstr.writeShort(this.value_index);
    }

    @Override // gnu.bytecode.Attribute
    public void print(ClassTypeWriter dst) {
        dst.print("Attribute \"");
        dst.print(getName());
        dst.print("\", length:");
        dst.print(getLength());
        dst.print(", value: ");
        int i = this.value_index;
        if (i == 0) {
            Object value = getValue(dst.ctype.constants);
            if (value instanceof String) {
                dst.printQuotedString((String) value);
            } else {
                dst.print(value);
            }
        } else {
            dst.printOptionalIndex(i);
            CpoolEntry entry = dst.ctype.constants.getPoolEntry(this.value_index);
            entry.print(dst, 1);
        }
        dst.println();
    }
}
