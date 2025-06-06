package gnu.expr;

import gnu.lists.FString;
import gnu.lists.FVector;
import gnu.mapping.Environment;
import gnu.mapping.Symbol;
import gnu.mapping.ThreadLocation;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ApplicationMainSupport {
    public static String[] commandLineArgArray;
    public static FVector commandLineArguments;
    public static boolean processCommandLinePropertyAssignments;
    static String[][] propertyFields = {new String[]{"out:doctype-system", "gnu.xml.XMLPrinter", "doctypeSystem"}, new String[]{"out:doctype-public", "gnu.xml.XMLPrinter", "doctypePublic"}, new String[]{"out:base", "gnu.kawa.functions.DisplayFormat", "outBase"}, new String[]{"out:radix", "gnu.kawa.functions.DisplayFormat", "outRadix"}, new String[]{"out:line-length", "gnu.text.PrettyWriter", "lineLengthLoc"}, new String[]{"out:right-margin", "gnu.text.PrettyWriter", "lineLengthLoc"}, new String[]{"out:miser-width", "gnu.text.PrettyWriter", "miserWidthLoc"}, new String[]{"out:xml-indent", "gnu.xml.XMLPrinter", "indentLoc"}, new String[]{"display:toolkit", "gnu.kawa.models.Display", "myDisplay"}, null};

    public static void processSetProperties() {
        String[] args = commandLineArgArray;
        if (args == null) {
            processCommandLinePropertyAssignments = true;
            return;
        }
        int iarg = 0;
        while (iarg < args.length && processSetProperty(args[iarg])) {
            iarg++;
        }
        if (iarg != 0) {
            setArgs(args, iarg);
        }
    }

    public static void processArgs(String[] args) {
        int iarg = 0;
        if (processCommandLinePropertyAssignments) {
            while (iarg < args.length && processSetProperty(args[iarg])) {
                iarg++;
            }
        }
        setArgs(args, iarg);
    }

    public static void setArgs(String[] args, int arg_start) {
        int nargs = args.length - arg_start;
        Object[] array = new Object[nargs];
        if (arg_start == 0) {
            commandLineArgArray = args;
        } else {
            String[] strings = new String[nargs];
            int i = nargs;
            while (true) {
                i--;
                if (i < 0) {
                    break;
                } else {
                    strings[i] = args[i + arg_start];
                }
            }
            commandLineArgArray = strings;
        }
        int i2 = nargs;
        while (true) {
            i2--;
            if (i2 >= 0) {
                array[i2] = new FString(args[i2 + arg_start]);
            } else {
                commandLineArguments = new FVector(array);
                Environment.getCurrent().put("command-line-arguments", (Object) commandLineArguments);
                return;
            }
        }
    }

    public static boolean processSetProperty(String arg) {
        int ci = arg.indexOf(61);
        if (ci <= 0) {
            return false;
        }
        String key = arg.substring(0, ci);
        String value = arg.substring(ci + 1);
        int i = 0;
        while (true) {
            String[] propertyField = propertyFields[i];
            if (propertyField == null) {
                break;
            }
            if (key.equals(propertyField[0])) {
                String cname = propertyField[1];
                String fname = propertyField[2];
                try {
                    Class clas = Class.forName(cname);
                    ThreadLocation loc = (ThreadLocation) clas.getDeclaredField(fname).get(null);
                    loc.setGlobal(value);
                    break;
                } catch (Throwable ex) {
                    System.err.println("error setting property " + key + " field " + cname + '.' + fname + ": " + ex);
                    System.exit(-1);
                }
            }
            i++;
        }
        Symbol symbol = Symbol.parse(key);
        Language.getDefaultLanguage();
        Environment current = Environment.getCurrent();
        current.define(symbol, null, value);
        return true;
    }
}
