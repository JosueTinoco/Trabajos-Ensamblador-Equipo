.model small   ;indica que se utilizara un modelo de 64 bits 
.stack
.data       ;segmento donde se declaran variables
    mensaje db 13,10, 'hola mundo $';debe llevar simbolo de pesos para terminar la cadena
    mensaje2 db 13,10, 'miguel$'   ;se vuelve a declarar 
    mensaje3 db 13,10, 'Hola$'
.code     : ;indica el segmento del codigo  

    inicio:    ;indica el nombre de la etiqueta seguido de;
    
    mov ax,@data ;registro ax 16 bits @data es una constante que sirve para regresar la panatlla o recibir datos de entrada salida     
    mov ds, ax ;contiene todas las constantes definidas                                                              
    mov dx, offset mensaje  ; carga en DX la direccion del primer mensaje
    call Imprimir ;llama a la rutina que imprime cadenas
                                                                                      ; mov ah, 9h
                                                                                      ;int 21h
      
    mov dx, offset mensaje2  ;funciona como el lea (offset)     
                                                               
            call imprimir     ;mov y offset sirven para imprimir en el registro de dx 
                             
            
    ;mov ah,9h   ;instruccion para imprimir pantalla   
    ;int 21h   
   
    mov dx, offset mensaje3  ;carga en dx la direccion del tercer mensaje    
    
           call Imprimir     ;call -->imprimir
           jmp finalizar     ;jmp -->imprimir
    Imprimir: 
    mov ah,9h   ;instruccion para imprimir pantalla   
    int 21h
    ret   ;regresa a la instruccion siguiente de call
    
    finalizar: 
        mov ah, 4ch    ;instruccion para la interrupcion "mov ah, 4ch"
        int 21h        ;llama a la interrupcion para finalizar la ejecucion
            
    end inicio       ;fin           
    

