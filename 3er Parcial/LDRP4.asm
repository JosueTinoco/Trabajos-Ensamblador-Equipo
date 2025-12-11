#start=led_display.exe#  ;Directivas de compilación/ensamblaje para el entorno específico (simulador o compilador).
#MAKE_BIN#
NAME "LED"
MOV AX,0   ;Inicializa el registro AX con cero. AX se usará como el contador.
OUT 199, AX  ;Envía el valor de AX (que es 0) al Puerto de Salida 199 ($C7h$).

CICLO:       ;Etiqueta de inicio del bucle.
    INC AX   ;Incrementa el contador AX en 1. (AX pasa de 0 a 1, luego a 2, etc.)
    OUT 199, AX  ;Envía el nuevo valor de AX al Puerto 199, actualizando el dispositivo conectado (ej. un display LED).
    cmp ax,10 ;Compara el valor actual en AX con el valor 10 (decimal). Esta instrucción establece flags (como el Zero Flag o el Carry Flag)  
    
LOOPNZ CICLO ;Decrementa el contador CX (que no fue inicializado en este código, lo cual es un error). 
              ;El sufijo NZ significa "No Zero" (No Cero). Si CX no es cero Y el resultado de la última operación (cmp) no fue cero
              ; salta a CICLO. Si CX no fue inicializado, este código podría comportarse de manera impredecible o correr un número de veces muy grande, 
              ;ya que cmp no afecta CX.