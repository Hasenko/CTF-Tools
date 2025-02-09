package gnu.text;

import java.net.URI;

/* compiled from: URIPath.java */
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class URIStringPath extends URIPath {
    String uriString;

    @Override // gnu.text.URIPath, gnu.text.Path
    public String toURIString() {
        return this.uriString;
    }

    public URIStringPath(URI uri, String uriString) {
        super(uri);
        this.uriString = uriString;
    }
}
