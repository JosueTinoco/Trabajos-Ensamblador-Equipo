.model small 
.stack 100h
.data
    archivo db "texto.txt" ,0     ;Nombre de el archivo a buscar, termina es 0 para marcar su fin de la cadena de texto  
    msgerror db "Archvio no encontrado$" ;mensaje si el archivo no existe
    msgencontrar db "Archivo encontrado$";mensaje si el archivo existe
    
.code
main proc 
     ;---inicializacion---
    mov ax, @data   ;carga la direccion de los datos
    mov ds, ax      ;inicializa DS con los datos
    
    ;Empieza a buscar el archivo
    mov ah, 3Dh   ;sirve para abrir el archivo  
    mov al, 0      ;el modo lo coloca en solo lectura
    mov dx, offset archivo ;apunta el nombre del archivo
    int 21h  ; aqui se intenta abrir el archivo
    
    jc error ;si la bandera es =1 ocurrio un error
    mov bx, ax ;AX contiene el handle
    mov ah, 3Eh  ;sirve para cerrar el archivo
    int 21h   ;aqui lo cierra
     
     jmp encontrar ;salta a el mensaje de encontrado
    jmp salir    
    
    
    encontrar:
        mov dx, offset msgencontrar ;muestra el mensaje de archivo encontrado
        mov ah, 09h ; la funcion 09h Imprime la cadena terminada en $
        int 21h  ; muestra el mensaje        
              
    error:
        mov dx, offset msgerror  ;carga el mensaje de archivo no encontrado
        mov ah, 09h ;imprime la cadena
        int 21h
        
     salir: 
     mov ah, 4ch ;funcion para terminar el programa
     int 21h
     main endp
end main