package gnu.bytecode;

import java.io.DataOutputStream;
import java.io.IOException;

/* loaded from: classes.dex */
public class Field extends Location implements AttrContainer, Member {
    Attribute attributes;
    int flags;
    Field next;
    ClassType owner;
    java.lang.reflect.Field rfield;
    String sourceName;

    @Override // gnu.bytecode.AttrContainer
    public final Attribute getAttributes() {
        return this.attributes;
    }

    @Override // gnu.bytecode.AttrContainer
    public final void setAttributes(Attribute attributes) {
        this.attributes = attributes;
    }

    public Field(ClassType ctype) {
        if (ctype.last_field == null) {
            ctype.fields = this;
        } else {
            ctype.last_field.next = this;
        }
        ctype.last_field = this;
        ctype.fields_count++;
        this.owner = ctype;
    }

    @Override // gnu.bytecode.Member
    public final ClassType getDeclaringClass() {
        return this.owner;
    }

    public final void setStaticFlag(boolean is_static) {
        if (is_static) {
            this.flags |= 8;
        } else {
            this.flags ^= -9;
        }
    }

    @Override // gnu.bytecode.Member
    public final boolean getStaticFlag() {
        return (this.flags & 8) != 0;
    }

    public final int getFlags() {
        return this.flags;
    }

    @Override // gnu.bytecode.Member
    public final int getModifiers() {
        return this.flags;
    }

    void write(DataOutputStream dstr, ClassType classfile) throws IOException {
        dstr.writeShort(this.flags);
        dstr.writeShort(this.name_index);
        dstr.writeShort(this.signature_index);
        Attribute.writeAll(this, dstr);
    }

    void assign_constants(ClassType classfile) {
        ConstantPool constants = classfile.constants;
        if (this.name_index == 0 && this.name != null) {
            this.name_index = constants.addUtf8(this.name).index;
        }
        if (this.signature_index == 0 && this.type != null) {
            this.signature_index = constants.addUtf8(this.type.getSignature()).index;
        }
        Attribute.assignConstants(this, classfile);
    }

    public synchronized java.lang.reflect.Field getReflectField() throws NoSuchFieldException {
        if (this.rfield == null) {
            this.rfield = this.owner.getReflectClass().getDeclaredField(getName());
        }
        return this.rfield;
    }

    public void setSourceName(String name) {
        this.sourceName = name;
    }

    public String getSourceName() {
        if (this.sourceName == null) {
            this.sourceName = getName().intern();
        }
        return this.sourceName;
    }

    public static Field searchField(Field fields, String name) {
        while (fields != null) {
            if (fields.getSourceName() != name) {
                fields = fields.next;
            } else {
                return fields;
            }
        }
        return null;
    }

    public final Field getNext() {
        return this.next;
    }

    public final void setConstantValue(Object obj, ClassType classType) {
        CpoolEntry addInt;
        ConstantPool constantPool = classType.constants;
        if (constantPool == null) {
            constantPool = new ConstantPool();
            classType.constants = constantPool;
        }
        switch (getType().getSignature().charAt(0)) {
            case 'C':
                if (obj instanceof Character) {
                    addInt = constantPool.addInt(((Character) obj).charValue());
                    break;
                }
            case 'B':
            case 'I':
            case 'S':
                addInt = constantPool.addInt(((Number) obj).intValue());
                break;
            case 'D':
                addInt = constantPool.addDouble(((Number) obj).doubleValue());
                break;
            case 'F':
                addInt = constantPool.addFloat(((Number) obj).floatValue());
                break;
            case 'J':
                addInt = constantPool.addLong(((Number) obj).longValue());
                break;
            case 'Z':
                addInt = constantPool.addInt(PrimType.booleanValue(obj) ? 1 : 0);
                break;
            default:
                addInt = constantPool.addString(obj.toString());
                break;
        }
        new ConstantValueAttr(addInt.getIndex()).addToFrontOf(this);
    }

    public String toString() {
        StringBuffer sbuf = new StringBuffer(100);
        sbuf.append("Field:");
        sbuf.append(getDeclaringClass().getName());
        sbuf.append('.');
        sbuf.append(this.name);
        return sbuf.toString();
    }
}
