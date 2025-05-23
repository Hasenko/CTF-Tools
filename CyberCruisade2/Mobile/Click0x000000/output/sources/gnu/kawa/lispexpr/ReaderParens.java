package gnu.kawa.lispexpr;

import gnu.text.Lexer;
import gnu.text.LineBufferedReader;
import gnu.text.SyntaxException;
import java.io.IOException;

/* loaded from: classes.dex */
public class ReaderParens extends ReadTableEntry {
    private static ReaderParens instance;
    char close;
    Object command;
    int kind;
    char open;

    @Override // gnu.kawa.lispexpr.ReadTableEntry
    public int getKind() {
        return this.kind;
    }

    public static ReaderParens getInstance(char open, char close) {
        return getInstance(open, close, 5);
    }

    public static ReaderParens getInstance(char open, char close, int kind) {
        if (open == '(' && close == ')' && kind == 5) {
            if (instance == null) {
                instance = new ReaderParens(open, close, kind, null);
            }
            return instance;
        }
        return new ReaderParens(open, close, kind, null);
    }

    public static ReaderParens getInstance(char open, char close, int kind, Object command) {
        if (command == null) {
            return getInstance(open, close, kind);
        }
        return new ReaderParens(open, close, kind, command);
    }

    public ReaderParens(char open, char close, int kind, Object command) {
        this.open = open;
        this.close = close;
        this.kind = kind;
        this.command = command;
    }

    @Override // gnu.kawa.lispexpr.ReadTableEntry
    public Object read(Lexer in, int ch, int count) throws IOException, SyntaxException {
        Object r = readList((LispReader) in, ch, count, this.close);
        if (this.command != null) {
            LineBufferedReader port = in.getPort();
            int startLine = port.getLineNumber();
            int startColumn = port.getColumnNumber();
            Object p = ((LispReader) in).makePair(this.command, startLine, startColumn);
            ((LispReader) in).setCdr(p, r);
            return p;
        }
        return r;
    }

    /* JADX WARN: Code restructure failed: missing block: B:59:0x007f, code lost:
    
        r18.error("unexpected '" + ((char) r2) + "' after '.'");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Object readList(gnu.kawa.lispexpr.LispReader r18, int r19, int r20, int r21) throws java.io.IOException, gnu.text.SyntaxException {
        /*
            Method dump skipped, instructions count: 277
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: gnu.kawa.lispexpr.ReaderParens.readList(gnu.kawa.lispexpr.LispReader, int, int, int):java.lang.Object");
    }
}
