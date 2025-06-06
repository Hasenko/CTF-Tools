package com.google.appinventor.components.runtime;

import android.R;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Looper;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;
import com.google.appinventor.common.version.AppInventorFeatures;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.common.ComponentConstants;
import com.google.appinventor.components.runtime.errors.YailRuntimeError;
import com.google.appinventor.components.runtime.util.AppInvHTTPD;
import com.google.appinventor.components.runtime.util.OnInitializeListener;
import com.google.appinventor.components.runtime.util.QUtil;
import com.google.appinventor.components.runtime.util.RetValManager;
import com.google.appinventor.components.runtime.util.WebRTCNativeMgr;
import dalvik.system.DexClassLoader;
import gnu.expr.Language;
import gnu.expr.ModuleExp;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintStream;
import java.lang.Thread;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import kawa.standard.Scheme;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class ReplForm extends Form {
    private static final String LOG_TAG = ReplForm.class.getSimpleName();
    private static final String SPLASH_ACTIVITY_CLASS = SplashActivity.class.getName();
    public static ReplForm topform;
    private List<String> loadedExternalDexs;
    private String replAssetDir;
    private String replCompDir;
    private WebRTCNativeMgr webRTCNativeMgr;
    private AppInvHTTPD httpdServer = null;
    private boolean IsUSBRepl = false;
    private boolean assetsLoaded = false;
    private boolean isDirect = false;
    private Object replResult = null;
    private String replResultFormName = null;
    private String currentTheme = ComponentConstants.DEFAULT_THEME;
    SchemeInterface schemeInterface = new SchemeInterface();

    public ReplForm() {
        topform = this;
    }

    public class SchemeInterface {
        Language scheme = Scheme.getInstance("scheme");

        public SchemeInterface() {
            ModuleExp.mustNeverCompile();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void adoptMainThreadClassLoader() {
            ClassLoader mainClassLoader = Looper.getMainLooper().getThread().getContextClassLoader();
            Thread myThread = Thread.currentThread();
            if (myThread.getContextClassLoader() != mainClassLoader) {
                myThread.setContextClassLoader(mainClassLoader);
            }
        }

        public void eval(final String sexp) {
            ReplForm.this.runOnUiThread(new Runnable() { // from class: com.google.appinventor.components.runtime.ReplForm.SchemeInterface.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        SchemeInterface.this.adoptMainThreadClassLoader();
                        if (sexp.equals("#DONE#")) {
                            ReplForm.this.finish();
                        } else {
                            SchemeInterface.this.scheme.eval(sexp);
                        }
                    } catch (Throwable e) {
                        Log.e(ReplForm.LOG_TAG, "Exception in scheme processing", e);
                    }
                }
            });
        }
    }

    @Override // com.google.appinventor.components.runtime.Form, com.google.appinventor.components.runtime.AppInventorCompatActivity, android.app.Activity
    public void onCreate(Bundle icicle) {
        Log.d(LOG_TAG, "onCreate");
        String replAssetPath = QUtil.getReplAssetPath(this, true);
        this.replAssetDir = replAssetPath;
        this.replCompDir = replAssetPath + "external_comps/";
        if (Build.VERSION.SDK_INT >= 34) {
            this.replCompDir = getCacheDir().getAbsolutePath() + "/external_comps/";
        }
        super.onCreate(icicle);
        Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: com.google.appinventor.components.runtime.ReplForm.1
            @Override // java.lang.Thread.UncaughtExceptionHandler
            public void uncaughtException(Thread t, Throwable e) {
                Log.e(ReplForm.LOG_TAG, "Uncaught exception", e);
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                PrintStream temp = new PrintStream(baos);
                e.printStackTrace(temp);
                temp.flush();
                RetValManager.sendError(baos.toString());
                temp.close();
            }
        });
        this.loadedExternalDexs = new ArrayList();
        Intent intent = getIntent();
        processExtrasAndData(intent, false);
        this.themeHelper.setActionBarAnimation(false);
    }

    @Override // com.google.appinventor.components.runtime.Form
    void onCreateFinish() {
        super.onCreateFinish();
        String str = LOG_TAG;
        Log.d(str, "onCreateFinish() Called in Repl");
        checkAssetDir();
        checkComponentDir();
        if (!isEmulator() && AppInventorFeatures.doCompanionSplashScreen()) {
            Intent webviewIntent = new Intent("android.intent.action.MAIN");
            webviewIntent.setClassName(activeForm.$context(), SPLASH_ACTIVITY_CLASS);
            activeForm.$context().startActivity(webviewIntent);
        }
        Intent intent = getIntent();
        Log.d(str, "Intent = " + intent);
        final String data = intent.getDataString();
        if (data != null) {
            Log.d(str, "Got data = " + data);
        } else {
            Log.d(str, "Did not receive any data");
        }
        if (data != null && data.startsWith("aicompanion")) {
            registerForOnInitialize(new OnInitializeListener() { // from class: com.google.appinventor.components.runtime.ReplForm.2
                @Override // com.google.appinventor.components.runtime.util.OnInitializeListener
                public void onInitialize() {
                    ReplForm.this.startChromebook(data);
                }
            });
        }
    }

    @Override // com.google.appinventor.components.runtime.Form
    protected void defaultPropertyValues() {
        super.defaultPropertyValues();
        Theme(ComponentConstants.DEFAULT_THEME);
    }

    @Override // com.google.appinventor.components.runtime.Form, android.app.Activity
    protected void onResume() {
        super.onResume();
    }

    @Override // com.google.appinventor.components.runtime.Form, com.google.appinventor.components.runtime.AppInventorCompatActivity, android.app.Activity
    protected void onStop() {
        super.onStop();
    }

    @Override // com.google.appinventor.components.runtime.Form, com.google.appinventor.components.runtime.AppInventorCompatActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        AppInvHTTPD appInvHTTPD = this.httpdServer;
        if (appInvHTTPD != null) {
            appInvHTTPD.stop();
            this.httpdServer = null;
        }
        finish();
        System.exit(0);
    }

    @Override // com.google.appinventor.components.runtime.Form
    protected void startNewForm(String nextFormName, Object startupValue) {
        if (startupValue != null) {
            this.startupValue = jsonEncodeForForm(startupValue, "open another screen with start value");
        }
        RetValManager.pushScreen(nextFormName, startupValue);
    }

    public void setFormName(String formName) {
        this.formName = formName;
        Log.d(LOG_TAG, "formName is now " + formName);
    }

    @Override // com.google.appinventor.components.runtime.Form
    protected void closeForm(Intent resultIntent) {
        RetValManager.popScreen("Not Yet");
    }

    protected void setResult(Object result) {
        Log.d(LOG_TAG, "setResult: " + result);
        this.replResult = result;
        this.replResultFormName = this.formName;
    }

    @Override // com.google.appinventor.components.runtime.Form
    protected void closeApplicationFromBlocks() {
        runOnUiThread(new Runnable() { // from class: com.google.appinventor.components.runtime.ReplForm.3
            @Override // java.lang.Runnable
            public void run() {
                Toast.makeText(ReplForm.this, "Closing forms is not currently supported during development.", 1).show();
            }
        });
    }

    @Override // com.google.appinventor.components.runtime.Form, android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        addSettingsButton(menu);
        addLogcatButton(menu);
        return true;
    }

    public void addSettingsButton(Menu menu) {
        MenuItem showSettingsItem = menu.add(0, 0, 3, "Settings").setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() { // from class: com.google.appinventor.components.runtime.ReplForm.4
            @Override // android.view.MenuItem.OnMenuItemClickListener
            public boolean onMenuItemClick(MenuItem item) {
                PhoneStatus.doSettings();
                return true;
            }
        });
        showSettingsItem.setIcon(R.drawable.sym_def_app_icon);
    }

    public void addLogcatButton(Menu menu) {
        if (!ReplApplication.isAcraActive()) {
            return;
        }
        MenuItem showSettingsItem = menu.add(0, 0, 4, "Send Error Report").setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() { // from class: com.google.appinventor.components.runtime.ReplForm.5
            @Override // android.view.MenuItem.OnMenuItemClickListener
            public boolean onMenuItemClick(MenuItem item) {
                String reportId = ReplForm.this.genReportId();
                ReplApplication.reportError(null, reportId);
                Notifier.oneButtonAlert(Form.activeForm, "Your Report Id is: " + reportId + "<br />Use this ID when reporting this error.", "Error Report Id", "OK");
                return true;
            }
        });
        showSettingsItem.setIcon(R.drawable.stat_sys_warning);
    }

    @Override // com.google.appinventor.components.runtime.Form, android.app.Activity
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        Log.d(LOG_TAG, "onNewIntent Called");
        processExtrasAndData(intent, true);
        String data = intent.getDataString();
        if (data != null && data.startsWith("aicompanion")) {
            startChromebook(data);
        }
    }

    void HandleReturnValues() {
        String str = LOG_TAG;
        Log.d(str, "HandleReturnValues() Called, replResult = " + this.replResult);
        Object obj = this.replResult;
        if (obj != null) {
            OtherScreenClosed(this.replResultFormName, obj);
            Log.d(str, "Called OtherScreenClosed");
            this.replResult = null;
        }
    }

    private void processExtrasAndData(Intent intent, boolean restart) {
        Bundle extras = intent.getExtras();
        if (extras != null) {
            Log.d(LOG_TAG, "extras: " + extras);
            Iterator<String> keys = extras.keySet().iterator();
            while (keys.hasNext()) {
                Log.d(LOG_TAG, "Extra Key: " + keys.next());
            }
        }
        String data = intent.getDataString();
        if (data != null && data.startsWith("aicompanion")) {
            this.isDirect = true;
            this.assetsLoaded = true;
        }
        if (extras != null && extras.getBoolean("rundirect")) {
            Log.d(LOG_TAG, "processExtrasAndData rundirect is true and restart is " + restart);
            this.isDirect = true;
            this.assetsLoaded = true;
            if (restart) {
                clear();
                AppInvHTTPD appInvHTTPD = this.httpdServer;
                if (appInvHTTPD != null) {
                    appInvHTTPD.resetSeq();
                } else {
                    startHTTPD(true);
                    AppInvHTTPD.setHmacKey("emulator");
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startChromebook(String data) {
        String code = data.substring(data.indexOf("//comp/") + 7);
        PhoneStatus status = new PhoneStatus(this);
        status.WebRTC(true);
        String code2 = status.setHmacSeedReturnCode(code, "rendezvous.appinventor.mit.edu");
        String ipAddress = PhoneStatus.GetWifiIpAddress();
        int api = status.SdkLevel();
        String version = status.GetVersionName();
        String aid = status.InstallationId();
        Log.d(LOG_TAG, "InstallationId = " + aid);
        Web web = new Web(this);
        web.Url("http://rendezvous.appinventor.mit.edu/rendezvous/");
        web.PostText("ipaddr=" + ipAddress + "&port=9987&webrtc=true&version=" + version + "&api=" + api + "&aid=" + aid + "&installer=" + status.GetInstaller() + "&r2=true&key=" + code2);
        status.startWebRTC("rendezvous.appinventor.mit.edu", "OK");
    }

    public boolean isDirect() {
        return this.isDirect;
    }

    public void setIsUSBrepl() {
        this.IsUSBRepl = true;
    }

    public void startHTTPD(boolean secure) {
        try {
            if (this.httpdServer == null) {
                checkAssetDir();
                this.httpdServer = new AppInvHTTPD(8001, new java.io.File(this.replAssetDir), secure, this);
                Log.i(LOG_TAG, "started AppInvHTTPD");
            }
        } catch (IOException ex) {
            Log.e(LOG_TAG, "Setting up NanoHTTPD: " + ex.toString());
        }
    }

    private void checkAssetDir() {
        java.io.File f = new java.io.File(this.replAssetDir);
        if (!f.exists()) {
            f.mkdirs();
        }
    }

    private boolean checkComponentDir() {
        java.io.File f = new java.io.File(this.replCompDir);
        if (!f.exists()) {
            return f.mkdirs();
        }
        return true;
    }

    public boolean isAssetsLoaded() {
        return this.assetsLoaded;
    }

    public void setAssetsLoaded() {
        this.assetsLoaded = true;
    }

    public void loadComponents(List<String> extensionNames) {
        if (extensionNames.isEmpty()) {
            return;
        }
        StringBuilder sb = new StringBuilder();
        String separator = "";
        for (String extension : extensionNames) {
            java.io.File loadComponent = new java.io.File(this.replCompDir + extension, Build.VERSION.SDK_INT >= 34 ? extension + ".jar" : "classes.jar");
            String str = LOG_TAG;
            Log.d(str, "Loading component dex " + loadComponent.getAbsolutePath());
            if (!loadComponent.exists()) {
                Log.d(str, "Extension " + extension + " does not exist");
                throw new YailRuntimeError("Extension " + extension + " does not exist", "Extension Error");
            }
            if (this.loadedExternalDexs.contains(loadComponent.getPath())) {
                Log.d(str, "Skipping already loaded " + loadComponent.getAbsolutePath());
            } else {
                if (loadComponent.canWrite() && !loadComponent.setReadOnly()) {
                    throw new YailRuntimeError("Unable to set " + loadComponent.getName() + " to read only", "Permission Error");
                }
                Log.d(str, "Queueing component dex " + loadComponent.getAbsolutePath());
                this.loadedExternalDexs.add(loadComponent.getPath());
                sb.append(separator);
                sb.append(loadComponent.getAbsolutePath());
                separator = java.io.File.pathSeparator;
            }
        }
        java.io.File dexOutput = new java.io.File(activeForm.$context().getCacheDir(), "componentDexs");
        if (!dexOutput.exists() && !dexOutput.mkdirs()) {
            throw new YailRuntimeError("Unable to create componentDexs directory", "Permission Error");
        }
        DexClassLoader dexCloader = new DexClassLoader(sb.toString(), dexOutput.getAbsolutePath(), null, ReplForm.class.getClassLoader());
        Thread.currentThread().setContextClassLoader(dexCloader);
        String str2 = LOG_TAG;
        Log.d(str2, Thread.currentThread().toString());
        Log.d(str2, Looper.getMainLooper().getThread().toString());
        Looper.getMainLooper().getThread().setContextClassLoader(dexCloader);
    }

    @Override // com.google.appinventor.components.runtime.Form
    @SimpleProperty(userVisible = false)
    public void Theme(String theme) {
        this.currentTheme = theme;
        super.Theme(theme);
        updateTitle();
    }

    public static void returnRetvals(String retvals) {
        ReplForm form = (ReplForm) activeForm;
        Log.d(LOG_TAG, "returnRetvals: " + retvals);
        form.sendToCompanion(retvals);
    }

    public void sendToCompanion(String data) {
        WebRTCNativeMgr webRTCNativeMgr = this.webRTCNativeMgr;
        if (webRTCNativeMgr == null) {
            Log.i(LOG_TAG, "No WebRTCNativeMgr!");
        } else {
            webRTCNativeMgr.send(data);
        }
    }

    public void setWebRTCMgr(WebRTCNativeMgr mgr) {
        this.webRTCNativeMgr = mgr;
    }

    public void evalScheme(String sexp) {
        this.schemeInterface.eval(sexp);
    }

    @Override // com.google.appinventor.components.runtime.Form
    public String getAssetPath(String asset) {
        return "file://" + this.replAssetDir + asset;
    }

    @Override // com.google.appinventor.components.runtime.Form
    public String getCachePath(String cache) {
        if (Build.VERSION.SDK_INT < 8) {
            return "file://" + Environment.getExternalStorageDirectory().getAbsolutePath() + "/AppInventor/cache/" + cache;
        }
        return "file://" + new java.io.File(getExternalCacheDir(), cache).getAbsolutePath();
    }

    @Override // com.google.appinventor.components.runtime.Form
    public String getPrivatePath(String fileName) {
        return "file://" + new java.io.File(QUtil.getReplDataPath(this), fileName).getAbsolutePath();
    }

    @Override // com.google.appinventor.components.runtime.Form
    public String getAssetPathForExtension(Component component, String asset) throws FileNotFoundException {
        SimpleObject annotation = (SimpleObject) component.getClass().getAnnotation(SimpleObject.class);
        if (annotation != null && !annotation.external()) {
            return Form.ASSETS_PREFIX + asset;
        }
        String extensionId = component.getClass().getName();
        String pkgPath = null;
        while (true) {
            if (!extensionId.contains(".")) {
                break;
            }
            java.io.File dir = new java.io.File(this.replCompDir + extensionId + "/assets");
            if (dir.exists() && dir.isDirectory()) {
                pkgPath = dir.getAbsolutePath();
                break;
            }
            extensionId = extensionId.substring(0, extensionId.lastIndexOf(46));
        }
        if (pkgPath != null) {
            java.io.File result = new java.io.File(pkgPath, asset);
            Log.d(LOG_TAG, "result = " + result.getAbsolutePath());
            if (result.exists()) {
                return "file://" + result.getAbsolutePath();
            }
        }
        throw new FileNotFoundException();
    }

    @Override // com.google.appinventor.components.runtime.AppInventorCompatActivity
    public boolean isRepl() {
        return true;
    }

    @Override // com.google.appinventor.components.runtime.Form
    protected void updateTitle() {
        this.themeHelper.setTitle(this.title, "AppTheme.Light".equals(this.currentTheme));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String genReportId() {
        String[] words = {"A", "ABE", "ACE", "ACT", "AD", "ADA", "ADD", "AGO", "AID", "AIM", "AIR", "ALL", "ALP", "AM", "AMY", "AN", "ANA", "AND", "ANN", "ANT", "ANY", "APE", "APS", "APT", "ARC", "ARE", "ARK", "ARM", "ART", "AS", "ASH", "ASK", "AT", "ATE", "AUG", "AUK", "AVE", "AWE", "AWK", "AWL", "AWN", "AX", "AYE", "BAD", "BAG", "BAH", "BAM", "BAN", "BAR", "BAT", "BAY", "BE", "BED", "BEE", "BEG", "BEN", "BET", "BEY", "BIB", "BID", "BIG", "BIN", "BIT", "BOB", "BOG", "BON", "BOO", "BOP", "BOW", "BOY", "BUB", "BUD", "BUG", "BUM", "BUN", "BUS", "BUT", "BUY", "BY", "BYE", "CAB", "CAL", "CAM", "CAN", "CAP", "CAR", "CAT", "CAW", "COD", "COG", "COL", "CON", "COO", "COP", "COT", "COW", "COY", "CRY", "CUB", "CUE", "CUP", "CUR", "CUT", "DAB", "DAD", "DAM", "DAN", "DAR", "DAY", "DEE", "DEL", "DEN", "DES", "DEW", "DID", "DIE", "DIG", "DIN", "DIP", "DO", "DOE", "DOG", "DON", "DOT", "DOW", "DRY", "DUB", "DUD", "DUE", "DUG", "DUN", "EAR", "EAT", "ED", "EEL", "EGG", "EGO", "ELI", "ELK", "ELM", "ELY", "EM", "END", "EST", "ETC", "EVA", "EVE", "EWE", "EYE", "FAD", "FAN", "FAR", "FAT", "FAY", "FED", "FEE", "FEW", "FIB", "FIG", "FIN", "FIR", "FIT", "FLO", "FLY", "FOE", "FOG", "FOR", "FRY", "FUM", "FUN", "FUR", "GAB", "GAD", "GAG", "GAL", "GAM", "GAP", "GAS", "GAY", "GEE", "GEL", "GEM", "GET", "GIG", "GIL", "GIN", "GO", "GOT", "GUM", "GUN", "GUS", "GUT", "GUY", "GYM", "GYP", "HA", "HAD", "HAL", "HAM", "HAN", "HAP", "HAS", "HAT", "HAW", "HAY", "HE", "HEM", "HEN", "HER", "HEW", "HEY", "HI", "HID", "HIM", "HIP", "HIS", "HIT", "HO", "HOB", "HOC", "HOE", "HOG", "HOP", "HOT", "HOW", "HUB", "HUE", "HUG", "HUH", "HUM", "HUT", "I", "ICY", "IDA", "IF", "IKE", "ILL", "INK", "INN", "IO", "ION", "IQ", "IRA", "IRE", "IRK", "IS", "IT", "ITS", "IVY", "JAB", "JAG", "JAM", "JAN", "JAR", "JAW", "JAY", "JET", "JIG", "JIM", "JO", "JOB", "JOE", "JOG", "JOT", "JOY", "JUG", "JUT", "KAY", "KEG", "KEN", "KEY", "KID", "KIM", "KIN", "KIT", "LA", "LAB", "LAC", "LAD", "LAG", "LAM", "LAP", "LAW", "LAY", "LEA", "LED", "LEE", "LEG", "LEN", "LEO", "LET", "LEW", "LID", "LIE", "LIN", "LIP", "LIT", "LO", "LOB", "LOG", "LOP", "LOS", "LOT", "LOU", "LOW", "LOY", "LUG", "LYE", "MA", "MAC", "MAD", "MAE", "MAN", "MAO", "MAP", "MAT", "MAW", "MAY", "ME", "MEG", "MEL", "MEN", "MET", "MEW", "MID", "MIN", "MIT", "MOB", "MOD", "MOE", "MOO", "MOP", "MOS", "MOT", "MOW", "MUD", "MUG", "MUM", "MY", "NAB", "NAG", "NAN", "NAP", "NAT", "NAY", "NE", "NED", "NEE", "NET", "NEW", "NIB", "NIL", "NIP", "NIT", "NO", "NOB", "NOD", "NON", "NOR", "NOT", "NOV", "NOW", "NU", "NUN", "NUT", "O", "OAF", "OAK", "OAR", "OAT", "ODD", "ODE", "OF", "OFF", "OFT", "OH", "OIL", "OK", "OLD", "ON", "ONE", "OR", "ORB", "ORE", "ORR", "OS", "OTT", "OUR", "OUT", "OVA", "OW", "OWE", "OWL", "OWN", "OX", "PA", "PAD", "PAL", "PAM", "PAN", "PAP", "PAR", "PAT", "PAW", "PAY", "PEA", "PEG", "PEN", "PEP", "PER", "PET", "PEW", "PHI", "PI", "PIE", "PIN", "PIT", "PLY", "PO", "POD", "POE", "POP", "POT", "POW", "PRO", "PRY", "PUB", "PUG", "PUN", "PUP", "PUT", "QUO", "RAG", "RAM", "RAN", "RAP", "RAT", "RAW", "RAY", "REB", "RED", "REP", "RET", "RIB", "RID", "RIG", "RIM", "RIO", "RIP", "ROB", "ROD", "ROE", "RON", "ROT", "ROW", "ROY", "RUB", "RUE", "RUG", "RUM", "RUN", "RYE", "SAC", "SAD", "SAG", "SAL", "SAM", "SAN", "SAP", "SAT", "SAW", "SAY", "SEA", "SEC", "SEE", "SEN", "SET", "SEW", "SHE", "SHY", "SIN", "SIP", "SIR", "SIS", "SIT", "SKI", "SKY", "SLY", "SO", "SOB", "SOD", "SON", "SOP", "SOW", "SOY", "SPA", "SPY", "SUB", "SUD", "SUE", "SUM", "SUN", "SUP", "TAB", "TAD", "TAG", "TAN", "TAP", "TAR", "TEA", "TED", "TEE", "TEN", "THE", "THY", "TIC", "TIE", "TIM", "TIN", "TIP", "TO", "TOE", "TOG", "TOM", "TON", "TOO", "TOP", "TOW", "TOY", "TRY", "TUB", "TUG", "TUM", "TUN", "TWO", "UN", "UP", "US", "USE", "VAN", "VAT", "VET", "VIE", "WAD", "WAG", "WAR", "WAS", "WAY", "WE", "WEB", "WED", "WEE", "WET", "WHO", "WHY", "WIN", "WIT", "WOK", "WON", "WOO", "WOW", "WRY", "WU", "YAM", "YAP", "YAW", "YE", "YEA", "YES", "YET", "YOU", "ABED", "ABEL", "ABET", "ABLE", "ABUT", "ACHE", "ACID", "ACME", "ACRE", "ACTA", "ACTS", "ADAM", "ADDS", "ADEN", "AFAR", "AFRO", "AGEE", "AHEM", "AHOY", "AIDA", "AIDE", "AIDS", "AIRY", "AJAR", "AKIN", "ALAN", "ALEC", "ALGA", "ALIA", "ALLY", "ALMA", "ALOE", "ALSO", "ALTO", "ALUM", "ALVA", "AMEN", "AMES", "AMID", "AMMO", "AMOK", "AMOS", "AMRA", "ANDY", "ANEW", "ANNA", "ANNE", "ANTE", "ANTI", "AQUA", "ARAB", "ARCH", "AREA", "ARGO", "ARID", "ARMY", "ARTS", "ARTY", "ASIA", "ASKS", "ATOM", "AUNT", "AURA", "AUTO", "AVER", "AVID", "AVIS", "AVON", "AVOW", "AWAY", "AWRY", "BABE", "BABY", "BACH", "BACK", "BADE", "BAIL", "BAIT", "BAKE", "BALD", "BALE", "BALI", "BALK", "BALL", "BALM", "BAND", "BANE", "BANG", "BANK", "BARB", "BARD", "BARE", "BARK", "BARN", "BARR", "BASE", "BASH", "BASK", "BASS", "BATE", "BATH", "BAWD", "BAWL", "BEAD", "BEAK", "BEAM", "BEAN", "BEAR", "BEAT", "BEAU", "BECK", "BEEF", "BEEN", "BEER", "BEET", "BELA", "BELL", "BELT", "BEND", "BENT", "BERG", "BERN", "BERT", "BESS", "BEST", "BETA", "BETH", "BHOY", "BIAS", "BIDE", "BIEN", "BILE", "BILK", "BILL", "BIND", "BING", "BIRD", "BITE", "BITS", "BLAB", "BLAT", "BLED", "BLEW", "BLOB", "BLOC", "BLOT", "BLOW", "BLUE", "BLUM", "BLUR", "BOAR", "BOAT", "BOCA", "BOCK", "BODE", "BODY", "BOGY", "BOHR", "BOIL", "BOLD", "BOLO", "BOLT", "BOMB", "BONA", "BOND", "BONE", "BONG", "BONN", "BONY", "BOOK", "BOOM", "BOON", "BOOT", "BORE", "BORG", "BORN", "BOSE", "BOSS", "BOTH", "BOUT", "BOWL", "BOYD", "BRAD", "BRAE", "BRAG", "BRAN", "BRAY", "BRED", "BREW", "BRIG", "BRIM", "BROW", "BUCK", "BUDD", "BUFF", "BULB", "BULK", "BULL", "BUNK", "BUNT", "BUOY", "BURG", "BURL", "BURN", "BURR", "BURT", "BURY", "BUSH", "BUSS", "BUST", "BUSY", "BYTE", "CADY", "CAFE", "CAGE", "CAIN", "CAKE", "CALF", "CALL", "CALM", "CAME", "CANE", "CANT", "CARD", "CARE", "CARL", "CARR", "CART", "CASE", "CASH", "CASK", "CAST", "CAVE", "CEIL", "CELL", "CENT", "CERN", "CHAD", "CHAR", "CHAT", "CHAW", "CHEF", "CHEN", "CHEW", "CHIC", "CHIN", "CHOU", "CHOW", "CHUB", "CHUG", "CHUM", "CITE", "CITY", "CLAD", "CLAM", "CLAN", "CLAW", "CLAY", "CLOD", "CLOG", "CLOT", "CLUB", "CLUE", "COAL", "COAT", "COCA", "COCK", "COCO", "CODA", "CODE", "CODY", "COED", "COIL", "COIN", "COKE", "COLA", "COLD", "COLT", "COMA", "COMB", "COME", "COOK", "COOL", "COON", "COOT", "CORD", "CORE", "CORK", "CORN", "COST", "COVE", "COWL", "CRAB", "CRAG", "CRAM", "CRAY", "CREW", "CRIB", "CROW", "CRUD", "CUBA", "CUBE", "CUFF", "CULL", "CULT", "CUNY", "CURB", "CURD", "CURE", "CURL", "CURT", "CUTS", "DADE", "DALE", "DAME", "DANA", "DANE", "DANG", "DANK", "DARE", "DARK", "DARN", "DART", "DASH", "DATA", "DATE", "DAVE", "DAVY", "DAWN", "DAYS", "DEAD", "DEAF", "DEAL", "DEAN", "DEAR", "DEBT", "DECK", "DEED", "DEEM", "DEER", "DEFT", "DEFY", "DELL", "DENT", "DENY", "DESK", "DIAL", "DICE", "DIED", "DIET", "DIME", "DINE", "DING", "DINT", "DIRE", "DIRT", "DISC", "DISH", "DISK", "DIVE", "DOCK", "DOES", "DOLE", "DOLL", "DOLT", "DOME", "DONE", "DOOM", "DOOR", "DORA", "DOSE", "DOTE", "DOUG", "DOUR", "DOVE", "DOWN", "DRAB", "DRAG", "DRAM", "DRAW", "DREW", "DRUB", "DRUG", "DRUM", "DUAL", "DUCK", "DUCT", "DUEL", "DUET", "DUKE", "DULL", "DUMB", "DUNE", "DUNK", "DUSK", "DUST", "DUTY", "EACH", "EARL", "EARN", "EASE", "EAST", "EASY", "EBEN", "ECHO", "EDDY", "EDEN", "EDGE", "EDGY", "EDIT", "EDNA", "EGAN", "ELAN", "ELBA", "ELLA", "ELSE", "EMIL", "EMIT", "EMMA", "ENDS", "ERIC", "EROS", "EVEN", "EVER", "EVIL", "EYED", "FACE", "FACT", "FADE", 
        "FAIL", "FAIN", "FAIR", "FAKE", "FALL", "FAME", "FANG", "FARM", "FAST", "FATE", "FAWN", "FEAR", "FEAT", "FEED", "FEEL", "FEET", "FELL", "FELT", "FEND", "FERN", "FEST", "FEUD", "FIEF", "FIGS", "FILE", "FILL", "FILM", "FIND", "FINE", "FINK", "FIRE", "FIRM", "FISH", "FISK", "FIST", "FITS", "FIVE", "FLAG", "FLAK", "FLAM", "FLAT", "FLAW", "FLEA", "FLED", "FLEW", "FLIT", "FLOC", "FLOG", "FLOW", "FLUB", "FLUE", "FOAL", "FOAM", "FOGY", "FOIL", "FOLD", "FOLK", "FOND", "FONT", "FOOD", "FOOL", "FOOT", "FORD", "FORE", "FORK", "FORM", "FORT", "FOSS", "FOUL", "FOUR", "FOWL", "FRAU", "FRAY", "FRED", "FREE", "FRET", "FREY", "FROG", "FROM", "FUEL", "FULL", "FUME", "FUND", "FUNK", "FURY", "FUSE", "FUSS", "GAFF", "GAGE", "GAIL", "GAIN", "GAIT", "GALA", "GALE", "GALL", "GALT", "GAME", "GANG", "GARB", "GARY", "GASH", "GATE", "GAUL", "GAUR", "GAVE", "GAWK", "GEAR", "GELD", "GENE", "GENT", "GERM", "GETS", "GIBE", "GIFT", "GILD", "GILL", "GILT", "GINA", "GIRD", "GIRL", "GIST", "GIVE", "GLAD", "GLEE", "GLEN", "GLIB", "GLOB", "GLOM", "GLOW", "GLUE", "GLUM", "GLUT", "GOAD", "GOAL", "GOAT", "GOER", "GOES", "GOLD", "GOLF", "GONE", "GONG", "GOOD", "GOOF", "GORE", "GORY", "GOSH", "GOUT", "GOWN", "GRAB", "GRAD", "GRAY", "GREG", "GREW", "GREY", "GRID", "GRIM", "GRIN", "GRIT", "GROW", "GRUB", "GULF", "GULL", "GUNK", "GURU", "GUSH", "GUST", "GWEN", "GWYN", "HAAG", "HAAS", "HACK", "HAIL", "HAIR", "HALE", "HALF", "HALL", "HALO", "HALT", "HAND", "HANG", "HANK", "HANS", "HARD", "HARK", "HARM", "HART", "HASH", "HAST", "HATE", "HATH", "HAUL", "HAVE", "HAWK", "HAYS", "HEAD", "HEAL", "HEAR", "HEAT", "HEBE", "HECK", "HEED", "HEEL", "HEFT", "HELD", "HELL", "HELM", "HERB", "HERD", "HERE", "HERO", "HERS", "HESS", "HEWN", "HICK", "HIDE", "HIGH", "HIKE", "HILL", "HILT", "HIND", "HINT", "HIRE", "HISS", "HIVE", "HOBO", "HOCK", "HOFF", "HOLD", "HOLE", "HOLM", "HOLT", "HOME", "HONE", "HONK", "HOOD", "HOOF", "HOOK", "HOOT", "HORN", "HOSE", "HOST", "HOUR", "HOVE", "HOWE", "HOWL", "HOYT", "HUCK", "HUED", "HUFF", "HUGE", "HUGH", "HUGO", "HULK", "HULL", "HUNK", "HUNT", "HURD", "HURL", "HURT", "HUSH", "HYDE", "HYMN", "IBIS", "ICON", "IDEA", "IDLE", "IFFY", "INCA", "INCH", "INTO", "IONS", "IOTA", "IOWA", "IRIS", "IRMA", "IRON", "ISLE", "ITCH", "ITEM", "IVAN", "JACK", "JADE", "JAIL", "JAKE", "JANE", "JAVA", "JEAN", "JEFF", "JERK", "JESS", "JEST", "JIBE", "JILL", "JILT", "JIVE", "JOAN", "JOBS", "JOCK", "JOEL", "JOEY", "JOHN", "JOIN", "JOKE", "JOLT", "JOVE", "JUDD", "JUDE", "JUDO", "JUDY", "JUJU", "JUKE", "JULY", "JUNE", "JUNK", "JUNO", "JURY", "JUST", "JUTE", "KAHN", "KALE", "KANE", "KANT", "KARL", "KATE", "KEEL", "KEEN", "KENO", "KENT", "KERN", "KERR", "KEYS", "KICK", "KILL", "KIND", "KING", "KIRK", "KISS", "KITE", "KLAN", "KNEE", "KNEW", "KNIT", "KNOB", "KNOT", "KNOW", "KOCH", "KONG", "KUDO", "KURD", "KURT", "KYLE", "LACE", "LACK", "LACY", "LADY", "LAID", "LAIN", "LAIR", "LAKE", "LAMB", "LAME", "LAND", "LANE", "LANG", "LARD", "LARK", "LASS", "LAST", "LATE", "LAUD", "LAVA", "LAWN", "LAWS", "LAYS", "LEAD", "LEAF", "LEAK", "LEAN", "LEAR", "LEEK", "LEER", "LEFT", "LEND", "LENS", "LENT", "LEON", "LESK", "LESS", "LEST", "LETS", "LIAR", "LICE", "LICK", "LIED", "LIEN", "LIES", "LIEU", "LIFE", "LIFT", "LIKE", "LILA", "LILT", "LILY", "LIMA", "LIMB", "LIME", "LIND", "LINE", "LINK", "LINT", "LION", "LISA", "LIST", "LIVE", "LOAD", "LOAF", "LOAM", "LOAN", "LOCK", "LOFT", "LOGE", "LOIS", "LOLA", "LONE", "LONG", "LOOK", "LOON", "LOOT", "LORD", "LORE", "LOSE", "LOSS", "LOST", "LOUD", "LOVE", "LOWE", "LUCK", "LUCY", "LUGE", "LUKE", "LULU", "LUND", "LUNG", "LURA", "LURE", "LURK", "LUSH", "LUST", "LYLE", "LYNN", "LYON", "LYRA", "MACE", "MADE", "MAGI", "MAID", "MAIL", "MAIN", "MAKE", "MALE", "MALI", "MALL", "MALT", "MANA", "MANN", "MANY", "MARC", "MARE", "MARK", "MARS", "MART", "MARY", "MASH", "MASK", "MASS", "MAST", "MATE", "MATH", "MAUL", "MAYO", "MEAD", "MEAL", "MEAN", "MEAT", "MEEK", "MEET", "MELD", "MELT", "MEMO", "MEND", "MENU", "MERT", "MESH", "MESS", "MICE", "MIKE", "MILD", "MILE", "MILK", "MILL", "MILT", "MIMI", "MIND", "MINE", "MINI", "MINK", "MINT", "MIRE", "MISS", "MIST", "MITE", "MITT", "MOAN", "MOAT", "MOCK", "MODE", "MOLD", "MOLE", "MOLL", "MOLT", "MONA", "MONK", "MONT", "MOOD", "MOON", "MOOR", "MOOT", "MORE", "MORN", "MORT", "MOSS", "MOST", "MOTH", "MOVE", "MUCH", "MUCK", "MUDD", "MUFF", "MULE", "MULL", "MURK", "MUSH", "MUST", "MUTE", "MUTT", "MYRA", "MYTH", "NAGY", "NAIL", "NAIR", "NAME", "NARY", "NASH", "NAVE", "NAVY", "NEAL", "NEAR", "NEAT", "NECK", "NEED", "NEIL", "NELL", "NEON", "NERO", "NESS", "NEST", "NEWS", "NEWT", "NIBS", "NICE", "NICK", "NILE", "NINA", "NINE", "NOAH", "NODE", "NOEL", "NOLL", "NONE", "NOOK", "NOON", "NORM", "NOSE", "NOTE", "NOUN", "NOVA", "NUDE", "NULL", "NUMB", "OATH", "OBEY", "OBOE", "ODIN", "OHIO", "OILY", "OINT", "OKAY", "OLAF", "OLDY", "OLGA", "OLIN", "OMAN", "OMEN", "OMIT", "ONCE", "ONES", "ONLY", "ONTO", "ONUS", "ORAL", "ORGY", "OSLO", "OTIS", "OTTO", "OUCH", "OUST", "OUTS", "OVAL", "OVEN", "OVER", "OWLY", "OWNS", "QUAD", "QUIT", "QUOD", "RACE", "RACK", "RACY", "RAFT", "RAGE", "RAID", "RAIL", "RAIN", "RAKE", "RANK", "RANT", "RARE", "RASH", "RATE", "RAVE", "RAYS", "READ", "REAL", "REAM", "REAR", "RECK", "REED", "REEF", "REEK", "REEL", "REID", "REIN", "RENA", "REND", "RENT", "REST", "RICE", "RICH", "RICK", "RIDE", "RIFT", "RILL", "RIME", "RING", "RINK", "RISE", "RISK", "RITE", "ROAD", "ROAM", "ROAR", "ROBE", "ROCK", "RODE", "ROIL", "ROLL", "ROME", "ROOD", "ROOF", "ROOK", "ROOM", "ROOT", "ROSA", "ROSE", "ROSS", "ROSY", "ROTH", "ROUT", "ROVE", "ROWE", "ROWS", "RUBE", "RUBY", "RUDE", "RUDY", "RUIN", "RULE", "RUNG", "RUNS", "RUNT", "RUSE", "RUSH", "RUSK", "RUSS", "RUST", "RUTH", "SACK", "SAFE", "SAGE", "SAID", "SAIL", "SALE", "SALK", "SALT", "SAME", "SAND", "SANE", "SANG", "SANK", "SARA", "SAUL", "SAVE", "SAYS", "SCAN", "SCAR", "SCAT", "SCOT", "SEAL", "SEAM", "SEAR", "SEAT", "SEED", "SEEK", "SEEM", "SEEN", "SEES", "SELF", "SELL", "SEND", "SENT", "SETS", "SEWN", "SHAG", "SHAM", "SHAW", "SHAY", "SHED", "SHIM", "SHIN", "SHOD", "SHOE", "SHOT", "SHOW", "SHUN", "SHUT", "SICK", "SIDE", "SIFT", "SIGH", "SIGN", "SILK", "SILL", "SILO", "SILT", "SINE", "SING", "SINK", "SIRE", "SITE", "SITS", "SITU", "SKAT", "SKEW", "SKID", "SKIM", "SKIN", "SKIT", "SLAB", "SLAM", "SLAT", "SLAY", "SLED", "SLEW", "SLID", "SLIM", "SLIT", "SLOB", "SLOG", "SLOT", "SLOW", "SLUG", "SLUM", "SLUR", "SMOG", "SMUG", "SNAG", "SNOB", "SNOW", "SNUB", "SNUG", "SOAK", "SOAR", "SOCK", "SODA", "SOFA", "SOFT", "SOIL", "SOLD", "SOME", "SONG", "SOON", "SOOT", "SORE", "SORT", "SOUL", "SOUR", "SOWN", "STAB", "STAG", "STAN", "STAR", "STAY", "STEM", "STEW", "STIR", "STOW", "STUB", "STUN", "SUCH", "SUDS", "SUIT", "SULK", "SUMS", "SUNG", "SUNK", "SURE", "SURF", "SWAB", "SWAG", "SWAM", "SWAN", "SWAT", "SWAY", "SWIM", "SWUM", "TACK", "TACT", "TAIL", "TAKE", "TALE", "TALK", "TALL", "TANK", "TASK", "TATE", "TAUT", "TEAL", "TEAM", "TEAR", "TECH", "TEEM", "TEEN", "TEET", "TELL", "TEND", "TENT", "TERM", "TERN", "TESS", "TEST", "THAN", "THAT", "THEE", "THEM", "THEN", "THEY", "THIN", "THIS", "THUD", "THUG", "TICK", "TIDE", "TIDY", "TIED", "TIER", "TILE", "TILL", "TILT", "TIME", "TINA", "TINE", "TINT", "TINY", "TIRE", "TOAD", "TOGO", "TOIL", "TOLD", "TOLL", "TONE", "TONG", "TONY", "TOOK", "TOOL", "TOOT", "TORE", "TORN", "TOTE", "TOUR", "TOUT", "TOWN", "TRAG", "TRAM", "TRAY", "TREE", "TREK", "TRIG", "TRIM", "TRIO", "TROD", "TROT", "TROY", "TRUE", "TUBA", "TUBE", "TUCK", "TUFT", "TUNA", "TUNE", "TUNG", "TURF", "TURN", "TUSK", "TWIG", "TWIN", "TWIT", "ULAN", "UNIT", "URGE", "USED", "USER", "USES", "UTAH", "VAIL", "VAIN", "VALE", "VARY", "VASE", "VAST", "VEAL", "VEDA", "VEIL", "VEIN", "VEND", "VENT", "VERB", "VERY", "VETO", "VICE", "VIEW", "VINE", "VISE", "VOID", "VOLT", "VOTE", "WACK", "WADE", "WAGE", "WAIL", "WAIT", "WAKE", "WALE", "WALK", "WALL", "WALT", "WAND", "WANE", "WANG", "WANT", "WARD", "WARM", "WARN", "WART", "WASH", "WAST", "WATS", "WATT", "WAVE", "WAVY", "WAYS", "WEAK", "WEAL", "WEAN", "WEAR", "WEED", "WEEK", "WEIR", "WELD", "WELL", "WELT", 
        "WENT", "WERE", "WERT", "WEST", "WHAM", "WHAT", "WHEE", "WHEN", "WHET", "WHOA", "WHOM", "WICK", "WIFE", "WILD", "WILL", "WIND", "WINE", "WING", "WINK", "WINO", "WIRE", "WISE", "WISH", "WITH", "WOLF", "WONT", "WOOD", "WOOL", "WORD", "WORE", "WORK", "WORM", "WORN", "WOVE", "WRIT", "WYNN", "YALE", "YANG", "YANK", "YARD", "YARN", "YAWL", "YAWN", "YEAH", "YEAR", "YELL", "YOGA", "YOKE"};
        Random random = new Random();
        int r = random.nextInt(256);
        int v = random.nextInt(256);
        return words[r] + " " + words[v];
    }
}
