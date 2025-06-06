package gnu.mapping;

import java.util.concurrent.Callable;

/* loaded from: classes.dex */
public class RunnableClosure implements Callable<Object>, Runnable {
    static int nrunnables = 0;
    Procedure action;
    CallContext context;
    private OutPort err;
    Throwable exception;
    private InPort in;
    String name;
    private OutPort out;
    Object result;

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public RunnableClosure(Procedure action, CallContext parentContext) {
        StringBuilder append = new StringBuilder().append("r");
        int i = nrunnables;
        nrunnables = i + 1;
        setName(append.append(i).toString());
        this.action = action;
    }

    public RunnableClosure(Procedure action, InPort in, OutPort out, OutPort err) {
        this(action, CallContext.getInstance());
        this.in = in;
        this.out = out;
        this.err = err;
    }

    public RunnableClosure(Procedure action) {
        this(action, CallContext.getInstance());
    }

    public final CallContext getCallContext() {
        return this.context;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            Environment env = Environment.getCurrent();
            String name = getName();
            if (env != null && env.getSymbol() == null && name != null) {
                env.setName(name);
            }
            CallContext callContext = this.context;
            if (callContext == null) {
                this.context = CallContext.getInstance();
            } else {
                CallContext.setInstance(callContext);
            }
            InPort inPort = this.in;
            if (inPort != null) {
                InPort.setInDefault(inPort);
            }
            OutPort outPort = this.out;
            if (outPort != null) {
                OutPort.setOutDefault(outPort);
            }
            OutPort outPort2 = this.err;
            if (outPort2 != null) {
                OutPort.setErrDefault(outPort2);
            }
            this.result = this.action.apply0();
        } catch (Throwable ex) {
            this.exception = ex;
        }
    }

    Object getResult() throws Throwable {
        Throwable ex = this.exception;
        if (ex != null) {
            throw ex;
        }
        return this.result;
    }

    @Override // java.util.concurrent.Callable
    public Object call() throws Exception {
        run();
        Throwable ex = this.exception;
        if (ex != null) {
            if (ex instanceof Exception) {
                throw ((Exception) ex);
            }
            if (ex instanceof Error) {
                throw ((Error) ex);
            }
            throw new RuntimeException(ex);
        }
        return this.result;
    }

    public String toString() {
        StringBuffer buf = new StringBuffer();
        buf.append("#<runnable ");
        buf.append(getName());
        buf.append(">");
        return buf.toString();
    }
}
