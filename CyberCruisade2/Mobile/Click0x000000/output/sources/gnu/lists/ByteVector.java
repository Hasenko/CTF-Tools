package gnu.lists;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

/* loaded from: classes.dex */
public abstract class ByteVector extends SimpleVector implements Externalizable, Comparable {
    protected static byte[] empty = new byte[0];
    byte[] data;

    @Override // gnu.lists.SimpleVector
    public int getBufferLength() {
        return this.data.length;
    }

    @Override // gnu.lists.SimpleVector
    public void setBufferLength(int length) {
        byte[] bArr = this.data;
        int oldLength = bArr.length;
        if (oldLength != length) {
            byte[] tmp = new byte[length];
            System.arraycopy(bArr, 0, tmp, 0, oldLength < length ? oldLength : length);
            this.data = tmp;
        }
    }

    @Override // gnu.lists.SimpleVector
    protected Object getBuffer() {
        return this.data;
    }

    public final byte byteAt(int index) {
        if (index > this.size) {
            throw new IndexOutOfBoundsException();
        }
        return this.data[index];
    }

    public final byte byteAtBuffer(int index) {
        return this.data[index];
    }

    @Override // gnu.lists.SimpleVector, gnu.lists.AbstractSequence
    public boolean consumeNext(int ipos, Consumer out) {
        int index = ipos >>> 1;
        if (index >= this.size) {
            return false;
        }
        out.writeInt(intAtBuffer(index));
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
            out.writeInt(intAtBuffer(i));
        }
    }

    public final void setByteAt(int index, byte value) {
        if (index > this.size) {
            throw new IndexOutOfBoundsException();
        }
        this.data[index] = value;
    }

    public final void setByteAtBuffer(int index, byte value) {
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

    @Override // java.io.Externalizable
    public void writeExternal(ObjectOutput out) throws IOException {
        int size = this.size;
        out.writeInt(size);
        for (int i = 0; i < size; i++) {
            out.writeByte(this.data[i]);
        }
    }

    @Override // java.io.Externalizable
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        int size = in.readInt();
        byte[] data = new byte[size];
        for (int i = 0; i < size; i++) {
            data[i] = in.readByte();
        }
        this.data = data;
        this.size = size;
    }
}
