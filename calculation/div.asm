; ------------------------
; 符号なし8bit ÷ 符号なし8bit = 符号なし8bitの割り算 ... 余り
; @param memMapDiv8LeftOpe 符号なし8bit
; @param memMapDiv8RightOpe 符号なし8bit
; @return 結果:memMapDiv8Result
;         余り:memMapDiv8Remainder
; ------------------------
div8 .MACRO
    ; 結果領域を初期化
    lda #0
    sta <memMapDiv8Result
    sta <memMapDiv8Remainder
    ; 左オペランド領域にセット
    lda <memMapDiv8LeftOpe
    sta <memMapDiv8LeftTemp
    ; ゼロ除算はやめて
    lda <memMapDiv8RightOpe
    beq .FINISH_DIV8\@
.CALCULATION_LOOP\@:
    ; 計算の初期化
    lda #1
    sta <memMapDiv8Temp
    lda <memMapDiv8RightOpe
    sta <memMapDiv8RightTemp
    ; left < rightになるまでループ
.CMP_GREATER_EQUAL_LOOP\@:
    ; left < right
    sec
    lda <memMapDiv8LeftTemp
    cmp <memMapDiv8RightTemp
    bcc .CMP_LESSER_FINISH\@
    ; 左へビットシフト
    asl <memMapDiv8Temp
    asl <memMapDiv8RightTemp
    jmp .CMP_GREATER_EQUAL_LOOP\@
.CMP_LESSER_FINISH\@:
    ; 一回もループしてなかったら終了
    lda <memMapDiv8Temp
    cmp #1
    beq .FINISH_DIV8\@
    ; 右へビットシフトして値を1個前に戻す
    lsr <memMapDiv8Temp
    lsr <memMapDiv8RightTemp
    ; 結果にシフトした分を加算 result += temp
    clc
    lda <memMapDiv8Result
    adc <memMapDiv8Temp
    sta <memMapDiv8Result
    ; 割り算した分を減算 left -= right
    sec
    lda <memMapDiv8LeftTemp
    sbc <memMapDiv8RightTemp
    sta <memMapDiv8LeftTemp
    jmp .CALCULATION_LOOP\@
.FINISH_DIV8\@:
    ; 計算が終了したので余りを設定
    lda <memMapDiv8LeftTemp
    sta <memMapDiv8Remainder
    .ENDM

; ------------------------
; サブルーチン版 8bit割り算
; ------------------------
subDiv8 .MACRO
funcDiv8:
    div8
    rts
    .ENDM
