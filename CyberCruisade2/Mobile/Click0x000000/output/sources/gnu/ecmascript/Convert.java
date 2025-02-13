package gnu.ecmascript;

/* loaded from: classes2.dex */
public class Convert {
    public static double toNumber(Object x) {
        if (x instanceof Number) {
            return ((Number) x).doubleValue();
        }
        if (x instanceof Boolean) {
            return ((Boolean) x).booleanValue() ? 1.0d : 0.0d;
        }
        if (!(x instanceof String)) {
            return Double.NaN;
        }
        try {
            return Double.valueOf((String) x).doubleValue();
        } catch (NumberFormatException e) {
            return Double.NaN;
        }
    }

    public static double toInteger(double x) {
        if (Double.isNaN(x)) {
            return 0.0d;
        }
        return x < 0.0d ? Math.ceil(x) : Math.floor(x);
    }

    public static double toInteger(Object x) {
        return toInteger(toNumber(x));
    }

    public int toInt32(double x) {
        if (Double.isNaN(x) || Double.isInfinite(x)) {
            return 0;
        }
        return (int) x;
    }

    public int toInt32(Object x) {
        return toInt32(toNumber(x));
    }
}
