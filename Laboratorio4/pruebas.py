pos1 = []

for i in range(64):
    pos1 += [""]

print(pos1)

def checkpos (hs, vs):
    cadena = ""
    for iter in range(64):
        cadena += "O" if ((5 + (iter % 8)*5 + (iter % 8)*74 < hs) & (5 + (iter % 8)*5 + ((iter % 8)+1)*74) & (5 + (iter / 8)*5 + (iter / 8)*54 < vs) & (5 + (iter / 8)*5 + ((iter / 8)+1)*54 > vs)) else "."

    return cadena
cadena2= ""
for i in range(480):
    for j in range(640):
        cadena2 += checkpos(j,i) + "\n"
    cadena2 += "\n"

f = open("txt.txt", "w+")
f.write(cadena2)
f.close()

print("Listo")