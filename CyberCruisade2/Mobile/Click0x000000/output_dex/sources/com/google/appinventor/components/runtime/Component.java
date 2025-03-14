package com.google.appinventor.components.runtime;

import com.google.appinventor.components.annotations.SimpleObject;

@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public interface Component {
    public static final int ACCELEROMETER_SENSITIVITY_MODERATE = 2;
    public static final int ACCELEROMETER_SENSITIVITY_STRONG = 3;
    public static final int ACCELEROMETER_SENSITIVITY_WEAK = 1;
    public static final int ALIGNMENT_CENTER = 1;
    public static final int ALIGNMENT_NORMAL = 0;
    public static final int ALIGNMENT_OPPOSITE = 2;
    public static final String ASSET_DIRECTORY = "component";
    public static final int BUTTON_SHAPE_DEFAULT = 0;
    public static final int BUTTON_SHAPE_OVAL = 3;
    public static final int BUTTON_SHAPE_RECT = 2;
    public static final int BUTTON_SHAPE_ROUNDED = 1;
    public static final int COLOR_BLACK = -16777216;
    public static final int COLOR_BLUE = -16776961;
    public static final int COLOR_CYAN = -16711681;
    public static final int COLOR_DEFAULT = 0;
    public static final int COLOR_DKGRAY = -12303292;
    public static final int COLOR_GRAY = -7829368;
    public static final int COLOR_GREEN = -16711936;
    public static final int COLOR_LTGRAY = -3355444;
    public static final int COLOR_MAGENTA = -65281;
    public static final int COLOR_NONE = 16777215;
    public static final int COLOR_ORANGE = -14336;
    public static final int COLOR_PINK = -20561;
    public static final int COLOR_RED = -65536;
    public static final int COLOR_WHITE = -1;
    public static final int COLOR_YELLOW = -256;
    public static final String DEFAULT_VALUE_COLOR_BLACK = "&HFF000000";
    public static final String DEFAULT_VALUE_COLOR_BLUE = "&HFF0000FF";
    public static final String DEFAULT_VALUE_COLOR_CYAN = "&HFF00FFFF";
    public static final String DEFAULT_VALUE_COLOR_DEFAULT = "&H00000000";
    public static final String DEFAULT_VALUE_COLOR_DKGRAY = "&HFF444444";
    public static final String DEFAULT_VALUE_COLOR_GRAY = "&HFF888888";
    public static final String DEFAULT_VALUE_COLOR_GREEN = "&HFF00FF00";
    public static final String DEFAULT_VALUE_COLOR_LTGRAY = "&HFFCCCCCC";
    public static final String DEFAULT_VALUE_COLOR_MAGENTA = "&HFFFF00FF";
    public static final String DEFAULT_VALUE_COLOR_NONE = "&H00FFFFFF";
    public static final String DEFAULT_VALUE_COLOR_ORANGE = "&HFFFFC800";
    public static final String DEFAULT_VALUE_COLOR_PINK = "&HFFFFAFAF";
    public static final String DEFAULT_VALUE_COLOR_RED = "&HFFFF0000";
    public static final String DEFAULT_VALUE_COLOR_WHITE = "&HFFFFFFFF";
    public static final String DEFAULT_VALUE_COLOR_YELLOW = "&HFFFFFF00";
    public static final String DEFAULT_VALUE_TEXT_TO_SPEECH_COUNTRY = "";
    public static final String DEFAULT_VALUE_TEXT_TO_SPEECH_LANGUAGE = "";
    public static final int DIRECTION_EAST = 3;
    public static final int DIRECTION_MAX = 4;
    public static final int DIRECTION_MIN = -4;
    public static final int DIRECTION_NONE = 0;
    public static final int DIRECTION_NORTH = 1;
    public static final int DIRECTION_NORTHEAST = 2;
    public static final int DIRECTION_NORTHWEST = -4;
    public static final int DIRECTION_SOUTH = -1;
    public static final int DIRECTION_SOUTHEAST = 4;
    public static final int DIRECTION_SOUTHWEST = -2;
    public static final int DIRECTION_WEST = -3;
    public static final float FONT_DEFAULT_SIZE = 14.0f;
    public static final int LENGTH_FILL_PARENT = -2;
    public static final int LENGTH_PERCENT_TAG = -1000;
    public static final int LENGTH_PREFERRED = -1;
    public static final int LENGTH_UNKNOWN = -3;
    public static final String LISTVIEW_KEY_DESCRIPTION = "Text2";
    public static final String LISTVIEW_KEY_IMAGE = "Image";
    public static final String LISTVIEW_KEY_MAIN_TEXT = "Text1";
    public static final int LISTVIEW_LAYOUT_IMAGE_SINGLE_TEXT = 3;
    public static final int LISTVIEW_LAYOUT_IMAGE_TWO_TEXT = 4;
    public static final int LISTVIEW_LAYOUT_SINGLE_TEXT = 0;
    public static final int LISTVIEW_LAYOUT_TWO_TEXT = 1;
    public static final int LISTVIEW_LAYOUT_TWO_TEXT_LINEAR = 2;
    public static final int SCALING_SCALE_PROPORTIONALLY = 0;
    public static final int SCALING_SCALE_TO_FIT = 1;
    public static final float SLIDER_MAX_VALUE = 50.0f;
    public static final float SLIDER_MIN_VALUE = 10.0f;
    public static final float SLIDER_THUMB_VALUE = 30.0f;
    public static final int TOAST_LENGTH_LONG = 1;
    public static final int TOAST_LENGTH_SHORT = 0;
    public static final String TYPEFACE_DEFAULT = "0";
    public static final String TYPEFACE_MONOSPACE = "3";
    public static final String TYPEFACE_SANSSERIF = "1";
    public static final String TYPEFACE_SERIF = "2";

    HandlesEventDispatching getDispatchDelegate();
}
