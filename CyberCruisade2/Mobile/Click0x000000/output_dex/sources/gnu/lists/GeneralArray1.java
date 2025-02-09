package gnu.lists;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class GeneralArray1 extends GeneralArray implements Sequence {
    @Override // gnu.lists.GeneralArray, gnu.lists.AbstractSequence
    public int createPos(int i, boolean z) {
        return (i << 1) | (z ? 1 : 0);
    }

    @Override // gnu.lists.AbstractSequence
    protected int nextIndex(int ipos) {
        return ipos == -1 ? size() : ipos >>> 1;
    }

    @Override // gnu.lists.AbstractSequence
    public void consumePosRange(int iposStart, int iposEnd, Consumer out) {
        if (out.ignoring()) {
            return;
        }
        int it = iposStart;
        while (!equals(it, iposEnd)) {
            if (!hasNext(it)) {
                throw new RuntimeException();
            }
            this.base.consume(this.offset + (this.strides[0] * (it >>> 1)), 1, out);
            it = nextPos(it);
        }
    }
}
