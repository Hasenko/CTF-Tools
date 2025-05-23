package gnu.lists;

import gnu.text.SourceLocator;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class PairWithPosition extends ImmutablePair implements SourceLocator {
    String filename;
    int position;

    public final void setFile(String filename) {
        this.filename = filename;
    }

    public final void setLine(int lineno, int colno) {
        if (lineno < 0) {
            lineno = 0;
        }
        if (colno < 0) {
            colno = 0;
        }
        this.position = (lineno << 12) + colno;
    }

    public final void setLine(int lineno) {
        setLine(lineno, 0);
    }

    @Override // gnu.text.SourceLocator
    public final String getFileName() {
        return this.filename;
    }

    @Override // gnu.text.SourceLocator, org.xml.sax.Locator
    public String getPublicId() {
        return null;
    }

    @Override // gnu.text.SourceLocator, org.xml.sax.Locator
    public String getSystemId() {
        return this.filename;
    }

    @Override // gnu.text.SourceLocator, org.xml.sax.Locator
    public final int getLineNumber() {
        int line = this.position >> 12;
        if (line == 0) {
            return -1;
        }
        return line;
    }

    @Override // gnu.text.SourceLocator, org.xml.sax.Locator
    public final int getColumnNumber() {
        int column = this.position & 4095;
        if (column == 0) {
            return -1;
        }
        return column;
    }

    @Override // gnu.text.SourceLocator
    public boolean isStableSourceLocation() {
        return true;
    }

    public PairWithPosition() {
    }

    public PairWithPosition(SourceLocator where, Object car, Object cdr) {
        super(car, cdr);
        this.filename = where.getFileName();
        setLine(where.getLineNumber(), where.getColumnNumber());
    }

    public PairWithPosition(Object car, Object cdr) {
        super(car, cdr);
    }

    public static PairWithPosition make(Object car, Object cdr, String filename, int line, int column) {
        PairWithPosition pair = new PairWithPosition(car, cdr);
        pair.filename = filename;
        pair.setLine(line, column);
        return pair;
    }

    public static PairWithPosition make(Object car, Object cdr, String filename, int position) {
        PairWithPosition pair = new PairWithPosition(car, cdr);
        pair.filename = filename;
        pair.position = position;
        return pair;
    }

    @Override // gnu.lists.Pair, gnu.lists.LList, java.io.Externalizable
    public void writeExternal(ObjectOutput out) throws IOException {
        out.writeObject(this.car);
        out.writeObject(this.cdr);
        out.writeObject(this.filename);
        out.writeInt(this.position);
    }

    @Override // gnu.lists.Pair, gnu.lists.LList, java.io.Externalizable
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        this.car = in.readObject();
        this.cdr = in.readObject();
        this.filename = (String) in.readObject();
        this.position = in.readInt();
    }
}
