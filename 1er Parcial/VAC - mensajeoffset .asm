.model small ; Declara el uso del modelo de memoria 'small'.
             ; Esto significa que el codigo y los datos no exceden 64 KB cada uno.
.stack       ; Define el segmento de la pila (stack) para datos temporales.
.data        ; Inicia el segmento de datos. Aca se definen las variables.
    mensaje db 13,10, 'hola mundo $' 
             ; Declara la cadena 'mensaje'.
             ; 13, 10: Retorno de carro y salto de linea (nueva linea).
             ; '$': El caracter de terminacion de cadena para la funcion de impresion.
    mensaje2 db 13,10, 'Victor$' 
             ; Segunda cadena de texto.
    mensaje3 db 13,10, 'Hola$' 
             ; Tercera cadena de texto.

.code        ; Inicia el segmento de codigo. Aca se escriben las instrucciones.

    inicio:  ; Etiqueta que marca el punto donde comienza la ejecucion del programa.

    mov ax,@data ; Mueve la direccion del segmento de datos (@data) al registro AX.
                 ; AX se usa como paso intermedio.
    mov ds, ax   ; Mueve la direccion de datos de AX al registro DS (Data Segment).
                 ; Esto permite que el programa acceda a las variables definidas en .data.
                 
; --- Impresion de 'hola mundo $' ---
    mov dx, offset mensaje 
                 ; Mueve el desplazamiento (offset) de la variable 'mensaje'
                 ; al registro DX. Esto es equivalente a usar 'LEA DX, mensaje'
                 ; y le dice a la funcion de impresion donde comienza el texto.
    mov ah, 9h   ; Carga el valor 09h en AH. 09h es el codigo de la funcion
                 ; de DOS para "Imprimir una cadena de caracteres".
    int 21h      ; Llama a la Interrupcion 21h del DOS para ejecutar la funcion
                 ; especificada en AH (imprimir) usando la direccion en DX.
                    
; --- Impresion de 'Victor$' ---
    mov dx, offset mensaje2 
                 ; Mueve el desplazamiento (offset) de 'mensaje2' al registro DX.
    mov ah,9h    ; Carga de nuevo la funcion 09h (Imprimir cadena) en AH.
    int 21h      ; Ejecuta la interrupcion 21h para imprimir "Victor$".
    
; --- Impresion de 'Hola$' ---
    mov dx, offset mensaje3 
                 ; Mueve el desplazamiento (offset) de 'mensaje3' al registro DX.
    mov ah,9h    ; Carga de nuevo la funcion 09h (Imprimir cadena) en AH.
    int 21h      ; Ejecuta la interrupcion 21h para imprimir "Hola$".

; --- Terminacion del Programa ---
    mov ah, 4ch  ; Carga el valor 4Ch en AH.
                 ; 4Ch es el codigo de la funcion del DOS para "Terminar
                 ; el programa y regresar al sistema operativo".
    int 21h      ; Ejecuta la interrupcion 21h, finalizando el programa.

    end inicio   ; Indica donde termina el codigo fuente y cual es el punto de inicio.                
    

