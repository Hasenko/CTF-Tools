package gnu.kawa.lispexpr;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ReaderMisc extends ReadTableEntry {
    int kind;

    public ReaderMisc(int kind) {
        this.kind = kind;
    }

    @Override // gnu.kawa.lispexpr.ReadTableEntry
    public int getKind() {
        return this.kind;
    }
}
