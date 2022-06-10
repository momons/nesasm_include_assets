; ------------------------
; 符号なし8bit x 符号なし8bit = 符号なし8bitの掛け算
; @param memMapMul8LeftOpe 符号なし8bit
; @param memMapMul8RightOpe 符号なし8bit
; @return 結果:memMapMul8Result
; ------------------------
mul8 .MACRO
    ; 結果領域を初期化
    lda #0
    sta <memMapMul8Result
    ; 作業用領域を初期化
    lda <memMapMul8LeftOpe
    sta <memMapMul8LeftTemp
    ; 右オペランド領域にセット
    lda <memMapMul8RightOpe
    sta <memMapMul8RightTemp
    ; 8bit分ループする
    ldx #8
.CALCULATION_LOOP\@:
    ; 右オペランドを右シフト
    clc
    lsr <memMapMul8RightTemp
    bcc .RIGHT_SHIFT_CURRY_OFF\@
    ; キャリーフラグがONならば
    clc
    ; 上位バイト同士を加算
    lda <memMapMul8Temp
    adc <memMapMul8Result
    sta <memMapMul8Result
.RIGHT_SHIFT_CURRY_OFF\@:
    ; カウント減算
    dex
    beq .FINISH_MUL8\@
    ; 左シフト
    asl <memMapMul8Temp
.LEFT_SHIFT_CURRY_OFF\@:
    jmp .CALCULATION_LOOP\@
.FINISH_MUL8\@:
    .ENDM

; ------------------------
; サブルーチン版 8bit掛け算
; ------------------------
funcMul8 .MACRO
    mul8
    rts
    .ENDM

; ------------------------
; 符号なし8bit x 符号なし8bit = 符号なし16bitの掛け算
; @param memMapMul16LeftOpe 符号なし8bit
; @param memMapMul16RightOpe 符号なし8bit
; @return 結果上位8バイト:memMapMul16ResultUpper
;         結果下位8バイト:memMapMul16ResultLower
; ------------------------
mul16 .MACRO
    ; 結果領域を初期化
    lda #0
    sta <memMapMul16ResultUpper
    sta <memMapMul16ResultLower
    ; 作業用領域を初期化
    sta <memMapMul16LeftTempUpper
    lda <memMapMul16LeftOpe
    sta <memMapMul16LeftTempLower
    ; 右オペランド領域にセット
    lda <memMapMul16RightOpe
    sta <memMapMul16RightTemp
    ; 8bit分ループする
    ldx #8
.CALCULATION_LOOP\@:
    ; 右オペランドを右シフト
    clc
    lsr <memMapMul16RightTemp
    bcc .RIGHT_SHIFT_CURRY_OFF\@
    ; キャリーフラグがONならば
    clc
    ; 上位バイト同士を加算
    lda <memMapMul16LeftTempUpper
    adc <memMapMul16ResultUpper
    sta <memMapMul16ResultUpper
    ; 下位バイト同士を加算
    clv
    lda <memMapMul16LeftTempLower
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
    asl <memMapMul16LeftTempUpper
    clc
    asl <memMapMul16LeftTempLower
    bcc .LEFT_SHIFT_CURRY_OFF\@
    ; アッパーバイトをインクリメント
    inc <memMapMul16LeftTempUpper
.LEFT_SHIFT_CURRY_OFF\@:
    jmp .CALCULATION_LOOP\@
.FINISH_MUL16\@:
    .ENDM

; ------------------------
; サブルーチン版 16bit掛け算
; ------------------------
funcMul16 .MACRO
    mul16
    rts
    .ENDM