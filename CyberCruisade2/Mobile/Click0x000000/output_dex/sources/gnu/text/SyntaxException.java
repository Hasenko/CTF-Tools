package gnu.text;

import java.io.PrintWriter;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class SyntaxException extends Exception {
    String header;
    public int maxToPrint = 10;
    SourceMessages messages;

    public SyntaxException(SourceMessages messages) {
        this.messages = messages;
    }

    public SyntaxException(String header, SourceMessages messages) {
        this.header = header;
        this.messages = messages;
    }

    public final String getHeader() {
        return this.header;
    }

    public final void setHeader(String header) {
        this.header = header;
    }

    public SourceMessages getMessages() {
        return this.messages;
    }

    public void printAll(PrintWriter out, int max) {
        String str = this.header;
        if (str != null) {
            out.println(str);
        }
        this.messages.printAll(out, max);
    }

    public void clear() {
        this.messages.clear();
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        StringBuffer buffer = new StringBuffer();
        String str = this.header;
        if (str != null) {
            buffer.append(str);
        }
        int max = this.maxToPrint;
        for (SourceError err = this.messages.firstError; err != null; err = err.next) {
            max--;
            if (max < 0) {
                break;
            }
            buffer.append('\n');
            buffer.append(err);
        }
        return buffer.toString();
    }
}
