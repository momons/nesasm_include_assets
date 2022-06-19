; ==============================================
; 割り込み
; ==============================================

; リセット割り込み
setResetInterrupt .MACRO
    .bank bankInterrupt
    .org memMapInterrupt
    .dw 0
    .dw RESET
    .dw 0
    .ENDM
