package gnu.lists;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class VoidConsumer extends FilterConsumer {
    public static VoidConsumer instance = new VoidConsumer();

    public static VoidConsumer getInstance() {
        return instance;
    }

    public VoidConsumer() {
        super(null);
        this.skipping = true;
    }

    @Override // gnu.lists.FilterConsumer, gnu.lists.Consumer
    public boolean ignoring() {
        return true;
    }
}
