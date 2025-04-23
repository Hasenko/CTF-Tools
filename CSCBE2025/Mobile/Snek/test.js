Java.perform(function () {
    var Application = Java.use("android.app.Application");
    Application.onCreate.implementation = function () {
        console.log("[*] Application onCreate() called");
        this.onCreate();
    };
});
