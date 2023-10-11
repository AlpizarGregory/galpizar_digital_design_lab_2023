gr_lin = 5
altura = 54
ancho = 74
lineas = 9
ancho_pantalla = 640
altura_pantalla = 480

yx = 0
yk = 0

for linea in range(lineas):
    if linea == 0:
        yk = yx + gr_lin
        print("Linea 1: de ", yx, " a ", yk)
        yx = yk
    else:
        yx += altura
        yk = yx + gr_lin
        print("Linea ", linea + 1, ": de ", yx, " a ", yk)
        yx = yk

xx = 0
xk = 0

for columna in range(lineas):
    if columna == 0:
        xk = xx + gr_lin
        print("Columna 1: de ", xx, " a ", xk)
        xx = xk
    else:
        xx += ancho
        xk = xx + gr_lin
        print("Columna ", columna + 1, ": de ", xx, " a ", xk)
        xx = xk