; ==============================================
; テスト 符号なし8bitの掛け算
; 正解:キャリーオン、不正解:キャリーオフ
; @param 1 左オペランド
; @param 2 右オペランド
; ==============================================
testUnsMul8 .MACRO
    lda #\1
    sta <unsMul8LeftOpe
    lda #\2
    sta <unsMul8RightOpe
    jsr funcUnsMul8

    ; 答え合わせ
    lda <unsMul8Result
    cmp #((\1 * \2) & $ff)
    beq .CARRY_ON\@
    clc
    jmp .TEST_FINISH\@
.CARRY_ON\@:
    sec
.TEST_FINISH\@:
    .ENDM

; ==============================================
; テスト 符号なし16bitの掛け算
; 正解:キャリーオン、不正解:キャリーオフ
; @param 1 左オペランド
; @param 2 右オペランド
; ==============================================
testUnsMul16 .MACRO
    lda #\1
    sta <unsMul16LeftOpe
    lda #\2
    sta <unsMul16RightOpe
    jsr funcUnsMul16

    ; 答え合わせ
    lda <unsMul16ResultLow
    cmp #((\1 * \2) & $ff)
    bne .CARRY_OFF\@
    lda <unsMul16ResultUp
    cmp #((\1 * \2) / $100 & $ff)
    beq .CARRY_ON\@
.CARRY_OFF\@:
    clc
    jmp .TEST_FINISH\@
.CARRY_ON\@:
    sec
.TEST_FINISH\@:
    .ENDM