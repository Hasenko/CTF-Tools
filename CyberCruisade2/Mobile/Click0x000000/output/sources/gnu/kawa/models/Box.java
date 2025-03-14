package gnu.kawa.models;

import gnu.math.IntNum;
import java.awt.Dimension;
import java.io.Serializable;

/* loaded from: classes2.dex */
public abstract class Box extends Model implements Viewable, Serializable {
    Viewable cellSpacing;
    Viewable[] components;
    int numComponents;

    public abstract int getAxis();

    public Viewable getCellSpacing() {
        return this.cellSpacing;
    }

    public void setCellSpacing(Object cellSpacing) {
        if ((cellSpacing instanceof IntNum) || (cellSpacing instanceof Integer)) {
            int size = ((Number) cellSpacing).intValue();
            Dimension dim = getAxis() == 0 ? new Dimension(size, 0) : new Dimension(0, size);
            this.cellSpacing = Spacer.rigidArea(dim);
            return;
        }
        this.cellSpacing = (Viewable) cellSpacing;
    }

    public final int getComponentCount() {
        return this.numComponents;
    }

    public final Viewable getComponent(int i) {
        return this.components[i];
    }

    public void add(Viewable component) {
        Viewable[] arr = this.components;
        int n = this.numComponents;
        if (n == 0) {
            this.components = new Viewable[4];
        } else if (arr.length <= n) {
            Viewable[] viewableArr = new Viewable[n * 2];
            this.components = viewableArr;
            System.arraycopy(arr, 0, viewableArr, 0, n);
            Viewable[] arr2 = this.components;
        }
        this.components[n] = component;
        this.numComponents = n + 1;
    }

    @Override // gnu.kawa.models.Viewable
    public void makeView(Display display, Object where) {
        display.addBox(this, where);
    }
}
