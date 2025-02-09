package gnu.text;

import java.io.Writer;
import java.lang.ref.WeakReference;

/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: WriterManager.java */
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class WriterRef extends WeakReference {
    WriterRef next;
    WriterRef prev;

    public WriterRef(Writer wr) {
        super(wr);
    }
}
