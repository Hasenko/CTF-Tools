package kawa.lang;

import gnu.lists.Consumer;
import gnu.mapping.Symbol;
import gnu.text.Printable;
import gnu.text.ReportFormat;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class EqualPat extends Pattern implements Printable, Externalizable {
    Object value;

    public EqualPat() {
    }

    public EqualPat(Object obj) {
        this.value = obj;
    }

    public static EqualPat make(Object obj) {
        return new EqualPat(obj);
    }

    @Override // kawa.lang.Pattern
    public boolean match(Object obj, Object[] vars, int start_vars) {
        if ((this.value instanceof String) && (obj instanceof Symbol)) {
            obj = ((Symbol) obj).getName();
        }
        return this.value.equals(obj);
    }

    @Override // kawa.lang.Pattern
    public int varCount() {
        return 0;
    }

    @Override // gnu.text.Printable
    public void print(Consumer out) {
        out.write("#<equals: ");
        ReportFormat.print(this.value, out);
        out.write(62);
    }

    @Override // java.io.Externalizable
    public void writeExternal(ObjectOutput out) throws IOException {
        out.writeObject(this.value);
    }

    @Override // java.io.Externalizable
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        this.value = in.readObject();
    }
}
