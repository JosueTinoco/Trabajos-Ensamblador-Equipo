.model small   ;indica que se utilizara un modelo de 64 bits
.code     : ;indica el segmento del codigo
    inicio:    ;indica el nombre de la etiqueta seguido de;
    
    mov cx,5h
    mov ax,1h
    mov ax,2h
    mov ax,3h
    mov bx,7h
    mov ss,4h
             ;indica que mueve un datos 15 al registro ax
          
    int 21h  ;esta interrupcion sirve para los datos de netrada del clado a pantall y tambien para la impresora 
             ;en este caso se utiliza para finalizar el programa
             
    end inicio                  
    

