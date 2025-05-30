package gnu.math;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class Dimensions {
    BaseUnit[] bases;
    private Dimensions chain;
    int hash_code;
    short[] powers;
    private static Dimensions[] hashTable = new Dimensions[100];
    public static Dimensions Empty = new Dimensions();

    public final int hashCode() {
        return this.hash_code;
    }

    private void enterHash(int hash_code) {
        this.hash_code = hash_code;
        Dimensions[] dimensionsArr = hashTable;
        int index = (Integer.MAX_VALUE & hash_code) % dimensionsArr.length;
        this.chain = dimensionsArr[index];
        dimensionsArr[index] = this;
    }

    private Dimensions() {
        this.bases = new BaseUnit[]{Unit.Empty};
        enterHash(0);
    }

    Dimensions(BaseUnit unit) {
        this.bases = new BaseUnit[]{unit, Unit.Empty};
        this.powers = new short[1];
        this.powers[0] = 1;
        enterHash(unit.index);
    }

    private Dimensions(Dimensions a, int mul_a, Dimensions b, int mul_b, int hash_code) {
        int pow;
        this.hash_code = hash_code;
        int a_i = 0;
        while (a.bases[a_i] != Unit.Empty) {
            a_i++;
        }
        int b_i = 0;
        while (b.bases[b_i] != Unit.Empty) {
            b_i++;
        }
        int t_i = a_i + b_i + 1;
        this.bases = new BaseUnit[t_i];
        this.powers = new short[t_i];
        int t_i2 = 0;
        int b_i2 = 0;
        int a_i2 = 0;
        while (true) {
            BaseUnit a_base = a.bases[a_i2];
            BaseUnit b_base = b.bases[b_i2];
            if (a_base.index < b_base.index) {
                pow = a.powers[a_i2] * mul_a;
                a_i2++;
            } else {
                int pow2 = b_base.index;
                if (pow2 < a_base.index) {
                    a_base = b_base;
                    pow = b.powers[b_i2] * mul_b;
                    b_i2++;
                } else if (b_base != Unit.Empty) {
                    pow = (a.powers[a_i2] * mul_a) + (b.powers[b_i2] * mul_b);
                    a_i2++;
                    b_i2++;
                    if (pow == 0) {
                        continue;
                    }
                } else {
                    this.bases[t_i2] = Unit.Empty;
                    enterHash(hash_code);
                    return;
                }
            }
            if (((short) pow) != pow) {
                throw new ArithmeticException("overflow in dimensions");
            }
            this.bases[t_i2] = a_base;
            this.powers[t_i2] = (short) pow;
            t_i2++;
        }
    }

    private boolean matchesProduct(Dimensions a, int mul_a, Dimensions b, int mul_b) {
        int pow;
        int a_i = 0;
        int b_i = 0;
        int t_i = 0;
        while (true) {
            BaseUnit a_base = a.bases[a_i];
            BaseUnit b_base = b.bases[b_i];
            if (a_base.index < b_base.index) {
                pow = a.powers[a_i] * mul_a;
                a_i++;
            } else {
                int pow2 = b_base.index;
                if (pow2 < a_base.index) {
                    a_base = b_base;
                    pow = b.powers[b_i] * mul_b;
                    b_i++;
                } else {
                    if (b_base == Unit.Empty) {
                        return this.bases[t_i] == b_base;
                    }
                    pow = (a.powers[a_i] * mul_a) + (b.powers[b_i] * mul_b);
                    a_i++;
                    b_i++;
                    if (pow == 0) {
                        continue;
                    }
                }
            }
            if (this.bases[t_i] != a_base || this.powers[t_i] != pow) {
                break;
            }
            t_i++;
        }
        return false;
    }

    public static Dimensions product(Dimensions a, int mul_a, Dimensions b, int mul_b) {
        int hash = (a.hashCode() * mul_a) + (b.hashCode() * mul_b);
        Dimensions[] dimensionsArr = hashTable;
        int index = (Integer.MAX_VALUE & hash) % dimensionsArr.length;
        for (Dimensions dim = dimensionsArr[index]; dim != null; dim = dim.chain) {
            if (dim.hash_code == hash && dim.matchesProduct(a, mul_a, b, mul_b)) {
                return dim;
            }
        }
        return new Dimensions(a, mul_a, b, mul_b, hash);
    }

    public int getPower(BaseUnit unit) {
        for (int i = 0; this.bases[i].index <= unit.index; i++) {
            if (this.bases[i] == unit) {
                return this.powers[i];
            }
        }
        return 0;
    }

    public String toString() {
        StringBuffer buf = new StringBuffer();
        for (int i = 0; this.bases[i] != Unit.Empty; i++) {
            if (i > 0) {
                buf.append('*');
            }
            buf.append(this.bases[i]);
            short s = this.powers[i];
            if (s != 1) {
                buf.append('^');
                buf.append((int) s);
            }
        }
        return buf.toString();
    }
}
