package gnu.mapping;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ProcLocation extends Location {
    Object[] args;
    Procedure proc;

    public ProcLocation(Procedure proc, Object[] args) {
        this.proc = proc;
        this.args = args;
    }

    @Override // gnu.mapping.Location
    public Object get(Object defaultValue) {
        try {
            return this.proc.applyN(this.args);
        } catch (Error ex) {
            throw ex;
        } catch (RuntimeException ex2) {
            throw ex2;
        } catch (Throwable ex3) {
            throw new WrappedException(ex3);
        }
    }

    @Override // gnu.mapping.Location
    public void set(Object value) {
        Object[] objArr = this.args;
        int len = objArr.length;
        Object[] xargs = new Object[len + 1];
        xargs[len] = value;
        System.arraycopy(objArr, 0, xargs, 0, len);
        try {
            this.proc.setN(xargs);
        } catch (Error ex) {
            throw ex;
        } catch (RuntimeException ex2) {
            throw ex2;
        } catch (Throwable ex3) {
            throw new WrappedException(ex3);
        }
    }

    @Override // gnu.mapping.Location
    public boolean isBound() {
        return true;
    }
}
