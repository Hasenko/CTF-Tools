package gnu.kawa.xml;

import gnu.bytecode.ClassType;
import gnu.bytecode.CodeAttr;
import gnu.bytecode.Method;
import gnu.bytecode.Variable;
import gnu.expr.ApplyExp;
import gnu.expr.Compilation;
import gnu.expr.ConsumerTarget;
import gnu.expr.Expression;
import gnu.expr.Target;
import gnu.lists.Consumer;
import gnu.lists.TreeList;
import gnu.lists.XConsumer;
import gnu.mapping.CallContext;
import gnu.mapping.Values;

/* loaded from: classes2.dex */
public class MakeWithBaseUri extends NodeConstructor {
    static final Method beginEntityMethod;
    static final Method endEntityMethod;
    public static final MakeWithBaseUri makeWithBaseUri = new MakeWithBaseUri();
    static final ClassType typeXConsumer;

    static {
        ClassType make = ClassType.make("gnu.lists.XConsumer");
        typeXConsumer = make;
        beginEntityMethod = make.getDeclaredMethod("beginEntity", 1);
        endEntityMethod = make.getDeclaredMethod("endEntity", 0);
    }

    @Override // gnu.mapping.Procedure
    public int numArgs() {
        return 8194;
    }

    @Override // gnu.mapping.Procedure
    public void apply(CallContext ctx) {
        Consumer saved = ctx.consumer;
        Consumer out = NodeConstructor.pushNodeContext(ctx);
        Object baseUri = ctx.getNextArg();
        Object node = ctx.getNextArg();
        if (out instanceof XConsumer) {
            ((XConsumer) out).beginEntity(baseUri);
        }
        try {
            Values.writeValues(node, out);
        } finally {
            if (out instanceof XConsumer) {
                ((XConsumer) out).endEntity();
            }
            if (out instanceof TreeList) {
                ((TreeList) out).dump();
            }
            NodeConstructor.popNodeContext(saved, ctx);
        }
    }

    @Override // gnu.kawa.xml.NodeConstructor
    public void compileToNode(ApplyExp exp, Compilation comp, ConsumerTarget target) {
        Variable consumer = target.getConsumerVariable();
        Expression[] args = exp.getArgs();
        int length = args.length;
        CodeAttr code = comp.getCode();
        code.emitLoad(consumer);
        args[0].compile(comp, Target.pushObject);
        code.emitInvokeInterface(beginEntityMethod);
        compileChild(args[1], comp, target);
        code.emitLoad(consumer);
        code.emitInvokeInterface(endEntityMethod);
    }
}
