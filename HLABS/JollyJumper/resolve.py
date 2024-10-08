"""
solution :

open the file with ghidra. Find the function that print the flag.

get the hex adress of the function (where it is stored), put it in the netcat.

the input value of the user was stored in local_20 variable. Wich is a pointer that point to a function.
So just over writting this pointed let me jump to the function i want.

"""