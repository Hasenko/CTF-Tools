package com.google.appinventor.components.annotations.androidmanifest;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: classes.dex */
public @interface ActivityElement {
    String allowEmbedded() default "";

    String allowTaskReparenting() default "";

    String alwaysRetainTaskState() default "";

    String autoRemoveFromRecents() default "";

    String banner() default "";

    String clearTaskOnLaunch() default "";

    String colorMode() default "";

    String configChanges() default "";

    String directBootAware() default "";

    String documentLaunchMode() default "";

    String enabled() default "";

    String excludeFromRecents() default "";

    String exported() default "true";

    String finishOnTaskLaunch() default "";

    String hardwareAccelerated() default "";

    String icon() default "";

    String immersive() default "";

    IntentFilterElement[] intentFilters() default {};

    String label() default "";

    String launchMode() default "";

    String lockTaskMode() default "";

    String maxAspectRatio() default "";

    String maxRecents() default "";

    MetaDataElement[] metaDataElements() default {};

    String multiprocess() default "";

    String name();

    String noHistory() default "";

    String parentActivityName() default "";

    String permission() default "";

    String persistableMode() default "";

    String process() default "";

    String relinquishTaskIdentity() default "";

    String resizeableActivity() default "";

    String screenOrientation() default "";

    String showForAllUsers() default "";

    String stateNotNeeded() default "";

    String supportsPictureInPicture() default "";

    String taskAffinity() default "";

    String theme() default "";

    String uiOptions() default "";

    String windowSoftInputMode() default "";
}
