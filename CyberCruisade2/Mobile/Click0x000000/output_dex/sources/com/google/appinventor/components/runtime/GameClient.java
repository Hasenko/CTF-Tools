package com.google.appinventor.components.runtime;

import android.app.Activity;
import android.os.Handler;
import android.util.Log;
import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.DesignerProperty;
import com.google.appinventor.components.annotations.PropertyCategory;
import com.google.appinventor.components.annotations.SimpleEvent;
import com.google.appinventor.components.annotations.SimpleFunction;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.annotations.UsesPermissions;
import com.google.appinventor.components.common.ComponentCategory;
import com.google.appinventor.components.runtime.collect.Lists;
import com.google.appinventor.components.runtime.errors.YailRuntimeError;
import com.google.appinventor.components.runtime.util.AsyncCallbackPair;
import com.google.appinventor.components.runtime.util.AsynchUtil;
import com.google.appinventor.components.runtime.util.GameInstance;
import com.google.appinventor.components.runtime.util.JsonUtil;
import com.google.appinventor.components.runtime.util.PlayerListDelta;
import com.google.appinventor.components.runtime.util.WebServiceUtil;
import com.google.appinventor.components.runtime.util.YailList;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import kawa.lang.SyntaxForms;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@UsesPermissions(permissionNames = "android.permission.INTERNET, com.google.android.googleapps.permission.GOOGLE_AUTH")
@DesignerComponent(category = ComponentCategory.INTERNAL, description = "Provides a way for applications to communicate with online game servers", iconName = "images/gameClient.png", nonVisible = SyntaxForms.DEBUGGING, version = 1)
@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class GameClient extends AndroidNonvisibleComponent implements Component, OnResumeListener, OnStopListener {
    private static final String COMMAND_ARGUMENTS_KEY = "args";
    private static final String COMMAND_TYPE_KEY = "command";
    private static final String COUNT_KEY = "count";
    private static final String ERROR_RESPONSE_KEY = "e";
    private static final String GAME_ID_KEY = "gid";
    private static final String GET_INSTANCE_LISTS_COMMAND = "getinstancelists";
    private static final String GET_MESSAGES_COMMAND = "messages";
    private static final String INSTANCE_ID_KEY = "iid";
    private static final String INSTANCE_PUBLIC_KEY = "makepublic";
    private static final String INVITED_LIST_KEY = "invited";
    private static final String INVITEE_KEY = "inv";
    private static final String INVITE_COMMAND = "invite";
    private static final String JOINED_LIST_KEY = "joined";
    private static final String JOIN_INSTANCE_COMMAND = "joininstance";
    private static final String LEADER_KEY = "leader";
    private static final String LEAVE_INSTANCE_COMMAND = "leaveinstance";
    private static final String LOG_TAG = "GameClient";
    private static final String MESSAGES_LIST_KEY = "messages";
    private static final String MESSAGE_CONTENT_KEY = "contents";
    private static final String MESSAGE_RECIPIENTS_KEY = "mrec";
    private static final String MESSAGE_SENDER_KEY = "msender";
    private static final String MESSAGE_TIME_KEY = "mtime";
    private static final String NEW_INSTANCE_COMMAND = "newinstance";
    private static final String NEW_MESSAGE_COMMAND = "newmessage";
    private static final String PLAYERS_LIST_KEY = "players";
    private static final String PLAYER_ID_KEY = "pid";
    private static final String PUBLIC_LIST_KEY = "public";
    private static final String SERVER_COMMAND = "servercommand";
    private static final String SERVER_RETURN_VALUE_KEY = "response";
    private static final String SET_LEADER_COMMAND = "setleader";
    private static final String TYPE_KEY = "type";
    private Activity activityContext;
    private Handler androidUIHandler;
    private String gameId;
    private GameInstance instance;
    private List<String> invitedInstances;
    private List<String> joinedInstances;
    private List<String> publicInstances;
    private String serviceUrl;
    private String userEmailAddress;

    public GameClient(ComponentContainer container) {
        super(container.$form());
        this.userEmailAddress = "";
        this.androidUIHandler = new Handler();
        this.activityContext = container.$context();
        this.form.registerForOnResume(this);
        this.form.registerForOnStop(this);
        this.gameId = "";
        this.instance = new GameInstance("");
        this.joinedInstances = Lists.newArrayList();
        this.invitedInstances = Lists.newArrayList();
        this.publicInstances = Lists.newArrayList();
        this.serviceUrl = "http://appinvgameserver.appspot.com";
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The game name for this application. The same game ID can have one or more game instances.")
    public String GameId() {
        return this.gameId;
    }

    @DesignerProperty(defaultValue = "", editorType = "string")
    public void GameId(String id) {
        this.gameId = id;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The game instance id.  Taken together,the game ID and the instance ID uniquely identify the game.")
    public String InstanceId() {
        return this.instance.getInstanceId();
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The set of game instances to which this player has been invited but has not yet joined.  To ensure current values are returned, first invoke GetInstanceLists.")
    public List<String> InvitedInstances() {
        return this.invitedInstances;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The set of game instances in which this player is participating.  To ensure current values are returned, first invoke GetInstanceLists.")
    public List<String> JoinedInstances() {
        return this.joinedInstances;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The game's leader. At any time, each game instance has only one leader, but the leader may change with time.  Initially, the leader is the game instance creator. Application writers determine special properties of the leader. The leader value is updated each time a successful communication is made with the server.")
    public String Leader() {
        return this.instance.getLeader();
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The current set of players for this game instance. Each player is designated by an email address, which is a string. The list of players is updated each time a successful communication is made with the game server.")
    public List<String> Players() {
        return this.instance.getPlayers();
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The set of game instances that have been marked public. To ensure current values are returned, first invoke {@link #GetInstanceLists}. ")
    public List<String> PublicInstances() {
        return this.publicInstances;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The URL of the game server.")
    public String ServiceUrl() {
        return this.serviceUrl;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, userVisible = false)
    @DesignerProperty(defaultValue = "http://appinvgameserver.appspot.com", editorType = "string")
    public void ServiceURL(String url) {
        if (url.endsWith("/")) {
            this.serviceUrl = url.substring(0, url.length() - 1);
        } else {
            this.serviceUrl = url;
        }
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The email address that is being used as the player id for this game client.   At present, users must set this manually in oder to join a game.  But this property will change in the future so that is set automatically, and users will not be able to change it.")
    public String UserEmailAddress() {
        if (this.userEmailAddress.equals("")) {
            Info("User email address is empty.");
        }
        return this.userEmailAddress;
    }

    @SimpleProperty
    public void UserEmailAddress(String emailAddress) {
        this.userEmailAddress = emailAddress;
        UserEmailAddressSet(emailAddress);
    }

    @SimpleEvent(description = "Indicates that a function call completed.")
    public void FunctionCompleted(final String functionName) {
        this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.1
            @Override // java.lang.Runnable
            public void run() {
                Log.d(GameClient.LOG_TAG, "Request completed: " + functionName);
                EventDispatcher.dispatchEvent(GameClient.this, "FunctionCompleted", functionName);
            }
        });
    }

    public void Initialize() {
        Log.d(LOG_TAG, "Initialize");
        if (this.gameId.equals("")) {
            throw new YailRuntimeError("Game Id must not be empty.", "GameClient Configuration Error.");
        }
    }

    @SimpleEvent(description = "Indicates that a new message has been received.")
    public void GotMessage(final String type, final String sender, final List<Object> contents) {
        Log.d(LOG_TAG, "Got message of type " + type);
        this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.2
            @Override // java.lang.Runnable
            public void run() {
                EventDispatcher.dispatchEvent(GameClient.this, "GotMessage", type, sender, contents);
            }
        });
    }

    @SimpleEvent(description = "Indicates that the InstanceId property has changed as a result of calling MakeNewInstance or SetInstance.")
    public void InstanceIdChanged(final String instanceId) {
        Log.d(LOG_TAG, "Instance id changed to " + instanceId);
        this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.3
            @Override // java.lang.Runnable
            public void run() {
                EventDispatcher.dispatchEvent(GameClient.this, "InstanceIdChanged", instanceId);
            }
        });
    }

    @SimpleEvent(description = "Indicates that a user has been invited to this game instance.")
    public void Invited(final String instanceId) {
        Log.d(LOG_TAG, "Player invited to " + instanceId);
        this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.4
            @Override // java.lang.Runnable
            public void run() {
                EventDispatcher.dispatchEvent(GameClient.this, "Invited", instanceId);
            }
        });
    }

    @SimpleEvent(description = "Indicates that this game has a new leader as specified through SetLeader")
    public void NewLeader(final String playerId) {
        this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.5
            @Override // java.lang.Runnable
            public void run() {
                Log.d(GameClient.LOG_TAG, "Leader change to " + playerId);
                EventDispatcher.dispatchEvent(GameClient.this, "NewLeader", playerId);
            }
        });
    }

    @SimpleEvent(description = "Indicates that a new instance was successfully created after calling MakeNewInstance.")
    public void NewInstanceMade(final String instanceId) {
        this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.6
            @Override // java.lang.Runnable
            public void run() {
                Log.d(GameClient.LOG_TAG, "New instance made: " + instanceId);
                EventDispatcher.dispatchEvent(GameClient.this, "NewInstanceMade", instanceId);
            }
        });
    }

    @SimpleEvent(description = "Indicates that a new player has joined this game instance.")
    public void PlayerJoined(final String playerId) {
        this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.7
            @Override // java.lang.Runnable
            public void run() {
                if (!playerId.equals(GameClient.this.UserEmailAddress())) {
                    Log.d(GameClient.LOG_TAG, "Player joined: " + playerId);
                    EventDispatcher.dispatchEvent(GameClient.this, "PlayerJoined", playerId);
                }
            }
        });
    }

    @SimpleEvent(description = "Indicates that a player has left this game instance.")
    public void PlayerLeft(final String playerId) {
        this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.8
            @Override // java.lang.Runnable
            public void run() {
                Log.d(GameClient.LOG_TAG, "Player left: " + playerId);
                EventDispatcher.dispatchEvent(GameClient.this, "PlayerLeft", playerId);
            }
        });
    }

    @SimpleEvent(description = "Indicates that a server command failed.")
    public void ServerCommandFailure(final String command, final YailList arguments) {
        this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.9
            @Override // java.lang.Runnable
            public void run() {
                Log.d(GameClient.LOG_TAG, "Server command failed: " + command);
                EventDispatcher.dispatchEvent(GameClient.this, "ServerCommandFailure", command, arguments);
            }
        });
    }

    @SimpleEvent(description = "Indicates that a server command returned successfully.")
    public void ServerCommandSuccess(final String command, final List<Object> response) {
        Log.d(LOG_TAG, command + " server command returned.");
        this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.10
            @Override // java.lang.Runnable
            public void run() {
                EventDispatcher.dispatchEvent(GameClient.this, "ServerCommandSuccess", command, response);
            }
        });
    }

    @SimpleEvent(description = "Indicates that the user email address has been set.")
    public void UserEmailAddressSet(final String emailAddress) {
        Log.d(LOG_TAG, "Email address set.");
        this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.11
            @Override // java.lang.Runnable
            public void run() {
                EventDispatcher.dispatchEvent(GameClient.this, "UserEmailAddressSet", emailAddress);
            }
        });
    }

    @SimpleEvent(description = "Indicates that something has occurred which the player should know about.")
    public void Info(final String message) {
        Log.d(LOG_TAG, "Info: " + message);
        this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.12
            @Override // java.lang.Runnable
            public void run() {
                EventDispatcher.dispatchEvent(GameClient.this, "Info", message);
            }
        });
    }

    @SimpleEvent(description = "Indicates that an error occurred while communicating with the web server.")
    public void WebServiceError(final String functionName, final String message) {
        Log.e(LOG_TAG, "WebServiceError: " + message);
        this.androidUIHandler.post(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.13
            @Override // java.lang.Runnable
            public void run() {
                EventDispatcher.dispatchEvent(GameClient.this, "WebServiceError", functionName, message);
            }
        });
    }

    @SimpleFunction(description = "Updates the InstancesJoined and InstancesInvited lists. This procedure can be called before setting the InstanceId.")
    public void GetInstanceLists() {
        AsynchUtil.runAsynchronously(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.14
            @Override // java.lang.Runnable
            public void run() {
                GameClient.this.postGetInstanceLists();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postGetInstanceLists() {
        AsyncCallbackPair<JSONObject> readMessagesCallback = new AsyncCallbackPair<JSONObject>() { // from class: com.google.appinventor.components.runtime.GameClient.15
            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onSuccess(JSONObject response) {
                GameClient.this.processInstanceLists(response);
                GameClient.this.FunctionCompleted("GetInstanceLists");
            }

            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onFailure(String message) {
                GameClient.this.WebServiceError("GetInstanceLists", "Failed to get up to date instance lists.");
            }
        };
        postCommandToGameServer(GET_INSTANCE_LISTS_COMMAND, Lists.newArrayList(new BasicNameValuePair(GAME_ID_KEY, GameId()), new BasicNameValuePair(INSTANCE_ID_KEY, InstanceId()), new BasicNameValuePair(PLAYER_ID_KEY, UserEmailAddress())), readMessagesCallback);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void processInstanceLists(JSONObject instanceLists) {
        try {
            this.joinedInstances = JsonUtil.getStringListFromJsonArray(instanceLists.getJSONArray(JOINED_LIST_KEY));
            this.publicInstances = JsonUtil.getStringListFromJsonArray(instanceLists.getJSONArray(PUBLIC_LIST_KEY));
            List<String> receivedInstancesInvited = JsonUtil.getStringListFromJsonArray(instanceLists.getJSONArray(INVITED_LIST_KEY));
            if (!receivedInstancesInvited.equals(InvitedInstances())) {
                Collection<?> oldList = this.invitedInstances;
                this.invitedInstances = receivedInstancesInvited;
                List<String> newInvites = new ArrayList<>(receivedInstancesInvited);
                newInvites.removeAll(oldList);
                for (String instanceInvited : newInvites) {
                    Invited(instanceInvited);
                }
            }
        } catch (JSONException e) {
            Log.w(LOG_TAG, e);
            Info("Instance lists failed to parse.");
        }
    }

    @SimpleFunction(description = "Retrieves messages of the specified type.")
    public void GetMessages(final String type, final int count) {
        AsynchUtil.runAsynchronously(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.16
            @Override // java.lang.Runnable
            public void run() {
                GameClient.this.postGetMessages(type, count);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postGetMessages(final String requestedType, int count) {
        AsyncCallbackPair<JSONObject> myCallback = new AsyncCallbackPair<JSONObject>() { // from class: com.google.appinventor.components.runtime.GameClient.17
            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onSuccess(JSONObject result) {
                try {
                    int count2 = result.getInt(GameClient.COUNT_KEY);
                    JSONArray messages = result.getJSONArray("messages");
                    for (int i = 0; i < count2; i++) {
                        JSONObject message = messages.getJSONObject(i);
                        String type = message.getString(GameClient.TYPE_KEY);
                        String sender = message.getString(GameClient.MESSAGE_SENDER_KEY);
                        String time = message.getString(GameClient.MESSAGE_TIME_KEY);
                        List<Object> contents = JsonUtil.getListFromJsonArray(message.getJSONArray(GameClient.MESSAGE_CONTENT_KEY), true);
                        if (requestedType.equals("")) {
                            GameClient.this.instance.putMessageTime(requestedType, time);
                        }
                        GameClient.this.instance.putMessageTime(type, time);
                        GameClient.this.GotMessage(type, sender, contents);
                    }
                } catch (JSONException e) {
                    Log.w(GameClient.LOG_TAG, e);
                    GameClient.this.Info("Failed to parse messages response.");
                }
                GameClient.this.FunctionCompleted("GetMessages");
            }

            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onFailure(String message) {
                GameClient.this.WebServiceError("GetMessages", message);
            }
        };
        if (InstanceId().equals("")) {
            Info("You must join an instance before attempting to fetch messages.");
        } else {
            postCommandToGameServer("messages", Lists.newArrayList(new BasicNameValuePair(GAME_ID_KEY, GameId()), new BasicNameValuePair(INSTANCE_ID_KEY, InstanceId()), new BasicNameValuePair(PLAYER_ID_KEY, UserEmailAddress()), new BasicNameValuePair(COUNT_KEY, Integer.toString(count)), new BasicNameValuePair(MESSAGE_TIME_KEY, this.instance.getMessageTime(requestedType)), new BasicNameValuePair(TYPE_KEY, requestedType)), myCallback);
        }
    }

    @SimpleFunction(description = "Invites a player to this game instance.")
    public void Invite(final String playerEmail) {
        AsynchUtil.runAsynchronously(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.18
            @Override // java.lang.Runnable
            public void run() {
                GameClient.this.postInvite(playerEmail);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postInvite(String inviteeEmail) {
        AsyncCallbackPair<JSONObject> inviteCallback = new AsyncCallbackPair<JSONObject>() { // from class: com.google.appinventor.components.runtime.GameClient.19
            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onSuccess(JSONObject response) {
                try {
                    String invitedPlayer = response.getString(GameClient.INVITEE_KEY);
                    if (invitedPlayer.equals("")) {
                        GameClient.this.Info(invitedPlayer + " was already invited.");
                    } else {
                        GameClient.this.Info("Successfully invited " + invitedPlayer + ".");
                    }
                } catch (JSONException e) {
                    Log.w(GameClient.LOG_TAG, e);
                    GameClient.this.Info("Failed to parse invite player response.");
                }
                GameClient.this.FunctionCompleted("Invite");
            }

            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onFailure(String message) {
                GameClient.this.WebServiceError("Invite", message);
            }
        };
        if (InstanceId().equals("")) {
            Info("You must have joined an instance before you can invite new players.");
        } else {
            postCommandToGameServer(INVITE_COMMAND, Lists.newArrayList(new BasicNameValuePair(GAME_ID_KEY, GameId()), new BasicNameValuePair(INSTANCE_ID_KEY, InstanceId()), new BasicNameValuePair(PLAYER_ID_KEY, UserEmailAddress()), new BasicNameValuePair(INVITEE_KEY, inviteeEmail)), inviteCallback);
        }
    }

    @SimpleFunction(description = "Leaves the current instance.")
    public void LeaveInstance() {
        AsynchUtil.runAsynchronously(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.20
            @Override // java.lang.Runnable
            public void run() {
                GameClient.this.postLeaveInstance();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postLeaveInstance() {
        AsyncCallbackPair<JSONObject> setInstanceCallback = new AsyncCallbackPair<JSONObject>() { // from class: com.google.appinventor.components.runtime.GameClient.21
            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onSuccess(JSONObject response) {
                GameClient.this.SetInstance("");
                GameClient.this.processInstanceLists(response);
                GameClient.this.FunctionCompleted("LeaveInstance");
            }

            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onFailure(String message) {
                GameClient.this.WebServiceError("LeaveInstance", message);
            }
        };
        postCommandToGameServer(LEAVE_INSTANCE_COMMAND, Lists.newArrayList(new BasicNameValuePair(GAME_ID_KEY, GameId()), new BasicNameValuePair(INSTANCE_ID_KEY, InstanceId()), new BasicNameValuePair(PLAYER_ID_KEY, UserEmailAddress())), setInstanceCallback);
    }

    @SimpleFunction(description = "Asks the server to create a new instance of this game.")
    public void MakeNewInstance(final String instanceId, final boolean makePublic) {
        AsynchUtil.runAsynchronously(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.22
            @Override // java.lang.Runnable
            public void run() {
                GameClient.this.postMakeNewInstance(instanceId, Boolean.valueOf(makePublic));
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postMakeNewInstance(String requestedInstanceId, Boolean makePublic) {
        AsyncCallbackPair<JSONObject> makeNewGameCallback = new AsyncCallbackPair<JSONObject>() { // from class: com.google.appinventor.components.runtime.GameClient.23
            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onSuccess(JSONObject response) {
                GameClient.this.processInstanceLists(response);
                GameClient gameClient = GameClient.this;
                gameClient.NewInstanceMade(gameClient.InstanceId());
                GameClient.this.FunctionCompleted("MakeNewInstance");
            }

            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onFailure(String message) {
                GameClient.this.WebServiceError("MakeNewInstance", message);
            }
        };
        postCommandToGameServer(NEW_INSTANCE_COMMAND, Lists.newArrayList(new BasicNameValuePair(PLAYER_ID_KEY, UserEmailAddress()), new BasicNameValuePair(GAME_ID_KEY, GameId()), new BasicNameValuePair(INSTANCE_ID_KEY, requestedInstanceId), new BasicNameValuePair(INSTANCE_PUBLIC_KEY, makePublic.toString())), makeNewGameCallback, true);
    }

    @SimpleFunction(description = "Sends a keyed message to all recipients in the recipients list. The message will consist of the contents list.")
    public void SendMessage(final String type, final YailList recipients, final YailList contents) {
        AsynchUtil.runAsynchronously(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.24
            @Override // java.lang.Runnable
            public void run() {
                GameClient.this.postNewMessage(type, recipients, contents);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postNewMessage(String type, YailList recipients, YailList contents) {
        AsyncCallbackPair<JSONObject> myCallback = new AsyncCallbackPair<JSONObject>() { // from class: com.google.appinventor.components.runtime.GameClient.25
            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onSuccess(JSONObject response) {
                GameClient.this.FunctionCompleted("SendMessage");
            }

            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onFailure(String message) {
                GameClient.this.WebServiceError("SendMessage", message);
            }
        };
        if (InstanceId().equals("")) {
            Info("You must have joined an instance before you can send messages.");
        } else {
            postCommandToGameServer(NEW_MESSAGE_COMMAND, Lists.newArrayList(new BasicNameValuePair(GAME_ID_KEY, GameId()), new BasicNameValuePair(INSTANCE_ID_KEY, InstanceId()), new BasicNameValuePair(PLAYER_ID_KEY, UserEmailAddress()), new BasicNameValuePair(TYPE_KEY, type), new BasicNameValuePair(MESSAGE_RECIPIENTS_KEY, recipients.toJSONString()), new BasicNameValuePair(MESSAGE_CONTENT_KEY, contents.toJSONString()), new BasicNameValuePair(MESSAGE_TIME_KEY, this.instance.getMessageTime(type))), myCallback);
        }
    }

    @SimpleFunction(description = "Sends the specified command to the game server.")
    public void ServerCommand(final String command, final YailList arguments) {
        AsynchUtil.runAsynchronously(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.26
            @Override // java.lang.Runnable
            public void run() {
                GameClient.this.postServerCommand(command, arguments);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postServerCommand(final String command, final YailList arguments) {
        AsyncCallbackPair<JSONObject> myCallback = new AsyncCallbackPair<JSONObject>() { // from class: com.google.appinventor.components.runtime.GameClient.27
            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onSuccess(JSONObject result) {
                try {
                    GameClient.this.ServerCommandSuccess(command, JsonUtil.getListFromJsonArray(result.getJSONArray(GameClient.MESSAGE_CONTENT_KEY), true));
                } catch (JSONException e) {
                    Log.w(GameClient.LOG_TAG, e);
                    GameClient.this.Info("Server command response failed to parse.");
                }
                GameClient.this.FunctionCompleted("ServerCommand");
            }

            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onFailure(String message) {
                GameClient.this.ServerCommandFailure(command, arguments);
                GameClient.this.WebServiceError("ServerCommand", message);
            }
        };
        Log.d(LOG_TAG, "Going to post " + command + " with args " + arguments);
        postCommandToGameServer(SERVER_COMMAND, Lists.newArrayList(new BasicNameValuePair(GAME_ID_KEY, GameId()), new BasicNameValuePair(INSTANCE_ID_KEY, InstanceId()), new BasicNameValuePair(PLAYER_ID_KEY, UserEmailAddress()), new BasicNameValuePair(COMMAND_TYPE_KEY, command), new BasicNameValuePair(COMMAND_ARGUMENTS_KEY, arguments.toJSONString())), myCallback);
    }

    @SimpleFunction(description = "Sets InstanceId and joins the specified instance.")
    public void SetInstance(final String instanceId) {
        AsynchUtil.runAsynchronously(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.28
            @Override // java.lang.Runnable
            public void run() {
                if (instanceId.equals("")) {
                    Log.d(GameClient.LOG_TAG, "Instance id set to empty string.");
                    if (!GameClient.this.InstanceId().equals("")) {
                        GameClient.this.instance = new GameInstance("");
                        GameClient.this.InstanceIdChanged("");
                        GameClient.this.FunctionCompleted("SetInstance");
                        return;
                    }
                    return;
                }
                GameClient.this.postSetInstance(instanceId);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postSetInstance(String instanceId) {
        AsyncCallbackPair<JSONObject> setInstanceCallback = new AsyncCallbackPair<JSONObject>() { // from class: com.google.appinventor.components.runtime.GameClient.29
            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onSuccess(JSONObject response) {
                GameClient.this.processInstanceLists(response);
                GameClient.this.FunctionCompleted("SetInstance");
            }

            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onFailure(String message) {
                GameClient.this.WebServiceError("SetInstance", message);
            }
        };
        postCommandToGameServer(JOIN_INSTANCE_COMMAND, Lists.newArrayList(new BasicNameValuePair(GAME_ID_KEY, GameId()), new BasicNameValuePair(INSTANCE_ID_KEY, instanceId), new BasicNameValuePair(PLAYER_ID_KEY, UserEmailAddress())), setInstanceCallback, true);
    }

    @SimpleFunction(description = "Tells the server to set the leader to playerId. Only the current leader may successfully set a new leader.")
    public void SetLeader(final String playerEmail) {
        AsynchUtil.runAsynchronously(new Runnable() { // from class: com.google.appinventor.components.runtime.GameClient.30
            @Override // java.lang.Runnable
            public void run() {
                GameClient.this.postSetLeader(playerEmail);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postSetLeader(String newLeader) {
        AsyncCallbackPair<JSONObject> setLeaderCallback = new AsyncCallbackPair<JSONObject>() { // from class: com.google.appinventor.components.runtime.GameClient.31
            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onSuccess(JSONObject response) {
                GameClient.this.FunctionCompleted("SetLeader");
            }

            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onFailure(String message) {
                GameClient.this.WebServiceError("SetLeader", message);
            }
        };
        if (InstanceId().equals("")) {
            Info("You must join an instance before attempting to set a leader.");
        } else {
            postCommandToGameServer(SET_LEADER_COMMAND, Lists.newArrayList(new BasicNameValuePair(GAME_ID_KEY, GameId()), new BasicNameValuePair(INSTANCE_ID_KEY, InstanceId()), new BasicNameValuePair(PLAYER_ID_KEY, UserEmailAddress()), new BasicNameValuePair(LEADER_KEY, newLeader)), setLeaderCallback);
        }
    }

    @Override // com.google.appinventor.components.runtime.OnResumeListener
    public void onResume() {
        Log.d(LOG_TAG, "Activity Resumed.");
    }

    @Override // com.google.appinventor.components.runtime.OnStopListener
    public void onStop() {
        Log.d(LOG_TAG, "Activity Stopped.");
    }

    private void postCommandToGameServer(String commandName, List<NameValuePair> params, AsyncCallbackPair<JSONObject> callback) {
        postCommandToGameServer(commandName, params, callback, false);
    }

    private void postCommandToGameServer(final String commandName, final List<NameValuePair> params, final AsyncCallbackPair<JSONObject> callback, final boolean allowInstanceIdChange) {
        AsyncCallbackPair<JSONObject> thisCallback = new AsyncCallbackPair<JSONObject>() { // from class: com.google.appinventor.components.runtime.GameClient.32
            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onSuccess(JSONObject responseObject) {
                Log.d(GameClient.LOG_TAG, "Received response for " + commandName + ": " + responseObject.toString());
                try {
                    if (responseObject.getBoolean(GameClient.ERROR_RESPONSE_KEY)) {
                        callback.onFailure(responseObject.getString(GameClient.SERVER_RETURN_VALUE_KEY));
                        return;
                    }
                    String responseGameId = responseObject.getString(GameClient.GAME_ID_KEY);
                    if (!responseGameId.equals(GameClient.this.GameId())) {
                        GameClient.this.Info("Incorrect game id in response: + " + responseGameId + ".");
                        return;
                    }
                    String responseInstanceId = responseObject.getString(GameClient.INSTANCE_ID_KEY);
                    if (responseInstanceId.equals("")) {
                        callback.onSuccess(responseObject.getJSONObject(GameClient.SERVER_RETURN_VALUE_KEY));
                        return;
                    }
                    if (responseInstanceId.equals(GameClient.this.InstanceId())) {
                        GameClient.this.updateInstanceInfo(responseObject);
                    } else {
                        if (!allowInstanceIdChange && !GameClient.this.InstanceId().equals("")) {
                            GameClient.this.Info("Ignored server response to " + commandName + " for incorrect instance " + responseInstanceId + ".");
                            return;
                        }
                        GameClient.this.instance = new GameInstance(responseInstanceId);
                        GameClient.this.updateInstanceInfo(responseObject);
                        GameClient.this.InstanceIdChanged(responseInstanceId);
                    }
                    callback.onSuccess(responseObject.getJSONObject(GameClient.SERVER_RETURN_VALUE_KEY));
                } catch (JSONException e) {
                    Log.w(GameClient.LOG_TAG, e);
                    callback.onFailure("Failed to parse JSON response to command " + commandName);
                }
            }

            @Override // com.google.appinventor.components.runtime.util.AsyncCallbackPair
            public void onFailure(String failureMessage) {
                Log.d(GameClient.LOG_TAG, "Posting to server failed for " + commandName + " with arguments " + params + "\n Failure message: " + failureMessage);
                callback.onFailure(failureMessage);
            }
        };
        WebServiceUtil.getInstance().postCommandReturningObject(ServiceUrl(), commandName, params, thisCallback);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateInstanceInfo(JSONObject responseObject) throws JSONException {
        boolean newLeader = false;
        String leader = responseObject.getString(LEADER_KEY);
        List<String> receivedPlayers = JsonUtil.getStringListFromJsonArray(responseObject.getJSONArray(PLAYERS_LIST_KEY));
        if (!Leader().equals(leader)) {
            this.instance.setLeader(leader);
            newLeader = true;
        }
        PlayerListDelta playersDelta = this.instance.setPlayers(receivedPlayers);
        if (playersDelta != PlayerListDelta.NO_CHANGE) {
            for (String player : playersDelta.getPlayersRemoved()) {
                PlayerLeft(player);
            }
            for (String player2 : playersDelta.getPlayersAdded()) {
                PlayerJoined(player2);
            }
        }
        if (newLeader) {
            NewLeader(Leader());
        }
    }
}
