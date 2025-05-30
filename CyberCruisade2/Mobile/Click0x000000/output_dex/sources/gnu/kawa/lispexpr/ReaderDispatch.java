package gnu.kawa.lispexpr;

import gnu.kawa.util.RangeTable;
import gnu.mapping.Values;
import gnu.text.Lexer;
import gnu.text.SyntaxException;
import java.io.IOException;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ReaderDispatch extends ReadTableEntry {
    int kind;
    RangeTable table;

    @Override // gnu.kawa.lispexpr.ReadTableEntry
    public int getKind() {
        return this.kind;
    }

    public void set(int key, Object value) {
        this.table.set(key, key, value);
    }

    public ReadTableEntry lookup(int key) {
        return (ReadTableEntry) this.table.lookup(key, null);
    }

    public ReaderDispatch() {
        this.table = new RangeTable();
        this.kind = 5;
    }

    public ReaderDispatch(boolean nonTerminating) {
        this.table = new RangeTable();
        this.kind = nonTerminating ? 6 : 5;
    }

    public static ReaderDispatch create(ReadTable rtable) {
        ReaderDispatch tab = new ReaderDispatch();
        ReaderDispatchMisc entry = ReaderDispatchMisc.getInstance();
        tab.set(58, entry);
        tab.set(66, entry);
        tab.set(68, entry);
        tab.set(69, entry);
        tab.set(70, entry);
        tab.set(73, entry);
        tab.set(79, entry);
        tab.set(82, entry);
        tab.set(83, entry);
        tab.set(84, entry);
        tab.set(85, entry);
        tab.set(88, entry);
        tab.set(124, entry);
        tab.set(59, entry);
        tab.set(33, entry);
        tab.set(92, entry);
        tab.set(61, entry);
        tab.set(35, entry);
        tab.set(47, entry);
        tab.set(39, new ReaderQuote(rtable.makeSymbol("function")));
        tab.set(40, new ReaderVector(')'));
        tab.set(60, new ReaderXmlElement());
        return tab;
    }

    @Override // gnu.kawa.lispexpr.ReadTableEntry
    public Object read(Lexer in, int ch, int count) throws IOException, SyntaxException {
        int ch2;
        int count2 = -1;
        while (true) {
            ch2 = in.read();
            if (ch2 < 0) {
                in.eofError("unexpected EOF after " + ((char) ch2));
            }
            if (ch2 > 65536) {
                break;
            }
            int digit = Character.digit((char) ch2, 10);
            if (digit < 0) {
                ch2 = Character.toUpperCase((char) ch2);
                break;
            }
            count2 = count2 < 0 ? digit : (count2 * 10) + digit;
        }
        ReadTableEntry entry = (ReadTableEntry) this.table.lookup(ch2, null);
        if (entry == null) {
            in.error('e', in.getName(), in.getLineNumber() + 1, in.getColumnNumber(), "invalid dispatch character '" + ((char) ch2) + '\'');
            return Values.empty;
        }
        return entry.read(in, ch2, count2);
    }
}
