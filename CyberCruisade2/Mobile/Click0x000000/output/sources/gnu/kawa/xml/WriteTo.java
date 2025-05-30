package gnu.kawa.xml;

import gnu.mapping.OutPort;
import gnu.mapping.Procedure2;
import gnu.mapping.Values;
import gnu.text.Path;
import gnu.xml.XMLPrinter;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: classes2.dex */
public class WriteTo extends Procedure2 {
    public static final WriteTo writeTo = new WriteTo();
    public static final WriteTo writeToIfChanged;
    boolean ifChanged;

    static {
        WriteTo writeTo2 = new WriteTo();
        writeToIfChanged = writeTo2;
        writeTo2.ifChanged = true;
    }

    public static void writeTo(Object value, Path ppath, OutputStream outs) throws Throwable {
        OutPort out = new OutPort(outs, ppath);
        XMLPrinter consumer = new XMLPrinter(out, false);
        String extension = ppath.getExtension();
        if ("html".equals(extension)) {
            consumer.setStyle("html");
        }
        Values.writeValues(value, consumer);
        out.close();
    }

    public static void writeTo(Object value, Object path) throws Throwable {
        Path ppath = Path.valueOf(path);
        OutputStream outs = ppath.openOutputStream();
        writeTo(value, ppath, outs);
    }

    public static void writeToIfChanged(Object value, Object path) throws Throwable {
        Path ppath = Path.valueOf(path);
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        writeTo(value, ppath, bout);
        byte[] bbuf = bout.toByteArray();
        try {
            InputStream ins = new BufferedInputStream(ppath.openInputStream());
            int i = 0;
            while (true) {
                int b = ins.read();
                boolean atend = i == bbuf.length;
                if (b < 0) {
                    if (atend) {
                        ins.close();
                        return;
                    }
                } else {
                    if (atend) {
                        break;
                    }
                    int i2 = i + 1;
                    if (bbuf[i] != b) {
                        break;
                    } else {
                        i = i2;
                    }
                }
            }
            ins.close();
        } catch (Throwable th) {
        }
        OutputStream fout = new BufferedOutputStream(ppath.openOutputStream());
        fout.write(bbuf);
        fout.close();
    }

    @Override // gnu.mapping.Procedure2, gnu.mapping.Procedure
    public Object apply2(Object value, Object fileName) throws Throwable {
        if (this.ifChanged) {
            writeToIfChanged(value, fileName.toString());
        } else {
            writeTo(value, fileName.toString());
        }
        return Values.empty;
    }
}
