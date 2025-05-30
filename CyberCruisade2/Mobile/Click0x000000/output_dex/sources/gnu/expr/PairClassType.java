package gnu.expr;

import gnu.bytecode.ClassType;
import gnu.bytecode.Type;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class PairClassType extends ClassType {
    public ClassType instanceType;
    Object staticLink;

    public PairClassType() {
    }

    PairClassType(Class reflectInterface, Class reflectInstanceClass) {
        super(reflectInterface.getName());
        setExisting(true);
        this.reflectClass = reflectInterface;
        Type.registerTypeForClass(reflectInterface, this);
        this.instanceType = (ClassType) Type.make(reflectInstanceClass);
    }

    public static PairClassType make(Class reflectInterface, Class reflectInstanceClass) {
        return new PairClassType(reflectInterface, reflectInstanceClass);
    }

    public static PairClassType make(Class reflectInterface, Class reflectInstanceClass, Object staticLink) {
        PairClassType type = new PairClassType(reflectInterface, reflectInstanceClass);
        type.staticLink = staticLink;
        return type;
    }

    public Object getStaticLink() {
        return this.staticLink;
    }

    public static Object extractStaticLink(ClassType type) {
        return ((PairClassType) type).staticLink;
    }
}
