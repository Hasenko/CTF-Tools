package androidx.versionedparcelable;

import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcelable;
import android.util.SparseArray;
import androidx.core.internal.view.SupportMenu;
import androidx.versionedparcelable.VersionedParcel;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.Set;

/* loaded from: classes2.dex */
class VersionedParcelStream extends VersionedParcel {
    private static final int TYPE_BOOLEAN = 5;
    private static final int TYPE_BOOLEAN_ARRAY = 6;
    private static final int TYPE_DOUBLE = 7;
    private static final int TYPE_DOUBLE_ARRAY = 8;
    private static final int TYPE_FLOAT = 13;
    private static final int TYPE_FLOAT_ARRAY = 14;
    private static final int TYPE_INT = 9;
    private static final int TYPE_INT_ARRAY = 10;
    private static final int TYPE_LONG = 11;
    private static final int TYPE_LONG_ARRAY = 12;
    private static final int TYPE_NULL = 0;
    private static final int TYPE_STRING = 3;
    private static final int TYPE_STRING_ARRAY = 4;
    private static final int TYPE_SUB_BUNDLE = 1;
    private static final int TYPE_SUB_PERSISTABLE_BUNDLE = 2;
    private static final Charset UTF_16 = Charset.forName("UTF-16");
    private final SparseArray<InputBuffer> mCachedFields = new SparseArray<>();
    private DataInputStream mCurrentInput;
    private DataOutputStream mCurrentOutput;
    private FieldBuffer mFieldBuffer;
    private boolean mIgnoreParcelables;
    private final DataInputStream mMasterInput;
    private final DataOutputStream mMasterOutput;

    public VersionedParcelStream(InputStream input, OutputStream output) {
        DataInputStream dataInputStream = input != null ? new DataInputStream(input) : null;
        this.mMasterInput = dataInputStream;
        DataOutputStream dataOutputStream = output != null ? new DataOutputStream(output) : null;
        this.mMasterOutput = dataOutputStream;
        this.mCurrentInput = dataInputStream;
        this.mCurrentOutput = dataOutputStream;
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public boolean isStream() {
        return true;
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void setSerializationFlags(boolean allowSerialization, boolean ignoreParcelables) {
        if (!allowSerialization) {
            throw new RuntimeException("Serialization of this object is not allowed");
        }
        this.mIgnoreParcelables = ignoreParcelables;
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void closeField() {
        FieldBuffer fieldBuffer = this.mFieldBuffer;
        if (fieldBuffer != null) {
            try {
                if (fieldBuffer.mOutput.size() != 0) {
                    this.mFieldBuffer.flushField();
                }
                this.mFieldBuffer = null;
            } catch (IOException e) {
                throw new VersionedParcel.ParcelException(e);
            }
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    protected VersionedParcel createSubParcel() {
        return new VersionedParcelStream(this.mCurrentInput, this.mCurrentOutput);
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public boolean readField(int fieldId) {
        InputBuffer buffer = this.mCachedFields.get(fieldId);
        if (buffer != null) {
            this.mCachedFields.remove(fieldId);
            this.mCurrentInput = buffer.mInputStream;
            return true;
        }
        while (true) {
            try {
                int fieldInfo = this.mMasterInput.readInt();
                int size = fieldInfo & SupportMenu.USER_MASK;
                if (size == 65535) {
                    size = this.mMasterInput.readInt();
                }
                InputBuffer buffer2 = new InputBuffer(65535 & (fieldInfo >> 16), size, this.mMasterInput);
                if (buffer2.mFieldId == fieldId) {
                    this.mCurrentInput = buffer2.mInputStream;
                    return true;
                }
                this.mCachedFields.put(buffer2.mFieldId, buffer2);
            } catch (IOException e) {
                return false;
            }
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void setOutputField(int fieldId) {
        closeField();
        FieldBuffer fieldBuffer = new FieldBuffer(fieldId, this.mMasterOutput);
        this.mFieldBuffer = fieldBuffer;
        this.mCurrentOutput = fieldBuffer.mDataStream;
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void writeByteArray(byte[] b) {
        try {
            if (b != null) {
                this.mCurrentOutput.writeInt(b.length);
                this.mCurrentOutput.write(b);
            } else {
                this.mCurrentOutput.writeInt(-1);
            }
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void writeByteArray(byte[] b, int offset, int len) {
        try {
            if (b != null) {
                this.mCurrentOutput.writeInt(len);
                this.mCurrentOutput.write(b, offset, len);
            } else {
                this.mCurrentOutput.writeInt(-1);
            }
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void writeInt(int val) {
        try {
            this.mCurrentOutput.writeInt(val);
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void writeLong(long val) {
        try {
            this.mCurrentOutput.writeLong(val);
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void writeFloat(float val) {
        try {
            this.mCurrentOutput.writeFloat(val);
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void writeDouble(double val) {
        try {
            this.mCurrentOutput.writeDouble(val);
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void writeString(String val) {
        try {
            if (val != null) {
                byte[] bytes = val.getBytes(UTF_16);
                this.mCurrentOutput.writeInt(bytes.length);
                this.mCurrentOutput.write(bytes);
            } else {
                this.mCurrentOutput.writeInt(-1);
            }
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void writeBoolean(boolean val) {
        try {
            this.mCurrentOutput.writeBoolean(val);
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void writeStrongBinder(IBinder val) {
        if (!this.mIgnoreParcelables) {
            throw new RuntimeException("Binders cannot be written to an OutputStream");
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void writeParcelable(Parcelable p) {
        if (!this.mIgnoreParcelables) {
            throw new RuntimeException("Parcelables cannot be written to an OutputStream");
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void writeStrongInterface(IInterface val) {
        if (!this.mIgnoreParcelables) {
            throw new RuntimeException("Binders cannot be written to an OutputStream");
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public IBinder readStrongBinder() {
        return null;
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public <T extends Parcelable> T readParcelable() {
        return null;
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public int readInt() {
        try {
            return this.mCurrentInput.readInt();
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public long readLong() {
        try {
            return this.mCurrentInput.readLong();
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public float readFloat() {
        try {
            return this.mCurrentInput.readFloat();
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public double readDouble() {
        try {
            return this.mCurrentInput.readDouble();
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public String readString() {
        try {
            int len = this.mCurrentInput.readInt();
            if (len > 0) {
                byte[] bytes = new byte[len];
                this.mCurrentInput.readFully(bytes);
                return new String(bytes, UTF_16);
            }
            return null;
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public byte[] readByteArray() {
        try {
            int len = this.mCurrentInput.readInt();
            if (len > 0) {
                byte[] bytes = new byte[len];
                this.mCurrentInput.readFully(bytes);
                return bytes;
            }
            return null;
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public boolean readBoolean() {
        try {
            return this.mCurrentInput.readBoolean();
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public void writeBundle(Bundle val) {
        try {
            if (val != null) {
                Set<String> keys = val.keySet();
                this.mCurrentOutput.writeInt(keys.size());
                for (String key : keys) {
                    writeString(key);
                    Object o = val.get(key);
                    writeObject(o);
                }
                return;
            }
            this.mCurrentOutput.writeInt(-1);
        } catch (IOException e) {
            throw new VersionedParcel.ParcelException(e);
        }
    }

    @Override // androidx.versionedparcelable.VersionedParcel
    public Bundle readBundle() {
        int size = readInt();
        if (size < 0) {
            return null;
        }
        Bundle b = new Bundle();
        for (int i = 0; i < size; i++) {
            String key = readString();
            readObject(readInt(), key, b);
        }
        return b;
    }

    private void writeObject(Object o) {
        if (o == null) {
            writeInt(0);
            return;
        }
        if (o instanceof Bundle) {
            writeInt(1);
            writeBundle((Bundle) o);
            return;
        }
        if (o instanceof String) {
            writeInt(3);
            writeString((String) o);
            return;
        }
        if (o instanceof String[]) {
            writeInt(4);
            writeArray((String[]) o);
            return;
        }
        if (o instanceof Boolean) {
            writeInt(5);
            writeBoolean(((Boolean) o).booleanValue());
            return;
        }
        if (o instanceof boolean[]) {
            writeInt(6);
            writeBooleanArray((boolean[]) o);
            return;
        }
        if (o instanceof Double) {
            writeInt(7);
            writeDouble(((Double) o).doubleValue());
            return;
        }
        if (o instanceof double[]) {
            writeInt(8);
            writeDoubleArray((double[]) o);
            return;
        }
        if (o instanceof Integer) {
            writeInt(9);
            writeInt(((Integer) o).intValue());
            return;
        }
        if (o instanceof int[]) {
            writeInt(10);
            writeIntArray((int[]) o);
            return;
        }
        if (o instanceof Long) {
            writeInt(11);
            writeLong(((Long) o).longValue());
            return;
        }
        if (o instanceof long[]) {
            writeInt(12);
            writeLongArray((long[]) o);
        } else if (o instanceof Float) {
            writeInt(13);
            writeFloat(((Float) o).floatValue());
        } else {
            if (o instanceof float[]) {
                writeInt(14);
                writeFloatArray((float[]) o);
                return;
            }
            throw new IllegalArgumentException("Unsupported type " + o.getClass());
        }
    }

    private void readObject(int type, String key, Bundle b) {
        switch (type) {
            case 0:
                b.putParcelable(key, null);
                return;
            case 1:
                b.putBundle(key, readBundle());
                return;
            case 2:
                b.putBundle(key, readBundle());
                return;
            case 3:
                b.putString(key, readString());
                return;
            case 4:
                b.putStringArray(key, (String[]) readArray(new String[0]));
                return;
            case 5:
                b.putBoolean(key, readBoolean());
                return;
            case 6:
                b.putBooleanArray(key, readBooleanArray());
                return;
            case 7:
                b.putDouble(key, readDouble());
                return;
            case 8:
                b.putDoubleArray(key, readDoubleArray());
                return;
            case 9:
                b.putInt(key, readInt());
                return;
            case 10:
                b.putIntArray(key, readIntArray());
                return;
            case 11:
                b.putLong(key, readLong());
                return;
            case 12:
                b.putLongArray(key, readLongArray());
                return;
            case 13:
                b.putFloat(key, readFloat());
                return;
            case 14:
                b.putFloatArray(key, readFloatArray());
                return;
            default:
                throw new RuntimeException("Unknown type " + type);
        }
    }

    private static class FieldBuffer {
        final DataOutputStream mDataStream;
        private final int mFieldId;
        final ByteArrayOutputStream mOutput;
        private final DataOutputStream mTarget;

        FieldBuffer(int fieldId, DataOutputStream target) {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            this.mOutput = byteArrayOutputStream;
            this.mDataStream = new DataOutputStream(byteArrayOutputStream);
            this.mFieldId = fieldId;
            this.mTarget = target;
        }

        void flushField() throws IOException {
            this.mDataStream.flush();
            int size = this.mOutput.size();
            int fieldInfo = (this.mFieldId << 16) | (size >= 65535 ? SupportMenu.USER_MASK : size);
            this.mTarget.writeInt(fieldInfo);
            if (size >= 65535) {
                this.mTarget.writeInt(size);
            }
            this.mOutput.writeTo(this.mTarget);
        }
    }

    private static class InputBuffer {
        final int mFieldId;
        final DataInputStream mInputStream;
        private final int mSize;

        InputBuffer(int fieldId, int size, DataInputStream inputStream) throws IOException {
            this.mSize = size;
            this.mFieldId = fieldId;
            byte[] data = new byte[size];
            inputStream.readFully(data);
            this.mInputStream = new DataInputStream(new ByteArrayInputStream(data));
        }
    }
}
