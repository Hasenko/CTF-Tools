package com.google.appinventor.components.runtime;

import android.app.Activity;
import android.os.Handler;
import android.util.Log;
import androidx.constraintlayout.solver.LinearSystem;
import com.firebase.client.AuthData;
import com.firebase.client.ChildEventListener;
import com.firebase.client.Config;
import com.firebase.client.DataSnapshot;
import com.firebase.client.Firebase;
import com.firebase.client.FirebaseError;
import com.firebase.client.MutableData;
import com.firebase.client.Transaction;
import com.firebase.client.ValueEventListener;
import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.DesignerProperty;
import com.google.appinventor.components.annotations.PropertyCategory;
import com.google.appinventor.components.annotations.SimpleEvent;
import com.google.appinventor.components.annotations.SimpleFunction;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.annotations.UsesLibraries;
import com.google.appinventor.components.annotations.UsesPermissions;
import com.google.appinventor.components.common.ComponentCategory;
import com.google.appinventor.components.common.PropertyTypeConstants;
import com.google.appinventor.components.runtime.errors.YailRuntimeError;
import com.google.appinventor.components.runtime.util.JsonUtil;
import com.google.appinventor.components.runtime.util.SdkLevel;
import com.google.appinventor.components.runtime.util.YailList;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import kawa.lang.SyntaxForms;
import org.json.JSONException;

@SimpleObject
@UsesPermissions(permissionNames = "android.permission.INTERNET")
@DesignerComponent(androidMinSdk = 10, category = ComponentCategory.EXPERIMENTAL, description = "Non-visible component that communicates with Firebase to store and retrieve information.", designerHelpDescription = "Non-visible component that communicates with a Firebase to store and retrieve information.", iconName = "images/firebaseDB.png", nonVisible = SyntaxForms.DEBUGGING, version = 3)
@UsesLibraries(libraries = "firebase.jar")
/* loaded from: classes.dex */
public class FirebaseDB extends AndroidNonvisibleComponent implements Component {
    private static final String LOG_TAG = "Firebase";
    private static boolean isInitialized = false;
    private static boolean persist = false;
    private final Activity activity;
    private Handler androidUIHandler;
    private Firebase.AuthStateListener authListener;
    private ChildEventListener childListener;
    private String defaultURL;
    private String developerBucket;
    private String firebaseToken;
    private String firebaseURL;
    private Firebase myFirebase;
    private String projectBucket;
    private boolean useDefault;

    private static class ReturnVal {
        String err;
        Object retval;

        private ReturnVal() {
        }

        Object getRetval() {
            return this.retval;
        }
    }

    private static abstract class Transactional {
        final Object arg1;
        final Object arg2;
        final ReturnVal retv;

        abstract Transaction.Result run(MutableData mutableData);

        Transactional(Object arg1, Object arg2, ReturnVal retv) {
            this.arg1 = arg1;
            this.arg2 = arg2;
            this.retv = retv;
        }

        ReturnVal getResult() {
            return this.retv;
        }
    }

    public FirebaseDB(ComponentContainer container) {
        super(container.$form());
        this.firebaseURL = null;
        this.defaultURL = null;
        this.useDefault = true;
        this.androidUIHandler = new Handler();
        Activity $context = container.$context();
        this.activity = $context;
        Firebase.setAndroidContext($context);
        this.developerBucket = "";
        this.projectBucket = "";
        this.firebaseToken = "";
        this.childListener = new ChildEventListener() { // from class: com.google.appinventor.components.runtime.FirebaseDB.1
            public void onChildAdded(final DataSnapshot snapshot, String previousChildKey) {
                FirebaseDB.this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.FirebaseDB.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        FirebaseDB.this.DataChanged(snapshot.getKey(), snapshot.getValue());
                    }
                });
            }

            public void onCancelled(final FirebaseError error) {
                FirebaseDB.this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.FirebaseDB.1.2
                    @Override // java.lang.Runnable
                    public void run() {
                        FirebaseDB.this.FirebaseError(error.getMessage());
                    }
                });
            }

            public void onChildChanged(final DataSnapshot snapshot, String previousChildKey) {
                FirebaseDB.this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.FirebaseDB.1.3
                    @Override // java.lang.Runnable
                    public void run() {
                        FirebaseDB.this.DataChanged(snapshot.getKey(), snapshot.getValue());
                    }
                });
            }

            public void onChildMoved(DataSnapshot snapshot, String previousChildKey) {
            }

            public void onChildRemoved(DataSnapshot snapshot) {
                Log.i(FirebaseDB.LOG_TAG, "onChildRemoved: " + snapshot.getKey() + " removed.");
            }
        };
        this.authListener = new Firebase.AuthStateListener() { // from class: com.google.appinventor.components.runtime.FirebaseDB.2
            public void onAuthStateChanged(AuthData data) {
                Log.i(FirebaseDB.LOG_TAG, "onAuthStateChanged: data = " + data);
                if (data == null) {
                    FirebaseDB.this.myFirebase.authWithCustomToken(FirebaseDB.this.firebaseToken, new Firebase.AuthResultHandler() { // from class: com.google.appinventor.components.runtime.FirebaseDB.2.1
                        public void onAuthenticated(AuthData authData) {
                            Log.i(FirebaseDB.LOG_TAG, "Auth Successful.");
                        }

                        public void onAuthenticationError(FirebaseError error) {
                            Log.e(FirebaseDB.LOG_TAG, "Auth Failed: " + error.getMessage());
                        }
                    });
                }
            }
        };
    }

    public void Initialize() {
        Log.i(LOG_TAG, "Initalize called!");
        isInitialized = true;
        resetListener();
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Gets the URL for this FirebaseDB.", userVisible = LinearSystem.FULL_DEBUG)
    public String FirebaseURL() {
        if (this.useDefault) {
            return "DEFAULT";
        }
        return this.firebaseURL;
    }

    @SimpleProperty(description = "Sets the URL for this FirebaseDB.")
    @DesignerProperty(defaultValue = "DEFAULT", editorType = PropertyTypeConstants.PROPERTY_TYPE_FIREBASE_URL)
    public void FirebaseURL(String url) {
        if (url.equals("DEFAULT")) {
            if (!this.useDefault) {
                this.useDefault = true;
                String str = this.defaultURL;
                if (str == null) {
                    Log.d(LOG_TAG, "FirebaseURL called before DefaultURL (should not happen!)");
                    return;
                } else {
                    this.firebaseURL = str;
                    resetListener();
                    return;
                }
            }
            this.firebaseURL = this.defaultURL;
            return;
        }
        this.useDefault = false;
        String url2 = url + (url.endsWith("/") ? "" : "/");
        if (this.firebaseURL.equals(url2)) {
            return;
        }
        this.firebaseURL = url2;
        this.useDefault = false;
        resetListener();
    }

    @SimpleProperty
    @DesignerProperty(editorType = PropertyTypeConstants.PROPERTY_TYPE_STRING)
    public void DeveloperBucket(String bucket) {
        this.developerBucket = bucket;
        resetListener();
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, userVisible = LinearSystem.FULL_DEBUG)
    public String DeveloperBucket() {
        return this.developerBucket;
    }

    @SimpleProperty(description = "Sets the ProjectBucket for this FirebaseDB.")
    @DesignerProperty(defaultValue = "", editorType = PropertyTypeConstants.PROPERTY_TYPE_STRING)
    public void ProjectBucket(String bucket) {
        if (!this.projectBucket.equals(bucket)) {
            this.projectBucket = bucket;
            resetListener();
        }
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Gets the ProjectBucket for this FirebaseDB.")
    public String ProjectBucket() {
        return this.projectBucket;
    }

    @SimpleProperty
    @DesignerProperty(editorType = PropertyTypeConstants.PROPERTY_TYPE_STRING)
    public void FirebaseToken(String JWT) {
        this.firebaseToken = JWT;
        resetListener();
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, userVisible = LinearSystem.FULL_DEBUG)
    public String FirebaseToken() {
        return this.firebaseToken;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "If true, variables will retain their values when off-line and the App exits. Values will be uploaded to Firebase the next time the App is run while connected to the network. This is useful for applications which will gather data while not connected to the network. Note: AppendValue and RemoveFirst will not work correctly when off-line, they require a network connection.<br/><br/> <i>Note</i>: If you set Persist on any Firebase component, on any screen, it makes all Firebase components on all screens persistent. This is a limitation of the low level Firebase library. Also be aware that if you want to set persist to true, you should do so before connecting the Companion for incremental development.", userVisible = LinearSystem.FULL_DEBUG)
    @DesignerProperty(defaultValue = "False", editorType = PropertyTypeConstants.PROPERTY_TYPE_BOOLEAN)
    public void Persist(boolean value) {
        Log.i(LOG_TAG, "Persist Called: Value = " + value);
        if (persist != value) {
            if (isInitialized) {
                throw new RuntimeException("You cannot change the Persist value of Firebase after Application Initialization, this includes the Companion");
            }
            Config config = Firebase.getDefaultConfig();
            config.setPersistenceEnabled(value);
            Firebase.setDefaultConfig(config);
            persist = value;
            resetListener();
        }
    }

    private void resetListener() {
        if (!isInitialized) {
            return;
        }
        Firebase firebase = this.myFirebase;
        if (firebase != null) {
            firebase.removeEventListener(this.childListener);
            this.myFirebase.removeAuthStateListener(this.authListener);
        }
        this.myFirebase = null;
        connectFirebase();
    }

    @SimpleFunction(description = "Remove the tag from Firebase")
    public void ClearTag(String tag) {
        this.myFirebase.child(tag).removeValue();
    }

    @SimpleFunction
    public void StoreValue(String tag, Object valueToStore) {
        if (valueToStore != null) {
            try {
                valueToStore = JsonUtil.getJsonRepresentation(valueToStore);
            } catch (JSONException e) {
                throw new YailRuntimeError("Value failed to convert to JSON.", "JSON Creation Error.");
            }
        }
        this.myFirebase.child(tag).setValue(valueToStore);
    }

    @SimpleFunction
    public void GetValue(final String tag, final Object valueIfTagNotThere) {
        this.myFirebase.child(tag).addListenerForSingleValueEvent(new ValueEventListener() { // from class: com.google.appinventor.components.runtime.FirebaseDB.3
            public void onDataChange(DataSnapshot snapshot) {
                final AtomicReference<Object> value = new AtomicReference<>();
                try {
                    if (snapshot.exists()) {
                        value.set(snapshot.getValue());
                    } else {
                        value.set(JsonUtil.getJsonRepresentation(valueIfTagNotThere));
                    }
                    FirebaseDB.this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.FirebaseDB.3.1
                        @Override // java.lang.Runnable
                        public void run() {
                            FirebaseDB.this.GotValue(tag, value.get());
                        }
                    });
                } catch (JSONException e) {
                    throw new YailRuntimeError("Value failed to convert to JSON.", "JSON Creation Error.");
                }
            }

            public void onCancelled(final FirebaseError error) {
                FirebaseDB.this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.FirebaseDB.3.2
                    @Override // java.lang.Runnable
                    public void run() {
                        FirebaseDB.this.FirebaseError(error.getMessage());
                    }
                });
            }
        });
    }

    @SimpleEvent
    public void GotValue(String tag, Object value) {
        if (value != null) {
            try {
                if (value instanceof String) {
                    value = JsonUtil.getObjectFromJson((String) value, true);
                }
            } catch (JSONException e) {
                throw new YailRuntimeError("Value failed to convert from JSON.", "JSON Retrieval Error.");
            }
        }
        EventDispatcher.dispatchEvent(this, "GotValue", tag, value);
    }

    @SimpleEvent
    public void DataChanged(String tag, Object value) {
        if (value != null) {
            try {
                if (value instanceof String) {
                    value = JsonUtil.getObjectFromJson((String) value, true);
                }
            } catch (JSONException e) {
                throw new YailRuntimeError("Value failed to convert from JSON.", "JSON Retrieval Error.");
            }
        }
        EventDispatcher.dispatchEvent(this, "DataChanged", tag, value);
    }

    @SimpleEvent
    public void FirebaseError(String message) {
        Log.e(LOG_TAG, message);
        boolean dispatched = EventDispatcher.dispatchEvent(this, "FirebaseError", message);
        if (!dispatched) {
            Notifier.oneButtonAlert(this.form, message, "FirebaseError", "Continue");
        }
    }

    private void connectFirebase() {
        if (SdkLevel.getLevel() < 10) {
            Notifier.oneButtonAlert(this.activity, "The version of Android on this device is too old to use Firebase.", "Android Too Old", "OK");
            return;
        }
        if (this.useDefault) {
            this.myFirebase = new Firebase(this.firebaseURL + "developers/" + this.developerBucket + this.projectBucket);
        } else {
            this.myFirebase = new Firebase(this.firebaseURL + this.projectBucket);
        }
        this.myFirebase.addChildEventListener(this.childListener);
        this.myFirebase.addAuthStateListener(this.authListener);
    }

    @SimpleFunction(description = "If you are having difficulty with the Companion and you are switching between different Firebase accounts, you may need to use this function to clear internal Firebase caches. You can just use the \"Do It\" function on this block in the blocks editor. Note: You should not normally need to use this block as part of an application.")
    public void Unauthenticate() {
        if (this.myFirebase == null) {
            connectFirebase();
        }
        this.myFirebase.unauth();
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, userVisible = LinearSystem.FULL_DEBUG)
    @DesignerProperty(editorType = PropertyTypeConstants.PROPERTY_TYPE_STRING)
    public void DefaultURL(String url) {
        this.defaultURL = url;
        if (this.useDefault) {
            this.firebaseURL = url;
            resetListener();
        }
    }

    @SimpleFunction(description = "Return the first element of a list and atomically remove it. If two devices use this function simultaneously, one will get the first element and the the other will get the second element, or an error if there is no available element. When the element is available, the \"FirstRemoved\" event will be triggered.")
    public void RemoveFirst(String tag) {
        final ReturnVal result = new ReturnVal();
        Firebase firebaseChild = this.myFirebase.child(tag);
        Transactional toRun = new Transactional(null, null, result) { // from class: com.google.appinventor.components.runtime.FirebaseDB.4
            @Override // com.google.appinventor.components.runtime.FirebaseDB.Transactional
            Transaction.Result run(MutableData currentData) {
                Object value = currentData.getValue();
                if (value == null) {
                    result.err = "Previous value was empty.";
                    return Transaction.abort();
                }
                try {
                    if (!(value instanceof String)) {
                        result.err = "Invalid JSON object in database (shouldn't happen!)";
                        return Transaction.abort();
                    }
                    Object value2 = JsonUtil.getObjectFromJson((String) value, true);
                    if (value2 instanceof List) {
                        if (((List) value2).isEmpty()) {
                            result.err = "The list was empty";
                            return Transaction.abort();
                        }
                        result.retval = ((List) value2).remove(0);
                        try {
                            currentData.setValue(JsonUtil.getJsonRepresentation(YailList.makeList((List) value2)));
                            return Transaction.success(currentData);
                        } catch (JSONException e) {
                            result.err = "Could not convert value to JSON.";
                            return Transaction.abort();
                        }
                    }
                    result.err = "You can only remove elements from a list.";
                    return Transaction.abort();
                } catch (JSONException e2) {
                    result.err = "Invalid JSON object in database (shouldn't happen!)";
                    return Transaction.abort();
                }
            }
        };
        firebaseTransaction(toRun, firebaseChild, new Runnable() { // from class: com.google.appinventor.components.runtime.FirebaseDB.5
            @Override // java.lang.Runnable
            public void run() {
                FirebaseDB.this.FirstRemoved(result.getRetval());
            }
        });
    }

    @SimpleFunction(description = "Get the list of tags for this application. When complete a \"TagList\" event will be triggered with the list of known tags.")
    public void GetTagList() {
        Firebase zFireBase = this.myFirebase.child("");
        zFireBase.addListenerForSingleValueEvent(new ValueEventListener() { // from class: com.google.appinventor.components.runtime.FirebaseDB.6
            public void onDataChange(DataSnapshot data) {
                Object value = data.getValue();
                if (value instanceof HashMap) {
                    final List listValue = new ArrayList(((HashMap) value).keySet());
                    FirebaseDB.this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.FirebaseDB.6.1
                        @Override // java.lang.Runnable
                        public void run() {
                            FirebaseDB.this.TagList(listValue);
                        }
                    });
                }
            }

            public void onCancelled(FirebaseError error) {
            }
        });
    }

    @SimpleEvent(description = "Event triggered when we have received the list of known tags. Used with the \"GetTagList\" Function.")
    public void TagList(List value) {
        EventDispatcher.dispatchEvent(this, "TagList", value);
    }

    @SimpleEvent(description = "Event triggered by the \"RemoveFirst\" function. The argument \"value\" is the object that was the first in the list, and which is now removed.")
    public void FirstRemoved(Object value) {
        EventDispatcher.dispatchEvent(this, "FirstRemoved", value);
    }

    @SimpleFunction(description = "Append a value to the end of a list atomically. If two devices use this function simultaneously, both will be appended and no data lost.")
    public void AppendValue(String tag, final Object valueToAdd) {
        final ReturnVal result = new ReturnVal();
        Firebase firebaseChild = this.myFirebase.child(tag);
        Transactional toRun = new Transactional(null, null, result) { // from class: com.google.appinventor.components.runtime.FirebaseDB.7
            @Override // com.google.appinventor.components.runtime.FirebaseDB.Transactional
            Transaction.Result run(MutableData currentData) {
                Object value = currentData.getValue();
                if (value == null) {
                    result.err = "Previous value was empty.";
                    return Transaction.abort();
                }
                try {
                    if (!(value instanceof String)) {
                        result.err = "Invalid JSON object in database (shouldn't happen!)";
                        return Transaction.abort();
                    }
                    Object value2 = JsonUtil.getObjectFromJson((String) value, true);
                    if (value2 instanceof List) {
                        ((List) value2).add(valueToAdd);
                        try {
                            currentData.setValue(JsonUtil.getJsonRepresentation((List) value2));
                            return Transaction.success(currentData);
                        } catch (JSONException e) {
                            result.err = "Could not convert value to JSON.";
                            return Transaction.abort();
                        }
                    }
                    result.err = "You can only append to a list.";
                    return Transaction.abort();
                } catch (JSONException e2) {
                    result.err = "Invalid JSON object in database (shouldn't happen!)";
                    return Transaction.abort();
                }
            }
        };
        firebaseTransaction(toRun, firebaseChild, null);
    }

    private void firebaseTransaction(final Transactional toRun, Firebase firebase, final Runnable whenDone) {
        final ReturnVal result = toRun.getResult();
        firebase.runTransaction(new Transaction.Handler() { // from class: com.google.appinventor.components.runtime.FirebaseDB.8
            public Transaction.Result doTransaction(MutableData currentData) {
                return toRun.run(currentData);
            }

            public void onComplete(final FirebaseError firebaseError, boolean committed, DataSnapshot currentData) {
                if (firebaseError != null) {
                    FirebaseDB.this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.FirebaseDB.8.1
                        @Override // java.lang.Runnable
                        public void run() {
                            Log.i(FirebaseDB.LOG_TAG, "AppendValue(onComplete): firebase: " + firebaseError.getMessage());
                            Log.i(FirebaseDB.LOG_TAG, "AppendValue(onComplete): result.err: " + result.err);
                            FirebaseDB.this.FirebaseError(firebaseError.getMessage());
                        }
                    });
                } else if (!committed) {
                    FirebaseDB.this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.FirebaseDB.8.2
                        @Override // java.lang.Runnable
                        public void run() {
                            Log.i(FirebaseDB.LOG_TAG, "AppendValue(!committed): result.err: " + result.err);
                            FirebaseDB.this.FirebaseError(result.err);
                        }
                    });
                } else if (whenDone != null) {
                    FirebaseDB.this.androidUIHandler.post(whenDone);
                }
            }
        });
    }
}
