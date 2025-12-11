.model small ;Configuran el modelo de memoria como small
.stack ;definen el espacio para la pila
.data   ;marcan el inicio del Segmento de Datos

        suma db ? ;indica que su valor inicial es indefinido. Aquí se almacenará el resultado final de la suma.
        arreglo db 11,8,7,1,2,8
        ele=($-arreglo) ;sirve para guardar en el "ele" (vafiable) el numero de elementos del arreglo
.code 
    
    inicio: 
    mov ax,@data ;Carga la dirección del segmento de datos en AX
    mov ds,ax ;este valor a DS (Data Segment), permitiendo el acceso a las variables definidas en .data.
    
    mov al,0  ;Carga el registro AL con cero. AL se usará para ir acumulando la suma de los elementos.
    mov cx, ele     ;movimiento de los guardado en ele en el registro del contador cx
    lea si, arreglo ;Carga la dirección efectiva (offset) de la variable arreglo en el registro SI, SI actuará como el puntero del arreglo, y como el loop se mueve elemento por elemento (byte por byte), se incrementará en 1 cada vez.  
    
    repetir: ;Etiqueta que marca el inicio del bucle de repetición.
    
    add al, arreglo [si]        ;add: suma
    inc si ;"inc sirve para el incremento
    
    loop repetir ;Decrementa el contador CX en 1. Si CX no es cero, el control salta a la etiqueta repetir
    
    mov suma, al          ;mueve suma a "al" para inicializar en 0
    hlt        ;aborta y termina
    end inicio
    
    