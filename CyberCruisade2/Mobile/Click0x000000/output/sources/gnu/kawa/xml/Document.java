package gnu.kawa.xml;

import gnu.lists.Consumer;
import gnu.lists.XConsumer;
import gnu.mapping.Location;
import gnu.mapping.ThreadLocation;
import gnu.text.Path;
import gnu.text.SourceMessages;
import gnu.text.SyntaxException;
import gnu.xml.NodeTree;
import gnu.xml.XMLParser;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.SoftReference;
import java.util.HashMap;
import java.util.Hashtable;

/* loaded from: classes2.dex */
public class Document {
    public static final Document document = new Document();
    private static ThreadLocation docMapLocation = new ThreadLocation("document-map");
    private static HashMap cache = new HashMap();

    public static void parse(Object name, Consumer out) throws Throwable {
        SourceMessages messages = new SourceMessages();
        if (out instanceof XConsumer) {
            ((XConsumer) out).beginEntity(name);
        }
        XMLParser.parse(name, messages, out);
        if (messages.seenErrors()) {
            throw new SyntaxException("document function read invalid XML", messages);
        }
        if (out instanceof XConsumer) {
            ((XConsumer) out).endEntity();
        }
    }

    public static KDocument parse(Object uri) throws Throwable {
        NodeTree tree = new NodeTree();
        parse(uri, tree);
        return new KDocument(tree, 10);
    }

    private static class DocReference extends SoftReference {
        static ReferenceQueue queue = new ReferenceQueue();
        Path key;

        public DocReference(Path key, KDocument doc) {
            super(doc, queue);
            this.key = key;
        }
    }

    public static void clearLocalCache() {
        Location loc = docMapLocation.getLocation();
        loc.set(null);
    }

    public static void clearSoftCache() {
        cache = new HashMap();
    }

    public static KDocument parseCached(Object uri) throws Throwable {
        return parseCached(Path.valueOf(uri));
    }

    public static synchronized KDocument parseCached(Path uri) throws Throwable {
        synchronized (Document.class) {
            while (true) {
                DocReference oldref = (DocReference) DocReference.queue.poll();
                if (oldref == null) {
                    break;
                }
                cache.remove(oldref.key);
            }
            Location loc = docMapLocation.getLocation();
            Hashtable map = (Hashtable) loc.get(null);
            if (map == null) {
                map = new Hashtable();
                loc.set(map);
            }
            KDocument doc = (KDocument) map.get(uri);
            if (doc != null) {
                return doc;
            }
            DocReference ref = (DocReference) cache.get(uri);
            if (ref != null) {
                KDocument doc2 = (KDocument) ref.get();
                if (doc2 == null) {
                    cache.remove(uri);
                } else {
                    map.put(uri, doc2);
                    return doc2;
                }
            }
            KDocument doc3 = parse(uri);
            map.put(uri, doc3);
            cache.put(uri, new DocReference(uri, doc3));
            return doc3;
        }
    }
}
