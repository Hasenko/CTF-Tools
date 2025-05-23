package com.google.appinventor.components.runtime;

import android.R;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.graphics.Typeface;
import android.os.Handler;
import android.text.Html;
import android.text.SpannableString;
import android.util.Log;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import androidx.constraintlayout.solver.LinearSystem;
import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.DesignerProperty;
import com.google.appinventor.components.annotations.PropertyCategory;
import com.google.appinventor.components.annotations.SimpleEvent;
import com.google.appinventor.components.annotations.SimpleFunction;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.common.ComponentCategory;
import com.google.appinventor.components.common.PropertyTypeConstants;
import com.google.appinventor.components.runtime.util.SdkLevel;
import kawa.lang.SyntaxForms;

@DesignerComponent(category = ComponentCategory.USERINTERFACE, description = "The Notifier component displays alert dialogs, messages, and temporary alerts, and creates Android log entries through the following methods: <ul><li> ShowMessageDialog: displays a message which the user must dismiss by pressing a button.</li><li> ShowChooseDialog: displays a message two buttons to let the user choose one of two responses, for example, yes or no, after which the AfterChoosing event is raised.</li><li> ShowTextDialog: lets the user enter text in response to the message, after which the AfterTextInput event is raised. <li> ShowPasswordDialog: lets the user enter password in response to the message, after which the AfterTextInput event is raised. <li> ShowAlert: displays a temporary  alert that goes away by itself after a short time.</li><li> ShowProgressDialog: displays an alert with a loading spinner that cannot be dismissed by the user. It can only be dismissed by using the DismissProgressDialog block.</li><li> DismissProgressDialog: Dismisses the progress dialog displayed by ShowProgressDialog.</li><li> LogError: logs an error message to the Android log. </li><li> LogInfo: logs an info message to the Android log.</li><li> LogWarning: logs a warning message to the Android log.</li><li>The messages in the dialogs (but not the alert) can be formatted using the following HTML tags:&lt;b&gt;, &lt;big&gt;, &lt;blockquote&gt;, &lt;br&gt;, &lt;cite&gt;, &lt;dfn&gt;, &lt;div&gt;, &lt;em&gt;, &lt;small&gt;, &lt;strong&gt;, &lt;sub&gt;, &lt;sup&gt;, &lt;tt&gt;. &lt;u&gt;</li><li>You can also use the font tag to specify color, for example, &lt;font color=\"blue\"&gt;.  Some of the available color names are aqua, black, blue, fuchsia, green, grey, lime, maroon, navy, olive, purple, red, silver, teal, white, and yellow</li></ul>", iconName = "images/notifier.png", nonVisible = SyntaxForms.DEBUGGING, version = 6)
@SimpleObject
/* loaded from: classes.dex */
public final class Notifier extends AndroidNonvisibleComponent implements Component {
    private static final String LOG_TAG = "Notifier";
    private final Activity activity;
    private int backgroundColor;
    private final Handler handler;
    private int notifierLength;
    private ProgressDialog progressDialog;
    private int textColor;

    public Notifier(ComponentContainer container) {
        super(container.$form());
        this.notifierLength = 1;
        this.backgroundColor = Component.COLOR_DKGRAY;
        this.textColor = -1;
        this.activity = container.$context();
        this.handler = new Handler();
        this.progressDialog = null;
    }

    @SimpleFunction(description = "Shows a dialog box with an optional title and message (use empty strings if they are not wanted). This dialog box contains a spinning artifact to indicate that the program is working. It cannot be canceled by the user but must be dismissed by the App Inventor Program by using the DismissProgressDialog block.")
    public void ShowProgressDialog(String message, String title) {
        progressDialog(message, title);
    }

    @SimpleFunction(description = "Dismiss a previously displayed ProgressDialog box")
    public void DismissProgressDialog() {
        ProgressDialog progressDialog = this.progressDialog;
        if (progressDialog != null) {
            progressDialog.dismiss();
            this.progressDialog = null;
        }
    }

    public void progressDialog(String message, String title) {
        if (this.progressDialog != null) {
            DismissProgressDialog();
        }
        ProgressDialog show = ProgressDialog.show(this.activity, title, message);
        this.progressDialog = show;
        show.setCancelable(false);
    }

    @SimpleFunction
    public void ShowMessageDialog(String message, String title, String buttonText) {
        oneButtonAlert(this.activity, message, title, buttonText);
    }

    public static void oneButtonAlert(Activity activity, String message, String title, String buttonText, final Runnable callBack) {
        Log.i(LOG_TAG, "One button alert " + message);
        AlertDialog alertDialog = new AlertDialog.Builder(activity).create();
        alertDialog.setTitle(title);
        alertDialog.setCancelable(false);
        alertDialog.setMessage(stringToHTML(message));
        alertDialog.setButton(-3, buttonText, new DialogInterface.OnClickListener() { // from class: com.google.appinventor.components.runtime.Notifier.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                Runnable runnable = callBack;
                if (runnable != null) {
                    runnable.run();
                }
            }
        });
        alertDialog.show();
    }

    public static void oneButtonAlert(Activity activity, String message, String title, String buttonText) {
        oneButtonAlert(activity, message, title, buttonText, null);
    }

    private static SpannableString stringToHTML(String message) {
        return new SpannableString(Html.fromHtml(message));
    }

    @SimpleFunction(description = "Shows a dialog box with two buttons, from which the user can choose.  If cancelable is true there will be an additional CANCEL button. Pressing a button will raise the AfterChoosing event.  The \"choice\" parameter to AfterChoosing will be the text on the button that was pressed, or \"Cancel\" if the  CANCEL button was pressed.")
    public void ShowChooseDialog(String message, String title, final String button1Text, final String button2Text, boolean cancelable) {
        twoButtonDialog(this.activity, message, title, button1Text, button2Text, cancelable, new Runnable() { // from class: com.google.appinventor.components.runtime.Notifier.2
            @Override // java.lang.Runnable
            public void run() {
                Notifier.this.AfterChoosing(button1Text);
            }
        }, new Runnable() { // from class: com.google.appinventor.components.runtime.Notifier.3
            @Override // java.lang.Runnable
            public void run() {
                Notifier.this.AfterChoosing(button2Text);
            }
        }, new Runnable() { // from class: com.google.appinventor.components.runtime.Notifier.4
            @Override // java.lang.Runnable
            public void run() {
                Notifier.this.ChoosingCanceled();
                Notifier notifier = Notifier.this;
                notifier.AfterChoosing(notifier.activity.getString(R.string.cancel));
            }
        });
    }

    public static void twoButtonDialog(Activity activity, String message, String title, String button1Text, String button2Text, boolean cancelable, final Runnable positiveAction, final Runnable negativeAction, final Runnable cancelAction) {
        Log.i(LOG_TAG, "ShowChooseDialog: " + message);
        AlertDialog alertDialog = new AlertDialog.Builder(activity).create();
        alertDialog.setTitle(title);
        alertDialog.setCancelable(false);
        alertDialog.setMessage(stringToHTML(message));
        alertDialog.setButton(-1, button1Text, new DialogInterface.OnClickListener() { // from class: com.google.appinventor.components.runtime.Notifier.5
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                positiveAction.run();
            }
        });
        alertDialog.setButton(-3, button2Text, new DialogInterface.OnClickListener() { // from class: com.google.appinventor.components.runtime.Notifier.6
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                negativeAction.run();
            }
        });
        if (cancelable) {
            String cancelButtonText = activity.getString(R.string.cancel);
            alertDialog.setButton(-2, cancelButtonText, new DialogInterface.OnClickListener() { // from class: com.google.appinventor.components.runtime.Notifier.7
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    cancelAction.run();
                }
            });
        }
        alertDialog.show();
    }

    @SimpleEvent(description = "Event after the user has made a selection for ShowChooseDialog.")
    public void AfterChoosing(String choice) {
        EventDispatcher.dispatchEvent(this, "AfterChoosing", choice);
    }

    @SimpleEvent(description = "Event raised when the user canceled ShowChooseDialog.")
    public void ChoosingCanceled() {
        EventDispatcher.dispatchEvent(this, "ChoosingCanceled", new Object[0]);
    }

    @SimpleFunction(description = "Shows a dialog box where the user can enter text, after which the AfterTextInput event will be raised.  If cancelable is true there will be an additional CANCEL button. Entering text will raise the AfterTextInput event.  The \"response\" parameter to AfterTextInput will be the text that was entered, or \"Cancel\" if the CANCEL button was pressed.")
    public void ShowTextDialog(String message, String title, boolean cancelable) {
        textInputDialog(message, title, cancelable, false);
    }

    @SimpleFunction(description = "Shows a dialog box where the user can enter password (input is masked), after which the AfterTextInput event will be raised.  If cancelable is true there will be an additional CANCEL button. Entering password will raise the AfterTextInput event.  The \"response\" parameter to AfterTextInput will be the entered password, or \"Cancel\" if CANCEL button was pressed.")
    public void ShowPasswordDialog(String message, String title, boolean cancelable) {
        textInputDialog(message, title, cancelable, true);
    }

    private void textInputDialog(String message, String title, boolean cancelable, boolean maskInput) {
        AlertDialog alertDialog = new AlertDialog.Builder(this.activity).create();
        alertDialog.setTitle(title);
        alertDialog.setMessage(stringToHTML(message));
        final EditText input = new EditText(this.activity);
        if (maskInput) {
            input.setInputType(129);
        }
        alertDialog.setView(input);
        alertDialog.setCancelable(false);
        alertDialog.setButton(-1, "OK", new DialogInterface.OnClickListener() { // from class: com.google.appinventor.components.runtime.Notifier.8
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                Notifier.this.HideKeyboard(input);
                Notifier.this.AfterTextInput(input.getText().toString());
            }
        });
        if (cancelable) {
            final String cancelButtonText = this.activity.getString(R.string.cancel);
            alertDialog.setButton(-2, cancelButtonText, new DialogInterface.OnClickListener() { // from class: com.google.appinventor.components.runtime.Notifier.9
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    Notifier.this.HideKeyboard(input);
                    if (!Notifier.this.TextInputCanceled()) {
                        Notifier.this.AfterTextInput(cancelButtonText);
                    }
                }
            });
        }
        alertDialog.show();
    }

    public void HideKeyboard(View view) {
        if (view != null) {
            InputMethodManager imm = (InputMethodManager) this.activity.getSystemService("input_method");
            imm.hideSoftInputFromWindow(view.getWindowToken(), 0);
        }
    }

    @SimpleEvent(description = "Event raised after the user has responded to ShowTextDialog.")
    public void AfterTextInput(String response) {
        EventDispatcher.dispatchEvent(this, "AfterTextInput", response);
    }

    @SimpleEvent(description = "Event raised when the user canceled ShowTextDialog.")
    public boolean TextInputCanceled() {
        return EventDispatcher.dispatchEvent(this, "TextInputCanceled", new Object[0]);
    }

    @SimpleFunction
    public void ShowAlert(final String notice) {
        this.handler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.Notifier.10
            @Override // java.lang.Runnable
            public void run() {
                Notifier.this.toastNow(notice);
            }
        });
    }

    @SimpleProperty(userVisible = LinearSystem.FULL_DEBUG)
    @DesignerProperty(defaultValue = Component.TYPEFACE_SANSSERIF, editorType = PropertyTypeConstants.PROPERTY_TYPE_TOAST_LENGTH)
    public void NotifierLength(int length) {
        this.notifierLength = length;
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "Specifies the length of time that the alert is shown -- either \"short\" or \"long\".")
    public int NotifierLength() {
        return this.notifierLength;
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "Specifies the background color for alerts (not dialogs).")
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_DKGRAY, editorType = PropertyTypeConstants.PROPERTY_TYPE_COLOR)
    public void BackgroundColor(int argb) {
        this.backgroundColor = argb;
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "Specifies the text color for alerts (not dialogs).")
    public int TextColor() {
        return this.textColor;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_WHITE, editorType = PropertyTypeConstants.PROPERTY_TYPE_COLOR)
    public void TextColor(int argb) {
        this.textColor = argb;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void toastNow(String message) {
        int fontsize = SdkLevel.getLevel() >= 14 ? 22 : 15;
        Toast toast = Toast.makeText(this.activity, message, this.notifierLength);
        toast.setGravity(17, toast.getXOffset() / 2, toast.getYOffset() / 2);
        TextView textView = new TextView(this.activity);
        textView.setBackgroundColor(this.backgroundColor);
        textView.setTextColor(this.textColor);
        textView.setTextSize(fontsize);
        Typeface typeface = Typeface.create(Typeface.SANS_SERIF, 0);
        textView.setTypeface(typeface);
        textView.setPadding(10, 10, 10, 10);
        textView.setText(message + " ");
        toast.setView(textView);
        toast.show();
    }

    @SimpleFunction(description = "Writes an error message to the Android system log. See the Google Android documentation for how to access the log.")
    public void LogError(String message) {
        Log.e(LOG_TAG, message);
    }

    @SimpleFunction(description = "Writes a warning message to the Android log. See the Google Android documentation for how to access the log.")
    public void LogWarning(String message) {
        Log.w(LOG_TAG, message);
    }

    @SimpleFunction(description = "Writes an information message to the Android log.")
    public void LogInfo(String message) {
        Log.i(LOG_TAG, message);
    }
}
