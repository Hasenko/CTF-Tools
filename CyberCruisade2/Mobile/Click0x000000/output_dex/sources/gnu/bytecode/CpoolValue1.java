package gnu.bytecode;

import java.io.DataOutputStream;
import java.io.IOException;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class CpoolValue1 extends CpoolEntry {
    int tag;
    int value;

    CpoolValue1(int tag) {
        this.tag = tag;
    }

    CpoolValue1(ConstantPool cpool, int tag, int hash, int value) {
        super(cpool, hash);
        this.tag = tag;
        this.value = value;
    }

    @Override // gnu.bytecode.CpoolEntry
    public int getTag() {
        return this.tag;
    }

    public final int getValue() {
        return this.value;
    }

    static int hashCode(int val) {
        return val;
    }

    @Override // gnu.bytecode.CpoolEntry
    public int hashCode() {
        if (this.hash == 0) {
            this.hash = this.value;
        }
        return this.hash;
    }

    @Override // gnu.bytecode.CpoolEntry
    void write(DataOutputStream dstr) throws IOException {
        dstr.writeByte(this.tag);
        dstr.writeInt(this.value);
    }

    @Override // gnu.bytecode.CpoolEntry
    public void print(ClassTypeWriter dst, int verbosity) {
        if (this.tag == 3) {
            if (verbosity > 0) {
                dst.print("Integer ");
            }
            dst.print(this.value);
            if (verbosity > 1 && this.value != 0) {
                dst.print("=0x");
                dst.print(Integer.toHexString(this.value));
                return;
            }
            return;
        }
        if (verbosity > 0) {
            dst.print("Float ");
        }
        dst.print(Float.intBitsToFloat(this.value));
        if (verbosity > 1) {
            dst.print("=0x");
            dst.print(Integer.toHexString(this.value));
        }
    }
}
