package gnu.mapping;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class Future extends Thread {
    public RunnableClosure closure;

    public Future(Procedure action, CallContext parentContext) {
        this.closure = new RunnableClosure(action, parentContext);
    }

    public Future(Procedure action, InPort in, OutPort out, OutPort err) {
        this.closure = new RunnableClosure(action, in, out, err);
    }

    public Future(Procedure action) {
        this.closure = new RunnableClosure(action);
    }

    public static Future make(Procedure action, Environment penvironment, InPort in, OutPort out, OutPort err) {
        Environment saveEnv = Environment.setSaveCurrent(penvironment);
        try {
            return new Future(action, in, out, err);
        } finally {
            Environment.restoreCurrent(saveEnv);
        }
    }

    public final CallContext getCallContext() {
        return this.closure.getCallContext();
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        this.closure.run();
    }

    public Object waitForResult() throws Throwable {
        try {
            join();
            Throwable ex = this.closure.exception;
            if (ex != null) {
                throw ex;
            }
            return this.closure.result;
        } catch (InterruptedException e) {
            throw new RuntimeException("thread join [force] was interrupted");
        }
    }

    @Override // java.lang.Thread
    public String toString() {
        StringBuffer buf = new StringBuffer();
        buf.append("#<future ");
        buf.append(getName());
        buf.append(">");
        return buf.toString();
    }
}
