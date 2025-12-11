.model small ; Declara el uso del modelo de memoria 'small'.
.stack       ; Define el segmento de la pila (stack).
.data        ; Inicia el segmento de datos. Aca se definen las variables.
    arreglo db "h","o","l","a",0 
             ; Declara un arreglo de bytes (db) con los caracteres 'h' 'o' 'l' 'a'.
             ; El ultimo byte es 0 (cero) que se usa como terminador o marca
             ; de fin de cadena para que el ciclo sepa cuando parar.

.code        ; Inicia el segmento de codigo.

    inicio:  ; Etiqueta que marca el punto de inicio del programa.
        mov ax, @data
        mov ds, ax   ; Inicializa el Registro de Segmento de Datos (DS)
                     ; para poder acceder a la variable 'arreglo'.

        mov si, offset arreglo ; Mueve la direccion de inicio (offset) del arreglo
                               ; al registro SI (Source Index).
                               ; SI funcionara como un 'puntero' que apunta a la
                               ; posicion actual del caracter a leer.
        
        mostrar: ; Etiqueta que marca el inicio del ciclo principal (bucle).
            mov al, [si] ; Mueve el *contenido* del byte apuntado por SI al registro AL.
                         ; Esta es la operacion de 'leer el caracter actual'.
                         ; El caracter leido se guarda en AL.
            
            cmp al, 0    ; Compara el valor en AL (el caracter leido) con cero (0).
                         ; Si el caracter es 0 significa que llegamos al final del arreglo.
            je salir     ; Si son Iguales (Equal) salta a la etiqueta 'salir'.
            jmp imprimir ; Si no son iguales salta a la etiqueta 'imprimir' para mostrar el caracter.
            
        salir:
            mov ah, 4ch  ; Carga la funcion 4Ch en AH para "Terminar el programa".
            int 21h      ; Llama a la Interrupcion 21h del DOS para terminar.
            
        imprimir:        ; Etiqueta para la rutina de impresion de un solo caracter.
            mov ah, 0Eh  ; Carga la funcion 0Eh en AH.
                         ; 0Eh es la funcion de la BIOS (Interrupcion 10h)
                         ; para "Escribir caracter en el modo TeleTipo" (mostrarlo).
                         ; El caracter a mostrar esta ya en AL.
            int 10h      ; Llama a la Interrupcion 10h (Interrupcion de Video BIOS)
                         ; para ejecutar la impresion.
            
            inc si       ; Incrementa el registro SI en uno.
                         ; Esto hace que el 'puntero' avance a la siguiente posicion
                         ; de memoria para leer el proximo caracter del arreglo