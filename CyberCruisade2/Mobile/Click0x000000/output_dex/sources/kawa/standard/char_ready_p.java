package kawa.standard;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class char_ready_p {
    public static boolean ready(Object arg1) {
        try {
            if (arg1 instanceof InputStream) {
                return ((InputStream) arg1).available() > 0;
            }
            if (arg1 instanceof Reader) {
                return ((Reader) arg1).ready();
            }
            throw new ClassCastException("invalid argument to char-ready?");
        } catch (IOException e) {
            return false;
        }
    }
}
