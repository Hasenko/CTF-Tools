from pwn import *
import time

# Remplace 'nom_du_programme' par le chemin vers ton programme
program = './dynamite_hard.exe'

# Fonction pour vérifier le code PIN
def check_pin(pin):
    # Crée un nouveau processus pour chaque tentative
    p = process(program)
    
    print(f"Tentative avec le PIN : {pin}")  # Affiche le PIN en cours d'essai
    p.sendline(pin)

    # Attendre un peu pour donner au programme le temps de réagir
    time.sleep(0.5)

    # Lire la sortie du programme pour vérifier la réponse
    try:
        output = p.recvuntil(b'Too late cowboy...', timeout=1)  # Attendre jusqu'au message d'erreur
        output += p.recv()  # Lire tout ce qui reste
        print(f"Sortie reçue : {output}")  # Affiche la sortie reçue
    except EOFError:
        output = p.recvall()  # Lire tout s'il se ferme
    finally:
        p.close()  # Ferme le processus

    return output

def main():
    for i in range(10000):  # Essaye chaque code de 0000 à 9999
        pin = f"{i:04}"  # Formate le nombre avec 4 chiffres
        output = check_pin(pin)  # Vérifie le code
        
        # Débogage : Affiche la sortie en tant que chaîne
        output_str = output.decode('utf-8', errors='ignore')  # Convertit la sortie en chaîne
        print(f"Vérification de la sortie : {output_str}")  # Affiche la sortie sous forme de chaîne

        # Vérifie si le message "Too late cowboy..." est présent
        if "Too late cowboy…" in output_str:  # Utilise une chaîne pour la comparaison
            continue  # Passe au prochain PIN
        else:  # Si le code est correct
            print(f"Le code correct est : {pin}")
            break  # On sort de la boucle si on trouve le code

if __name__ == "__main__":
    main()