package com.google.appinventor.components.runtime.util;

import java.util.ArrayList;
import java.util.Deque;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.xml.sax.Attributes;
import org.xml.sax.helpers.DefaultHandler;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class XmlParser extends DefaultHandler {
    private static final String CONTENT_TAG = "$content";
    private YailDictionary root = null;
    private YailDictionary currentElement = null;
    private Deque<YailDictionary> stack = new LinkedList();

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void startElement(String uri, String localName, String qname, Attributes attributes) {
        YailDictionary el = new YailDictionary();
        el.put("$tag", qname);
        el.put("$namespaceUri", uri);
        el.put("$localName", localName.isEmpty() ? qname : localName);
        if (qname.contains(":")) {
            String[] parts = qname.split(":");
            el.put("$namespace", parts[0]);
        } else {
            el.put("$namespace", "");
        }
        YailDictionary attrs = new YailDictionary();
        for (int i = 0; i < attributes.getLength(); i++) {
            attrs.put(attributes.getQName(i), attributes.getValue(i));
        }
        el.put("$attributes", attrs);
        el.put(CONTENT_TAG, new ArrayList());
        YailDictionary yailDictionary = this.currentElement;
        if (yailDictionary != null) {
            ((List) yailDictionary.get(CONTENT_TAG)).add(el);
            if (!this.currentElement.containsKey(qname)) {
                this.currentElement.put(qname, new ArrayList());
            }
            ((List) this.currentElement.get(qname)).add(el);
            this.stack.push(this.currentElement);
        } else {
            this.root = el;
        }
        this.currentElement = el;
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void characters(char[] ch, int start, int length) {
        List<Object> items = (List) this.currentElement.get(CONTENT_TAG);
        if (items instanceof ArrayList) {
            String content = new String(ch, start, length).trim();
            if (!content.isEmpty()) {
                items.add(content);
            }
        }
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void endElement(String uri, String localName, String qname) {
        for (Map.Entry<Object, Object> e : this.currentElement.entrySet()) {
            if (e.getValue() instanceof ArrayList) {
                e.setValue(YailList.makeList((List) e.getValue()));
            }
        }
        if (!this.stack.isEmpty()) {
            this.currentElement = this.stack.pop();
        }
    }

    public YailDictionary getRoot() {
        return this.root;
    }
}
