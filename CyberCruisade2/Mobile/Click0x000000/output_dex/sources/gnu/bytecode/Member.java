package gnu.bytecode;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public interface Member {
    ClassType getDeclaringClass();

    int getModifiers();

    String getName();

    boolean getStaticFlag();

    void setName(String str);
}
