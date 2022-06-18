; ------------------------
; 符号なし8bit x 符号なし8bit = 符号なし8bitの掛け算
; @param unsMul8LeftOpe 符号なし8bit
; @param unsMul8RightOpe 符号なし8bit
; @return 結果:unsMul8Result
; ------------------------
unsMul8LeftOpe = $01
unsMul8RightOpe = $02
unsMul8Result = $03
unsMul8LeftTemp = $04
unsMul8RightTemp = $05
unsMul8 .MACRO
    ; 結果領域を初期化
    lda #0
    sta <unsMul8Result
    ; 作業用領域を初期化
    lda <unsMul8LeftOpe
    sta <unsMul8LeftTemp
    ; 右オペランド領域にセット
    lda <unsMul8RightOpe
    sta <unsMul8RightTemp
    ; 8bit分ループする
    ldx #8
.CALCULATION_LOOP\@:
    ; 右オペランドを右シフト
    clc
    lsr <unsMul8RightTemp
    bcc .RIGHT_SHIFT_CURRY_OFF\@
    ; キャリーフラグがONならば
    clc
    ; 結果に加算
    lda <unsMul8LeftTemp
    adc <unsMul8Result
    sta <unsMul8Result
.RIGHT_SHIFT_CURRY_OFF\@:
    ; カウント減算
    dex
    beq .FINISH_MUL8\@
    ; 左シフト
    asl <unsMul8LeftTemp
    jmp .CALCULATION_LOOP\@
.FINISH_MUL8\@:
    .ENDM

; ------------------------
; サブルーチン版 8bit掛け算
; ------------------------
subUnsMul8 .MACRO
funcUnsMul8:
    unsMul8
    rts
    .ENDM

; ------------------------
; 符号なし8bit x 符号なし8bit = 符号なし16bitの掛け算
; @param unsMul16LeftOpe 符号なし8bit
; @param unsMul16RightOpe 符号なし8bit
; @return 結果上位8bit:unsMul16ResultUpper
;         結果下位8bit:unsMul16ResultLower
; ------------------------
unsMul16LeftOpe = $01
unsMul16RightOpe = $02
unsMul16ResultUp = $03
unsMul16ResultLow = $04
unsMul16LeftTempUp = $05
unsMul16LeftTempLow = $06
unsMul16RightTemp = $07
unsMul16 .MACRO
    ; 結果領域を初期化
    lda #0
    sta <unsMul16ResultUp
    sta <unsMul16ResultLow
    ; 作業用領域を初期化
    sta <unsMul16LeftTempUp
    lda <unsMul16LeftOpe
    sta <unsMul16LeftTempLow
    ; 右オペランド領域にセット
    lda <unsMul16RightOpe
    sta <unsMul16RightTemp
    ; 8bit分ループする
    ldx #8
.CALCULATION_LOOP\@:
    ; 右オペランドを右シフト
    clc
    lsr <unsMul16RightTemp
    bcc .RIGHT_SHIFT_CURRY_OFF\@
    ; キャリーフラグがONならば
    clc
    ; 上位バイト同士を加算
    lda <unsMul16LeftTempUp
    adc <unsMul16ResultUp
    sta <unsMul16ResultUp
    ; 下位バイト同士を加算
    clv
    lda <unsMul16LeftTempLow
    adc <unsMul16ResultLow
    sta <unsMul16ResultLow
    bvc .RIGHT_SHIFT_CURRY_OFF\@
    ; オーバーフローフラグがONならば、上位バイトに1加算する
    inc <unsMul16ResultUp
.RIGHT_SHIFT_CURRY_OFF\@:
    ; カウント減算
    dex
    beq .FINISH_MUL16\@
    ; 左シフト
    asl <unsMul16LeftTempUp
    clc
    asl <unsMul16LeftTempLow
    bcc .LEFT_SHIFT_CURRY_OFF\@
    ; アッパーバイトをインクリメント
    inc <unsMul16LeftTempUp
.LEFT_SHIFT_CURRY_OFF\@:
    jmp .CALCULATION_LOOP\@
.FINISH_MUL16\@:
    .ENDM

; ------------------------
; サブルーチン版 16bit掛け算
; ------------------------
subUnsMul16 .MACRO
funcUnsMul16:
    unsMul16
    rts
    .ENDM
