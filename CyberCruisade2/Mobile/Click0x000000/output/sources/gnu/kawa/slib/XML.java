package gnu.kawa.slib;

import androidx.fragment.app.FragmentTransaction;
import gnu.expr.ModuleBody;
import gnu.expr.ModuleInfo;
import gnu.expr.ModuleMethod;
import gnu.kawa.xml.Document;
import gnu.kawa.xml.KAttr;
import gnu.kawa.xml.KComment;
import gnu.kawa.xml.KDocument;
import gnu.kawa.xml.KElement;
import gnu.kawa.xml.KProcessingInstruction;
import gnu.kawa.xml.OutputAsXML;
import gnu.lists.Consumer;
import gnu.mapping.CallContext;
import gnu.mapping.SimpleSymbol;
import gnu.mapping.Symbol;
import gnu.mapping.WrongType;

/* compiled from: XML.scm */
/* loaded from: classes2.dex */
public class XML extends ModuleBody {
    public static final XML $instance;
    static final SimpleSymbol Lit0;
    static final SimpleSymbol Lit1;
    static final SimpleSymbol Lit2;
    public static OutputAsXML as$Mnxml;
    public static final ModuleMethod attribute$Mnname;
    public static final Class comment;
    public static final ModuleMethod element$Mnname;
    public static final ModuleMethod parse$Mnxml$Mnfrom$Mnurl;
    public static final Class processing$Mninstruction;

    static {
        SimpleSymbol simpleSymbol = (SimpleSymbol) new SimpleSymbol("attribute-name").readResolve();
        Lit2 = simpleSymbol;
        SimpleSymbol simpleSymbol2 = (SimpleSymbol) new SimpleSymbol("element-name").readResolve();
        Lit1 = simpleSymbol2;
        SimpleSymbol simpleSymbol3 = (SimpleSymbol) new SimpleSymbol("parse-xml-from-url").readResolve();
        Lit0 = simpleSymbol3;
        processing$Mninstruction = KProcessingInstruction.class;
        comment = KComment.class;
        XML xml = new XML();
        $instance = xml;
        parse$Mnxml$Mnfrom$Mnurl = new ModuleMethod(xml, 1, simpleSymbol3, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        element$Mnname = new ModuleMethod(xml, 2, simpleSymbol2, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        attribute$Mnname = new ModuleMethod(xml, 3, simpleSymbol, FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
        xml.run();
    }

    public XML() {
        ModuleInfo.register(this);
    }

    @Override // gnu.expr.ModuleBody
    public final void run(CallContext $ctx) {
        Consumer $result = $ctx.consumer;
        as$Mnxml = new OutputAsXML();
    }

    public static KDocument parseXmlFromUrl(Object url) {
        return Document.parse(url);
    }

    @Override // gnu.expr.ModuleBody
    public int match1(ModuleMethod moduleMethod, Object obj, CallContext callContext) {
        switch (moduleMethod.selector) {
            case 1:
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 2:
                if (!(obj instanceof KElement)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            case 3:
                if (!(obj instanceof KAttr)) {
                    return -786431;
                }
                callContext.value1 = obj;
                callContext.proc = moduleMethod;
                callContext.pc = 1;
                return 0;
            default:
                return super.match1(moduleMethod, obj, callContext);
        }
    }

    public static Symbol elementName(KElement element) {
        return element.getNodeSymbol();
    }

    public static Symbol attributeName(KAttr attr) {
        return attr.getNodeSymbol();
    }

    @Override // gnu.expr.ModuleBody
    public Object apply1(ModuleMethod moduleMethod, Object obj) {
        switch (moduleMethod.selector) {
            case 1:
                return parseXmlFromUrl(obj);
            case 2:
                try {
                    return elementName((KElement) obj);
                } catch (ClassCastException e) {
                    throw new WrongType(e, "element-name", 1, obj);
                }
            case 3:
                try {
                    return attributeName((KAttr) obj);
                } catch (ClassCastException e2) {
                    throw new WrongType(e2, "attribute-name", 1, obj);
                }
            default:
                return super.apply1(moduleMethod, obj);
        }
    }
}
