package com.google.appinventor.components.runtime;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.os.AsyncTask;
import android.util.Log;
import com.google.api.client.extensions.android2.AndroidHttp;
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
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
import com.google.appinventor.components.runtime.util.ClientLoginHelper;
import com.google.appinventor.components.runtime.util.ErrorMessages;
import com.google.appinventor.components.runtime.util.IClientLoginHelper;
import com.google.appinventor.components.runtime.util.MediaUtil;
import com.google.appinventor.components.runtime.util.OAuth2Helper;
import com.google.appinventor.components.runtime.util.SdkLevel;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import kawa.lang.SyntaxForms;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.HttpConnectionParams;
import org.json.JSONException;
import org.json.JSONObject;

@SimpleObject
@UsesPermissions(permissionNames = "android.permission.INTERNET,android.permission.ACCOUNT_MANAGER,android.permission.MANAGE_ACCOUNTS,android.permission.GET_ACCOUNTS,android.permission.USE_CREDENTIALS,android.permission.WRITE_EXTERNAL_STORAGE,android.permission.READ_EXTERNAL_STORAGE")
@DesignerComponent(category = ComponentCategory.INTERNAL, description = "<p>A non-visible component that communicates with Google Fusion Tables. Fusion Tables let you store, share, query and visualize data tables; this component lets you query, create, and modify these tables.</p> <p><font color=red><b>NOTE:</b>&nbsp;Google shutdown the Fusion Tables service on December 3, 2019. This component no longer functions.</font></p> <p>This component uses the <a href=\"https://developers.google.com/fusiontables/docs/v2/getting_started\" target=\"_blank\">Fusion Tables API V2.0</a>. <p>Applications using Fusion Tables must authentication to Google's servers. There are two ways this can be done. The first way uses an API Key which you the developer obtain (see below). With this approach end-users must also login to access a Fusion Table. The second approach is to use a Service Account. With this approach you create credentials and a special \"Service Account Email Address\" which you obtain from the <a href=\"https://code.google.com/apis/console/\" target=\"_blank\">Google APIs Console</a>. You then tell the Fusion Table Control the name of the Service Account Email address and upload the secret key as an asset to your application and set the KeyFile property to point at this file. Finally you check the \"UseServiceAuthentication\" checkbox in the designer. When using a Service Account, end-users do not need to login to use Fusion Tables, your service account authenticates all access.</p> <p>To get an API key, follow these instructions.</p> <ol><li>Go to your <a href=\"https://code.google.com/apis/console/\" target=\"_blank\">Google APIs Console</a> and login if necessary.</li><li>Select the <i>Services</i> item from the menu on the left.</li><li>Choose the <i>Fusiontables</i> service from the list provided and turn it on.</li><li>Go back to the main menu and select the <i>API Access</i> item. </li></ol><p>Your API Key will be near the bottom of that pane in the section called \"Simple API Access\".You will have to provide that key as the value for the <i>ApiKey</i> property in your Fusiontables app.</p><p>Once you have an API key, set the value of the <i>Query</i> property to a valid Fusiontables SQL query and call <i>SendQuery</i> to execute the query.  App Inventor will send the query to the Fusion Tables server and the <i>GotResult</i> block will fire when a result is returned from the server.Query results will be returned in CSV format, and can be converted to list format using the \"list from csv table\" or \"list from csv row\" blocks.</p><p>Note that you do not need to worry about UTF-encoding the query. But you do need to make sure the query follows the syntax described in <a href=\"https://developers.google.com/fusiontables/docs/v2/getting_started\" target=\"_blank\">the reference manual</a>, which means that things like capitalization for names of columns matters, and that single quotes must be used around column names if there are spaces in them.</p>", iconName = "images/fusiontables.png", nonVisible = SyntaxForms.DEBUGGING, version = 4)
@UsesLibraries(libraries = "fusiontables.jar,google-api-client.jar,google-api-client-android2-beta.jar,google-http-client.jar,google-http-client-android2-beta.jar,google-http-client-android3-beta.jar,google-oauth-client.jar,guava.jar,gson-2.1.jar")
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class FusiontablesControl extends AndroidNonvisibleComponent implements Component {
    public static final String APP_NAME = "App Inventor";
    public static final String AUTHORIZATION_HEADER_PREFIX = "Bearer ";
    public static final String AUTH_TOKEN_TYPE_FUSIONTABLES = "oauth2:https://www.googleapis.com/auth/fusiontables";
    private static final String DEFAULT_QUERY = "show tables";
    private static final String DIALOG_TEXT = "Choose an account to access FusionTables";
    public static final String FUSIONTABLES_POST = "https://www.googleapis.com/fusiontables/v2/tables";
    private static final String FUSIONTABLE_SERVICE = "fusiontables";
    private static final String FUSION_QUERY_URL = "http://www.google.com/fusiontables/v2/query";
    private static final String LOG_TAG = "FUSION";
    private static final int SERVER_TIMEOUT_MS = 30000;
    private final Activity activity;
    private String apiKey;
    private String authTokenType;
    private java.io.File cachedServiceCredentials;
    private final ComponentContainer container;
    private String errorMessage;
    private boolean isServiceAuth;
    private String keyPath;
    private String loadingDialogMessage;
    private String query;
    private String queryResultStr;
    private final IClientLoginHelper requestHelper;
    private String scope;
    private String serviceAccountEmail;
    private boolean showLoadingDialog;
    private String standardErrorMessage;

    public FusiontablesControl(ComponentContainer componentContainer) {
        super(componentContainer.$form());
        this.cachedServiceCredentials = null;
        this.authTokenType = AUTH_TOKEN_TYPE_FUSIONTABLES;
        this.standardErrorMessage = "Error on Fusion Tables query";
        this.keyPath = "";
        this.isServiceAuth = false;
        this.serviceAccountEmail = "";
        this.scope = "https://www.googleapis.com/auth/fusiontables";
        this.loadingDialogMessage = "Please wait loading...";
        this.showLoadingDialog = true;
        this.container = componentContainer;
        this.activity = componentContainer.$context();
        this.requestHelper = createClientLoginHelper(DIALOG_TEXT, FUSIONTABLE_SERVICE);
        this.query = DEFAULT_QUERY;
        if (SdkLevel.getLevel() < 5) {
            showNoticeAndDie("Sorry. The Fusiontables component is not compatible with this phone.", "This application must exit.", "Rats!");
        }
    }

    private void showNoticeAndDie(String message, String title, String buttonText) {
        AlertDialog alertDialog = new AlertDialog.Builder(this.activity).create();
        alertDialog.setTitle(title);
        alertDialog.setCancelable(false);
        alertDialog.setMessage(message);
        alertDialog.setButton(buttonText, new DialogInterface.OnClickListener() { // from class: com.google.appinventor.components.runtime.FusiontablesControl.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                FusiontablesControl.this.activity.finish();
            }
        });
        alertDialog.show();
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Indicates whether a service account should be used for authentication")
    public boolean UseServiceAuthentication() {
        return this.isServiceAuth;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "False", editorType = "boolean")
    public void UseServiceAuthentication(boolean bool) {
        this.isServiceAuth = bool;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The Service Account Email Address when service account authentication is in use.")
    public String ServiceAccountEmail() {
        return this.serviceAccountEmail;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "", editorType = "string")
    public void ServiceAccountEmail(String email) {
        this.serviceAccountEmail = email;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "", editorType = "string")
    public void ApiKey(String apiKey) {
        this.apiKey = apiKey;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Your Google API Key. For help, click on the questionmark (?) next to the FusiontablesControl component in the Palette. ")
    public String ApiKey() {
        return this.apiKey;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = DEFAULT_QUERY, editorType = "string")
    public void Query(String query) {
        this.query = query;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The query to send to the Fusion Tables API. <p>For legal query formats and examples, see the <a href=\"https://developers.google.com/fusiontables/docs/v2/getting_started\" target=\"_blank\">Fusion Tables API v2.0 reference manual</a>.</p> <p>Note that you do not need to worry about UTF-encoding the query. But you do need to make sure it follows the syntax described in the reference manual, which means that things like capitalization for names of columns matters, and that single quotes need to be used around column names if there are spaces in them.</p> ")
    public String Query() {
        return this.query;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "", editorType = "asset")
    public void KeyFile(String path) {
        if (path.equals(this.keyPath)) {
            return;
        }
        java.io.File file = this.cachedServiceCredentials;
        if (file != null) {
            file.delete();
            this.cachedServiceCredentials = null;
        }
        this.keyPath = path == null ? "" : path;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Specifies the path of the private key file.  This key file is used to get access to the FusionTables API.")
    public String KeyFile() {
        return this.keyPath;
    }

    @SimpleFunction(description = "Send the query to the Fusiontables server.")
    public void SendQuery() {
        new QueryProcessorV2(this.activity).execute(this.query);
    }

    @SimpleFunction(description = "DEPRECATED. This block is deprecated as of the end of 2012.  Use SendQuery.")
    @Deprecated
    public void DoQuery() {
        if (this.requestHelper != null) {
            new QueryProcessor().execute(this.query);
        } else {
            this.form.dispatchErrorOccurredEvent(this, "DoQuery", 3, new Object[0]);
        }
    }

    @SimpleEvent(description = "Indicates that the Fusion Tables query has finished processing, with a result.  The result of the query will generally be returned in CSV format, and can be converted to list format using the \"list from csv table\" or \"list from csv row\" blocks.")
    public void GotResult(String result) {
        EventDispatcher.dispatchEvent(this, "GotResult", result);
    }

    @SimpleFunction(description = "Forget end-users login credentials. Has no effect on service authentication")
    public void ForgetLogin() {
        OAuth2Helper.resetAccountCredential(this.activity);
    }

    @SimpleFunction(description = "Inserts a row into the specified fusion table. The tableId field is the id of thefusion table. The columns is a comma-separated list of the columns to insert values into. The values field specifies what values to insert into each column.")
    public void InsertRow(String tableId, String columns, String values) {
        this.query = "INSERT INTO " + tableId + " (" + columns + ") VALUES (" + values + ")";
        new QueryProcessorV2(this.activity).execute(this.query);
    }

    @SimpleFunction(description = "Gets all the rows from a specified fusion table. The tableId field is the id of therequired fusion table. The columns field is a comma-separeted list of the columns to retrieve.")
    public void GetRows(String tableId, String columns) {
        this.query = "SELECT " + columns + " FROM " + tableId;
        new QueryProcessorV2(this.activity).execute(this.query);
    }

    @SimpleFunction(description = "Gets all the rows from a fusion table that meet certain conditions. The tableId field isthe id of the required fusion table. The columns field is a comma-separeted list of the columns toretrieve. The conditions field specifies what rows to retrieve from the table, for example the rows in whicha particular column value is not null.")
    public void GetRowsWithConditions(String tableId, String columns, String conditions) {
        this.query = "SELECT " + columns + " FROM " + tableId + " WHERE " + conditions;
        new QueryProcessorV2(this.activity).execute(this.query);
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "Please wait loading...", editorType = "string")
    public void LoadingDialogMessage(String loadingDialogMessage) {
        this.loadingDialogMessage = loadingDialogMessage;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Set the loading message for the dialog.")
    public String LoadingDialogMessage() {
        return this.loadingDialogMessage;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "True", editorType = "boolean")
    public void ShowLoadingDialog(boolean showLoadingDialog) {
        this.showLoadingDialog = showLoadingDialog;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Whether or not to show the loading dialog")
    public boolean ShowLoadingDialog() {
        return this.showLoadingDialog;
    }

    private IClientLoginHelper createClientLoginHelper(String accountPrompt, String service) {
        if (SdkLevel.getLevel() >= 5) {
            HttpClient httpClient = new DefaultHttpClient();
            HttpConnectionParams.setSoTimeout(httpClient.getParams(), SERVER_TIMEOUT_MS);
            HttpConnectionParams.setConnectionTimeout(httpClient.getParams(), SERVER_TIMEOUT_MS);
            return new ClientLoginHelper(this.activity, service, accountPrompt, httpClient);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public HttpUriRequest genFusiontablesQuery(String query) throws IOException {
        HttpPost request = new HttpPost(FUSION_QUERY_URL);
        ArrayList<BasicNameValuePair> pair = new ArrayList<>(1);
        pair.add(new BasicNameValuePair("sql", query));
        UrlEncodedFormEntity entity = new UrlEncodedFormEntity(pair, "UTF-8");
        entity.setContentType("application/x-www-form-urlencoded");
        request.setEntity(entity);
        return request;
    }

    private class QueryProcessor extends AsyncTask<String, Void, String> {
        private ProgressDialog progress;

        private QueryProcessor() {
            this.progress = null;
        }

        @Override // android.os.AsyncTask
        protected void onPreExecute() {
            this.progress = ProgressDialog.show(FusiontablesControl.this.activity, "Fusiontables", "processing query...", true);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public String doInBackground(String... params) {
            try {
                HttpUriRequest request = FusiontablesControl.this.genFusiontablesQuery(params[0]);
                Log.d(FusiontablesControl.LOG_TAG, "Fetching: " + params[0]);
                HttpResponse response = FusiontablesControl.this.requestHelper.execute(request);
                ByteArrayOutputStream outstream = new ByteArrayOutputStream();
                response.getEntity().writeTo(outstream);
                Log.d(FusiontablesControl.LOG_TAG, "Response: " + response.getStatusLine().toString());
                return outstream.toString();
            } catch (IOException e) {
                e.printStackTrace();
                return e.getMessage();
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(String result) {
            this.progress.dismiss();
            FusiontablesControl.this.GotResult(result);
        }
    }

    public com.google.api.client.http.HttpResponse sendQuery(String query, String authToken) {
        return null;
    }

    public static String httpResponseToString(com.google.api.client.http.HttpResponse response) {
        if (response == null) {
            return "";
        }
        if (response.getStatusCode() != 200) {
            String resultStr = response.getStatusCode() + " " + response.getStatusMessage();
            return resultStr;
        }
        try {
            String resultStr2 = parseResponse(response.getContent());
            return resultStr2;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }

    public static String httpApacheResponseToString(HttpResponse response) {
        if (response == null) {
            return "";
        }
        if (response.getStatusLine().getStatusCode() != 200) {
            String resultStr = response.getStatusLine().getStatusCode() + " " + response.getStatusLine().getReasonPhrase();
            return resultStr;
        }
        try {
            String resultStr2 = parseResponse(response.getEntity().getContent());
            return resultStr2;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }

    public static String parseResponse(InputStream input) {
        String resultStr = "";
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(input));
            StringBuilder sb = new StringBuilder();
            while (true) {
                String line = br.readLine();
                if (line != null) {
                    sb.append(line + "\n");
                } else {
                    resultStr = sb.toString();
                    Log.i(LOG_TAG, "resultStr = " + resultStr);
                    br.close();
                    return resultStr;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return resultStr;
        }
    }

    public void handleOAuthError(String msg) {
        Log.i(LOG_TAG, "handleOAuthError: " + msg);
        this.errorMessage = msg;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String parseSqlCreateQueryToJson(String query) {
        Log.i(LOG_TAG, "parsetoJSonSqlCreate :" + query);
        StringBuilder jsonContent = new StringBuilder();
        String query2 = query.trim();
        String tableName = query2.substring("create table".length(), query2.indexOf(40)).trim();
        String columnsList = query2.substring(query2.indexOf(40) + 1, query2.indexOf(41));
        String[] columnSpecs = columnsList.split(",");
        jsonContent.append("{'columns':[");
        for (int k = 0; k < columnSpecs.length; k++) {
            String[] nameTypePair = columnSpecs[k].split(":");
            jsonContent.append("{'name': '" + nameTypePair[0].trim() + "', 'type': '" + nameTypePair[1].trim() + "'}");
            if (k < columnSpecs.length - 1) {
                jsonContent.append(",");
            }
        }
        jsonContent.append("],");
        jsonContent.append("'isExportable':'true',");
        jsonContent.append("'name': '" + tableName + "'");
        jsonContent.append("}");
        jsonContent.insert(0, "CREATE TABLE ");
        Log.i(LOG_TAG, "result = " + jsonContent.toString());
        return jsonContent.toString();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String doPostRequest(String query, String authToken) {
        String jsonContent = query.trim().substring("create table".length());
        Log.i(LOG_TAG, "Http Post content = " + jsonContent);
        HttpPost request = new HttpPost("https://www.googleapis.com/fusiontables/v2/tables?key=" + ApiKey());
        try {
            StringEntity entity = new StringEntity(jsonContent);
            entity.setContentType("application/json");
            request.addHeader("Authorization", AUTHORIZATION_HEADER_PREFIX + authToken);
            request.setEntity(entity);
            HttpClient client = new DefaultHttpClient();
            try {
                HttpResponse response = client.execute(request);
                int statusCode = response.getStatusLine().getStatusCode();
                if (response != null && statusCode == 200) {
                    try {
                        String jsonResult = httpApacheResponseToString(response);
                        JSONObject jsonObj = new JSONObject(jsonResult);
                        if (jsonObj.has("tableId")) {
                            this.queryResultStr = "tableId," + jsonObj.get("tableId");
                        } else {
                            this.queryResultStr = jsonResult;
                        }
                        Log.i(LOG_TAG, "Response code = " + response.getStatusLine());
                        Log.i(LOG_TAG, "Query = " + query + "\nResultStr = " + this.queryResultStr);
                    } catch (IllegalStateException e) {
                        e.printStackTrace();
                        return "Error: " + e.getMessage();
                    } catch (JSONException e2) {
                        e2.printStackTrace();
                        return "Error: " + e2.getMessage();
                    }
                } else {
                    Log.i(LOG_TAG, "Error: " + response.getStatusLine().toString());
                    this.queryResultStr = response.getStatusLine().toString();
                }
                return this.queryResultStr;
            } catch (ClientProtocolException e3) {
                e3.printStackTrace();
                return "Error: " + e3.getMessage();
            } catch (IOException e4) {
                e4.printStackTrace();
                return "Error: " + e4.getMessage();
            }
        } catch (UnsupportedEncodingException e5) {
            e5.printStackTrace();
            return "Error: " + e5.getMessage();
        }
    }

    private class QueryProcessorV2 extends AsyncTask<String, Void, String> {
        private static final String STAG = "FUSION_SERVICE_ACCOUNT";
        private static final String TAG = "QueryProcessorV2";
        private final Activity activity;
        private final ProgressDialog dialog;

        QueryProcessorV2(Activity activity) {
            Log.i(TAG, "Creating AsyncFusiontablesQuery");
            this.activity = activity;
            this.dialog = new ProgressDialog(activity);
        }

        @Override // android.os.AsyncTask
        protected void onPreExecute() {
            if (FusiontablesControl.this.ShowLoadingDialog()) {
                this.dialog.setMessage(FusiontablesControl.this.LoadingDialogMessage());
                this.dialog.show();
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public String doInBackground(String... params) {
            String query = params[0];
            Log.i(TAG, "Starting doInBackground " + query);
            if (FusiontablesControl.this.isServiceAuth) {
                return serviceAuthRequest(query);
            }
            return userAuthRequest(query);
        }

        private String userAuthRequest(String query) {
            FusiontablesControl.this.queryResultStr = "";
            OAuth2Helper oauthHelper = new OAuth2Helper();
            String authToken = oauthHelper.getRefreshedAuthToken(this.activity, FusiontablesControl.this.authTokenType);
            if (authToken != null) {
                if (query.toLowerCase().contains("create table")) {
                    FusiontablesControl fusiontablesControl = FusiontablesControl.this;
                    fusiontablesControl.queryResultStr = fusiontablesControl.doPostRequest(fusiontablesControl.parseSqlCreateQueryToJson(query), authToken);
                    return FusiontablesControl.this.queryResultStr;
                }
                com.google.api.client.http.HttpResponse response = FusiontablesControl.this.sendQuery(query, authToken);
                if (response != null) {
                    FusiontablesControl.this.queryResultStr = FusiontablesControl.httpResponseToString(response);
                    Log.i(TAG, "Query = " + query + "\nResultStr = " + FusiontablesControl.this.queryResultStr);
                } else {
                    FusiontablesControl fusiontablesControl2 = FusiontablesControl.this;
                    fusiontablesControl2.queryResultStr = fusiontablesControl2.errorMessage;
                    Log.i(TAG, "Error:  " + FusiontablesControl.this.errorMessage);
                }
                return FusiontablesControl.this.queryResultStr;
            }
            return OAuth2Helper.getErrorMessage();
        }

        private String serviceAuthRequest(String query) {
            FusiontablesControl.this.queryResultStr = "";
            FusiontablesControl fusiontablesControl = FusiontablesControl.this;
            fusiontablesControl.errorMessage = fusiontablesControl.standardErrorMessage;
            HttpTransport TRANSPORT = AndroidHttp.newCompatibleTransport();
            Log.i(STAG, "keyPath " + FusiontablesControl.this.keyPath);
            try {
                if (FusiontablesControl.this.cachedServiceCredentials == null) {
                    FusiontablesControl fusiontablesControl2 = FusiontablesControl.this;
                    fusiontablesControl2.cachedServiceCredentials = MediaUtil.copyMediaToTempFile(fusiontablesControl2.container.$form(), FusiontablesControl.this.keyPath);
                }
                new GoogleCredential.Builder().setTransport(TRANSPORT).setJsonFactory((JsonFactory) null).setServiceAccountId(FusiontablesControl.this.serviceAccountEmail).setServiceAccountScopes(Collections.singleton(FusiontablesControl.this.scope)).setServiceAccountPrivateKeyFromP12File(FusiontablesControl.this.cachedServiceCredentials).build();
                if (0 != 0) {
                    FusiontablesControl.this.queryResultStr = FusiontablesControl.httpResponseToString(null);
                    Log.i(STAG, "Query = " + query + "\nResultStr = " + FusiontablesControl.this.queryResultStr);
                } else {
                    FusiontablesControl fusiontablesControl3 = FusiontablesControl.this;
                    fusiontablesControl3.queryResultStr = fusiontablesControl3.errorMessage;
                    Log.i(STAG, "Error with null response:  " + FusiontablesControl.this.errorMessage);
                }
                Log.i(STAG, "executed sql query");
            } catch (Throwable e) {
                Log.i(STAG, "in Catch Throwable e");
                e.printStackTrace();
                FusiontablesControl.this.queryResultStr = e.getMessage();
            }
            Log.i(STAG, "returning queryResultStr = " + FusiontablesControl.this.queryResultStr);
            return FusiontablesControl.this.queryResultStr;
        }

        String parseJsonResponseException(String exceptionMessage) {
            Log.i(STAG, "parseJsonResponseException: " + exceptionMessage);
            return exceptionMessage;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(String result) {
            Log.i(FusiontablesControl.LOG_TAG, "Query result " + result);
            if (result == null) {
                result = FusiontablesControl.this.errorMessage;
            }
            this.dialog.dismiss();
            FusiontablesControl.this.GotResult(result);
        }
    }

    void signalJsonResponseError(String query, String parsedException) {
        this.form.dispatchErrorOccurredEventDialog(this, "SendQuery", ErrorMessages.FUSION_TABLES_QUERY_ERROR, query, parsedException);
    }
}
