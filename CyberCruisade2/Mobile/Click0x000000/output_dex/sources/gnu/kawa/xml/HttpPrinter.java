package gnu.kawa.xml;

import com.google.appinventor.components.runtime.util.NanoHTTPD;
import gnu.lists.Consumable;
import gnu.lists.FilterConsumer;
import gnu.lists.UnescapedData;
import gnu.mapping.OutPort;
import gnu.mapping.Symbol;
import gnu.xml.XMLPrinter;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Vector;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class HttpPrinter extends FilterConsumer {
    Object currentHeader;
    private int elementNesting;
    Vector headers;
    protected OutputStream ostream;
    protected String sawContentType;
    StringBuilder sbuf;
    private int seenStartDocument;
    boolean seenXmlHeader;
    OutPort writer;

    public HttpPrinter(OutputStream out) {
        super(null);
        this.headers = new Vector();
        this.sbuf = new StringBuilder(100);
        this.ostream = out;
    }

    public HttpPrinter(OutPort out) {
        super(null);
        this.headers = new Vector();
        this.sbuf = new StringBuilder(100);
        this.writer = out;
    }

    public static HttpPrinter make(OutPort out) {
        return new HttpPrinter(out);
    }

    private void writeRaw(String str) throws IOException {
        OutPort outPort = this.writer;
        if (outPort != null) {
            outPort.write(str);
            return;
        }
        int len = str.length();
        for (int i = 0; i < len; i++) {
            this.ostream.write((byte) str.charAt(i));
        }
    }

    @Override // gnu.lists.FilterConsumer
    protected void beforeNode() {
        if (this.sawContentType == null) {
            addHeader("Content-type", NanoHTTPD.MIME_XML);
        }
        beginData();
    }

    public void printHeader(String label, String value) throws IOException {
        writeRaw(label);
        writeRaw(": ");
        writeRaw(value);
        writeRaw("\n");
    }

    public void printHeaders() throws IOException {
        int num = this.headers.size();
        for (int i = 0; i < num; i += 2) {
            printHeader(this.headers.elementAt(i).toString(), this.headers.elementAt(i + 1).toString());
        }
        writeRaw("\n");
    }

    public void addHeader(String label, String value) {
        if (label.equalsIgnoreCase("Content-type")) {
            this.sawContentType = value;
        }
        this.headers.addElement(label);
        this.headers.addElement(value);
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void startAttribute(Object attrType) {
        if (this.base == null) {
            this.currentHeader = attrType;
        } else {
            this.base.startAttribute(attrType);
        }
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void endAttribute() {
        Object obj = this.currentHeader;
        if (obj != null) {
            addHeader(obj.toString(), this.sbuf.toString());
            this.sbuf.setLength(0);
            this.currentHeader = null;
            return;
        }
        this.base.endAttribute();
    }

    public void beginData() {
        if (this.base == null) {
            if (this.sawContentType == null) {
                addHeader("Content-type", NanoHTTPD.MIME_PLAINTEXT);
            }
            if (this.writer == null) {
                this.writer = new OutPort(this.ostream);
            }
            String style = null;
            if (NanoHTTPD.MIME_HTML.equalsIgnoreCase(this.sawContentType)) {
                style = "html";
            } else if ("application/xhtml+xml".equalsIgnoreCase(this.sawContentType)) {
                style = "xhtml";
            } else if (NanoHTTPD.MIME_PLAINTEXT.equalsIgnoreCase(this.sawContentType)) {
                style = "plain";
            }
            this.base = XMLPrinter.make(this.writer, style);
            if (this.seenStartDocument == 0) {
                this.base.startDocument();
                this.seenStartDocument = 1;
            }
            try {
                printHeaders();
            } catch (Throwable ex) {
                throw new RuntimeException(ex.toString());
            }
        }
        append((CharSequence) this.sbuf);
        this.sbuf.setLength(0);
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void startElement(Object type) {
        String mimeType;
        if (this.sawContentType == null) {
            if (!this.seenXmlHeader) {
                mimeType = NanoHTTPD.MIME_HTML;
            } else if ((type instanceof Symbol) && "html".equals(((Symbol) type).getLocalPart())) {
                mimeType = "text/xhtml";
            } else {
                mimeType = NanoHTTPD.MIME_XML;
            }
            addHeader("Content-type", mimeType);
        }
        beginData();
        this.base.startElement(type);
        this.elementNesting++;
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void endElement() {
        super.endElement();
        int i = this.elementNesting - 1;
        this.elementNesting = i;
        if (i == 0 && this.seenStartDocument == 1) {
            endDocument();
        }
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void writeObject(Object v) {
        if ((v instanceof Consumable) && !(v instanceof UnescapedData)) {
            ((Consumable) v).consume(this);
        } else {
            beginData();
            super.writeObject(v);
        }
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void write(CharSequence str, int start, int length) {
        if (this.base == null) {
            this.sbuf.append(str, start, start + length);
        } else {
            this.base.write(str, start, length);
        }
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void write(char[] buf, int off, int len) {
        if (this.base == null) {
            this.sbuf.append(buf, off, len);
        } else {
            this.base.write(buf, off, len);
        }
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void startDocument() {
        if (this.base != null) {
            this.base.startDocument();
        }
        this.seenStartDocument = 2;
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public void endDocument() {
        if (this.base != null) {
            this.base.endDocument();
        }
        try {
            if (this.sawContentType == null) {
                addHeader("Content-type", NanoHTTPD.MIME_PLAINTEXT);
            }
            if (this.sbuf.length() > 0) {
                String str = this.sbuf.toString();
                this.sbuf.setLength(0);
                OutPort outPort = this.writer;
                if (outPort != null) {
                    outPort.write(str);
                } else {
                    this.ostream.write(str.getBytes());
                }
            }
            OutPort outPort2 = this.writer;
            if (outPort2 != null) {
                outPort2.close();
            }
            OutputStream outputStream = this.ostream;
            if (outputStream != null) {
                outputStream.flush();
            }
        } catch (Throwable th) {
        }
    }

    public boolean reset(boolean headersAlso) {
        if (headersAlso) {
            this.headers.clear();
            this.sawContentType = null;
            this.currentHeader = null;
            this.elementNesting = 0;
        }
        this.sbuf.setLength(0);
        this.base = null;
        if (this.ostream == null) {
            return true;
        }
        boolean ok = this.writer == null;
        this.writer = null;
        return ok;
    }
}
