package gnu.mapping;

import gnu.bytecode.ArrayType;
import gnu.bytecode.Type;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public abstract class MethodProc extends ProcedureN {
    public static final int NO_MATCH = -1;
    public static final int NO_MATCH_AMBIGUOUS = -851968;
    public static final int NO_MATCH_BAD_TYPE = -786432;
    public static final int NO_MATCH_TOO_FEW_ARGS = -983040;
    public static final int NO_MATCH_TOO_MANY_ARGS = -917504;
    static final Type[] unknownArgTypes = {Type.pointer_type};
    protected Object argTypes;

    public int isApplicable(Type[] argTypes) {
        int argCount = argTypes.length;
        int num = numArgs();
        if (argCount < (num & 4095) || (num >= 0 && argCount > (num >> 12))) {
            return -1;
        }
        int result = 1;
        int i = argCount;
        while (true) {
            i--;
            if (i >= 0) {
                Type ptype = getParameterType(i);
                int code = ptype.compare(argTypes[i]);
                if (code == -3) {
                    return -1;
                }
                if (code < 0) {
                    result = 0;
                }
            } else {
                return result;
            }
        }
    }

    public int numParameters() {
        int num = numArgs();
        int max = num >> 12;
        if (max >= 0) {
            return max;
        }
        int min = num & 4095;
        return min + 1;
    }

    protected void resolveParameterTypes() {
        this.argTypes = unknownArgTypes;
    }

    public Type getParameterType(int index) {
        if (!(this.argTypes instanceof Type[])) {
            resolveParameterTypes();
        }
        Type[] atypes = (Type[]) this.argTypes;
        if (index < atypes.length && (index < atypes.length - 1 || maxArgs() >= 0)) {
            return atypes[index];
        }
        if (maxArgs() < 0) {
            Type rtype = atypes[atypes.length - 1];
            if (rtype instanceof ArrayType) {
                return ((ArrayType) rtype).getComponentType();
            }
        }
        return Type.objectType;
    }

    public static RuntimeException matchFailAsException(int code, Procedure proc, Object[] args) {
        int arg = (short) code;
        if ((code & (-65536)) != -786432) {
            return new WrongArguments(proc, args.length);
        }
        return new WrongType(proc, arg, arg > 0 ? args[arg - 1] : null);
    }

    @Override // gnu.mapping.ProcedureN, gnu.mapping.Procedure
    public Object applyN(Object[] args) throws Throwable {
        checkArgCount(this, args.length);
        CallContext ctx = CallContext.getInstance();
        checkN(args, ctx);
        return ctx.runUntilValue();
    }

    public static MethodProc mostSpecific(MethodProc proc1, MethodProc proc2) {
        boolean not1 = false;
        boolean not2 = false;
        int min1 = proc1.minArgs();
        int min2 = proc2.minArgs();
        int max1 = proc1.maxArgs();
        int max2 = proc2.maxArgs();
        MethodProc methodProc = null;
        if ((max1 >= 0 && max1 < min2) || (max2 >= 0 && max2 < min1)) {
            return null;
        }
        int num1 = proc1.numParameters();
        int num2 = proc2.numParameters();
        int limit = num1 > num2 ? num1 : num2;
        if (max1 != max2) {
            if (max1 < 0) {
                not1 = true;
            }
            if (max2 < 0) {
                not2 = true;
            }
        }
        if (min1 < min2) {
            not1 = true;
        } else if (min1 > min2) {
            not2 = true;
        }
        for (int i = 0; i < limit; i++) {
            Type t1 = proc1.getParameterType(i);
            Type t2 = proc2.getParameterType(i);
            int comp = t1.compare(t2);
            if (comp == -1) {
                not2 = true;
                if (not1) {
                    return null;
                }
            }
            if (comp == 1) {
                not1 = true;
                if (not2) {
                    return null;
                }
            }
            methodProc = null;
        }
        return not2 ? proc1 : not1 ? proc2 : methodProc;
    }

    public static int mostSpecific(MethodProc[] procs, int length) {
        if (length <= 1) {
            return length - 1;
        }
        MethodProc best = procs[0];
        MethodProc[] bests = null;
        int bestn = 0;
        for (int i = 1; i < length; i++) {
            MethodProc method = procs[i];
            if (best != null) {
                MethodProc winner = mostSpecific(best, method);
                if (winner == null) {
                    if (bests == null) {
                        bests = new MethodProc[length];
                    }
                    bests[0] = best;
                    bests[1] = method;
                    bestn = 2;
                    best = null;
                } else if (winner == method) {
                    best = method;
                    bestn = i;
                }
            } else {
                int j = 0;
                while (true) {
                    if (j < bestn) {
                        MethodProc old = bests[j];
                        MethodProc winner2 = mostSpecific(old, method);
                        if (winner2 != old) {
                            if (winner2 != null) {
                                j++;
                            } else {
                                bests[bestn] = method;
                                bestn++;
                                break;
                            }
                        }
                    } else {
                        best = method;
                        bestn = i;
                        break;
                    }
                }
            }
        }
        if (best == null) {
            return -1;
        }
        return bestn;
    }
}
