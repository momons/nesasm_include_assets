; ------------------------
; 8bit ÷ 8bit = 8bitの割り算 ... 余り
; @param div8LeftOpe 符号なし8bit
; @param div8RightOpe 符号なし8bit
; @return 結果:div8Result
;         余り:div8Remainder
; ------------------------
div8LeftOpe = $01
div8RightOpe = $02
div8Result = $03
div8Remainder = $04
div8LeftTemp = $05
div8RightTemp = $06
div8Temp = $07
div8 .MACRO
    ; 結果領域を初期化
    lda #0
    sta <div8Result
    sta <div8Remainder
    ; 左オペランド領域にセット
    lda <div8LeftOpe
    sta <div8LeftTemp
    ; ゼロ除算はやめて
    lda <div8RightOpe
    beq .FINISH_DIV8\@
.CALCULATION_LOOP\@:
    ; 計算の初期化
    lda #1
    sta <div8Temp
    lda <div8RightOpe
    sta <div8RightTemp
    ; left < rightになるまでループ
.CMP_GREATER_EQUAL_LOOP\@:
    ; left < right
    sec
    lda <div8LeftTemp
    cmp <div8RightTemp
    bcc .CMP_LESSER_FINISH\@
    ; 左へビットシフト
    asl <div8Temp
    asl <div8RightTemp
    jmp .CMP_GREATER_EQUAL_LOOP\@
.CMP_LESSER_FINISH\@:
    ; 一回もループしてなかったら終了
    lda <div8Temp
    cmp #1
    beq .FINISH_DIV8\@
    ; 右へビットシフトして値を1個前に戻す
    lsr <div8Temp
    lsr <div8RightTemp
    ; 結果にシフトした分を加算 result += temp
    clc
    lda <div8Result
    adc <div8Temp
    sta <div8Result
    ; 割り算した分を減算 left -= right
    sec
    lda <div8LeftTemp
    sbc <div8RightTemp
    sta <div8LeftTemp
    jmp .CALCULATION_LOOP\@
.FINISH_DIV8\@:
    ; 計算が終了したので余りを設定
    lda <div8LeftTemp
    sta <div8Remainder
    .ENDM

; ------------------------
; サブルーチン版 8bit割り算
; ------------------------
subDiv8 .MACRO
funcDiv8:
    div8
    rts
    .ENDM
