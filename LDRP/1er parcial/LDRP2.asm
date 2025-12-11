.model small   ;indica que se utilizara un modelo de 64 bits 
.stack
.data       ;segmento donde se declaran variables
    mensaje db 13,10, 'hola mundo $';debe llevar simbolo de pesos para terminar la cadena
    
.code     : ;indica el segmento del codigo  

    inicio:    ;indica el nombre de la etiqueta seguido de;
    
    mov ax,@data ;registro ax 16 bits @data es una constante que sirve para regresar la panatlla o recibir datos de entrada salida     
    lea dx, mensaje ;mover mensaje a dx, lea trabaja con registro dx     
                                                                        
                                                                        ;ds contiene todas las constantes definidas de ensamblador
    
    mov ah,9h   ;instruccion para imprimir pantalla   
    int 21h  
             
    end inicio                  
    

