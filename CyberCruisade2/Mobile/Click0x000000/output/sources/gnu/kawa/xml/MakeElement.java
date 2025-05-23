package gnu.kawa.xml;

import gnu.bytecode.ClassType;
import gnu.bytecode.CodeAttr;
import gnu.bytecode.Method;
import gnu.bytecode.Type;
import gnu.bytecode.Variable;
import gnu.expr.ApplyExp;
import gnu.expr.Compilation;
import gnu.expr.ConsumerTarget;
import gnu.expr.Expression;
import gnu.expr.QuoteExp;
import gnu.expr.Special;
import gnu.expr.Target;
import gnu.lists.Consumable;
import gnu.lists.Consumer;
import gnu.mapping.CallContext;
import gnu.mapping.Symbol;
import gnu.xml.NamespaceBinding;
import gnu.xml.XMLFilter;
import gnu.xml.XName;

/* loaded from: classes.dex */
public class MakeElement extends NodeConstructor {
    static final Method endElementMethod;
    public static final MakeElement makeElement = new MakeElement();
    static final Method startElementMethod3;
    static final Method startElementMethod4;
    static final ClassType typeMakeElement;
    public int copyNamespacesMode = 1;
    private boolean handlingKeywordParameters;
    NamespaceBinding namespaceNodes;
    public Symbol tag;

    static {
        ClassType make = ClassType.make("gnu.kawa.xml.MakeElement");
        typeMakeElement = make;
        startElementMethod3 = make.getDeclaredMethod("startElement", 3);
        startElementMethod4 = make.getDeclaredMethod("startElement", 4);
        endElementMethod = make.getDeclaredMethod("endElement", 2);
    }

    @Override // gnu.mapping.Procedure
    public int numArgs() {
        return this.tag == null ? -4095 : -4096;
    }

    @Override // gnu.mapping.Procedure
    public String toString() {
        return "makeElement[" + this.tag + "]";
    }

    public boolean isHandlingKeywordParameters() {
        return this.handlingKeywordParameters;
    }

    public void setHandlingKeywordParameters(boolean value) {
        this.handlingKeywordParameters = value;
    }

    public NamespaceBinding getNamespaceNodes() {
        return this.namespaceNodes;
    }

    public void setNamespaceNodes(NamespaceBinding bindings) {
        this.namespaceNodes = bindings;
    }

    public static Symbol getTagName(ApplyExp exp) {
        Expression[] args = exp.getArgs();
        if (args.length > 0) {
            Expression arg0 = args[0];
            if (arg0 instanceof QuoteExp) {
                Object val = ((QuoteExp) arg0).getValue();
                if (val instanceof Symbol) {
                    return (Symbol) val;
                }
                return null;
            }
            return null;
        }
        return null;
    }

    public static void startElement(Consumer out, Object qname, int copyNamespacesMode, NamespaceBinding namespaceNodes) {
        XName type;
        if (qname instanceof Symbol) {
            type = new XName((Symbol) qname, namespaceNodes);
        } else {
            type = new XName(Symbol.make("", qname.toString(), ""), namespaceNodes);
        }
        if (out instanceof XMLFilter) {
            ((XMLFilter) out).copyNamespacesMode = copyNamespacesMode;
        }
        out.startElement(type);
    }

    public static void startElement(Consumer out, Object qname, int copyNamespacesMode) {
        Symbol type;
        if (qname instanceof Symbol) {
            type = (Symbol) qname;
        } else {
            type = Symbol.make("", qname.toString(), "");
        }
        if (out instanceof XMLFilter) {
            ((XMLFilter) out).copyNamespacesMode = copyNamespacesMode;
        }
        out.startElement(type);
    }

    public static void endElement(Consumer out, Object type) {
        out.endElement();
    }

    @Override // gnu.mapping.Procedure
    public void apply(CallContext ctx) {
        Consumer saved = ctx.consumer;
        Consumer out = pushNodeContext(ctx);
        try {
            Object type = this.tag;
            if (type == null) {
                type = ctx.getNextArg();
            }
            NamespaceBinding namespaceBinding = this.namespaceNodes;
            if (namespaceBinding != null) {
                startElement(out, type, this.copyNamespacesMode, namespaceBinding);
            } else {
                startElement(out, type, this.copyNamespacesMode);
            }
            Object endMarker = Special.dfault;
            while (true) {
                Object arg = ctx.getNextArg(endMarker);
                if (arg != endMarker) {
                    if (arg instanceof Consumable) {
                        ((Consumable) arg).consume(out);
                    } else {
                        ctx.writeValue(arg);
                    }
                    if (isHandlingKeywordParameters()) {
                        out.endAttribute();
                    }
                } else {
                    endElement(out, type);
                    return;
                }
            }
        } finally {
            popNodeContext(saved, ctx);
        }
    }

    @Override // gnu.kawa.xml.NodeConstructor
    public void compileToNode(ApplyExp exp, Compilation comp, ConsumerTarget target) {
        int i;
        Variable consumer = target.getConsumerVariable();
        Expression[] args = exp.getArgs();
        int nargs = args.length;
        CodeAttr code = comp.getCode();
        code.emitLoad(consumer);
        code.emitDup();
        Symbol symbol = this.tag;
        if (symbol == null) {
            args[0].compile(comp, Target.pushObject);
            i = 1;
        } else {
            comp.compileConstant(symbol, Target.pushObject);
            i = 0;
        }
        code.emitDup(1, 1);
        code.emitPushInt(this.copyNamespacesMode);
        NamespaceBinding namespaceBinding = this.namespaceNodes;
        if (namespaceBinding != null) {
            comp.compileConstant(namespaceBinding, Target.pushObject);
            code.emitInvokeStatic(startElementMethod4);
        } else {
            code.emitInvokeStatic(startElementMethod3);
        }
        while (i < nargs) {
            compileChild(args[i], comp, target);
            if (isHandlingKeywordParameters()) {
                code.emitLoad(consumer);
                code.emitInvokeInterface(MakeAttribute.endAttributeMethod);
            }
            i++;
        }
        code.emitInvokeStatic(endElementMethod);
    }

    @Override // gnu.kawa.xml.NodeConstructor, gnu.mapping.Procedure
    public Type getReturnType(Expression[] args) {
        return Compilation.typeObject;
    }
}
