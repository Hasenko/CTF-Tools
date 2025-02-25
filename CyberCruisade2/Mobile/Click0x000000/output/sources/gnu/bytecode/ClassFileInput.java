package gnu.bytecode;

import java.io.DataInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.dex */
public class ClassFileInput extends DataInputStream {
    ClassType ctype;
    InputStream str;

    public ClassFileInput(InputStream str) throws IOException {
        super(str);
    }

    public ClassFileInput(ClassType ctype, InputStream str) throws IOException, ClassFormatError {
        super(str);
        this.ctype = ctype;
        if (!readHeader()) {
            throw new ClassFormatError("invalid magic number");
        }
        ctype.constants = readConstants();
        readClassInfo();
        readFields();
        readMethods();
        readAttributes(ctype);
    }

    public static ClassType readClassType(InputStream str) throws IOException, ClassFormatError {
        ClassType ctype = new ClassType();
        new ClassFileInput(ctype, str);
        return ctype;
    }

    public boolean readHeader() throws IOException {
        int magic = readInt();
        if (magic != -889275714) {
            return false;
        }
        readFormatVersion();
        return true;
    }

    public void readFormatVersion() throws IOException {
        int minor = readUnsignedShort();
        int major = readUnsignedShort();
        this.ctype.classfileFormatVersion = (65536 * major) + minor;
    }

    public ConstantPool readConstants() throws IOException {
        return new ConstantPool(this);
    }

    public void readClassInfo() throws IOException {
        this.ctype.access_flags = readUnsignedShort();
        this.ctype.thisClassIndex = readUnsignedShort();
        CpoolClass clas = getClassConstant(this.ctype.thisClassIndex);
        String name = clas.name.string;
        this.ctype.this_name = name.replace('/', '.');
        this.ctype.setSignature("L" + name + ";");
        this.ctype.superClassIndex = readUnsignedShort();
        if (this.ctype.superClassIndex == 0) {
            this.ctype.setSuper((ClassType) null);
        } else {
            CpoolClass clas2 = getClassConstant(this.ctype.superClassIndex);
            this.ctype.setSuper(clas2.name.string.replace('/', '.'));
        }
        int nInterfaces = readUnsignedShort();
        if (nInterfaces > 0) {
            this.ctype.interfaces = new ClassType[nInterfaces];
            this.ctype.interfaceIndexes = new int[nInterfaces];
            for (int i = 0; i < nInterfaces; i++) {
                int index = readUnsignedShort();
                this.ctype.interfaceIndexes[i] = index;
                CpoolClass clas3 = (CpoolClass) this.ctype.constants.getForced(index, 7);
                this.ctype.interfaces[i] = ClassType.make(clas3.name.string.replace('/', '.'));
            }
        }
    }

    public int readAttributes(AttrContainer container) throws IOException {
        int count = readUnsignedShort();
        Attribute last = container.getAttributes();
        for (int i = 0; i < count; i++) {
            if (last != null) {
                while (true) {
                    Attribute next = last.getNext();
                    if (next == null) {
                        break;
                    }
                    last = next;
                }
            }
            int index = readUnsignedShort();
            CpoolUtf8 nameConstant = (CpoolUtf8) this.ctype.constants.getForced(index, 1);
            int length = readInt();
            nameConstant.intern();
            Attribute attr = readAttribute(nameConstant.string, length, container);
            if (attr != null) {
                if (attr.getNameIndex() == 0) {
                    attr.setNameIndex(index);
                }
                if (last == null) {
                    container.setAttributes(attr);
                } else {
                    if (container.getAttributes() == attr) {
                        container.setAttributes(attr.getNext());
                        attr.setNext(null);
                    }
                    last.setNext(attr);
                }
                last = attr;
            }
        }
        return count;
    }

    public final void skipAttribute(int length) throws IOException {
        int read = 0;
        while (read < length) {
            int skipped = (int) skip(length - read);
            if (skipped == 0) {
                if (read() < 0) {
                    throw new EOFException("EOF while reading class files attributes");
                }
                skipped = 1;
            }
            read += skipped;
        }
    }

    public Attribute readAttribute(String name, int length, AttrContainer container) throws IOException {
        CodeAttr code;
        Method method;
        int count;
        if (name == "SourceFile" && (container instanceof ClassType)) {
            return new SourceFileAttr(readUnsignedShort(), (ClassType) container);
        }
        if (name == "Code" && (container instanceof Method)) {
            CodeAttr code2 = new CodeAttr((Method) container);
            code2.fixup_count = -1;
            code2.setMaxStack(readUnsignedShort());
            code2.setMaxLocals(readUnsignedShort());
            int code_len = readInt();
            byte[] insns = new byte[code_len];
            readFully(insns);
            code2.setCode(insns);
            int exception_table_length = readUnsignedShort();
            for (int i = 0; i < exception_table_length; i++) {
                int start_pc = readUnsignedShort();
                int end_pc = readUnsignedShort();
                int handler_pc = readUnsignedShort();
                int catch_type = readUnsignedShort();
                code2.addHandler(start_pc, end_pc, handler_pc, catch_type);
            }
            readAttributes(code2);
            return code2;
        }
        if (name == "LineNumberTable" && (container instanceof CodeAttr)) {
            int count2 = readUnsignedShort() * 2;
            short[] numbers = new short[count2];
            for (int i2 = 0; i2 < count2; i2++) {
                numbers[i2] = readShort();
            }
            return new LineNumbersAttr(numbers, (CodeAttr) container);
        }
        if (name == "LocalVariableTable" && (container instanceof CodeAttr)) {
            CodeAttr code3 = (CodeAttr) container;
            LocalVarsAttr attr = new LocalVarsAttr(code3);
            Method method2 = attr.getMethod();
            if (attr.parameter_scope == null) {
                attr.parameter_scope = method2.pushScope();
            }
            Scope scope = attr.parameter_scope;
            if (scope.end == null) {
                scope.end = new Label(code3.PC);
            }
            ConstantPool constants = method2.getConstants();
            int count3 = readUnsignedShort();
            int prev_start = scope.start.position;
            int prev_end = scope.end.position;
            int i3 = 0;
            while (i3 < count3) {
                Variable var = new Variable();
                int start_pc2 = readUnsignedShort();
                int end_pc2 = readUnsignedShort() + start_pc2;
                if (start_pc2 == prev_start && end_pc2 == prev_end) {
                    code = code3;
                    method = method2;
                    count = count3;
                } else {
                    while (true) {
                        code = code3;
                        if (scope.parent == null || (start_pc2 >= scope.start.position && end_pc2 <= scope.end.position)) {
                            break;
                        }
                        scope = scope.parent;
                        code3 = code;
                    }
                    Scope parent = scope;
                    method = method2;
                    count = count3;
                    Scope scope2 = new Scope(new Label(start_pc2), new Label(end_pc2));
                    scope2.linkChild(parent);
                    prev_start = start_pc2;
                    prev_end = end_pc2;
                    scope = scope2;
                }
                scope.addVariable(var);
                var.setName(readUnsignedShort(), constants);
                var.setSignature(readUnsignedShort(), constants);
                var.offset = readUnsignedShort();
                i3++;
                code3 = code;
                method2 = method;
                count3 = count;
            }
            return attr;
        }
        if (name == "Signature" && (container instanceof Member)) {
            return new SignatureAttr(readUnsignedShort(), (Member) container);
        }
        if (name == "StackMapTable" && (container instanceof CodeAttr)) {
            byte[] data = new byte[length];
            readFully(data, 0, length);
            return new StackMapTableAttr(data, (CodeAttr) container);
        }
        if ((name == "RuntimeVisibleAnnotations" || name == "RuntimeInvisibleAnnotations") && ((container instanceof Field) || (container instanceof Method) || (container instanceof ClassType))) {
            byte[] data2 = new byte[length];
            readFully(data2, 0, length);
            return new RuntimeAnnotationsAttr(name, data2, container);
        }
        if (name == "ConstantValue" && (container instanceof Field)) {
            return new ConstantValueAttr(readUnsignedShort());
        }
        if (name == "InnerClasses" && (container instanceof ClassType)) {
            int count4 = readUnsignedShort() * 4;
            short[] data3 = new short[count4];
            for (int i4 = 0; i4 < count4; i4++) {
                data3[i4] = readShort();
            }
            return new InnerClassesAttr(data3, (ClassType) container);
        }
        if (name == "EnclosingMethod" && (container instanceof ClassType)) {
            int class_index = readUnsignedShort();
            int method_index = readUnsignedShort();
            return new EnclosingMethodAttr(class_index, method_index, (ClassType) container);
        }
        if (name == "Exceptions" && (container instanceof Method)) {
            Method meth = (Method) container;
            int count5 = readUnsignedShort();
            short[] exn_indices = new short[count5];
            for (int i5 = 0; i5 < count5; i5++) {
                exn_indices[i5] = readShort();
            }
            meth.setExceptions(exn_indices);
            return meth.getExceptionAttr();
        }
        if (name == "SourceDebugExtension" && (container instanceof ClassType)) {
            SourceDebugExtAttr attr2 = new SourceDebugExtAttr((ClassType) container);
            byte[] data4 = new byte[length];
            readFully(data4, 0, length);
            attr2.data = data4;
            attr2.dlength = length;
            return attr2;
        }
        byte[] data5 = new byte[length];
        readFully(data5, 0, length);
        return new MiscAttr(name, data5);
    }

    public void readFields() throws IOException {
        int nFields = readUnsignedShort();
        ConstantPool constants = this.ctype.constants;
        for (int i = 0; i < nFields; i++) {
            int flags = readUnsignedShort();
            int nameIndex = readUnsignedShort();
            int descriptorIndex = readUnsignedShort();
            Field fld = this.ctype.addField();
            fld.setName(nameIndex, constants);
            fld.setSignature(descriptorIndex, constants);
            fld.flags = flags;
            readAttributes(fld);
        }
    }

    public void readMethods() throws IOException {
        int nMethods = readUnsignedShort();
        for (int i = 0; i < nMethods; i++) {
            int flags = readUnsignedShort();
            int nameIndex = readUnsignedShort();
            int descriptorIndex = readUnsignedShort();
            Method meth = this.ctype.addMethod(null, flags);
            meth.setName(nameIndex);
            meth.setSignature(descriptorIndex);
            readAttributes(meth);
        }
    }

    CpoolClass getClassConstant(int index) {
        return (CpoolClass) this.ctype.constants.getForced(index, 7);
    }
}
