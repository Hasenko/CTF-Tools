package gnu.bytecode;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class Location {
    protected String name;
    int name_index;
    int signature_index;
    protected Type type;

    public final String getName() {
        return this.name;
    }

    public final void setName(String name) {
        this.name = name;
    }

    public final void setName(int name_index, ConstantPool constants) {
        if (name_index <= 0) {
            this.name = null;
        } else {
            CpoolUtf8 nameConstant = (CpoolUtf8) constants.getForced(name_index, 1);
            this.name = nameConstant.string;
        }
        this.name_index = name_index;
    }

    public final Type getType() {
        return this.type;
    }

    public final void setType(Type type) {
        this.type = type;
    }

    public final String getSignature() {
        return this.type.getSignature();
    }

    public void setSignature(int signature_index, ConstantPool constants) {
        CpoolUtf8 sigConstant = (CpoolUtf8) constants.getForced(signature_index, 1);
        this.signature_index = signature_index;
        this.type = Type.signatureToType(sigConstant.string);
    }
}
