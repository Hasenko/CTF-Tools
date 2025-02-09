package kawa;

import javax.swing.text.StyledEditorKit;
import javax.swing.text.ViewFactory;

/* compiled from: ReplPane.java */
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class ReplEditorKit extends StyledEditorKit {
    ViewFactory factory;
    final ReplPane pane;
    ViewFactory styledFactory = super.getViewFactory();

    public ReplEditorKit(ReplPane pane) {
        this.pane = pane;
        this.factory = new 1(this, pane);
    }

    public ViewFactory getViewFactory() {
        return this.factory;
    }
}
