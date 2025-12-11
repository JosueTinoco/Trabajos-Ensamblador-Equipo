.model small   ;indica que se utilizara un modelo de 64 bits
.code     : ;indica el segmento del codigo
    inicio:    ;indica el nombre de la etiqueta seguido de;
    
    mov cx,5h ;Mueve el valor hexadecimal 5h (5 en decimal) al registro CX
    mov ax,1h ;Mueve el valor hexadecimal 1h (1 en decimal) al registro AX (Accumulator Register).
    mov ax,2h ;Sobrescribe el valor en AX con el valor hexadecimal 2h.
    mov ax,3h ;Sobrescribe el valor en AX nuevamente con el valor hexadecimal 3h (3 en decimal). Al finalizar esta línea, AX contiene 3h.
    mov bx,7h ;Mueve el valor hexadecimal 7h (7 en decimal) al registro BX
    mov ss,4h
             ;indica que mueve un datos 15 al registro ax
          
    int 21h  ;esta interrupcion sirve para los datos de netrada del clado a pantall y tambien para la impresora 
             ;en este caso se utiliza para finalizar el programa
             
    end inicio                  
    

