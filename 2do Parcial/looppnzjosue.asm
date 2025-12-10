.model small        ; Define modelo de memoria pequeno
.stack              ; Define espacio de pila
.data
   suma db ?        ; Variable vacia para guardar el resultado de la suma
   arreglo db 11,8, 7, 1, 2, 8 ; Define la lista de numeros (son 6 numeros)
   ele= ($-arreglo) ; Calcula automaticamente cuantos numeros hay (longitud = 6)
   
.code 

inicio:
    mov ax, @data   ; Carga la direccion de las variables en AX
    mov ds, ax      ; Pasa esa direccion a DS
    
    mov ax, 0       ; Pone AX en 0 para empezar a sumar desde cero
    mov cx, ele     ; Pone 6 en el contador CX (la cantidad de vueltas)
    
L0:                 ; Etiqueta donde inicia el ciclo
    add al, arreglo [si] ; Suma el numero actual del arreglo al acumulador AL
    mov bl, arreglo[si]  ; Copia ese mismo numero a BL para revisarlo
    inc si          ; Incrementa SI para pasar a la siguiente posicion del arreglo
    sub bl, 2       ; Resta 2 al valor que copiamos en BL
                    ; OJO: Si el numero era 2, la resta da 0 (2-2=0) y activa la bandera Zero Flag
    
    loopnz L0       ; "Loop Not Zero". Hace dos cosas:
                    ; 1. Resta 1 a CX.
                    ; 2. Revisa la operacion anterior (sub bl, 2).
                    ; SI CX aun no es 0 Y la resta NO dio 0, repite el ciclo.
                    ; (Si encuentra un 2 en el arreglo, se sale del ciclo antes de tiempo)
    
    mov suma, al    ; Guarda el resultado final de la suma en la variable
    mov ah,4ch      ; Funcion para salir
    int 21h         ; Termina el programa
    
    
end inicio          ; Fin del codigo  