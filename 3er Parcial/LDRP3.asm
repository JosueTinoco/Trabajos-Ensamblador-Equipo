

.model small        ; Define el modelo de memoria. 'SMALL' significa que
                   

.stack 100h         ; Define el tamaño de la pila (Stack) en 100h bytes.
                    

.data ; En este programa mínimo no se definen variables, pero si lo hicieras,


.code               ; Inicia el segmento de codigo (donde van las instrucciones)

    inicio:         ; Etiqueta de inicio del programa (se usa en el 'END inicio')

       
        
        mov cx, 5h      ; Carga el valor 5 (hexadecimal) en el registro Contador (CX).
        
        mov ax, 1h      ; Carga 1h en AX.
        mov ax, 2h      ; Sobrescribe AX con 2h.
        mov ax, 3h      ; Sobrescribe AX con 3h (El valor final en AX es 3h).
        
        mov bx, 7h      ; Carga 7h en el registro Base (BX).
 
        
        mov ah, 4ch     ; Carga 4Ch (Función de DOS para "Terminar Programa") en el
                        ; registro AH (parte alta de AX).
                        
        int 21h         ; Llama a la Interrupción 21h. El sistema operativo (DOS)
                        ; lee 4Ch en AH y finaliza la ejecución del programa.

    end inicio          ; Marca el final del código fuente y especifica que la
                        ; ejecución debe comenzar en la etiqueta 'inicio'.
; ====================================================================