package gnu.mapping;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class PropertyKey<T> {
    String name;

    public PropertyKey(String name) {
        this.name = name;
    }

    public T get(PropertySet propertySet, T t) {
        return (T) propertySet.getProperty(this, t);
    }

    public final T get(PropertySet container) {
        return get(container, null);
    }

    public void set(PropertySet container, T value) {
        container.setProperty(this, value);
    }
}
