; ------------------------
; 8bit x 8bit = 8bitの掛け算
; @param 1 左オペランド 8bit
; @param 2 右オペランド 8bit
; @return 結果:memMapMul8Result
; ------------------------
mul8 .MACRO
    ; 結果領域を初期化
    lda #0
    sta memMapMul8Result
    ; 作業用領域を初期化
    lda \1
    sta memMapMul8Temp
    ; 右オペランド領域にセット
    lda \2
    sta memMapMul8RightOperand
    ; 8bit分ループする
    ldx #8
.CALCULATION_LOOP\@:
    ; 右オペランドを右シフト
    clc
    lsr memMapMul8RightOperand
    bcc .RIGHT_SHIFT_CURRY_OFF\@
    ; キャリーフラグがONならば
    clc
    ; 上位バイト同士を加算
    lda memMapMul8Temp
    adc memMapMul8Result
    sta memMapMul8Result
.RIGHT_SHIFT_CURRY_OFF\@:
    ; カウント減算
    dex
    beq .FINISH_MUL8\@
    ; 左シフト
    asl memMapMul8Temp
.LEFT_SHIFT_CURRY_OFF\@:
    jmp .CALCULATION_LOOP\@
.FINISH_MUL8\@:
    lda memMapMul8Result
    tax
    .ENDM

; ------------------------
; 8bit x 8bit = 16bitの掛け算
; @param 1 左オペランド 8bit
; @param 2 右オペランド 8bit
; @return 結果上位8バイト:memMapMul16ResultUpper
;         結果下位8バイト:memMapMul16ResultLower
; ------------------------
mul16 .MACRO
    ; 結果領域を初期化
    lda #0
    sta <memMapMul16ResultUpper
    sta <memMapMul16ResultLower
    ; 作業用領域を初期化
    sta <memMapMul16TempUpper
    lda \1
    sta <memMapMul16TempLower
    ; 右オペランド領域にセット
    lda \2
    sta <memMapMul16RightOperand
    ; 8bit分ループする
    ldx #8
.CALCULATION_LOOP\@:
    ; 右オペランドを右シフト
    clc
    lsr <memMapMul16RightOperand
    bcc .RIGHT_SHIFT_CURRY_OFF\@
    ; キャリーフラグがONならば
    clc
    ; 上位バイト同士を加算
    lda <memMapMul16TempUpper
    adc <memMapMul16ResultUpper
    sta <memMapMul16ResultUpper
    ; 下位バイト同士を加算
    clv
    lda <memMapMul16TempLower
    adc <memMapMul16ResultLower
    sta <memMapMul16ResultLower
    bvc .RIGHT_SHIFT_CURRY_OFF\@
    ; オーバーフローフラグがONならば、上位バイトに1加算する
    inc <memMapMul16ResultUpper
.RIGHT_SHIFT_CURRY_OFF\@:
    ; カウント減算
    dex
    beq .FINISH_MUL16\@
    ; 左シフト
    asl <memMapMul16TempUpper
    clc
    asl <memMapMul16TempLower
    bcc .LEFT_SHIFT_CURRY_OFF\@
    ; アッパーバイトをインクリメント
    inc <memMapMul16TempUpper
.LEFT_SHIFT_CURRY_OFF\@:
    jmp .CALCULATION_LOOP\@
.FINISH_MUL16\@:
    .ENDM
