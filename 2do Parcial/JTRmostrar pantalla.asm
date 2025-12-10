.model small        ; Modelo de memoria pequeno
.stack              ; Espacio para la pila
.data               ; Espacio de datos (esta vacio aqui)
.code               ; Espacio de codigo
inicio:
      mov ax,@data  ; Carga la direccion de datos en AX
      mov dx,ax     ; Mueve ese valor a DX (OJO: Normalmente aqui se pone mov ds,ax)
       
      ;Escribir en la pagina oculta
      mov ah,09h    ; Funcion INT 10h: Escribir caracter y atributo (color)
      mov al,'*'    ; El caracter que vamos a pintar es un asterisco
      mov bh,1h     ; Importante: Escribe en la Pagina 1 (no la 0 que ves normalmente)
      mov bl,01dh   ; Color: 1 es Fondo Azul, d es Letra Magenta Claro
       
      mov cx,6h     ; Repetir el caracter 6 veces
      int 10h       ; Ejecuta la instruccion de video (pinta los asteriscos en memoria)
       
      ;Mostrar la pagina oculta
      mov ah,05h    ; Funcion INT 10h: Cambiar la pagina activa de visualizacion
      mov al,1      ; Le dice a la pantalla: "Muestra ahora la Pagina 1"
      int 10h       ; Ejecuta el cambio (aqui apareceran los asteriscos de golpe)
       
      ;Salir
      mov ah,4ch    ; Funcion para terminar el programa
      int 21h       ; Sale al sistema operativo
       
      end inicio    ; Fin del codigo