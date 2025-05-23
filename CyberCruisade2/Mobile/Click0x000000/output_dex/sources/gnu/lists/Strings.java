package gnu.lists;

import java.io.PrintWriter;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class Strings {
    public static void makeUpperCase(CharSeq str) {
        int i = str.length();
        while (true) {
            i--;
            if (i >= 0) {
                str.setCharAt(i, Character.toUpperCase(str.charAt(i)));
            } else {
                return;
            }
        }
    }

    public static void makeLowerCase(CharSeq str) {
        int i = str.length();
        while (true) {
            i--;
            if (i >= 0) {
                str.setCharAt(i, Character.toLowerCase(str.charAt(i)));
            } else {
                return;
            }
        }
    }

    public static void makeCapitalize(CharSeq str) {
        char ch;
        char prev = ' ';
        int len = str.length();
        for (int i = 0; i < len; i++) {
            char ch2 = str.charAt(i);
            if (!Character.isLetterOrDigit(prev)) {
                ch = Character.toTitleCase(ch2);
            } else {
                ch = Character.toLowerCase(ch2);
            }
            str.setCharAt(i, ch);
            prev = ch;
        }
    }

    public static void printQuoted(CharSequence str, PrintWriter ps, int escapes) {
        int len = str.length();
        ps.print('\"');
        for (int i = 0; i < len; i++) {
            char ch = str.charAt(i);
            if (ch == '\\' || ch == '\"') {
                ps.print('\\');
            } else if (escapes > 0) {
                if (ch == '\n') {
                    ps.print("\\n");
                } else if (ch == '\r') {
                    ps.print("\\r");
                } else if (ch == '\t') {
                    ps.print("\\t");
                } else if (ch == 7) {
                    ps.print("\\a");
                } else if (ch == '\b') {
                    ps.print("\\b");
                } else if (ch == 11) {
                    ps.print("\\v");
                } else if (ch == '\f') {
                    ps.print("\\f");
                }
            }
            ps.print(ch);
        }
        ps.print('\"');
    }
}
