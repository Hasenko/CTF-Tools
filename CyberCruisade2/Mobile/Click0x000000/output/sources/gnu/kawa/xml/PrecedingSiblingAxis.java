package gnu.kawa.xml;

import gnu.lists.AbstractSequence;
import gnu.lists.NodePredicate;
import gnu.lists.PositionConsumer;

/* loaded from: classes2.dex */
public class PrecedingSiblingAxis extends TreeScanner {
    public static PrecedingSiblingAxis make(NodePredicate type) {
        PrecedingSiblingAxis axis = new PrecedingSiblingAxis();
        axis.type = type;
        return axis;
    }

    @Override // gnu.kawa.xml.TreeScanner
    public void scan(AbstractSequence seq, int ipos, PositionConsumer out) {
        int child;
        int end = seq.endPos();
        int parent = seq.parentPos(ipos);
        if (parent == end || (child = seq.firstChildPos(parent)) == 0) {
            return;
        }
        if (this.type.isInstancePos(seq, child)) {
            out.writePosition(seq, child);
        }
        while (true) {
            child = seq.nextMatching(child, this.type, ipos, false);
            if (child != 0) {
                out.writePosition(seq, child);
            } else {
                return;
            }
        }
    }
}
