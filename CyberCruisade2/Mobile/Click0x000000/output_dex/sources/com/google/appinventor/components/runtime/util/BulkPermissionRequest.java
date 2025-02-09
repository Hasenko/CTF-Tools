package com.google.appinventor.components.runtime.util;

import com.google.appinventor.components.runtime.Component;
import com.google.appinventor.components.runtime.Form;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public abstract class BulkPermissionRequest {
    private String caller;
    private String[] permissions;
    private Component source;

    public abstract void onGranted();

    protected BulkPermissionRequest(Component source, String caller, String... permissions) {
        this.source = source;
        this.caller = caller;
        this.permissions = permissions;
    }

    public void onDenied(String[] permissions) {
        Form form = (Form) this.source.getDispatchDelegate();
        for (String permission : permissions) {
            form.dispatchPermissionDeniedEvent(this.source, this.caller, permission);
        }
    }

    public final List<String> getPermissions() {
        List<String> result = new ArrayList<>(this.permissions.length);
        Collections.addAll(result, this.permissions);
        return result;
    }
}
