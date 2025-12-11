.model small
.stack
.data
    mensj1 db 10,13, 'ingrese un digito por favor: $' 
    mensj2 db 10,13, 'ingrese un segundo digito por favor: $' 
    mensj_res db 10,13, 'La suma es: $'
    
    ; Variable para guardar el primer digito
    num1 db ? 
    
    ; Variable para guardar el resultado (el 10 y 13 son para el salto de linea)
    res db 10,13, '0', '$' 
    
.code

    inicio:
        mov ax, @data
        mov ds, ax  
        
        mov cx, 3      ;carga en el registro cx el numero de veces que se va a repetir el ciclo
        repetir:
        
        
        ; IMPRIMIR Y LEER PRIMER DIGITO
        mov ah, 9h
        lea dx, mensj1
        int 21h 
        
        mov ah, 01              ; Funcion para leer un caracter
        int 21h                
        
        ; GUARDAR PRIMER DIGITO
        mov num1, al            ; Guarda el caracter ASCII del primer digito en 'num1'
        
        ; IMPRIMIR Y LEER SEGUNDO DIGITO
        mov ah, 9h
        lea dx, mensj2
        int 21h
        
        mov ah, 01              ; Funcion para leer un caracter
        int 21h                 
        
        ; REALIZAR LA SUMA
        ; AL tiene el segundo digito (ASCII)
        ; AH es el registro que usaremos para la suma
        
        mov ah, num1            ; Mueve el primer digito (ASCII) de 'num1' a AH
        
        ; CONVERSION DE ASCII A NUMERO
        ; Restamos 30h (o 48 decimal) para obtener el valor numerico del caracter
        sub al, '0'             ; Convierte el segundo digito (en AL) a su valor numerico
        sub ah, '0'             ; Convierte el primer digito (en AH) a su valor numerico
        
        ; SUMA
        add al, ah              ; Suma: (valor2) + (valor1). El resultado esta en AL
        
        ; CONVERSION DE NUMERO A ASCII PARA MOSTRAR
        
        add al, '0'             ; Convierte el resultado numerico (en AL) de nuevo a ASCII
        
        ; GUARDAR Y MOSTRAR EL RESULTADO
        mov res + 2, al         ; Guarda el caracter ASCII del resultado en la posicion correcta de 'res'
                                ; (La posicion 2 es despues del 10,13)
        
        ; Mostrar el mensaje "La suma es: "
        mov ah, 9h
        lea dx, mensj_res
        int 21h
        
        ; Mostrar el resultado
        mov ah, 9h
        lea dx, res + 2         ; Muestra solo el digito del resultado
        int 21h   
        
        loop repetir    ;termina la funcion de repetir  
        
        
        ; Salir del programa   

        mov ah, 4ch           ;4ch va fuera del ciclo repetir
        int 21h
        
    end inicio    ;fin



