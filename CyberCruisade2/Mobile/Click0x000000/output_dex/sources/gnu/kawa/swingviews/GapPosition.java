package gnu.kawa.swingviews;

import gnu.lists.CharBuffer;
import gnu.lists.SeqPosition;
import javax.swing.text.Position;

/* compiled from: SwingContent.java */
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class GapPosition extends SeqPosition implements Position {
    public GapPosition(CharBuffer content, int offset) {
        super(content, offset, offset != 0);
    }

    public int getOffset() {
        return nextIndex();
    }
}
