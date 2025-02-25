package gnu.kawa.swingviews;

import gnu.kawa.models.Display;
import gnu.kawa.models.Paintable;
import gnu.kawa.models.Viewable;
import gnu.kawa.models.Window;
import gnu.lists.AbstractSequence;
import gnu.lists.FString;
import java.awt.Component;
import java.awt.Container;
import javax.swing.BoxLayout;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenuBar;
import javax.swing.JPanel;

/* loaded from: classes2.dex */
public class SwingFrame extends JFrame implements Window {
    SwingDisplay display;

    @Override // gnu.kawa.models.Window
    public Display getDisplay() {
        return this.display;
    }

    public SwingFrame(String title, JMenuBar menubar, Object contents) {
        if (title != null) {
            setTitle(title);
        }
        if (menubar != null) {
            setJMenuBar(menubar);
        }
        Container pane = getContentPane();
        pane.setLayout(new BoxLayout(pane, 0));
        addComponent(contents);
    }

    @Override // gnu.kawa.models.Window
    public void setContent(Object content) {
        setContentPane(new JPanel());
        addComponent(content);
        pack();
    }

    @Override // gnu.kawa.models.Window
    public void setMenuBar(Object menubar) {
        setJMenuBar((JMenuBar) menubar);
    }

    public void addComponent(Object contents) {
        if ((contents instanceof FString) || (contents instanceof String)) {
            getContentPane().add(new JLabel(contents.toString()));
            return;
        }
        if (contents instanceof AbstractSequence) {
            AbstractSequence seq = (AbstractSequence) contents;
            int iter = seq.startPos();
            while (true) {
                int nextPos = seq.nextPos(iter);
                iter = nextPos;
                if (nextPos != 0) {
                    addComponent(seq.getPosPrevious(iter));
                } else {
                    return;
                }
            }
        } else if (contents instanceof Viewable) {
            ((Viewable) contents).makeView(getDisplay(), getContentPane());
        } else if (contents instanceof Paintable) {
            getContentPane().add(new SwingPaintable((Paintable) contents));
        } else if (contents != null) {
            getContentPane().add((Component) contents);
        }
    }

    @Override // gnu.kawa.models.Window
    public void open() {
        pack();
        setVisible(true);
    }
}
