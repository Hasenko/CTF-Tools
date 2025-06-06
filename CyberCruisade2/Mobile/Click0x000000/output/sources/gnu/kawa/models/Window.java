package gnu.kawa.models;

/* loaded from: classes2.dex */
public interface Window {
    Display getDisplay();

    String getTitle();

    void open();

    void setContent(Object obj);

    void setMenuBar(Object obj);

    void setTitle(String str);
}
