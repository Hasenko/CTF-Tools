package gnu.text;

import org.xml.sax.Locator;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public interface SourceLocator extends Locator {
    @Override // org.xml.sax.Locator
    int getColumnNumber();

    String getFileName();

    @Override // org.xml.sax.Locator
    int getLineNumber();

    @Override // org.xml.sax.Locator
    String getPublicId();

    @Override // org.xml.sax.Locator
    String getSystemId();

    boolean isStableSourceLocation();
}
