#start=led_display.exe# ; inidica al simulador que se usar el display

#make_bin#  ;Genera el archivo binario

name "led" ;nombre del programa

mov ax, 1234  ;carga el valor 1234 en AX, son los datos que se enviaran
out 199, ax   ;envia el contenido de AX al puerto 199

mov ax, 5678     ;carga el valor 5678 en AX, es el nuevo dato
out 199, ax      ; envia el contenido al puerto 199 otra vez