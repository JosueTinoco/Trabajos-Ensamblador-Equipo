.model small
.stack ;Reserva un segmento de memoria para la pila (stack). El tamaño por defecto es usualmente 1KB.
.data  ;Inicia el segmento donde se definen las variables y constantes.

    mnsj1 db 13,10, 'el valor de la resistencia supero el limite, cambiar resistencia$'
    mensj2 db 13,10, 'el valor de la resistencia se encuentra  dentro del limite$' ;Define una segunda cadena de bytes con el mismo formato.

.code ;Inicia el segmento donde se encuentra el código ejecutable.
    inicio:  ;Punto de inicio de la ejecución del programa.
       mov ax, @data ;Carga la dirección del segmento de datos (@data) en el registro AX.
       mov ds, ax ;Mueve el valor de AX al registro de segmento de datos
       
       mov ax, 14h  ;20 Carga el valor $14$ (20 en decimal) en el registro AX. Este puede representar el valor límite.
       mov bx, 16h   ;7  Carga el valor $16$ (22 en decimal) en el registro BX. Este puede representar el valor actual de la resistencia.
       
       cmp ax,bx ;Compara el valor en AX con el valor en BX. Esta instrucción establece las banderas de estado (ZF, CF, SF, etc.)
       jge mayorigual  ;Salta a la etiqueta mayorigual si el valor en AX es Mayor o Igual al valor en BX.
       jl esmenor ;Salta a la etiqueta esmenor si el valor en AX es Menor que el valor en BX.
       
       mayorigual:   ;Rutina que se ejecuta si AX > BX.
       lea dx, mnsj1  ;arga la dirección de memoria de la variable mnsj1 en el registro DX
       call imprimir  ;Llama a la subrutina imprimir para mostrar el Mensaje 1.
       jmp finalizar  ;Salta a la etiqueta finalizar para terminar el programa, evitando la ejecución del código de esmenor.
       
       esmenor:  ;Rutina que se ejecuta si AX < BX.
       lea dx,mensj2 ;Carga la dirección de memoria de la variable mnsj2 en el registro DX.
       call imprimir  ;Llama a la subrutina imprimir para mostrar el Mensaje 2.
       jmp finalizar  ;Salta a la etiqueta finalizar.
       
       imprimir:  ;Subrutina de Impresión de Cadena de Caracteres.
       mov ah,9h  ;Carga el valor $09\text{h}$ en el registro AH. Este código selecciona la función Display String
       int 21h    ;Llama a la Interrupción $21\text{h}$ 
       ret         ;Vuelve al punto del código que llamó a la subrutina
       
       finalizar:   ;Punto de terminación del programa.
       mov ah, 4ch  ;Carga el valor 4Ch en AH. Este código selecciona la función Terminate Programa 
       int 21h  ;Llama a la Interrupción $21\text{h}$ para devolver el control al sistema operativo



end inicio