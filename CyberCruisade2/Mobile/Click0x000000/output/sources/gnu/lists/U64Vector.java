package gnu.lists;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

/* loaded from: classes.dex */
public class U64Vector extends SimpleVector implements Externalizable, Comparable {
    long[] data;

    public U64Vector() {
        this.data = S64Vector.empty;
    }

    public U64Vector(int size, long value) {
        long[] array = new long[size];
        this.data = array;
        this.size = size;
        while (true) {
            size--;
            if (size >= 0) {
                array[size] = value;
            } else {
                return;
            }
        }
    }

    public U64Vector(int size) {
        this.data = new long[size];
        this.size = size;
    }

    public U64Vector(long[] data) {
        this.data = data;
        this.size = data.length;
    }

    public U64Vector(Sequence seq) {
        this.data = new long[seq.size()];
        addAll(seq);
    }

    @Override // gnu.lists.SimpleVector
    public int getBufferLength() {
        return this.data.length;
    }

    @Override // gnu.lists.SimpleVector
    public void setBufferLength(int length) {
        long[] jArr = this.data;
        int oldLength = jArr.length;
        if (oldLength != length) {
            long[] tmp = new long[length];
            System.arraycopy(jArr, 0, tmp, 0, oldLength < length ? oldLength : length);
            this.data = tmp;
        }
    }

    @Override // gnu.lists.SimpleVector
    protected Object getBuffer() {
        return this.data;
    }

    @Override // gnu.lists.SimpleVector
    public final int intAtBuffer(int index) {
        return (int) this.data[index];
    }

    @Override // gnu.lists.SimpleVector
    public final long longAt(int index) {
        if (index > this.size) {
            throw new IndexOutOfBoundsException();
        }
        return this.data[index];
    }

    @Override // gnu.lists.SimpleVector
    public final long longAtBuffer(int index) {
        return this.data[index];
    }

    @Override // gnu.lists.SimpleVector, gnu.lists.AbstractSequence
    public final Object get(int index) {
        if (index > this.size) {
            throw new IndexOutOfBoundsException();
        }
        return Convert.toObjectUnsigned(this.data[index]);
    }

    @Override // gnu.lists.SimpleVector
    public final Object getBuffer(int index) {
        return Convert.toObjectUnsigned(this.data[index]);
    }

    @Override // gnu.lists.SimpleVector
    public Object setBuffer(int index, Object value) {
        long[] jArr = this.data;
        long old = jArr[index];
        jArr[index] = Convert.toLongUnsigned(value);
        return Convert.toObjectUnsigned(old);
    }

    public final void setLongAt(int index, long value) {
        if (index > this.size) {
            throw new IndexOutOfBoundsException();
        }
        this.data[index] = value;
    }

    public final void setLongAtBuffer(int index, long value) {
        this.data[index] = value;
    }

    @Override // gnu.lists.SimpleVector
    protected void clearBuffer(int start, int count) {
        while (true) {
            count--;
            if (count >= 0) {
                this.data[start] = 0;
                start++;
            } else {
                return;
            }
        }
    }

    @Override // gnu.lists.SimpleVector
    public int getElementKind() {
        return 23;
    }

    @Override // gnu.lists.SimpleVector
    public String getTag() {
        return "u64";
    }

    @Override // gnu.lists.SimpleVector, gnu.lists.AbstractSequence
    public boolean consumeNext(int ipos, Consumer out) {
        int index = ipos >>> 1;
        if (index >= this.size) {
            return false;
        }
        out.writeLong(this.data[index]);
        return true;
    }

    @Override // gnu.lists.SimpleVector, gnu.lists.AbstractSequence
    public void consumePosRange(int iposStart, int iposEnd, Consumer out) {
        if (out.ignoring()) {
            return;
        }
        int end = iposEnd >>> 1;
        if (end > this.size) {
            end = this.size;
        }
        for (int i = iposStart >>> 1; i < end; i++) {
            out.writeLong(this.data[i]);
        }
    }

    @Override // java.lang.Comparable
    public int compareTo(Object obj) {
        U64Vector vec2 = (U64Vector) obj;
        long[] arr1 = this.data;
        long[] arr2 = vec2.data;
        int n1 = this.size;
        int n2 = vec2.size;
        int n = n1 > n2 ? n2 : n1;
        for (int i = 0; i < n; i++) {
            long v1 = arr1[i];
            long v2 = arr2[i];
            if (v1 != v2) {
                return (v1 ^ Long.MIN_VALUE) > (Long.MIN_VALUE ^ v2) ? 1 : -1;
            }
        }
        int i2 = n1 - n2;
        return i2;
    }

    @Override // java.io.Externalizable
    public void writeExternal(ObjectOutput out) throws IOException {
        int size = this.size;
        out.writeInt(size);
        for (int i = 0; i < size; i++) {
            out.writeLong(this.data[i]);
        }
    }

    @Override // java.io.Externalizable
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        int size = in.readInt();
        long[] data = new long[size];
        for (int i = 0; i < size; i++) {
            data[i] = in.readLong();
        }
        this.data = data;
        this.size = size;
    }
}
