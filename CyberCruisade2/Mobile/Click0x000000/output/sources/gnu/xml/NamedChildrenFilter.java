package gnu.xml;

import gnu.lists.Consumable;
import gnu.lists.Consumer;
import gnu.lists.FilterConsumer;
import gnu.lists.SeqPosition;
import gnu.lists.TreeList;
import gnu.mapping.Symbol;

/* loaded from: classes2.dex */
public class NamedChildrenFilter extends FilterConsumer {
    int level;
    String localName;
    int matchLevel;
    String namespaceURI;

    public static NamedChildrenFilter make(String namespaceURI, String localName, Consumer out) {
        return new NamedChildrenFilter(namespaceURI, localName, out);
    }

    public NamedChildrenFilter(String namespaceURI, String localName, Consumer out) {
        super(out);
        this.namespaceURI = namespaceURI;
        this.localName = localName;
        this.skipping = true;
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void startDocument() {
        this.level++;
        super.startDocument();
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void endDocument() {
        this.level--;
        super.endDocument();
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void startElement(Object type) {
        String curNamespaceURI;
        String curLocalName;
        String str;
        if (this.skipping && this.level == 1) {
            if (type instanceof Symbol) {
                Symbol qname = (Symbol) type;
                curNamespaceURI = qname.getNamespaceURI();
                curLocalName = qname.getLocalName();
            } else {
                curNamespaceURI = "";
                curLocalName = type.toString().intern();
            }
            String str2 = this.localName;
            if ((str2 == curLocalName || str2 == null) && ((str = this.namespaceURI) == curNamespaceURI || str == null)) {
                this.skipping = false;
                this.matchLevel = this.level;
            }
        }
        super.startElement(type);
        this.level++;
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void endElement() {
        this.level--;
        super.endElement();
        if (!this.skipping && this.matchLevel == this.level) {
            this.skipping = true;
        }
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void writeObject(Object val) {
        if (val instanceof SeqPosition) {
            SeqPosition pos = (SeqPosition) val;
            if (pos.sequence instanceof TreeList) {
                ((TreeList) pos.sequence).consumeNext(pos.ipos, this);
                return;
            }
        }
        if (val instanceof Consumable) {
            ((Consumable) val).consume(this);
        } else {
            super.writeObject(val);
        }
    }
}
