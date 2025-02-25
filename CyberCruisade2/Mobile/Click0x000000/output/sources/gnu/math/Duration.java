package gnu.math;

import gnu.bytecode.Access;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

/* loaded from: classes.dex */
public class Duration extends Quantity implements Externalizable {
    int months;
    int nanos;
    long seconds;
    public Unit unit;

    public static Duration make(int months, long seconds, int nanos, Unit unit) {
        Duration d = new Duration();
        d.months = months;
        d.seconds = seconds;
        d.nanos = nanos;
        d.unit = unit;
        return d;
    }

    public static Duration makeMonths(int months) {
        Duration d = new Duration();
        d.unit = Unit.month;
        d.months = months;
        return d;
    }

    public static Duration makeMinutes(int minutes) {
        Duration d = new Duration();
        d.unit = Unit.second;
        d.seconds = minutes * 60;
        return d;
    }

    public static Duration parse(String str, Unit unit) {
        Duration d = valueOf(str, unit);
        if (d == null) {
            throw new IllegalArgumentException("not a valid " + unit.getName() + " duration: '" + str + "'");
        }
        return d;
    }

    public static Duration parseDuration(String str) {
        return parse(str, Unit.duration);
    }

    public static Duration parseYearMonthDuration(String str) {
        return parse(str, Unit.month);
    }

    public static Duration parseDayTimeDuration(String str) {
        return parse(str, Unit.second);
    }

    public static Duration valueOf(String str, Unit unit) {
        boolean negative;
        int nanos;
        char ch;
        long part;
        int nanos2;
        String str2 = str.trim();
        int pos = 0;
        int len = str2.length();
        if (0 < len && str2.charAt(0) == '-') {
            negative = true;
            pos = 0 + 1;
        } else {
            negative = false;
        }
        if (pos + 1 >= len || str2.charAt(pos) != 'P') {
            return null;
        }
        int months = 0;
        long seconds = 0;
        long part2 = scanPart(str2, pos + 1);
        int pos2 = ((int) part2) >> 16;
        char ch2 = (char) part2;
        if (unit == Unit.second && (ch2 == 'Y' || ch2 == 'M')) {
            return null;
        }
        if (ch2 != 'Y') {
            nanos = 0;
        } else {
            nanos = 0;
            months = ((int) (part2 >> 32)) * 12;
            pos2 = ((int) part2) >> 16;
            part2 = scanPart(str2, pos2);
            ch2 = (char) part2;
        }
        if (ch2 == 'M') {
            months = (int) (months + (part2 >> 32));
            pos2 = ((int) part2) >> 16;
            part2 = scanPart(str2, pos2);
            ch2 = (char) part2;
        }
        if (unit == Unit.month && pos2 != len) {
            return null;
        }
        if (ch2 == 'D') {
            if (unit == Unit.month) {
                return null;
            }
            seconds = ((int) (part2 >> 32)) * 86400;
            pos2 = ((int) part2) >> 16;
            part2 = scanPart(str2, pos2);
        }
        if (part2 != (pos2 << 16)) {
            return null;
        }
        if (pos2 == len) {
            nanos2 = nanos;
        } else {
            if (str2.charAt(pos2) != 'T' || (pos2 = pos2 + 1) == len || unit == Unit.month) {
                return null;
            }
            long part3 = scanPart(str2, pos2);
            char ch3 = (char) part3;
            if (ch3 == 'H') {
                seconds += ((int) (part3 >> 32)) * 3600;
                pos2 = ((int) part3) >> 16;
                part3 = scanPart(str2, pos2);
                ch3 = (char) part3;
            }
            if (ch3 != 'M') {
                ch = ch3;
                part = part3;
            } else {
                seconds += ((int) (part3 >> 32)) * 60;
                pos2 = ((int) part3) >> 16;
                long part4 = scanPart(str2, pos2);
                ch = (char) part4;
                part = part4;
            }
            if (ch == 'S' || ch == '.') {
                seconds += (int) (part >> 32);
                pos2 = ((int) part) >> 16;
            }
            if (ch == '.' && pos2 + 1 < len && Character.digit(str2.charAt(pos2), 10) >= 0) {
                int nfrac = 0;
                while (true) {
                    if (pos2 >= len) {
                        nanos2 = nanos;
                        break;
                    }
                    int pos3 = pos2 + 1;
                    ch = str2.charAt(pos2);
                    int dig = Character.digit(ch, 10);
                    if (dig < 0) {
                        nanos2 = nanos;
                        pos2 = pos3;
                        break;
                    }
                    if (nfrac < 9) {
                        nanos = (nanos * 10) + dig;
                    } else if (nfrac == 9 && dig >= 5) {
                        nanos++;
                    }
                    nfrac++;
                    pos2 = pos3;
                }
                while (true) {
                    int nanos3 = nfrac + 1;
                    if (nfrac >= 9) {
                        break;
                    }
                    nanos2 *= 10;
                    nfrac = nanos3;
                }
                if (ch != 'S') {
                    return null;
                }
            } else {
                nanos2 = nanos;
            }
        }
        if (pos2 != len) {
            return null;
        }
        Duration d = new Duration();
        if (negative) {
            months = -months;
            seconds = -seconds;
            nanos2 = -nanos2;
        }
        d.months = months;
        d.seconds = seconds;
        d.nanos = nanos2;
        d.unit = unit;
        return d;
    }

    @Override // gnu.math.Quantity, gnu.math.Numeric
    public Numeric add(Object y, int k) {
        if (y instanceof Duration) {
            return add(this, (Duration) y, k);
        }
        if ((y instanceof DateTime) && k == 1) {
            return DateTime.add((DateTime) y, this, 1);
        }
        throw new IllegalArgumentException();
    }

    @Override // gnu.math.Quantity, gnu.math.Numeric
    public Numeric mul(Object y) {
        if (y instanceof RealNum) {
            return times(this, ((RealNum) y).doubleValue());
        }
        return ((Numeric) y).mulReversed(this);
    }

    @Override // gnu.math.Quantity, gnu.math.Numeric
    public Numeric mulReversed(Numeric x) {
        if (!(x instanceof RealNum)) {
            throw new IllegalArgumentException();
        }
        return times(this, ((RealNum) x).doubleValue());
    }

    public static double div(Duration dur1, Duration dur2) {
        int months1 = dur1.months;
        int months2 = dur2.months;
        double d = dur1.seconds;
        int i = dur1.nanos;
        double d2 = i;
        Double.isNaN(d2);
        Double.isNaN(d);
        double sec1 = d + (d2 * 1.0E-9d);
        double d3 = dur2.seconds;
        double d4 = i;
        Double.isNaN(d4);
        Double.isNaN(d3);
        double sec2 = d3 + (d4 * 1.0E-9d);
        if (months2 == 0 && sec2 == 0.0d) {
            throw new ArithmeticException("divide duration by zero");
        }
        if (months2 == 0) {
            if (months1 == 0) {
                return sec1 / sec2;
            }
        } else if (sec2 == 0.0d && sec1 == 0.0d) {
            double d5 = months1;
            double d6 = months2;
            Double.isNaN(d5);
            Double.isNaN(d6);
            return d5 / d6;
        }
        throw new ArithmeticException("divide of incompatible durations");
    }

    @Override // gnu.math.Quantity, gnu.math.Numeric
    public Numeric div(Object y) {
        if (y instanceof RealNum) {
            double dy = ((RealNum) y).doubleValue();
            if (dy == 0.0d || Double.isNaN(dy)) {
                throw new ArithmeticException("divide of duration by 0 or NaN");
            }
            return times(this, 1.0d / dy);
        }
        if (y instanceof Duration) {
            return new DFloNum(div(this, (Duration) y));
        }
        return ((Numeric) y).divReversed(this);
    }

    public static Duration add(Duration x, Duration y, int k) {
        long months = x.months + (k * y.months);
        long nanos = (x.seconds * 1000000000) + x.nanos + (k * ((y.seconds * 1000000000) + y.nanos));
        Duration d = new Duration();
        d.months = (int) months;
        d.seconds = (int) (nanos / 1000000000);
        d.nanos = (int) (nanos % 1000000000);
        Unit unit = x.unit;
        if (unit != y.unit || unit == Unit.duration) {
            throw new ArithmeticException("cannot add these duration types");
        }
        d.unit = x.unit;
        return d;
    }

    public static Duration times(Duration x, double y) {
        if (x.unit == Unit.duration) {
            throw new IllegalArgumentException("cannot multiply general duration");
        }
        double d = x.months;
        Double.isNaN(d);
        double months = d * y;
        if (Double.isInfinite(months) || Double.isNaN(months)) {
            throw new ArithmeticException("overflow/NaN when multiplying a duration");
        }
        double d2 = (x.seconds * 1000000000) + x.nanos;
        Double.isNaN(d2);
        double nanos = d2 * y;
        Duration d3 = new Duration();
        d3.months = (int) Math.floor(0.5d + months);
        d3.seconds = (int) (nanos / 1.0E9d);
        d3.nanos = (int) (nanos % 1.0E9d);
        d3.unit = x.unit;
        return d3;
    }

    public static int compare(Duration x, Duration y) {
        long months = x.months - y.months;
        long nanos = ((x.seconds * 1000000000) + x.nanos) - ((y.seconds * 1000000000) + y.nanos);
        if (months < 0 && nanos <= 0) {
            return -1;
        }
        if (months > 0 && nanos >= 0) {
            return 1;
        }
        if (months != 0) {
            return -2;
        }
        if (nanos < 0) {
            return -1;
        }
        return nanos > 0 ? 1 : 0;
    }

    @Override // gnu.math.Quantity, gnu.math.Numeric
    public int compare(Object obj) {
        if (obj instanceof Duration) {
            return compare(this, (Duration) obj);
        }
        throw new IllegalArgumentException();
    }

    @Override // gnu.math.Numeric
    public String toString() {
        StringBuffer sbuf = new StringBuffer();
        int m = this.months;
        long s = this.seconds;
        int n = this.nanos;
        boolean neg = m < 0 || s < 0 || n < 0;
        if (neg) {
            m = -m;
            s = -s;
            n = -n;
            sbuf.append('-');
        }
        sbuf.append('P');
        int y = m / 12;
        if (y != 0) {
            sbuf.append(y);
            sbuf.append('Y');
            m -= y * 12;
        }
        if (m != 0) {
            sbuf.append(m);
            sbuf.append(Access.METHOD_CONTEXT);
        }
        long d = s / 86400;
        if (d != 0) {
            sbuf.append(d);
            sbuf.append('D');
            s -= 86400 * d;
        }
        if (s == 0 && n == 0) {
            if (sbuf.length() == 1) {
                sbuf.append(this.unit == Unit.month ? "0M" : "T0S");
            }
        } else {
            sbuf.append('T');
            long hr = s / 3600;
            if (hr != 0) {
                sbuf.append(hr);
                sbuf.append('H');
                s -= 3600 * hr;
            }
            long mn = s / 60;
            if (mn != 0) {
                sbuf.append(mn);
                sbuf.append(Access.METHOD_CONTEXT);
                s -= 60 * mn;
            }
            if (s != 0 || n != 0) {
                sbuf.append(s);
                appendNanoSeconds(n, sbuf);
                sbuf.append('S');
            }
        }
        return sbuf.toString();
    }

    static void appendNanoSeconds(int nanoSeconds, StringBuffer sbuf) {
        if (nanoSeconds == 0) {
            return;
        }
        sbuf.append('.');
        int pos = sbuf.length();
        sbuf.append(nanoSeconds);
        int len = sbuf.length();
        int pad = (pos + 9) - len;
        while (true) {
            pad--;
            if (pad < 0) {
                break;
            } else {
                sbuf.insert(pos, '0');
            }
        }
        int len2 = pos + 9;
        do {
            len2--;
        } while (sbuf.charAt(len2) == '0');
        sbuf.setLength(len2 + 1);
    }

    private static long scanPart(String str, int start) {
        int i = start;
        long val = -1;
        int len = str.length();
        while (i < len) {
            char ch = str.charAt(i);
            i++;
            int dig = Character.digit(ch, 10);
            if (dig < 0) {
                return val < 0 ? start << 16 : (val << 32) | (i << 16) | ch;
            }
            val = val < 0 ? dig : (10 * val) + dig;
            if (val > 2147483647L) {
                return -1L;
            }
        }
        if (val < 0) {
            return start << 16;
        }
        return -1L;
    }

    public int getYears() {
        return this.months / 12;
    }

    public int getMonths() {
        return this.months % 12;
    }

    public int getDays() {
        return (int) (this.seconds / 86400);
    }

    public int getHours() {
        return (int) ((this.seconds / 3600) % 24);
    }

    public int getMinutes() {
        return (int) ((this.seconds / 60) % 60);
    }

    public int getSecondsOnly() {
        return (int) (this.seconds % 60);
    }

    public int getNanoSecondsOnly() {
        return this.nanos;
    }

    public int getTotalMonths() {
        return this.months;
    }

    public long getTotalSeconds() {
        return this.seconds;
    }

    public long getTotalMinutes() {
        return this.seconds / 60;
    }

    public long getNanoSeconds() {
        return (this.seconds * 1000000000) + this.nanos;
    }

    @Override // gnu.math.Numeric
    public boolean isZero() {
        return this.months == 0 && this.seconds == 0 && this.nanos == 0;
    }

    @Override // gnu.math.Numeric
    public boolean isExact() {
        return false;
    }

    @Override // java.io.Externalizable
    public void writeExternal(ObjectOutput out) throws IOException {
        out.writeInt(this.months);
        out.writeLong(this.seconds);
        out.writeInt(this.nanos);
        out.writeObject(this.unit);
    }

    @Override // java.io.Externalizable
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        this.months = in.readInt();
        this.seconds = in.readLong();
        this.nanos = in.readInt();
        this.unit = (Unit) in.readObject();
    }

    @Override // gnu.math.Quantity
    public Unit unit() {
        return this.unit;
    }

    @Override // gnu.math.Quantity
    public Complex number() {
        throw new Error("number needs to be implemented!");
    }

    public int hashCode() {
        return (this.months ^ ((int) this.seconds)) ^ this.nanos;
    }

    public static boolean equals(Duration x, Duration y) {
        return x.months == y.months && x.seconds == y.seconds && x.nanos == y.nanos;
    }

    @Override // gnu.math.Numeric
    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof Duration)) {
            return false;
        }
        return equals(this, (Duration) obj);
    }
}
