.model small         ;define el modelo de memoria      
.stack               ;reserva la pila   
.data                ;seccion de datos
.code                ;seccion de codigo
inicio:
      mov ax,@data    ;carga la direccion del segmento de datos en AX
      mov dx,ax       ;inicializa el segmento de datos
      
    ;---imprimir un caracter con color usando INT 10H---
      mov ah,09h ;imprimir el caracter con un atributo 
      mov al,'*' ;caracter a imprimir
      mov bh,0h  ;pagina de video 0
      mov bl,01dh;Atributo de color
      mov cx,010h ;Numero de veces que se imprimira el caracter
      int 10h    ;llamada a la interrupcion del video
      
      mov ah,4ch  ;funcion 4CH termina el programa
      int 21h     ;llamada para finalizar
      
      end inicio ;Fin del programa

                                                                                  