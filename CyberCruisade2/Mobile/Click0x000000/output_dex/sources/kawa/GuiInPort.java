package kawa;

import gnu.mapping.OutPort;
import gnu.mapping.TtyInPort;
import gnu.text.Path;
import java.io.IOException;
import java.io.Reader;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class GuiInPort extends TtyInPort {
    ReplDocument document;

    public GuiInPort(Reader in, Path path, OutPort tie, ReplDocument document) {
        super(in, path, tie);
        this.document = document;
    }

    @Override // gnu.mapping.TtyInPort
    public void emitPrompt(String prompt) throws IOException {
        this.document.write(prompt, ReplDocument.promptStyle);
    }
}
