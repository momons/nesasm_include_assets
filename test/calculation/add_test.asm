; ==============================================
; テスト 符号なし8bitの足し算
; 正解:キャリーオン、不正解:キャリーオフ
; @param 1 左オペランド
; @param 2 右オペランド
; ==============================================
testUnsAdd8 .MACRO
    lda #\1
    sta <unsAdd8LeftOpe
    lda #\2
    sta <unsAdd8RightOpe
    jsr funcUnsAdd8

    ; 答え合わせ
    lda <unsAdd8ResultLow
    cmp #((\1 + \2) & $ff)
    bne .CARRY_OFF\@
    lda <unsAdd8ResultUp
    cmp #((\1 + \2) / $100 & $ff)
    beq .CARRY_ON\@
.CARRY_OFF\@:
    clc
    jmp .TEST_FINISH\@
.CARRY_ON\@:
    sec
.TEST_FINISH\@:
    .ENDM

; ==============================================
; テスト 符号なし16bitの足し算
; 正解:キャリーオン、不正解:キャリーオフ
; @param 1 左オペランド
; @param 2 右オペランド
; ==============================================
testUnsAdd16 .MACRO
    lda #(\1 / $100)
    sta <unsAdd16LeftOpeUp
    lda #(\1 & $ff)
    sta <unsAdd16LeftOpeLow
    lda #(\2 / $100)
    sta <unsAdd16RightOpeUp
    lda #(\2 & $ff)
    sta <unsAdd16RightOpeLow
    jsr funcUnsAdd16

    ; 答え合わせ
    lda <unsAdd16ResultLow
    cmp #((\1 + \2) & $ff)
    bne .CARRY_OFF\@
    lda <unsAdd16ResultUp
    cmp #((\1 + \2) / $100 & $ff)
    beq .CARRY_ON\@
.CARRY_OFF\@:
    clc
    jmp .TEST_FINISH\@
.CARRY_ON\@:
    sec
.TEST_FINISH\@:
    .ENDM
