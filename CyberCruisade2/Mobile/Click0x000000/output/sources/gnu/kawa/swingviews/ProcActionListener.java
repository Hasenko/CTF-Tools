package gnu.kawa.swingviews;

import gnu.mapping.Procedure;
import gnu.mapping.WrappedException;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/* compiled from: SwingDisplay.java */
/* loaded from: classes2.dex */
class ProcActionListener implements ActionListener {
    Procedure proc;

    public ProcActionListener(Procedure proc) {
        this.proc = proc;
    }

    public void actionPerformed(ActionEvent e) {
        try {
            this.proc.apply1(e);
        } catch (Throwable ex) {
            throw new WrappedException(ex);
        }
    }
}
