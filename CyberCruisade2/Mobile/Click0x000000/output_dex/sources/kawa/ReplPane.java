package kawa;

import gnu.lists.CharBuffer;
import gnu.mapping.OutPort;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import javax.swing.JTextPane;
import javax.swing.text.EditorKit;
import javax.swing.text.Element;
import javax.swing.text.MutableAttributeSet;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ReplPane extends JTextPane implements KeyListener {
    ReplDocument document;
    public static final String ViewableElementName = "Viewable";
    public static final Object ViewableAttribute = new String(ViewableElementName);
    public static final String PaintableElementName = "Paintable";
    public static final Object PaintableAttribute = new String(PaintableElementName);

    public ReplPane(ReplDocument document) {
        super(document);
        this.document = document;
        document.pane = this;
        document.paneCount++;
        addKeyListener(this);
        addFocusListener(document);
        getEditorKit();
        setCaretPosition(document.outputMark);
    }

    protected EditorKit createDefaultEditorKit() {
        return new ReplEditorKit(this);
    }

    public void removeNotify() {
        super.removeNotify();
        ReplDocument replDocument = this.document;
        int i = replDocument.paneCount - 1;
        replDocument.paneCount = i;
        if (i == 0) {
            this.document.close();
        }
    }

    void enter() {
        String str;
        int pos = getCaretPosition();
        CharBuffer b = this.document.content.buffer;
        int len = b.length() - 1;
        this.document.endMark = -1;
        if (pos >= this.document.outputMark) {
            int lineAfterCaret = b.indexOf(10, pos);
            if (lineAfterCaret == len) {
                if (len > this.document.outputMark && b.charAt(len - 1) == '\n') {
                    lineAfterCaret--;
                } else {
                    this.document.insertString(len, "\n", null);
                }
            }
            this.document.endMark = lineAfterCaret;
            synchronized (this.document.in_r) {
                this.document.in_r.notifyAll();
            }
            if (pos <= lineAfterCaret) {
                setCaretPosition(lineAfterCaret + 1);
                return;
            }
            return;
        }
        int lineBefore = pos == 0 ? 0 : b.lastIndexOf(10, pos - 1) + 1;
        Element el = this.document.getCharacterElement(lineBefore);
        int lineAfter = b.indexOf(10, pos);
        if (el.getAttributes().isEqual(ReplDocument.promptStyle)) {
            lineBefore = el.getEndOffset();
        }
        if (lineAfter < 0) {
            str = b.substring(lineBefore, len) + '\n';
        } else {
            str = b.substring(lineBefore, lineAfter + 1);
        }
        setCaretPosition(this.document.outputMark);
        this.document.write(str, ReplDocument.inputStyle);
        if (this.document.in_r != null) {
            this.document.in_r.append((CharSequence) str, 0, str.length());
        }
    }

    public MutableAttributeSet getInputAttributes() {
        return ReplDocument.inputStyle;
    }

    public void keyPressed(KeyEvent e) {
        int code = e.getKeyCode();
        if (code == 10) {
            enter();
            e.consume();
        }
    }

    public void keyReleased(KeyEvent e) {
    }

    public void keyTyped(KeyEvent e) {
    }

    public OutPort getStdout() {
        return this.document.out_stream;
    }

    public OutPort getStderr() {
        return this.document.err_stream;
    }
}
