package com.google.appinventor.components.annotations;

import com.google.appinventor.components.common.ComponentCategory;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public @interface DesignerComponent {
    int androidMinSdk() default 7;

    ComponentCategory category() default ComponentCategory.UNINITIALIZED;

    String dateBuilt() default "";

    String description() default "";

    String designerHelpDescription() default "";

    String helpUrl() default "";

    String iconName() default "";

    String licenseName() default "";

    boolean nonVisible() default false;

    boolean showOnPalette() default true;

    int version();

    String versionName() default "";
}
