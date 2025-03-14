package gnu.xquery.util;

import androidx.appcompat.widget.ActivityChooserView;
import androidx.core.location.LocationRequestCompat;
import gnu.kawa.functions.Arithmetic;
import gnu.kawa.xml.KNode;
import gnu.kawa.xml.UntypedAtomic;
import gnu.kawa.xml.XDataType;
import gnu.kawa.xml.XIntegerType;
import gnu.mapping.Procedure1;
import gnu.mapping.Values;
import gnu.math.DFloNum;
import gnu.math.IntNum;
import gnu.math.Numeric;
import gnu.math.RealNum;
import gnu.xml.TextUtils;
import java.math.BigDecimal;

/* loaded from: classes2.dex */
public class NumberValue extends Procedure1 {
    public static final NumberValue numberValue = new NumberValue();
    public static final Double NaN = new Double(Double.NaN);

    public static boolean isNaN(Object arg) {
        return ((arg instanceof Double) || (arg instanceof Float) || (arg instanceof DFloNum)) && Double.isNaN(((Number) arg).doubleValue());
    }

    @Override // gnu.mapping.Procedure1, gnu.mapping.Procedure
    public Object apply1(Object arg) {
        if (arg != Values.empty && arg != null) {
            try {
                return numberValue(arg);
            } catch (Throwable th) {
            }
        }
        return NaN;
    }

    public static Number numberCast(Object value) {
        if (value == Values.empty || value == null) {
            return null;
        }
        if (value instanceof Values) {
            Values vals = (Values) value;
            int ipos = vals.startPos();
            int count = 0;
            while (true) {
                int nextPos = vals.nextPos(ipos);
                ipos = nextPos;
                if (nextPos == 0) {
                    break;
                }
                if (count > 0) {
                    throw new ClassCastException("non-singleton sequence cast to number");
                }
                value = vals.getPosPrevious(ipos);
                count++;
            }
        }
        if ((value instanceof KNode) || (value instanceof UntypedAtomic)) {
            return (Double) XDataType.doubleType.valueOf(TextUtils.stringValue(value));
        }
        return (Number) value;
    }

    public static Object numberValue(Object value) {
        double d;
        Object value2 = KNode.atomicValue(value);
        if ((value2 instanceof UntypedAtomic) || (value2 instanceof String)) {
            try {
                return XDataType.doubleType.valueOf(TextUtils.stringValue(value2));
            } catch (Throwable th) {
                d = Double.NaN;
            }
        } else if ((value2 instanceof Number) && ((value2 instanceof RealNum) || !(value2 instanceof Numeric))) {
            d = ((Number) value2).doubleValue();
        } else {
            d = Double.NaN;
        }
        return XDataType.makeDouble(d);
    }

    public static Object abs(Object value) {
        if (value == null || value == Values.empty) {
            return value;
        }
        Object value2 = numberCast(value);
        if (value2 instanceof Double) {
            Double d = (Double) value2;
            double x = d.doubleValue();
            long bits = Double.doubleToRawLongBits(x);
            if (bits >= 0) {
                return d;
            }
            double x2 = Double.longBitsToDouble(bits & LocationRequestCompat.PASSIVE_INTERVAL);
            return Double.valueOf(x2);
        }
        if (value2 instanceof Float) {
            Float d2 = (Float) value2;
            float x3 = d2.floatValue();
            int bits2 = Float.floatToRawIntBits(x3);
            if (bits2 >= 0) {
                return d2;
            }
            float x4 = Float.intBitsToFloat(bits2 & ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
            return Float.valueOf(x4);
        }
        if (value2 instanceof BigDecimal) {
            BigDecimal dec = (BigDecimal) value2;
            if (dec.signum() < 0) {
                return dec.negate();
            }
            return dec;
        }
        return ((Numeric) value2).abs();
    }

    public static Object floor(Object val) {
        Number value = numberCast(val);
        if (value == null) {
            return val;
        }
        if (value instanceof Double) {
            return XDataType.makeDouble(Math.floor(((Double) value).doubleValue()));
        }
        if (value instanceof Float) {
            return XDataType.makeFloat((float) Math.floor(((Float) value).floatValue()));
        }
        if (value instanceof BigDecimal) {
            BigDecimal dec = (BigDecimal) value;
            return Arithmetic.asIntNum(dec.divide(XDataType.DECIMAL_ONE, 0, 3).toBigInteger());
        }
        return ((RealNum) value).toInt(1);
    }

    public static Object ceiling(Object val) {
        Number value = numberCast(val);
        if (value == null) {
            return val;
        }
        if (value instanceof Double) {
            return XDataType.makeDouble(Math.ceil(((Double) value).doubleValue()));
        }
        if (value instanceof Float) {
            return XDataType.makeFloat((float) Math.ceil(((Float) value).floatValue()));
        }
        if (value instanceof BigDecimal) {
            BigDecimal dec = (BigDecimal) value;
            return Arithmetic.asIntNum(dec.divide(XDataType.DECIMAL_ONE, 0, 2).toBigInteger());
        }
        return ((RealNum) value).toInt(2);
    }

    public static Object round(Object arg) {
        float val;
        double val2;
        Number value = numberCast(arg);
        if (value == null) {
            return arg;
        }
        if (value instanceof Double) {
            double val3 = ((Double) value).doubleValue();
            if (val3 >= -0.5d && val3 <= 0.0d && (val3 < 0.0d || Double.doubleToLongBits(val3) < 0)) {
                val2 = -0.0d;
            } else {
                val2 = Math.floor(0.5d + val3);
            }
            return XDataType.makeDouble(val2);
        }
        if (value instanceof Float) {
            float val4 = ((Float) value).floatValue();
            if (val4 >= -0.5d && val4 <= 0.0d && (val4 < 0.0d || Float.floatToIntBits(val4) < 0)) {
                val = -0.0f;
            } else {
                double d = val4;
                Double.isNaN(d);
                val = (float) Math.floor(d + 0.5d);
            }
            return XDataType.makeFloat(val);
        }
        if (value instanceof BigDecimal) {
            BigDecimal dec = (BigDecimal) value;
            int mode = dec.signum() < 0 ? 5 : 4;
            return Arithmetic.asIntNum(dec.divide(XDataType.DECIMAL_ONE, 0, mode).toBigInteger());
        }
        return ((RealNum) value).toInt(4);
    }

    public static Object roundHalfToEven(Object value, IntNum precision) {
        Number number = numberCast(value);
        if (number == null) {
            return value;
        }
        if ((value instanceof Double) || (value instanceof Float)) {
            double v = ((Number) value).doubleValue();
            if (v == 0.0d || Double.isInfinite(v) || Double.isNaN(v)) {
                return value;
            }
        }
        BigDecimal dec = (BigDecimal) XDataType.decimalType.cast(number);
        int prec = precision.intValue();
        BigDecimal dec2 = dec.setScale(prec, 6);
        if (number instanceof Double) {
            return XDataType.makeDouble(dec2.doubleValue());
        }
        if (number instanceof Float) {
            return XDataType.makeFloat(dec2.floatValue());
        }
        if (number instanceof IntNum) {
            return XIntegerType.integerType.cast(dec2);
        }
        return dec2;
    }

    public static Object roundHalfToEven(Object value) {
        return roundHalfToEven(value, IntNum.zero());
    }
}
