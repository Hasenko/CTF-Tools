package gnu.lists;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class TreePosition extends SeqPosition implements Cloneable {
    int depth;
    int[] istack;
    AbstractSequence[] sstack;
    int start;
    private Object xpos;

    public TreePosition() {
        this.depth = -1;
    }

    public TreePosition(Object root) {
        this.xpos = root;
        this.depth = -1;
    }

    public TreePosition(AbstractSequence seq, int index) {
        super(seq, index, false);
    }

    public TreePosition(TreePosition pos) {
        set(pos);
    }

    public Object clone() {
        return new TreePosition(this);
    }

    public void set(TreePosition position) {
        release();
        int d = position.depth;
        this.depth = d;
        if (d < 0) {
            this.xpos = position.xpos;
            return;
        }
        AbstractSequence[] abstractSequenceArr = this.sstack;
        if (abstractSequenceArr == null || abstractSequenceArr.length <= d) {
            this.sstack = new AbstractSequence[d + 10];
        }
        int[] iArr = this.istack;
        if (iArr == null || iArr.length <= d) {
            this.istack = new int[d + 10];
        }
        int i = 0;
        while (true) {
            int i2 = this.depth;
            if (i < i2) {
                int j = position.start + i;
                AbstractSequence seq = position.sstack[j];
                this.sstack[i2 - 1] = seq;
                this.istack[i2 - i] = seq.copyPos(position.istack[j]);
                i++;
            } else {
                AbstractSequence seq2 = position.sequence;
                this.sequence = seq2;
                this.ipos = seq2.copyPos(position.ipos);
                return;
            }
        }
    }

    public int getDepth() {
        return this.depth + 1;
    }

    public AbstractSequence getRoot() {
        return this.depth == 0 ? this.sequence : this.sstack[this.start];
    }

    public Object getPosNext() {
        return this.sequence == null ? this.xpos : this.sequence.getPosNext(this.ipos);
    }

    public void push(AbstractSequence child, int iposChild) {
        int i = this.depth;
        int d = this.start + i;
        if (d >= 0) {
            if (d == 0) {
                this.istack = new int[8];
                this.sstack = new AbstractSequence[8];
            } else {
                int[] iArr = this.istack;
                if (d >= iArr.length) {
                    int ndepth = d * 2;
                    int[] itemp = new int[ndepth];
                    Object[] objArr = new Object[ndepth];
                    AbstractSequence[] stemp = new AbstractSequence[ndepth];
                    System.arraycopy(iArr, 0, itemp, 0, i);
                    System.arraycopy(this.sstack, 0, stemp, 0, this.depth);
                    this.istack = itemp;
                    this.sstack = stemp;
                }
            }
            this.sstack[d] = this.sequence;
            this.istack[d] = this.ipos;
        }
        this.depth++;
        this.sequence = child;
        this.ipos = iposChild;
    }

    public void pop() {
        this.sequence.releasePos(this.ipos);
        popNoRelease();
    }

    public void popNoRelease() {
        int i = this.depth - 1;
        this.depth = i;
        if (i < 0) {
            this.xpos = this.sequence;
            this.sequence = null;
        } else {
            this.sequence = this.sstack[this.start + i];
            this.ipos = this.istack[this.start + this.depth];
        }
    }

    public final boolean gotoParent() {
        if (this.sequence == null) {
            return false;
        }
        return this.sequence.gotoParent(this);
    }

    @Override // gnu.lists.SeqPosition
    public boolean gotoChildrenStart() {
        if (this.sequence != null) {
            return this.sequence.gotoChildrenStart(this);
        }
        Object obj = this.xpos;
        if (!(obj instanceof AbstractSequence)) {
            return false;
        }
        this.depth = 0;
        this.sequence = (AbstractSequence) obj;
        setPos(this.sequence.startPos());
        return true;
    }

    public boolean gotoAttributesStart() {
        if (this.sequence == null) {
            boolean z = this.xpos instanceof AbstractSequence;
            return false;
        }
        return this.sequence.gotoAttributesStart(this);
    }

    public Object getAncestor(int up) {
        if (up == 0) {
            return this.sequence.getPosNext(this.ipos);
        }
        int i = this.depth - up;
        if (i <= 0) {
            return getRoot();
        }
        int i2 = i + this.start;
        return this.sstack[i2].getPosNext(this.istack[i2]);
    }

    @Override // gnu.lists.SeqPosition
    public void release() {
        while (this.sequence != null) {
            this.sequence.releasePos(this.ipos);
            pop();
        }
        this.xpos = null;
    }

    public void dump() {
        System.err.println("TreePosition dump depth:" + this.depth + " start:" + this.start);
        int i = 0;
        while (true) {
            int i2 = this.depth;
            if (i <= i2) {
                AbstractSequence seq = i == 0 ? this.sequence : this.sstack[i2 - i];
                System.err.print("#" + i + " seq:" + seq);
                System.err.println(" ipos:" + (i == 0 ? this.ipos : this.istack[this.depth - i]));
                i++;
            } else {
                return;
            }
        }
    }
}
