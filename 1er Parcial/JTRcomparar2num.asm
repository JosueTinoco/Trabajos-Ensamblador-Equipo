.model small        ; Define el modelo de memoria pequeño
.stack              ; Define el espacio para la pila
.data               
    ; Define mensajes. 13,10 es para bajar de renglon. $ es el fin del texto
    menj1 db 13,10, 'ES MAYOR$'       
    mensj2 db 13,10, 'ES MENOR QUE$'
    mensj3 db 13,10, 'ES IGUAL$'
    
.code   
    inicio:         ; Etiqueta de inicio del programa
        mov ax, @data   ; Carga la direccion de las variables en AX
        mov ds, ax      ; Pasa esa direccion a DS para poder usar los mensajes
       
        mov ax, 5h      ; Pone el numero 5 (hexadecimal) en el registro AX
        mov bx, 31h     ; Pone el numero 31 hex (49 decimal) en el registro BX
       
        cmp ax,bx       ; Compara el valor de AX contra BX (hace una resta imaginaria)
        jg esmayor      ; Jump if Greater: Si AX es mayor que BX, salta a "esmayor"
        jl esmenor      ; Jump if Less: Si AX es menor que BX, salta a "esmenor"
        je esigual      ; Jump if Equal: Si AX es igual a BX, salta a "esigual"
       
    esmayor:        ; Etiqueta que se ejecuta si fue mayor
        lea dx, menj1   ; Carga la direccion del mensaje "ES MAYOR" en DX
        call imprimir   ; Va a la subrutina "imprimir" y luego regresa aqui
        jmp finalizar   ; Salta obligatoriamente al final (para no ejecutar lo de abajo)
          
    esmenor:        ; Etiqueta que se ejecuta si fue menor
        lea dx, mensj2  ; Carga la direccion del mensaje "ES MENOR QUE"
        call imprimir   ; Llama a la funcion de imprimir
        jmp finalizar   ; Salta al final
         
    esigual:        ; Etiqueta que se ejecuta si son iguales
        lea dx, mensj3  ; Carga la direccion del mensaje "ES IGUAL"
        call imprimir   ; Llama a la funcion de imprimir
        jmp finalizar   ; Salta al final
         
    imprimir:       ; Esto es una subrutina (como una funcion pequeñita)
        mov ah, 9h      ; Funcion para mostrar texto en pantalla
        int 21h         ; Ejecuta la impresion
        ret             ; RETURN: Regresa a la linea donde fue llamada (call)
       
    finalizar:      ; Etiqueta para terminar el programa
        mov ah, 4ch     ; Funcion para salir a DOS
        int 21h         ; Se sale del programa
       
    end inicio      ; Fin del codigo (Ojo: en tu original decia 'endinicio:', debe ir separado)