package com.google.appinventor.components.runtime.util;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerCallback;
import android.accounts.AccountManagerFuture;
import android.accounts.AuthenticatorException;
import android.accounts.OperationCanceledException;
import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.io.IOException;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;

/* loaded from: classes.dex */
public class ClientLoginHelper implements IClientLoginHelper {
    private static final String ACCOUNT_TYPE = "com.google";
    private static final String AUTHORIZATION_HEADER_PREFIX = "GoogleLogin auth=";
    private static final String LOG_TAG = "ClientLoginHelper";
    private AccountChooser accountChooser;
    private AccountManager accountManager;
    private Activity activity;
    private String authToken;
    private HttpClient client;
    private boolean initialized = false;
    private String service;

    public ClientLoginHelper(Activity activity, String service, String prompt, HttpClient client) {
        this.service = service;
        this.client = client == null ? new DefaultHttpClient() : client;
        this.activity = activity;
        this.accountManager = AccountManager.get(activity);
        this.accountChooser = new AccountChooser(activity, service, prompt, service);
    }

    private void initialize() throws ClientProtocolException {
        if (!this.initialized) {
            Log.i(LOG_TAG, "initializing");
            if (isUiThread()) {
                throw new IllegalArgumentException("Can't initialize login helper from UI thread");
            }
            this.authToken = getAuthToken();
            this.initialized = true;
        }
    }

    private boolean isUiThread() {
        return Looper.getMainLooper().getThread().equals(Thread.currentThread());
    }

    @Override // com.google.appinventor.components.runtime.util.IClientLoginHelper
    public HttpResponse execute(HttpUriRequest request) throws ClientProtocolException, IOException {
        initialize();
        addGoogleAuthHeader(request, this.authToken);
        HttpResponse response = this.client.execute(request);
        if (response.getStatusLine().getStatusCode() == 401) {
            Log.i(LOG_TAG, "Invalid token: " + this.authToken);
            this.accountManager.invalidateAuthToken(ACCOUNT_TYPE, this.authToken);
            this.authToken = getAuthToken();
            removeGoogleAuthHeaders(request);
            addGoogleAuthHeader(request, this.authToken);
            Log.i(LOG_TAG, "new token: " + this.authToken);
            return this.client.execute(request);
        }
        return response;
    }

    @Override // com.google.appinventor.components.runtime.util.IClientLoginHelper
    public void forgetAccountName() {
        this.accountChooser.forgetAccountName();
    }

    private static void addGoogleAuthHeader(HttpUriRequest request, String token) {
        if (token != null) {
            Log.i(LOG_TAG, "adding auth token token: " + token);
            request.addHeader("Authorization", AUTHORIZATION_HEADER_PREFIX + token);
        }
    }

    private static void removeGoogleAuthHeaders(HttpUriRequest request) {
        for (Header header : request.getAllHeaders()) {
            if (header.getName().equalsIgnoreCase("Authorization") && header.getValue().startsWith(AUTHORIZATION_HEADER_PREFIX)) {
                Log.i(LOG_TAG, "Removing header:" + header);
                request.removeHeader(header);
            }
        }
    }

    @Override // com.google.appinventor.components.runtime.util.IClientLoginHelper
    public String getAuthToken() throws ClientProtocolException {
        Account account = this.accountChooser.findAccount();
        if (account != null) {
            AccountManagerFuture<Bundle> future = this.accountManager.getAuthToken(account, this.service, (Bundle) null, this.activity, (AccountManagerCallback<Bundle>) null, (Handler) null);
            Log.i(LOG_TAG, "Have account, auth token: " + future);
            try {
                Bundle result = future.getResult();
                return result.getString("authtoken");
            } catch (AuthenticatorException e) {
                e.printStackTrace();
            } catch (OperationCanceledException e2) {
                e2.printStackTrace();
            } catch (IOException e3) {
                e3.printStackTrace();
            }
        }
        throw new ClientProtocolException("Can't get valid authentication token");
    }
}
