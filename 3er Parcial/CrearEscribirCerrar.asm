.model small ;Define el tamano de modelo a realizar
.stack 100h  ;Reservva un espacio en pila de 256 bytes (100h)
.data        ;Segmento de datos
    archivo db "archivoprueba.txt", 0   ;Espacio para el contenido del archivo
    mensaje db "Hola desde ensamblador!",0Dh,0Ah ;Mensaje a mostrar
    long_msj equ $ - mensaje  ;Calcula la liongitud del mensaje
    
    contenido db 200 dup(0)    ;Numero de bytes leidos
    handle dw ?               ;Variable para guardar el handle
    
    msgMostrar db 0Dh,0Ah, "Contenido del archivo:",0Dh,0Ah,"$" ;Este mensaje para mostrar antes de leer 09h
.code       ;Segmento de codigo
    main proc          ;Inicio del procedimiento principal
    mov ax,@data       ;Carga la direccion base del segmento de datos en AX.
    mov ds,ax          ;Mueve esa dirección al registro DS
    
    ;Crear archivo
    mov ah,3Ch         ; Funcion DOS 3Ch: Crear un archivo
    mov cx, 0          ;Modo de lectura
    mov dx, offset archivo  ;Carga en DX la direccion de memoria donde esta el nombre del archivo.   
    int 21h            ;Ejecuta interrupcion 21h
    jc error           ;Salta si CF=1 hubo error
    mov handle,ax      ;Actualiza el handle (identificador) en la variable.
    
    ;Abrir Archivo
    mov ah, 3Dh        ;Funcion DOS 3Dh: Abrir archivo existente.
    mov al, 1          ;Escritura
    mov dx, offset archivo ;Direccion del nombre del archivo.
    int 21h            ;Interrupcion 21h
    jc error           ;Salta si hay error
    mov handle,ax      ;Actualiza el handle (identificador) en la variable.
    
    ;Escribir Texto
    mov ah,40h         ;Funcion DOS 40h: Escribir en archivo o dispositivo.
    mov bx, handle     ;Carga en BX el identificador del archivo donde vamos a escribir.
    mov cx, long_msj   ;Carga en CX la cantidad de bytes (caracteres) que vamos a escribir.
    mov dx, offset mensaje ;Carga en DX la direccion del texto
    int 21h            ;Interrupcion 21h
    
    ;Cerrar
    mov ah,3Eh         ;Funcion DOS 3Eh: Cerrar archivo.
    mov bx,handle      ;Indica en BX que archivo cerrar.
    int 21h            ;Interrupcion 21h
    
    ;Mostrar mensaje "Contenido del Archivo"
    mov ah,09h         ;Funcion DOS 09h: Imprimir cadena.
    mov dx, offset msgMostrar  ;Apunta al buffer que ahora tiene el texto + '$'.
    int 21h            ;Interrupcion 21h
    
    ;Abrir para Lectura
    mov ah,3Dh         ;Funcion DOS 3Dh: Abrir archivo.
    mov al,0           ;Modo de acceso: 0 = Solo lectura (Read-only).
    mov dx, offset archivo ;Nombre del archivo.
    int 21h            ;Interrupcion 21h
    jc error           ;Salta si hay error
    mov handle, ax     ;Guarda el handle para lectura.
    
    ;Leer Archivo
    mov ah,3Fh         ;Funcion DOS 3Fh: Leer de un archivo.
    mov bx,handle      ;Handle del archivo en BX.
    mov cx,200         ;Cantidad máxima de bytes a leer (tamaño de nuestro buffer).
    mov dx, offset contenido ;Direccion del buffer donde se guardarán los datos leidos.
    int 21h            ;Interrupcion 21h
    jc error           ;Salta si hay error
    
    ;Ax = bytes leidos 7 agregar '$' para imprimir
    mov di,ax      ; Mueve la cantidad de bytes leidos (AX) al registro indice DI.
    mov byte ptr contenido[di], '$' ; Coloca un signo '$' justo al final de lo leido.
    
    ;Mostrar contenido leido
    mov ah,09h     ;Funcion DOS 09h: Imprimir cadena.
    mov dx, offset contenido  ;Apunta al buffer que ahora tiene el texto + '$'.
    int 21h        ;Imprime el contenido del archivo en pantalla.
    
    ;Salir
    mov ah,3Eh     ; Cerrar el archivo de lectura.
    mov bx,handle  ; Handle en BX.
    int 21h        ; Cierra archivo.
    
    mov ax,4C00h   ; Funcion 4Ch: Terminar proceso con codigo de retorno 00h (exito).
    int 21h        ; Devuelve control al sistema operativo.
    
    error:         ; Etiqueta en caso de fallo (ej. disco lleno, archivo no encontrado).
    mov ax, 4C01h  ; Terminar proceso con codigo de error 01h.
    int 21h        ; Salir.
    
    main endp      ; Fin del procedimiento.
    end main       ; Fin del programa.