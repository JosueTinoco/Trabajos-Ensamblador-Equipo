.model small        ;Define que el programa usara poca memoria (modelo 'small')
.stack              ;Indica el inicio del segmento de pila (memoria temporal)

    DB 100h DUP (?) ;Reserva 256 bytes de espacio vacio para la pila
       
.data               ;Inicio del segmento de datos (variables)
    MENSAJE DB 'Se ha cambiado el color de la pantalla $' ; Guarda el texto. El simbolo $ avisa donde termina
    ASSUME CS:CODIGO, SS:PILA, DS:DATOS ; Le dice al ensamblador que segmento corresponde a cada registro

.code               ;Inicio del segmento de codigo (instrucciones)
inicio:             ;Etiqueta que marca donde arranca el programa
    MOV AX,@DATA    ;Carga la direccion de las variables en el registro AX
    Mov DS,AX       ;Pasa esa direccion de AX al registro DS (necesario para usar variables)
       
    ;Bloque para cambiar color de fondo
    mov ah,06h      ;Funcion de video para desplazar o limpiar pantalla
    mov bH,00011111B ;Define el color: Fondo Azul (0001) y Letra Blanca Brillante (1111)
    mov cx,000000h  ;Coordenada inicial: Esquina superior izquierda (Renglon 0, Columna 0)
    mov dx,184Fh    ;Coordenada final: Esquina inferior derecha (Renglon 24, Columna 79)
    int 10h         ;Llama a la interrupcion de video (BIOS) para pintar la pantalla
       
    ;Bloque para mover el cursor al inicio
    MOV AH,02H      ;Funcion de video para colocar el cursor en una posicion
    MOV BH,00H      ;Elige la pagina de video 0 (la pantalla actual)
    MOV DX, 0000H   ;Coordenadas donde ira el cursor: Renglon 0, Columna 0
    INT 10H         ;Ejecuta la interrupcion para mover el cursor
       
    ;Bloque para mostrar el texto
    LEA DX,MENSAJE  ;Carga en DX la direccion donde esta guardado el mensaje
    MOV AH,9H       ;Funcion del sistema operativo (DOS) para imprimir texto
    INT 21H         ;Ejecuta la interrupcion para mostrar el texto en pantalla
       
    END INICIO      ;Fin del archivo y le dice al programa que empiece en la etiqueta 'inicio'