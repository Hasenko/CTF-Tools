package gnu.expr;

import gnu.bytecode.Variable;
import gnu.mapping.Procedure;
import java.lang.reflect.Type;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public interface TypeValue extends Type {
    Expression convertValue(Expression expression);

    void emitIsInstance(Variable variable, Compilation compilation, Target target);

    void emitTestIf(Variable variable, Declaration declaration, Compilation compilation);

    Procedure getConstructor();

    gnu.bytecode.Type getImplementationType();
}
