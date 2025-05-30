package gnu.kawa.functions;

import gnu.bytecode.ClassType;
import gnu.bytecode.Type;
import gnu.kawa.reflect.SlotSet;
import gnu.mapping.Environment;
import gnu.mapping.HasSetter;
import gnu.mapping.Namespace;
import gnu.mapping.Procedure;
import gnu.mapping.Procedure3;
import gnu.mapping.Symbol;
import gnu.mapping.Values;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class SetNamedPart extends Procedure3 implements HasSetter {
    public static final SetNamedPart setNamedPart;

    static {
        SetNamedPart setNamedPart2 = new SetNamedPart();
        setNamedPart = setNamedPart2;
        setNamedPart2.setName("setNamedPart");
        setNamedPart2.setProperty(Procedure.validateApplyKey, "gnu.kawa.functions.CompileNamedPart:validateSetNamedPart");
    }

    @Override // gnu.mapping.Procedure3, gnu.mapping.Procedure
    public Object apply3(Object container, Object part, Object value) {
        if (container instanceof Namespace) {
            Namespace ns = (Namespace) container;
            String uri = ns.getName();
            if (uri.startsWith("class:")) {
                container = ClassType.make(uri.substring(6));
            } else {
                Symbol sym = ns.getSymbol(part.toString());
                Environment.getCurrent();
                Environment.getCurrent().put(sym, value);
                return Values.empty;
            }
        }
        if (container instanceof Class) {
            container = (ClassType) Type.make((Class) container);
        }
        if (container instanceof ClassType) {
            try {
                SlotSet.setStaticField(container, part.toString(), value);
                return Values.empty;
            } catch (Throwable th) {
            }
        }
        SlotSet.setField(container, part.toString(), value);
        return Values.empty;
    }
}
