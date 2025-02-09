package gnu.expr;

/* compiled from: BlockExp.java */
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class BlockExitException extends RuntimeException {
    ExitExp exit;
    Object result;

    public BlockExitException(ExitExp exit, Object result) {
        this.exit = exit;
        this.result = result;
    }
}
