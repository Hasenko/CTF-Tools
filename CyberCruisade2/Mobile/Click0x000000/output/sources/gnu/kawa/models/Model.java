package gnu.kawa.models;

/* loaded from: classes2.dex */
public abstract class Model implements Viewable {
    transient WeakListener listeners;

    public void addListener(ModelListener listener) {
        this.listeners = new WeakListener(listener, this.listeners);
    }

    public void addListener(WeakListener listener) {
        listener.next = this.listeners;
        this.listeners = listener;
    }

    public void notifyListeners(String key) {
        WeakListener prev = null;
        WeakListener wlistener = this.listeners;
        while (wlistener != null) {
            Object listener = wlistener.get();
            WeakListener next = wlistener.next;
            if (listener == null) {
                if (prev != null) {
                    prev.next = next;
                }
            } else {
                prev = wlistener;
                wlistener.update(listener, this, key);
            }
            wlistener = next;
        }
    }
}
