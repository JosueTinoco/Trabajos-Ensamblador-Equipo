.model small ;Configuran el modelo de memoria como small
.stack     ;definen el espacio para la pila (stack) 
.data       ;comienzo del Segmento de Datos (data).   

   suma db ?  ;Define una variable llamada suma en el Segmento de Datos. db indica que es de 8 bits. El ? indica que su valor inicial no está definido
   arreglo db 11,8, 7, 1, 2, 8   ;Define un arreglo de bytes llamado arreglo y lo inicializa con los valores: 11, 8, 7, 1, 2, 8.
   ele= ($-arreglo) ;Define una constante llamada ele. $ representa la dirección actual.
   
.code   ;Define el comienzo del Segmento de Código.

inicio:
    move ax, @data ;Carga la dirección del segmento de datos (@data) en el registro AX y luego copia ese valor al registro DS
    mov ds, ax
    
    mov ax, 0  ;nicializa el registro AX con el valor 0. Se usará la parte baja de AX (AL) como acumulador para la suma.
    mov cx, ele
    
L0: 
    add al, arreglo [si] ;Suma el valor del byte apuntado por arreglo[SI] (ej. arreglo[0], arreglo[1], etc.) al registro AL (Accumulator Low).
    mov bl, arreglo[si];Carga el valor del elemento actual del arreglo en el registro BL
    inc si
    sub bl, 1     ;sub es substraer o restar
    
    loopnz L0   ;Decrementa el contador CX en 1. Si CX no es cero Y el Zero Flag (ZF) no está activo, salta de vuelta a la etiqueta L0. Este bucle se repetirá 6 veces
    
    mov suma al  ;Mueve el resultado final de la suma (que está en el acumulador AL) a la variable suma.
    mov ah,4ch   ;Este es el código de función para terminar el programa y devolver el control al sistema operativo
    int 21h     
    
    
end incio    