package com.google.appinventor.components.runtime.util;

import android.util.Log;
import com.google.appinventor.components.common.FileScope;
import com.google.appinventor.components.runtime.Component;
import com.google.appinventor.components.runtime.Form;
import java.io.File;
import java.util.Collections;
import java.util.List;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public abstract class SingleFileOperation extends FileOperation {
    private static final String LOG_TAG = FileOperation.class.getSimpleName();
    protected final FileAccessMode accessMode;
    protected final File file;
    protected final String fileName;
    protected final String resolvedPath;
    protected final FileScope scope;
    protected final ScopedFile scopedFile;

    protected abstract void processFile(ScopedFile scopedFile);

    protected SingleFileOperation(Form form, Component component, String method, String fileName, FileScope scope, FileAccessMode accessMode, boolean async) {
        super(form, component, method, async);
        this.scope = scope;
        this.accessMode = accessMode;
        this.fileName = fileName;
        ScopedFile scopedFile = new ScopedFile(scope, fileName);
        this.scopedFile = scopedFile;
        if (fileName.startsWith("content:")) {
            this.file = null;
            this.resolvedPath = fileName;
        } else {
            File resolve = scopedFile.resolve(form);
            this.file = resolve;
            this.resolvedPath = resolve.getAbsolutePath();
        }
        Log.d(LOG_TAG, "resolvedPath = " + this.resolvedPath);
    }

    protected SingleFileOperation(Form form, Component component, String method, ScopedFile file, FileAccessMode accessMode, boolean async) {
        super(form, component, method, async);
        this.scope = file.getScope();
        this.accessMode = accessMode;
        String fileName = file.getFileName();
        this.fileName = fileName;
        this.scopedFile = file;
        if (fileName.startsWith("content:")) {
            this.file = null;
            this.resolvedPath = fileName;
        } else {
            File resolve = file.resolve(form);
            this.file = resolve;
            this.resolvedPath = resolve.getAbsolutePath();
        }
        Log.d(LOG_TAG, "resolvedPath = " + this.resolvedPath);
    }

    protected SingleFileOperation(Form form, Component component, String method, String fileName, FileScope scope, FileAccessMode accessMode) {
        this(form, component, method, fileName, scope, accessMode, true);
    }

    @Override // com.google.appinventor.components.runtime.util.FileOperation
    public List<String> getPermissions() {
        String permission = FileUtil.getNeededPermission(this.form, this.resolvedPath, this.accessMode);
        if (permission == null) {
            return Collections.emptyList();
        }
        return Collections.singletonList(permission);
    }

    public final File getFile() {
        return this.file;
    }

    public final ScopedFile getScopedFile() {
        return this.scopedFile;
    }

    public final boolean isAsset() {
        return this.fileName.startsWith("//") || this.scope == FileScope.Asset;
    }

    public final FileScope getScope() {
        return this.scope;
    }

    @Override // com.google.appinventor.components.runtime.util.FileOperation
    protected void performOperation() {
        processFile(this.scopedFile);
    }

    @Override // com.google.appinventor.components.runtime.util.FileOperation
    protected boolean needsExternalStorage() {
        return FileUtil.isExternalStorageUri(this.form, this.resolvedPath);
    }

    @Override // com.google.appinventor.components.runtime.util.FileOperation
    protected final boolean needsPermission() {
        return FileUtil.needsPermission(this.form, this.resolvedPath);
    }
}
