package gnu.mapping;

import gnu.bytecode.Type;

/* loaded from: classes.dex */
public class WrongType extends WrappedException {
    public static final int ARG_CAST = -4;
    public static final int ARG_DESCRIPTION = -3;
    public static final int ARG_UNKNOWN = -1;
    public static final int ARG_VARNAME = -2;
    public Object argValue;
    public Object expectedType;
    public int number;
    public Procedure proc;
    public String procname;

    public WrongType(String name, int n, String u) {
        super(null, null);
        this.procname = name;
        this.number = n;
        this.expectedType = u;
    }

    public WrongType(Procedure proc, int n, ClassCastException ex) {
        super(ex);
        this.proc = proc;
        this.procname = proc.getName();
        this.number = n;
    }

    public WrongType(ClassCastException ex, Procedure proc, int n, Object argValue) {
        this(proc, n, ex);
        this.argValue = argValue;
    }

    public WrongType(Procedure proc, int n, Object argValue) {
        this.proc = proc;
        this.procname = proc.getName();
        this.number = n;
        this.argValue = argValue;
    }

    public WrongType(Procedure proc, int n, Object argValue, Type expectedType) {
        this.proc = proc;
        this.procname = proc.getName();
        this.number = n;
        this.argValue = argValue;
        this.expectedType = expectedType;
    }

    public WrongType(int n, Object argValue, Type expectedType) {
        this.number = n;
        this.argValue = argValue;
        this.expectedType = expectedType;
    }

    public WrongType(Procedure proc, int n, Object argValue, String expectedType) {
        this(proc.getName(), n, argValue, expectedType);
        this.proc = proc;
    }

    public WrongType(String procName, int n, Object argValue, String expectedType) {
        this.procname = procName;
        this.number = n;
        this.argValue = argValue;
        this.expectedType = expectedType;
    }

    public WrongType(String procname, int n, ClassCastException ex) {
        super(ex);
        this.procname = procname;
        this.number = n;
    }

    public WrongType(ClassCastException ex, String procname, int n, Object argValue) {
        this(procname, n, ex);
        this.argValue = argValue;
    }

    public static WrongType make(ClassCastException ex, Procedure proc, int n) {
        return new WrongType(proc, n, ex);
    }

    public static WrongType make(ClassCastException ex, String procname, int n) {
        return new WrongType(procname, n, ex);
    }

    public static WrongType make(ClassCastException ex, Procedure proc, int n, Object argValue) {
        WrongType wex = new WrongType(proc, n, ex);
        wex.argValue = argValue;
        return wex;
    }

    public static WrongType make(ClassCastException ex, String procname, int n, Object argValue) {
        WrongType wex = new WrongType(procname, n, ex);
        wex.argValue = argValue;
        return wex;
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        String msg;
        int i;
        int i2;
        StringBuffer sbuf = new StringBuffer(100);
        int i3 = this.number;
        if (i3 == -3) {
            sbuf.append(this.procname);
        } else if (i3 == -4 || i3 == -2) {
            sbuf.append("Value");
        } else {
            sbuf.append("Argument ");
            if (this.number > 0) {
                sbuf.append('#');
                sbuf.append(this.number);
            }
        }
        if (this.argValue != null) {
            sbuf.append(" (");
            String argString = this.argValue.toString();
            if (argString.length() > 50) {
                sbuf.append(argString.substring(0, 47));
                sbuf.append("...");
            } else {
                sbuf.append(argString);
            }
            sbuf.append(")");
        }
        if (this.procname != null && (i2 = this.number) != -3) {
            sbuf.append(i2 == -2 ? " for variable '" : " to '");
            sbuf.append(this.procname);
            sbuf.append("'");
        }
        sbuf.append(" has wrong type");
        if (this.argValue != null) {
            sbuf.append(" (");
            sbuf.append(this.argValue.getClass().getName());
            sbuf.append(")");
        }
        Object expectType = this.expectedType;
        if (expectType == null && (i = this.number) > 0) {
            Procedure procedure = this.proc;
            if (procedure instanceof MethodProc) {
                expectType = ((MethodProc) procedure).getParameterType(i - 1);
            }
        }
        if (expectType != null && expectType != Type.pointer_type) {
            sbuf.append(" (expected: ");
            if (expectType instanceof Type) {
                expectType = ((Type) expectType).getName();
            } else if (expectType instanceof Class) {
                expectType = ((Class) expectType).getName();
            }
            sbuf.append(expectType);
            sbuf.append(")");
        }
        Throwable ex = getCause();
        if (ex != null && (msg = ex.getMessage()) != null) {
            sbuf.append(" (");
            sbuf.append(msg);
            sbuf.append(')');
        }
        return sbuf.toString();
    }
}
