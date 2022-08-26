; Simple CPU identification program
;
; Public Domain by mail@eduardocasino.es
;

        cpu     8086

%include "exebin.mac"

        EXE_begin
        EXE_stack 512
        SECTION .text

start:  push    cs
        pop     ds

        ;
        ; in 808x and 8018x, flags 12-15 are always set.
        ; in 286, flags 12-15 are always clear in real mode.
        ; in 32-bit processors, bit 15 is always clear in real mode.
        ;                       bits 12-14 have the last value loaded into them.
        ;

        pushf                ; Save current flags
        xor     ax, ax
        push    ax
        popf                 ; Load all flags cleared
        pushf
        pop     ax           ; Load flags back to ax
        and     ax, 0xf000   ; If 86/186, flags 12-15 will be set
        cmp     ax, 0xf000
        je      return
        mov     ax, 0xf000
        push    ax
        popf                 ; Load flags 12-15 set
        pushf
        pop     ax           ; Load flags back to ax
        and     ax, 0xf000   ; If 286, flags 12-15 will be cleared
        mov     al, 2
        jz      return
        mov     al, 3

    return:
        popf

quit:   mov     ah, 0x4C     ; Exit
        int     0x21

        EXE_end
