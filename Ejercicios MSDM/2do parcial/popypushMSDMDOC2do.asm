.model small
.stack
.data

.code
inicio :
        mov ax, 255  ;carga 255 en AX lo almacena para despues recuperarlo
        mov bx, 32   ; carga 32 en BX lo almacena para desmostrar el uso de la pila
        mov cx, 27   ; carga 27 en CX
        mov dx, 8    ;carga 8 en Dx el ultimo vlor antes de pasar todo a la pila
        
        push ax      ;Guarda el valor actual de AX en la pila
        push bx      ;Guarda el valor actual de BX en la pila
        push cx      ;Guarda el valor actual de CX en la pila
        push dx      ;Guarda el valor actual de DX en la pila, este sera el primero en salir
        
        pop ax       ;recupera el ultimo valor guardado y lo coloca en AX
        pop bx       ;recupera el valor de Cx desde la pila y lo conoce en Bx
        pop cx       ;recupera el valor de Bx desde la pila y lo coloca en Cx
        pop dx       ;recupera el valor de Ax desde la pila y lo coloca en Dx
        
end inicio   ;fin del programa    