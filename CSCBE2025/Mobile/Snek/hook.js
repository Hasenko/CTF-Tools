Java.perform(function() {
    var module = Process.findModuleByName("libil2cpp.so");

    const moduleBase = module.base;
    console.log("[+] Module base address: " + moduleBase);

    const snakeDec = moduleBase.add(0x4b6020);
    console.log("[+] Snake$$Dec address: " + snakeDec);

    
    Interceptor.attach(snakeDec, {
        onEnter: function(args) {
            this.param1 = args[0];
            this.param2 = args[1];
            console.log("[+] Snake$$Dec called with parameters:");
            console.log("    param1: " + this.param1);
            console.log("    param2: " + this.param2);
        },
        
        onLeave: function(retval) {
            console.log("[+] Snake$$Dec returned: " + retval);
            try {
                const decryptedString = Memory.readUtf8String(retval);
                console.log("[+] Decrypted string: " + decryptedString);
            } catch (e) {
                console.log("[!] Return value is not a readable string: " + e);
                try {
                    const bytes = Memory.readByteArray(retval, 64);
                    console.log("[+] First 64 bytes of memory at return address:");
                    console.log(hexdump(bytes));
                } catch (e2) {
                    console.log("[!] Couldn't read memory at return address: " + e2);
                }
            }

            return retval;
        }
    });

    console.log("[*] Hook installed, waiting for Snake$$Dec to be called");
});