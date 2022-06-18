; ==============================================
; テスト 8bitの割り算
; 正解:キャリーオン、不正解:キャリーオフ
; @param 1 左オペランド
; @param 2 右オペランド
; ==============================================
testDiv8 .MACRO
    lda #\1
    sta <div8LeftOpe
    lda #\2
    sta <div8RightOpe
    jsr funcDiv8

    ; 答え合わせ
    lda <div8Result
    cmp #(\1 / \2)
    bne .CARRY_OFF\@
    lda <div8Remainder
    cmp #(\1 % \2)
    beq .CARRY_ON\@
.CARRY_OFF\@:
    clc
    jmp .TEST_FINISH\@
.CARRY_ON\@:
    sec
.TEST_FINISH\@:
    .ENDM
