#!/usr/bin/env python3

try:
  program = input('Enter a program:')
  response = exec(program)
  print(f"You entered `{response}`")
  if response == "password":
    print("Yeah, good job !")
    quit()
except:
  pass

print("No good...")

"""
solution :

exec() est un fontion en python qui permet d'éxécuter un code python mit en paramètre.
le challenge nous dit que le flag est dans le fichier flag.txt

donc pour l'obtenir on fait la commande suivante :

print(open('flag.txt').read())

sauf que ça n'affiche rien. Car le fichier n'est pas dans le répertoire courant. Donc je regarde si la commande open est disponible en affichant toute les commandes disponible:
-> print(dir(__builtins__))

  résultat :
  ['ArithmeticError', 'AssertionError', 'AttributeError', 'BaseException', 'BlockingIOError', 'BrokenPipeError', 'BufferError', 
  'BytesWarning', 'ChildProcessError', 'ConnectionAbortedError', 'ConnectionError', 'ConnectionRefusedError', 'ConnectionResetError', 
  'DeprecationWarning', 'EOFError', 'Ellipsis', 'EncodingWarning', 'EnvironmentError', 'Exception', 'False', 'FileExistsError', 
  'FileNotFoundError', 'FloatingPointError', 'FutureWarning', 'GeneratorExit', 'IOError', 'ImportError', 'ImportWarning', 
  'IndentationError', 'IndexError', 'InterruptedError', 'IsADirectoryError', 'KeyError', 'KeyboardInterrupt', 'LookupError', 
  'MemoryError', 'ModuleNotFoundError', 'NameError', 'None', 'NotADirectoryError', 'NotImplemented', 'NotImplementedError', 'OSError', 
  'OverflowError', 'PendingDeprecationWarning', 'PermissionError', 'ProcessLookupError', 'RecursionError', 'ReferenceError', 'ResourceWarning', 
  'RuntimeError', 'RuntimeWarning', 'StopAsyncIteration', 'StopIteration', 'SyntaxError', 'SyntaxWarning', 'SystemError', 'SystemExit', 'TabError', 
  'TimeoutError', 'True', 'TypeError', 'UnboundLocalError', 'UnicodeDecodeError', 'UnicodeEncodeError', 'UnicodeError', 'UnicodeTranslateError', 
  'UnicodeWarning', 'UserWarning', 'ValueError', 'Warning', 'ZeroDivisionError', '__build_class__', '__debug__', '__doc__', '__import__', '__loader__', 
  '__name__', '__package__', '__spec__', 'abs', 'aiter', 'all', 'anext', 'any', 'ascii', 'bin', 'bool', 'breakpoint', 'bytearray', 'bytes', 'callable', 
  'chr', 'classmethod', 'compile', 'complex', 'copyright', 'credits', 'delattr', 'dict', 'dir', 'divmod', 'enumerate', 'eval', 'exec', 'exit', 'filter', 
  'float', 'format', 'frozenset', 'getattr', 'globals', 'hasattr', 'hash', 'help', 'hex', 'id', 'input', 'int', 'isinstance', 'issubclass', 'iter', 
  'len', 'license', 'list', 'locals', 'map', 'max', 'memoryview', 'min', 'next', 'object', 'oct', 'open', 'ord', 'pow', 'print', 'property', 'quit', 
  'range', 'repr', 'reversed', 'round', 'set', 'setattr', 'slice', 'sorted', 'staticmethod', 'str', 'sum', 'super', 'tuple', 'type', 'vars', 'zip']

Ici open est disponible donc c'est surement que flag n'éxiste pas à l'endroit que j'ai préciser
Pour vérifier l'arborescence on fait :
  -> import os; print(os.listdir('.'))
  
  résultat :
    ['.bash_logout', '.bashrc', '.profile', 'tp3']

on est donc sur que flag.txt n'est pas ici.
donc on va parcourir l'arborescence du serveur :
  -> import os; print(os.listdir('/'))

ici on voit que flag.txt est à la racine. Donc on ajuste la première commande :
  -> print(open('/flag.txt').read())
"""