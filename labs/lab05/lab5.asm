; lab5.asm

SECTION .data				   ; Начало секции данных
    lab5:      DB 'Ekaterina Kaneva',10    ; 'Ekaterina Kaneva' плюс
    					   ; символ перевода строки
    lab5Len:   EQU $-lab5                  ; Длина строки lab5
    
SECTION .text		; Начало секции кода
    GLOBAL_start           

_start:   		; Точка входа в программу              
    mov eax,4		; Системный вызов для записи (sys_write)
    mov ebx,1		; Описатель файла '1' - стандартный вывод
    mov ecx,lab5	; Адрес строки lab5 в ecx
    mov edx,lab5Len	; Размер строки lab5
    int 0x80		; Вызов ядра
  
    mov eax,1		; Системный вызов для выхода (sys_exit)
    mov ebx,0		; Выход с кодом возврата '0' (без ошибок)
    int 0x80		; Вызов ядра
