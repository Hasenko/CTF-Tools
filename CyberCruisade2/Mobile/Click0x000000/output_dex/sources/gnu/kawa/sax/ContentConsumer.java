package gnu.kawa.sax;

import gnu.kawa.servlet.HttpRequestContext;
import gnu.lists.Consumable;
import gnu.lists.Consumer;
import gnu.lists.SeqPosition;
import gnu.mapping.Symbol;
import gnu.text.Char;
import gnu.xml.XName;
import org.xml.sax.ContentHandler;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.AttributesImpl;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ContentConsumer implements Consumer {
    String attrLocalName;
    String attrQName;
    String attrURI;
    AttributesImpl attributes;
    char[] chBuffer;
    int inStartTag;
    String[] names;
    int nesting;
    ContentHandler out;
    StringBuilder strBuffer;

    public ContentConsumer() {
        this.nesting = 0;
        this.names = new String[15];
        this.attributes = new AttributesImpl();
        this.strBuffer = new StringBuilder(HttpRequestContext.HTTP_OK);
    }

    public ContentConsumer(ContentHandler handler) {
        this.nesting = 0;
        this.names = new String[15];
        this.attributes = new AttributesImpl();
        this.strBuffer = new StringBuilder(HttpRequestContext.HTTP_OK);
        this.out = handler;
    }

    public void error(String method, SAXException ex) {
        throw new RuntimeException("caught " + ex + " in " + method);
    }

    public void endStartTag() {
        if (this.inStartTag != 1) {
            return;
        }
        int i = (this.nesting - 1) * 3;
        try {
            ContentHandler contentHandler = this.out;
            String[] strArr = this.names;
            contentHandler.startElement(strArr[i], strArr[i + 1], strArr[i + 2], this.attributes);
        } catch (SAXException ex) {
            error("startElement", ex);
        }
        this.attributes.clear();
        this.inStartTag = 0;
    }

    @Override // gnu.lists.Consumer
    public void startElement(Object type) {
        String namespaceURI;
        String localName;
        if (this.inStartTag == 1) {
            endStartTag();
        }
        flushStrBuffer();
        int i = this.nesting * 3;
        String[] strArr = this.names;
        if (i >= strArr.length) {
            String[] tmp = new String[i * 2];
            System.arraycopy(strArr, 0, tmp, 0, i);
            this.names = tmp;
        }
        if (type instanceof Symbol) {
            Symbol sym = (Symbol) type;
            namespaceURI = sym.getNamespaceURI();
            localName = sym.getLocalName();
        } else if (type instanceof XName) {
            XName sym2 = (XName) type;
            namespaceURI = sym2.getNamespaceURI();
            localName = sym2.getLocalName();
        } else {
            namespaceURI = "";
            localName = type.toString();
        }
        String[] strArr2 = this.names;
        strArr2[i] = namespaceURI;
        strArr2[i + 1] = localName;
        strArr2[i + 2] = type.toString();
        this.inStartTag = 1;
        this.nesting++;
    }

    @Override // gnu.lists.Consumer
    public void startAttribute(Object attrType) {
        this.attrURI = ((Symbol) attrType).getNamespaceURI();
        this.attrLocalName = ((Symbol) attrType).getLocalName();
        this.attrQName = attrType.toString();
        this.inStartTag = 2;
    }

    @Override // gnu.lists.Consumer
    public void endAttribute() {
        this.attributes.addAttribute(this.attrURI, this.attrLocalName, this.attrQName, "CDATA", this.strBuffer.toString());
        this.strBuffer.setLength(0);
        this.inStartTag = 1;
    }

    @Override // gnu.lists.Consumer
    public void startDocument() {
        try {
            this.out.startDocument();
        } catch (SAXException ex) {
            error("startDocument", ex);
        }
    }

    @Override // gnu.lists.Consumer
    public void endDocument() {
        try {
            this.out.endDocument();
        } catch (SAXException ex) {
            error("endDocument", ex);
        }
    }

    @Override // gnu.lists.Consumer
    public void endElement() {
        endStartTag();
        flushStrBuffer();
        int i = this.nesting - 1;
        this.nesting = i;
        int i2 = i * 3;
        try {
            ContentHandler contentHandler = this.out;
            String[] strArr = this.names;
            contentHandler.endElement(strArr[i2], strArr[i2 + 1], strArr[i2 + 2]);
        } catch (SAXException ex) {
            error("endElement", ex);
        }
        String[] strArr2 = this.names;
        strArr2[i2] = null;
        strArr2[i2 + 1] = null;
        strArr2[i2 + 2] = null;
    }

    void flushStrBuffer() {
        if (this.strBuffer.length() > 0) {
            if (this.chBuffer == null) {
                this.chBuffer = new char[HttpRequestContext.HTTP_OK];
            }
            try {
                int slen = this.strBuffer.length();
                int start = 0;
                while (true) {
                    int len = slen - start;
                    if (len <= 0) {
                        this.strBuffer.setLength(0);
                        return;
                    }
                    char[] cArr = this.chBuffer;
                    if (len > cArr.length) {
                        len = cArr.length;
                    }
                    this.strBuffer.getChars(start, start + len, cArr, start);
                    this.out.characters(this.chBuffer, 0, len);
                    start += len;
                }
            } catch (SAXException ex) {
                error("characters", ex);
            }
        }
    }

    @Override // gnu.lists.Consumer
    public void write(char[] buf, int off, int len) {
        if (this.inStartTag == 1) {
            endStartTag();
        }
        if (this.inStartTag == 2) {
            this.strBuffer.append(buf, off, len);
            return;
        }
        flushStrBuffer();
        try {
            this.out.characters(buf, off, len);
        } catch (SAXException ex) {
            error("characters", ex);
        }
    }

    @Override // gnu.lists.Consumer
    public void write(int v) {
        if (this.inStartTag == 1) {
            endStartTag();
        }
        if (v >= 65536) {
            this.strBuffer.append((char) (((v - 65536) >> 10) + 55296));
            v = (v & 1023) + 56320;
        }
        this.strBuffer.append((char) v);
    }

    @Override // gnu.lists.Consumer
    public void write(String v) {
        if (this.inStartTag == 1) {
            endStartTag();
        }
        this.strBuffer.append(v);
    }

    @Override // gnu.lists.Consumer
    public void write(CharSequence str, int start, int end) {
        if (this.inStartTag == 1) {
            endStartTag();
        }
        this.strBuffer.append(str, start, end);
    }

    @Override // java.lang.Appendable
    public ContentConsumer append(char c) {
        write(c);
        return this;
    }

    @Override // java.lang.Appendable
    public ContentConsumer append(CharSequence csq) {
        if (csq == null) {
            csq = "null";
        }
        write(csq, 0, csq.length());
        return this;
    }

    @Override // java.lang.Appendable
    public ContentConsumer append(CharSequence csq, int start, int end) {
        if (csq == null) {
            csq = "null";
        }
        write(csq, start, end);
        return this;
    }

    @Override // gnu.lists.Consumer
    public void writeObject(Object v) {
        if (v instanceof Consumable) {
            ((Consumable) v).consume(this);
            return;
        }
        if (v instanceof SeqPosition) {
            SeqPosition pos = (SeqPosition) v;
            pos.sequence.consumeNext(pos.ipos, this);
        } else if (v instanceof Char) {
            ((Char) v).print(this);
        } else {
            write(v == null ? "(null)" : v.toString());
        }
    }

    @Override // gnu.lists.Consumer
    public void writeBoolean(boolean v) {
        if (this.inStartTag == 1) {
            endStartTag();
        }
        this.strBuffer.append(v);
    }

    @Override // gnu.lists.Consumer
    public void writeLong(long v) {
        if (this.inStartTag == 1) {
            endStartTag();
        }
        this.strBuffer.append(v);
    }

    @Override // gnu.lists.Consumer
    public void writeInt(int v) {
        if (this.inStartTag == 1) {
            endStartTag();
        }
        this.strBuffer.append(v);
    }

    @Override // gnu.lists.Consumer
    public void writeFloat(float v) {
        if (this.inStartTag == 1) {
            endStartTag();
        }
        this.strBuffer.append(v);
    }

    @Override // gnu.lists.Consumer
    public void writeDouble(double v) {
        if (this.inStartTag == 1) {
            endStartTag();
        }
        this.strBuffer.append(v);
    }

    public void finalize() {
        flushStrBuffer();
    }

    @Override // gnu.lists.Consumer
    public boolean ignoring() {
        return false;
    }

    public void setContentHandler(ContentHandler handler) {
        this.out = handler;
    }

    public ContentHandler getContentHandler() {
        return this.out;
    }
}
