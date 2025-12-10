.model small        ; Define que el programa usa poca memoria (modelo 'small')
.stack              ; Define el espacio para la pila (memoria temporal automatica)
.data               ; Inicio del segmento donde van las variables
    ; Define el primer mensaje. 10 y 13 son para bajar de renglon (Enter). $ marca el final
    mensj1 db 10,13, 'ingrese un caracter por favor$' 
    mensj2 db 10,13, 'ingrese un segundo caracter por favor$' 
    
    ; Define variables de un byte. Aunque aqui solo tienen guardados saltos de linea (10,13)
    num1 db 10,13
    num2 db 10,13       
    res db 10,13    ; Variable pensada para el resultado

.code               ; Inicio del segmento de instrucciones
    inicio:         ; Etiqueta donde empieza a ejecutarse el programa
        mov ax, @data   ; Agarra la direccion de las variables y la pone en AX
        mov ds, ax      ; Pasa esa direccion al registro DS (necesario para usar datos)
        
        ; Mostrar primer mensaje
        mov ah, 9h      ; Funcion 09h: Sirve para imprimir texto en pantalla
        lea dx, mensj1  ; Carga en DX la direccion donde esta el mensaje 1
        int 21h         ; Llama al sistema (DOS) para que muestre el mensaje
                            
        ;Leer primer caracter
        mov ah, 01      ; Funcion 01h: Sirve para leer una tecla
        int 21h         ; Espera a que presiones una tecla. 
                        ; OJO: El caracter que escribiste se guarda en el registro AL
        
        ;Mostrar segundo mensaje
        mov ah, 9h      ; Vuelve a preparar la funcion de imprimir texto
        lea dx, mensj2  ; Carga en DX la direccion del mensaje 2
        int 21h         ; Muestra el mensaje 2 en pantalla
        
        ;Leer segundo caracter
        mov ah, 01      ; Prepara la funcion para leer otra tecla
        int 21h         ; Espera a que presiones la segunda tecla
         
        ;Salir del programa
        mov ah, 4ch     ;Funcion 4Ch: Terminar programa correctamente
        int 21h         ;Devuelve el control al sistema operativo
         
    end inicio      ;Fin del codigo 