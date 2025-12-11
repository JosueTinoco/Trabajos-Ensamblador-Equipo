.model small ; Define el modelo de memoria 'small'.
.stack       ; Define el segmento de la pila.
.data        ; Inicia el segmento de datos.

arreglo db 1, 5, 8, 3, 0 ; Declara un arreglo de bytes.
                         ; Contiene los numeros 1, 5, 8, y 3.
                         ; El 0 (cero) es el marcador de fin de arreglo o terminador.

.code        ; Inicia el segmento de codigo.

inicio:
    mov ax, @data
    mov ds, ax   ; Inicializa el Registro de Segmento de Datos (DS)
                 ; para que el programa pueda ver las variables del .data.

    mov si, offset arreglo ; Carga la direccion de inicio (offset) del arreglo
                           ; en el registro SI. SI es nuestro puntero.
                           
mostrar:
    mov al, [si] ; Mueve el *contenido* del byte apuntado por SI al registro AL.
                 ; AL ahora contiene el numero actual del arreglo (1 5 8 3).
    cmp al, 0    ; Compara el numero en AL con cero (0).
    je salir     ; Si son iguales (es decir el numero es 0) salta a la etiqueta 'salir'
                 ; para terminar el programa.

    add al, 30h  ; CLAVE: Suma 30h (hexadecimal) al numero en AL.
                 ; Por ejemplo si AL tiene el numero 1 (valor 01h),
                 ; al sumarle 30h da 31h. 31h es el codigo ASCII para el caracter '1'.
                 ; Esto convierte el valor numerico en su caracter imprimible.
    
    mov ah, 0Eh  ; Carga la funcion 0Eh en AH.
                 ; Esta es la funcion de la BIOS (int 10h) para "escribir caracter".
    int 10h      ; Llama a la Interrupcion 10h (Video BIOS) para mostrar el
                 ; caracter cuyo codigo ASCII esta en AL.

    inc si       ; Incrementa el puntero SI para avanzar al siguiente elemento del arreglo.
    jmp mostrar  ; Salta de nuevo a la etiqueta 'mostrar' para continuar el ciclo.

salir:
    mov ah, 4ch  ; Carga la funcion 4Ch en AH para "Terminar el programa".
    int 21h      ; Llama a la Interrupcion 21h del DOS para salir.
    
end inicio