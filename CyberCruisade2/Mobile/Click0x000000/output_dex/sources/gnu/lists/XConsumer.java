package gnu.lists;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public interface XConsumer extends Consumer {
    void beginEntity(Object obj);

    void endEntity();

    void writeCDATA(char[] cArr, int i, int i2);

    void writeComment(char[] cArr, int i, int i2);

    void writeProcessingInstruction(String str, char[] cArr, int i, int i2);
}
