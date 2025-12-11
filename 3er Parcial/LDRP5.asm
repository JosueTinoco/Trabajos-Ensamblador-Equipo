#start=led_display.exe#    ;Define el nombre del archivo ejecutable de salida.
#MAKE_BIN# ;Indica que se debe generar un archivo binario simple
NAME "LED" ;Asigna un nombre interno o de módulo al código.
MOV AX,10   ;Carga el valor decimal 10 en el registro de propósito general AX (Acumulador). 
            ;Este valor actuará como un contador inicial y como el dato a enviar.  
            
            
OUT 199, AX ;Envía el valor actual del registro AX, al Puerto de E/S (Input/Output) con la dirección 199.

CICLO:       ;Define el punto de inicio para el bucle (ciclo).
    dec AX    ;Reduce el valor del registro AX en 1.
    OUT 199, AX  ;Envía el nuevo valor del registro AX (ahora decrecido) al Puerto de E/S 199.
    cmp ax,1  ;Compara el valor actual de AX con el valor 1
LOOPNZ CICLO  ;Esta instrucción condicional evalúa las banderas después del CMP
    