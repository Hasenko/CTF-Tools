package gnu.kawa.xml;

import gnu.lists.AbstractSequence;
import gnu.lists.Consumer;
import gnu.lists.SeqPosition;
import gnu.lists.Sequence;
import gnu.lists.TreeList;
import gnu.mapping.Values;
import gnu.xml.NodeTree;
import gnu.xml.XMLFilter;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class Nodes extends Values implements NodeList {
    static final int POS_SIZE = 5;
    int count;
    XMLFilter curFragment;
    NodeTree curNode;
    boolean inAttribute;
    int nesting = 0;

    @Override // gnu.lists.TreeList, gnu.lists.PositionConsumer
    public void writePosition(AbstractSequence seq, int ipos) {
        this.count++;
        super.writePosition(seq, ipos);
    }

    @Override // gnu.lists.TreeList
    public int find(Object seq) {
        if (this.gapStart > 0) {
            int oindex = getIntN((this.gapStart - 5) + 1);
            if (this.objects[oindex] == seq) {
                return oindex;
            }
        }
        int oindex2 = this.gapEnd;
        if (oindex2 < this.data.length) {
            int oindex3 = getIntN(this.gapEnd + 1);
            if (this.objects[oindex3] == seq) {
                return oindex3;
            }
        }
        int oindex4 = super.find(seq);
        return oindex4;
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void writeObject(Object v) {
        XMLFilter xMLFilter = this.curFragment;
        if (xMLFilter != null) {
            if (this.nesting == 0 && ((v instanceof SeqPosition) || (v instanceof TreeList))) {
                finishFragment();
            } else {
                xMLFilter.writeObject(v);
                return;
            }
        }
        if (v instanceof SeqPosition) {
            SeqPosition seq = (SeqPosition) v;
            writePosition(seq.sequence, seq.ipos);
        } else if (v instanceof TreeList) {
            TreeList tlist = (TreeList) v;
            writePosition(tlist, 0);
        } else {
            handleNonNode();
            this.curFragment.writeObject(v);
        }
    }

    void maybeStartTextNode() {
        if (this.curFragment == null) {
            throw new IllegalArgumentException("non-node where node required");
        }
    }

    void handleNonNode() {
        if (this.curFragment == null) {
            throw new ClassCastException("atomic value where node is required");
        }
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void writeFloat(float v) {
        handleNonNode();
        this.curFragment.writeFloat(v);
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void writeDouble(double v) {
        handleNonNode();
        this.curFragment.writeDouble(v);
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void writeLong(long v) {
        handleNonNode();
        this.curFragment.writeLong(v);
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void writeInt(int v) {
        handleNonNode();
        this.curFragment.writeInt(v);
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void writeBoolean(boolean v) {
        handleNonNode();
        this.curFragment.writeBoolean(v);
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void write(int v) {
        maybeStartTextNode();
        this.curFragment.write(v);
    }

    @Override // gnu.lists.TreeList, java.lang.Appendable
    public Consumer append(CharSequence csq, int start, int end) {
        maybeStartTextNode();
        this.curFragment.write(csq, start, end);
        return this;
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void write(char[] buf, int off, int len) {
        maybeStartTextNode();
        this.curFragment.write(buf, off, len);
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void write(CharSequence str, int start, int length) {
        maybeStartTextNode();
        this.curFragment.write(str, start, length);
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void write(String str) {
        maybeStartTextNode();
        this.curFragment.write(str);
    }

    private void maybeStartNonTextNode() {
        if (this.curFragment != null && this.nesting == 0) {
            finishFragment();
        }
        if (this.curFragment == null) {
            startFragment();
        }
        this.nesting++;
    }

    private void maybeEndNonTextNode() {
        int i = this.nesting - 1;
        this.nesting = i;
        if (i == 0) {
            finishFragment();
        }
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void startElement(Object type) {
        maybeStartNonTextNode();
        this.curFragment.startElement(type);
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void endElement() {
        this.curFragment.endElement();
        maybeEndNonTextNode();
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void startAttribute(Object attrType) {
        maybeStartNonTextNode();
        this.curFragment.startAttribute(attrType);
        this.inAttribute = true;
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void endAttribute() {
        if (!this.inAttribute) {
            return;
        }
        this.inAttribute = false;
        this.curFragment.endAttribute();
        maybeEndNonTextNode();
    }

    @Override // gnu.lists.TreeList, gnu.lists.XConsumer
    public void writeComment(char[] chars, int offset, int length) {
        maybeStartNonTextNode();
        this.curFragment.writeComment(chars, offset, length);
        maybeEndNonTextNode();
    }

    @Override // gnu.lists.TreeList, gnu.lists.XConsumer
    public void writeCDATA(char[] chars, int offset, int length) {
        maybeStartNonTextNode();
        this.curFragment.writeCDATA(chars, offset, length);
    }

    @Override // gnu.lists.TreeList, gnu.lists.XConsumer
    public void writeProcessingInstruction(String target, char[] content, int offset, int length) {
        maybeStartNonTextNode();
        this.curFragment.writeProcessingInstruction(target, content, offset, length);
        maybeEndNonTextNode();
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void startDocument() {
        maybeStartNonTextNode();
        this.curFragment.startDocument();
    }

    @Override // gnu.lists.TreeList, gnu.lists.Consumer
    public void endDocument() {
        this.curFragment.endDocument();
        maybeEndNonTextNode();
    }

    @Override // gnu.lists.TreeList, gnu.lists.XConsumer
    public void beginEntity(Object base) {
        maybeStartNonTextNode();
        this.curFragment.beginEntity(base);
    }

    @Override // gnu.lists.TreeList, gnu.lists.XConsumer
    public void endEntity() {
        this.curFragment.endEntity();
        maybeEndNonTextNode();
    }

    void startFragment() {
        NodeTree nodeTree = new NodeTree();
        this.curNode = nodeTree;
        this.curFragment = new XMLFilter(nodeTree);
        writePosition(this.curNode, 0);
    }

    void finishFragment() {
        this.curNode = null;
        this.curFragment = null;
    }

    @Override // gnu.lists.TreeList, gnu.lists.AbstractSequence, gnu.lists.Sequence, java.util.List, java.util.Collection, com.google.appinventor.components.runtime.util.YailObject
    public int size() {
        return this.count;
    }

    @Override // org.w3c.dom.NodeList
    public int getLength() {
        return this.count;
    }

    @Override // gnu.lists.TreeList, gnu.lists.AbstractSequence
    public Object get(int index) {
        int i = index * 5;
        if (i >= this.gapStart) {
            i += this.gapEnd - this.gapStart;
        }
        if (i < 0 || i >= this.data.length) {
            throw new IndexOutOfBoundsException();
        }
        if (this.data[i] != 61711) {
            throw new RuntimeException("internal error - unexpected data");
        }
        return KNode.make((NodeTree) this.objects[getIntN(i + 1)], getIntN(i + 3));
    }

    @Override // org.w3c.dom.NodeList
    public Node item(int index) {
        if (index >= this.count) {
            return null;
        }
        return (Node) get(index);
    }

    @Override // gnu.lists.TreeList, gnu.lists.AbstractSequence
    public Object getPosNext(int ipos) {
        int index = posToDataIndex(ipos);
        if (index == this.data.length) {
            return Sequence.eofValue;
        }
        if (this.data[index] != 61711) {
            throw new RuntimeException("internal error - unexpected data");
        }
        return KNode.make((NodeTree) this.objects[getIntN(index + 1)], getIntN(index + 3));
    }

    public AbstractSequence getSeq(int index) {
        int i = index * 5;
        if (i >= this.gapStart) {
            i += this.gapEnd - this.gapStart;
        }
        if (i < 0 || i >= this.data.length) {
            return null;
        }
        if (this.data[i] != 61711) {
            throw new RuntimeException("internal error - unexpected data");
        }
        return (AbstractSequence) this.objects[getIntN(i + 1)];
    }

    public int getPos(int index) {
        int i = index * 5;
        if (i >= this.gapStart) {
            i += this.gapEnd - this.gapStart;
        }
        if (this.data[i] != 61711) {
            throw new RuntimeException("internal error - unexpected data");
        }
        return getIntN(i + 3);
    }

    public static KNode root(NodeTree seq, int ipos) {
        int root;
        if (seq.gapStart > 5 && seq.data[0] == 61714) {
            root = 10;
        } else {
            root = 0;
        }
        return KNode.make(seq, root);
    }
}
