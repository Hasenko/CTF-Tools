package gnu.mapping;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class WrongArguments extends IllegalArgumentException {
    public int number;
    Procedure proc;
    public String procname;
    public String usage;

    public static String checkArgCount(Procedure proc, int argCount) {
        int num = proc.numArgs();
        int min = num & 4095;
        int max = num >> 12;
        String pname = proc.getName();
        if (pname == null) {
            pname = proc.getClass().getName();
        }
        return checkArgCount(pname, min, max, argCount);
    }

    public static String checkArgCount(String pname, int min, int max, int argCount) {
        boolean tooMany;
        if (argCount < min) {
            tooMany = false;
        } else if (max >= 0 && argCount > max) {
            tooMany = true;
        } else {
            return null;
        }
        StringBuffer buf = new StringBuffer(100);
        buf.append("call to ");
        if (pname == null) {
            buf.append("unnamed procedure");
        } else {
            buf.append('\'');
            buf.append(pname);
            buf.append('\'');
        }
        buf.append(tooMany ? " has too many" : " has too few");
        buf.append(" arguments (");
        buf.append(argCount);
        if (min == max) {
            buf.append("; must be ");
            buf.append(min);
        } else {
            buf.append("; min=");
            buf.append(min);
            if (max >= 0) {
                buf.append(", max=");
                buf.append(max);
            }
        }
        buf.append(')');
        return buf.toString();
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        String msg;
        Procedure procedure = this.proc;
        if (procedure != null && (msg = checkArgCount(procedure, this.number)) != null) {
            return msg;
        }
        return super.getMessage();
    }

    public WrongArguments(Procedure proc, int argCount) {
        this.proc = proc;
        this.number = argCount;
    }

    public WrongArguments(String name, int n, String u) {
        this.procname = name;
        this.number = n;
        this.usage = u;
    }
}
