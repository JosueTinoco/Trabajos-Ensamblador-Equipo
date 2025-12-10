.model small        ; Define modelo de memoria pequeno
.stack              ; Define espacio de pila
.data
    ; Mensajes de texto. 10 y 13 son para dar 'Enter' (salto de linea)
    mensj1 db 10,13, 'ingrese un digito por favor: $' 
    mensj2 db 10,13, 'ingrese un segundo digito por favor: $' 
    mensj_res db 10,13, 'La suma es: $'
    
    ; Variable vacia de 1 byte para guardar el primer numero que escribas
    num1 db ? 
    
    ; Variable para el resultado. 
    ; Tiene salto de linea (10,13), un espacio para el numero ('0') y el final ($)
    res db 10,13, '0', '$' 
    
.code

    inicio:
        mov ax, @data   ; Carga la direccion de las variables en AX
        mov ds, ax      ; Pasa esa direccion a DS (necesario para usar .data)
        
        mov cx, 3       ; Pone el numero 3 en CX. El ciclo se repetira 3 veces
        
    repetir:            ; Etiqueta de inicio del ciclo
        
        ; --- Pedir primer numero ---
        mov ah, 9h      ; Funcion para imprimir texto
        lea dx, mensj1  ; Carga la direccion del mensaje 1
        int 21h         ; Muestra "ingrese un digito..."
        
        mov ah, 01      ; Funcion para leer una tecla del teclado
        int 21h         ; Espera a que presiones una tecla. Se guarda en AL
        
        mov num1, al    ; Guarda lo que escribiste (en AL) dentro de la variable 'num1'
        
        ; --- Pedir segundo numero ---
        mov ah, 9h      ; Funcion para imprimir texto
        lea dx, mensj2  ; Carga la direccion del mensaje 2
        int 21h         ; Muestra "ingrese un segundo digito..."
        
        mov ah, 01      ; Funcion para leer tecla
        int 21h         ; Se guarda en AL (ahora AL tiene el segundo numero)
        
        ; --- Preparar la suma ---
        ; En este punto: AL tiene el 2do numero. num1 tiene el 1er numero.
        
        mov ah, num1    ; Mueve el primer numero (que guardamos antes) al registro AH
        
        ; --- Conversion ASCII a Numero Real ---
        ; El teclado envia codigos (ej: '5' es 53). Hay que restar '0' (48) para obtener el 5 real.
        sub al, '0'     ; Convierte el segundo digito de "Letra" a "Numero"
        sub ah, '0'     ; Convierte el primer digito de "Letra" a "Numero"
        
        ; Sumar
        add al, ah      ; Suma los dos numeros reales. El resultado queda en AL
        
        ; Conversion Numero Real a ASCII
        ; Para imprimirlo, hay que convertir el numero de vuelta a codigo de letra
        add al, '0'     ; Suma '0' al resultado para que sea imprimible
        
        ;Guardar resultado en memoria
        ; 'res + 2' se salta el 10 y el 13, y guarda el dato justo donde estaba el '0'
        mov res + 2, al 
                               
        ;Imprimir texto "La suma es:"
        mov ah, 9h
        lea dx, mensj_res
        int 21h
        
        ;Imprimir el numero resultado
        mov ah, 9h      ; Funcion imprimir
        lea dx, res + 2 ; Apunta directo al numero dentro de la variable 'res'
                        ; (Se salta los saltos de linea iniciales de esa variable)
        int 21h         ; Muestra el numero
        
        loop repetir    ; Resta 1 a CX. Si CX no es 0, salta a la etiqueta 'repetir'
        
        
        ;Salir
        mov ah, 4ch     ; Funcion para terminar programa
        int 21h         ; Salir a DOS
        
    end inicio      ; Fin del codigo