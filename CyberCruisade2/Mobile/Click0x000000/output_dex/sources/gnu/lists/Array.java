package gnu.lists;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public interface Array {
    Object get(int[] iArr);

    int getEffectiveIndex(int[] iArr);

    int getLowBound(int i);

    Object getRowMajor(int i);

    int getSize(int i);

    boolean isEmpty();

    int rank();

    Object set(int[] iArr, Object obj);

    Array transpose(int[] iArr, int[] iArr2, int i, int[] iArr3);
}
