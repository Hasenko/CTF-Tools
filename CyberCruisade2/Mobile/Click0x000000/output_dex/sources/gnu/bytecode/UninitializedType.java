package gnu.bytecode;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class UninitializedType extends ObjectType {
    ClassType ctype;
    Label label;

    UninitializedType(ClassType ctype) {
        super(ctype.getName());
        setSignature(ctype.getSignature());
        this.ctype = ctype;
    }

    UninitializedType(ClassType ctype, Label label) {
        this(ctype);
        this.label = label;
    }

    static UninitializedType uninitializedThis(ClassType ctype) {
        return new UninitializedType(ctype);
    }

    @Override // gnu.bytecode.ObjectType, gnu.bytecode.Type
    public Type getImplementationType() {
        return this.ctype;
    }

    @Override // gnu.bytecode.Type
    public String toString() {
        return "Uninitialized<" + this.ctype.getName() + '>';
    }
}
