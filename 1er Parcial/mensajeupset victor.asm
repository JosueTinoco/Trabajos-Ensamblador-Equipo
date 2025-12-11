.model small ; Declara el uso del modelo de memoria 'small'.
             ; Este es uno de los modelos más sencillos y comunes,
             ; significa que el código y los datos no ocupan más
             ; de 64 KB cada uno (un segmento).
.stack       ; Define el segmento de la pila (stack). El stack se usa
             ; para almacenar direcciones de retorno de subrutinas y
             ; datos temporales.
.data        ; Inicia el segmento de datos. Aquí se declaran todas
             ; las variables y cadenas de texto.
    mensaje db 13,10, 'hola mundo $' 
             ; Declara una variable llamada 'mensaje'.
             ; 'db' (Define Byte) indica que se almacenará como una
             ; secuencia de bytes.
             ; 13: Código ASCII para Retorno de Carro (CR).
             ; 10: Código ASCII para Salto de Línea (LF).
             ; Estos dos aseguran que el mensaje empiece en una nueva línea.
             ; 'hola mundo ': El texto del mensaje.
             ; '$': Es el delimitador de fin de cadena que necesita
             ; la función de impresión de DOS (interrupción 21h, función 09h).
    mensaje2 db 13,10, 'Victor$' 
             ; Segunda cadena de texto, también con CR y LF para nueva línea.
    mensaje3 db 13,10, 'Hola$' 
             ; Tercera cadena de texto, también con CR y LF para nueva línea.

.code        ; Inicia el segmento de código. Aquí es donde se escriben
             ; las instrucciones que ejecutará el programa.

    inicio:  ; Es una etiqueta que marca el punto de inicio del
             ; programa. El programa comenzará la ejecucion en esta linea.

    mov ax,@data ; Mueve la dirección de inicio del segmento de datos
                 ; (@data) al registro AX. El registro AX se usa como
                 ; intermediario.
    mov ds, ax   ; Mueve el contenido de AX a DS (Registro de Segmento de Datos).
                 ; Esto es crucial: le indica al procesador dónde
                 ; encontrar las variables declaradas en el segmento `.data`.
                 
; --- Impresión de 'hola mundo $' ---
    lea dx, mensaje ; Carga la Dirección Efectiva (Offset) de la variable
                    ; 'mensaje' en el registro DX. DX ahora apunta al texto
                    ; que queremos imprimir.
    mov ah, 9h      ; Carga el valor 09h (hexadecimal) en el registro AH.
                    ; 09h es el código de la función del DOS para
                    ; "Imprimir una cadena terminada en '$'".
    int 21h         ; Llama a la Interrupción de software 21h (Interrupción de DOS).
                    ; Esta interrupción ejecuta la función especificada en AH
                    ; (imprimir cadena) usando la dirección de la cadena en DX.
                    
; --- Impresión de 'Victor$' ---
    lea dx, mensaje2 ; Carga la Dirección Efectiva (Offset) de 'mensaje2'
                     ; en el registro DX. Ahora apunta a "Victor$".
    mov ah,9h        ; Vuelve a cargar la funcion 09h (Imprimir cadena)
                     ; en AH. (Técnicamente, ya estaba cargada, pero
                     ; se repite para claridad/seguridad).
    int 21h          ; Ejecuta la interrupcion 21h para imprimir "Victor$".
    
; --- Impresión de 'Hola$' ---
    lea dx,mensaje3  ; Carga la Direccion Efectiva (Offset) de 'mensaje3'
                     ; en el registro DX. Ahora apunta a "Hola$".
    mov ah,9h        ; Vuelve a cargar la funcion 09h (Imprimir cadena)
                     ; en AH.
    int 21h          ; Ejecuta la interrupción 21h para imprimir "Hola$".

; --- Terminación del Programa ---
    mov ah, 4ch      ; Carga el valor 4Ch en AH.
                     ; 4Ch es el codigo de la funcion del DOS para
                     ; "Terminar el programa y regresar al DOS".
    int 21h          ; Ejecuta la interrupcion 21h, finalizando el programa.

    end inicio       ; Indica al ensamblador dónde termina el codigo fuente
                     ; y le recuerda cuál es la etiqueta de inicio.            
    

