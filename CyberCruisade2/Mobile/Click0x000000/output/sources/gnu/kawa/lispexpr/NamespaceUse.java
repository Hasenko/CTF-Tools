package gnu.kawa.lispexpr;

import gnu.mapping.Namespace;

/* compiled from: LispPackage.java */
/* loaded from: classes2.dex */
class NamespaceUse {
    Namespace imported;
    Namespace importing;
    NamespaceUse nextImported;
    NamespaceUse nextImporting;

    NamespaceUse() {
    }
}
