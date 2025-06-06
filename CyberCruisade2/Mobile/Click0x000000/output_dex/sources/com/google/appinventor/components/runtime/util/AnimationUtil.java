package com.google.appinventor.components.runtime.util;

import android.app.Activity;
import android.util.Log;
import android.view.View;
import android.view.animation.AnimationSet;
import android.view.animation.TranslateAnimation;
import com.google.appinventor.components.common.ScreenAnimation;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public final class AnimationUtil {
    private AnimationUtil() {
    }

    private static void ApplyHorizontalScrollAnimation(View view, boolean left, int speed) {
        float sign = left ? 1.0f : -1.0f;
        AnimationSet animationSet = new AnimationSet(true);
        animationSet.setRepeatCount(-1);
        animationSet.setRepeatMode(1);
        TranslateAnimation move = new TranslateAnimation(2, sign * 0.7f, 2, sign * (-0.7f), 2, 0.0f, 2, 0.0f);
        move.setStartOffset(0L);
        move.setDuration(speed);
        move.setFillAfter(true);
        animationSet.addAnimation(move);
        view.startAnimation(animationSet);
    }

    public static void ApplyAnimation(View view, String animation) {
        if (animation.equals("ScrollRightSlow")) {
            ApplyHorizontalScrollAnimation(view, false, 8000);
            return;
        }
        if (animation.equals("ScrollRight")) {
            ApplyHorizontalScrollAnimation(view, false, 4000);
            return;
        }
        if (animation.equals("ScrollRightFast")) {
            ApplyHorizontalScrollAnimation(view, false, 1000);
            return;
        }
        if (animation.equals("ScrollLeftSlow")) {
            ApplyHorizontalScrollAnimation(view, true, 8000);
            return;
        }
        if (animation.equals("ScrollLeft")) {
            ApplyHorizontalScrollAnimation(view, true, 4000);
        } else if (animation.equals("ScrollLeftFast")) {
            ApplyHorizontalScrollAnimation(view, true, 1000);
        } else if (animation.equals("Stop")) {
            view.clearAnimation();
        }
    }

    public static void ApplyOpenScreenAnimation(Activity activity, String animType) {
        ScreenAnimation anim = ScreenAnimation.fromUnderlyingValue(animType);
        ApplyOpenScreenAnimation(activity, anim);
    }

    public static void ApplyOpenScreenAnimation(Activity activity, ScreenAnimation animType) {
        if (animType == null) {
            return;
        }
        if (SdkLevel.getLevel() <= 4) {
            Log.e("AnimationUtil", "Screen animations are not available on android versions less than 2.0.");
            return;
        }
        int enter = 0;
        int exit = 0;
        switch (AnonymousClass1.$SwitchMap$com$google$appinventor$components$common$ScreenAnimation[animType.ordinal()]) {
            case 1:
                enter = activity.getResources().getIdentifier("fadein", "anim", activity.getPackageName());
                exit = activity.getResources().getIdentifier("hold", "anim", activity.getPackageName());
                break;
            case 2:
                exit = activity.getResources().getIdentifier("zoom_exit", "anim", activity.getPackageName());
                enter = activity.getResources().getIdentifier("zoom_enter", "anim", activity.getPackageName());
                break;
            case 3:
                exit = activity.getResources().getIdentifier("slide_exit", "anim", activity.getPackageName());
                enter = activity.getResources().getIdentifier("slide_enter", "anim", activity.getPackageName());
                break;
            case 4:
                exit = activity.getResources().getIdentifier("slide_v_exit", "anim", activity.getPackageName());
                enter = activity.getResources().getIdentifier("slide_v_enter", "anim", activity.getPackageName());
                break;
            case 5:
                break;
            default:
                return;
        }
        EclairUtil.overridePendingTransitions(activity, enter, exit);
    }

    /* renamed from: com.google.appinventor.components.runtime.util.AnimationUtil$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$google$appinventor$components$common$ScreenAnimation;

        static {
            int[] iArr = new int[ScreenAnimation.values().length];
            $SwitchMap$com$google$appinventor$components$common$ScreenAnimation = iArr;
            try {
                iArr[ScreenAnimation.Fade.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$google$appinventor$components$common$ScreenAnimation[ScreenAnimation.Zoom.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$google$appinventor$components$common$ScreenAnimation[ScreenAnimation.SlideHorizontal.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$google$appinventor$components$common$ScreenAnimation[ScreenAnimation.SlideVertical.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$google$appinventor$components$common$ScreenAnimation[ScreenAnimation.None.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    public static void ApplyCloseScreenAnimation(Activity activity, String animType) {
        ScreenAnimation anim = ScreenAnimation.fromUnderlyingValue(animType);
        ApplyCloseScreenAnimation(activity, anim);
    }

    public static void ApplyCloseScreenAnimation(Activity activity, ScreenAnimation animType) {
        if (animType == null) {
            return;
        }
        if (SdkLevel.getLevel() <= 4) {
            Log.e("AnimationUtil", "Screen animations are not available on android versions less than 2.0.");
            return;
        }
        int enter = 0;
        int exit = 0;
        switch (AnonymousClass1.$SwitchMap$com$google$appinventor$components$common$ScreenAnimation[animType.ordinal()]) {
            case 1:
                exit = activity.getResources().getIdentifier("fadeout", "anim", activity.getPackageName());
                enter = activity.getResources().getIdentifier("hold", "anim", activity.getPackageName());
                break;
            case 2:
                exit = activity.getResources().getIdentifier("zoom_exit_reverse", "anim", activity.getPackageName());
                enter = activity.getResources().getIdentifier("zoom_enter_reverse", "anim", activity.getPackageName());
                break;
            case 3:
                exit = activity.getResources().getIdentifier("slide_exit_reverse", "anim", activity.getPackageName());
                enter = activity.getResources().getIdentifier("slide_enter_reverse", "anim", activity.getPackageName());
                break;
            case 4:
                exit = activity.getResources().getIdentifier("slide_v_exit_reverse", "anim", activity.getPackageName());
                enter = activity.getResources().getIdentifier("slide_v_enter_reverse", "anim", activity.getPackageName());
                break;
            case 5:
                break;
            default:
                return;
        }
        EclairUtil.overridePendingTransitions(activity, enter, exit);
    }
}
