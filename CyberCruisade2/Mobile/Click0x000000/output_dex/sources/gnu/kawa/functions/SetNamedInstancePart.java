package gnu.kawa.functions;

import gnu.kawa.reflect.SlotSet;
import gnu.mapping.Procedure;
import gnu.mapping.Procedure2;
import gnu.mapping.Values;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

/* compiled from: GetNamedInstancePart.java */
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class SetNamedInstancePart extends Procedure2 implements Externalizable {
    String pname;

    public SetNamedInstancePart() {
        setProperty(Procedure.validateApplyKey, "gnu.kawa.functions.CompileNamedPart:validateSetNamedInstancePart");
    }

    public SetNamedInstancePart(String name) {
        this();
        setPartName(name);
    }

    public void setPartName(String name) {
        setName("set-instance-part:." + name);
        this.pname = name;
    }

    @Override // gnu.mapping.Procedure2, gnu.mapping.Procedure
    public Object apply2(Object instance, Object value) throws Throwable {
        SlotSet.setField(instance, this.pname, value);
        return Values.empty;
    }

    @Override // java.io.Externalizable
    public void writeExternal(ObjectOutput out) throws IOException {
        out.writeObject(this.pname);
    }

    @Override // java.io.Externalizable
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        setPartName((String) in.readObject());
    }
}
