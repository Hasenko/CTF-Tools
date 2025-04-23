Java.perform(function() {
    var targetClass = Java.use("be.dauntless.tryandcatchme.MainActivity");
    
    // Hook a function, in this case the one which has the goto logic
    targetClass.checkForWin.implementation = function() {
        console.log("checkForWin() is being called");

        // Manipulate the program's control flow by modifying the logic here
        // If you want to force a jump, simply return early or modify the result
        var context = Java.use("android.app.ActivityThread").currentApplication().getApplicationContext();
        var result = this.checkForWin(context); // Call original function, or skip it
        console.log(result)

        return true;
    };
});

// r1 = 1 + 1 + 1 + 1 + 1 + 1 + 1 + 10 + (10)