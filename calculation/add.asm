; ------------------------
; 符号なし16bit + 符号なし16bit = 符号なし16bitの足し算
; @param memMapAdd16LeftOpe 符号なし16bit
; @param memMapAdd16RightOpe 符号なし16bit
; @return 結果:memMapAdd16ResultUpper, memMapAdd16ResultLower
; ------------------------
unsAdd16 .MACRO
    ; 初期化
    ldx #0
    lda #0
    sta <memMapAdd16ResultUpper
    sta <memMapAdd16ResultLower
    ; ループの初期化
.CALCULATION_LOOP\@:
    lda #1
    sta <memMapAdd16Temp1
.BIT_SHIFT_LOOP\@:
    ; memMapAdd16Temp2 = left & memMapAdd16Temp1
    lda <memMapAdd16LeftOpeLower, X
    and <memMapAdd16Temp1
    sta <memMapAdd16Temp2
    ; memMapAdd16Temp3 = right & memMapAdd16Temp1
    lda <memMapAdd16RightOpeLower, X
    and <memMapAdd16Temp1
    sta <memMapAdd16Temp3
    ; A = memMapAdd16Temp2 & memMapAdd16Temp3
    and <memMapAdd16Temp2
    beq .BIT_AND_ZERO\@
.ADD_CARRY_BIT\@:
    ; どちらも1なので桁上がり
    ; A = memMapAdd16Temp1 << 1
    lda <memMapAdd16Temp1
    asl A
    ; キャリーしてしまった
    bcs .TEMP1_ASL_CARRY_ON\@
.ADD_BIT\@:
    ; memMapAdd16Result |= A
    ora <memMapAdd16ResultLower, X
    sta <memMapAdd16ResultLower, X
    jmp .TEMP1_BIT_SHIFT\@
.BIT_AND_ZERO\@:
    ; A = memMapAdd16Temp2 | memMapAdd16Temp3
    lda <memMapAdd16Temp2
    ora <memMapAdd16Temp3
    ; 両方とも0なので次のステップへ
    beq .TEMP1_BIT_SHIFT\@
    ; どちらかが1なので1を加算する
    ; A = memMapAdd16Result & memMapAdd16Temp1
    lda <memMapAdd16ResultLower, X
    and <memMapAdd16Temp1
    ; すでに1が存在するので桁上がりで追加へ
    bne .ADD_CARRY_BIT\@
    ; 桁上がりではない形で追加へ
    lda <memMapAdd16Temp1
    jmp .ADD_BIT\@
.TEMP1_ASL_CARRY_ON\@:
    ; if A != 0
    txa
    ; TODO: 上位バイトならば無視しちゃう？
    bne .TEMP1_BIT_SHIFT\@
    ; 上位バイトに1を設定する
    lda #1
    sta <memMapAdd16ResultUpper
.TEMP1_BIT_SHIFT\@:
    ; temp1 <<= 1
    lda <memMapAdd16Temp1
    ; キャリーフラグが立ってないので次のビットへ
    bcc .BIT_SHIFT_LOOP\@
    ; X++
    inx
    ; 2ならば終了する
    txa
    cmp 2
    beq .UNS_ADD16_FINISH\@
    jmp .CALCULATION_LOOP\@
.UNS_ADD16_FINISH\@:
    .ENDM

; ------------------------
; サブルーチン版 符号なし16bitの足し算
; ------------------------
subUnsAdd16 .MACRO
funcUnsAdd16:
    unsAdd16
    rts
    .ENDM
