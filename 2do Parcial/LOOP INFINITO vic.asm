#start=led_display.exe# ; Directiva (instruccion para el ensamblador) que indica
                       ; el nombre del programa ejecutable que se creara.
#MAKE_BIN#             ; Directiva que indica que el archivo de salida debe ser
                       ; un archivo binario simple (BIN), comun en microcontroladores.
NAME "LED"             ; Define el nombre interno del programa o modulo como "LED".

MOV AX,0               ; Mueve el valor cero (0) al registro AX.
                       ; AX es el contador que vamos a usar para la pantalla.
OUT 199, AX            ; Envia el contenido del registro AX (que es 0) al puerto
                       ; de salida de hardware numero 199.
                       ; Esto inicializa la pantalla o el LED a cero (apagado o valor inicial).

CICLO:                 ; Etiqueta que marca el inicio del bucle principal del programa.
    INC AX             ; Incrementa el valor del registro AX en uno.
                       ; AX ahora vale 1, luego 2, luego 3, y asi sucesivamente.
    OUT 199, AX        ; Envia el nuevo valor de AX al puerto de salida 199.
                       ; En un display LED, esto haria que el numero mostrado
                       ; cambie (cuente) con cada iteracion del ciclo.
LOOP CICLO             ; Instruccion de bucle. Disminuye el registro de conteo
                       ; CX en 1. Si CX no es cero, salta a la etiqueta 'CICLO'
                       ; y repite el bucle.
                       ; (Nota: En este codigo falta inicializar CX, pero el
                       ; LOOP asume que debe usarse para el bucle).