package gnu.bytecode;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class Scope {
    Label end;
    Scope firstChild;
    Scope lastChild;
    Variable last_var;
    Scope nextSibling;
    Scope parent;
    boolean preserved;
    Label start;
    Variable vars;

    public Scope() {
    }

    public Scope(Label start, Label end) {
        this.start = start;
        this.end = end;
    }

    public final Variable firstVar() {
        return this.vars;
    }

    public VarEnumerator allVars() {
        return new VarEnumerator(this);
    }

    public void linkChild(Scope parent) {
        this.parent = parent;
        if (parent == null) {
            return;
        }
        Scope scope = parent.lastChild;
        if (scope == null) {
            parent.firstChild = this;
        } else {
            scope.nextSibling = this;
        }
        parent.lastChild = this;
    }

    public Variable addVariable(CodeAttr code, Type type, String name) {
        Variable var = new Variable(name, type);
        addVariable(code, var);
        return var;
    }

    public void addVariable(Variable var) {
        Variable variable = this.last_var;
        if (variable == null) {
            this.vars = var;
        } else {
            variable.next = var;
        }
        this.last_var = var;
        var.scope = this;
    }

    public void addVariableAfter(Variable prev, Variable var) {
        if (prev == null) {
            var.next = this.vars;
            this.vars = var;
        } else {
            var.next = prev.next;
            prev.next = var;
        }
        if (this.last_var == prev) {
            this.last_var = var;
        }
        if (var.next == var) {
            throw new Error("cycle");
        }
        var.scope = this;
    }

    public void addVariable(CodeAttr code, Variable var) {
        addVariable(var);
        if (var.isSimple() && code != null) {
            var.allocateLocal(code);
        }
    }

    public Variable getVariable(int index) {
        Variable var = this.vars;
        while (true) {
            index--;
            if (index >= 0) {
                var = var.next;
            } else {
                return var;
            }
        }
    }

    static boolean equals(byte[] name1, byte[] name2) {
        if (name1.length != name2.length) {
            return false;
        }
        if (name1 == name2) {
            return true;
        }
        int i = name1.length;
        do {
            i--;
            if (i < 0) {
                return true;
            }
        } while (name1[i] == name2[i]);
        return false;
    }

    public void setStartPC(CodeAttr code) {
        if (this.start == null) {
            this.start = new Label();
        }
        boolean reachable = code.reachableHere();
        this.start.define(code);
        code.setReachable(reachable);
    }

    public void noteStartFunction(CodeAttr code) {
        setStartPC(code);
        this.start.setTypes(code);
    }

    public Variable lookup(String name) {
        for (Variable var = this.vars; var != null; var = var.next) {
            if (name.equals(var.name)) {
                return var;
            }
        }
        return null;
    }

    void freeLocals(CodeAttr code) {
        if (this.preserved) {
            return;
        }
        for (Variable var = this.vars; var != null; var = var.next) {
            if (var.isSimple() && !var.dead()) {
                var.freeLocal(code);
            }
        }
        for (Scope child = this.firstChild; child != null; child = child.nextSibling) {
            if (child.preserved) {
                child.preserved = false;
                child.freeLocals(code);
            }
        }
    }
}
