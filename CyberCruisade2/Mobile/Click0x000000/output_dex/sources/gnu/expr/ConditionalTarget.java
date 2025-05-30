package gnu.expr;

import androidx.appcompat.R$styleable;
import gnu.bytecode.CodeAttr;
import gnu.bytecode.Label;
import gnu.bytecode.Type;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ConditionalTarget extends Target {
    public Label ifFalse;
    public Label ifTrue;
    Language language;
    public boolean trueBranchComesFirst = true;

    public ConditionalTarget(Label ifTrue, Label ifFalse, Language language) {
        this.ifTrue = ifTrue;
        this.ifFalse = ifFalse;
        this.language = language;
    }

    @Override // gnu.expr.Target
    public Type getType() {
        return Type.booleanType;
    }

    @Override // gnu.expr.Target
    public void compileFromStack(Compilation comp, Type stackType) {
        CodeAttr code = comp.getCode();
        char sig = stackType.getSignature().charAt(0);
        switch (sig) {
            case R$styleable.AppCompatTheme_textAppearanceSearchResultSubtitle /* 68 */:
                code.emitPushDouble(0.0d);
                break;
            case 'F':
                code.emitPushFloat(0.0f);
                break;
            case R$styleable.AppCompatTheme_listPreferredItemPaddingLeft /* 74 */:
                code.emitPushLong(0L);
                break;
            case 'L':
            case R$styleable.AppCompatTheme_colorButtonNormal /* 91 */:
                Language language = this.language;
                comp.compileConstant(language == null ? Boolean.FALSE : language.booleanObject(false));
                break;
            default:
                if (this.trueBranchComesFirst) {
                    code.emitGotoIfIntEqZero(this.ifFalse);
                    code.emitGoto(this.ifTrue);
                    return;
                } else {
                    code.emitGotoIfIntNeZero(this.ifTrue);
                    code.emitGoto(this.ifFalse);
                    return;
                }
        }
        if (this.trueBranchComesFirst) {
            code.emitGotoIfEq(this.ifFalse);
        } else {
            code.emitGotoIfNE(this.ifTrue);
        }
        emitGotoFirstBranch(code);
    }

    public final void emitGotoFirstBranch(CodeAttr code) {
        code.emitGoto(this.trueBranchComesFirst ? this.ifTrue : this.ifFalse);
    }
}
