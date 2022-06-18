; ==============================================
; 符号なし8bit + 符号なし8bit = 符号なし16bitの足し算
; @param memMapAdd8LeftOpe 左オペランド 符号なし8bit
; @param memMapAdd8RightOpe 右オペランド 符号なし8bit
; @return 結果上位8bit: unsAdd8ResultUp
;         結果下位8bit: unsAdd8ResultLow
; ==============================================
unsAdd8LeftOpe = $01
unsAdd8RightOpe = $02
unsAdd8ResultLow = $03
unsAdd8ResultUp = $04
unsAdd8Temp1 = $05
unsAdd8Temp2 = $06
unsAdd8 .MACRO
    ; 初期化
    lda #0
    sta <unsAdd8ResultUp
    sta <unsAdd8ResultLow
    ; 上位1bitを削りTemp領域へ
    lda <unsAdd8LeftOpe
    and #%01111111
    sta <unsAdd8Temp1
    lda <unsAdd8RightOpe
    and #%01111111
    ; unsAdd8ResultLow = A + unsAdd8Temp1
    clc
    adc <unsAdd8Temp1
    sta <unsAdd8ResultLow
    ; オーバーフローしなかったら
    bvc .ADD_OVERFLOW_SAFE\@
    ; オーバーフローしたら
    lda #1
    sta <unsAdd8Temp2
.ADD_OVERFLOW_SAFE\@:
    ; A = unsAdd8LeftOpe & $80
    lda <unsAdd8LeftOpe
    and #%10000000
    ; unsAdd8Temp1 = A <<< 1
    rol A
    sta <unsAdd8Temp1
    ; A = unsAdd8RightOpe & $80
    lda <unsAdd8RightOpe
    and #%10000000
    ; A <<<= 1
    rol A
    ; A += unsAdd8Temp1
    clc
    adc <unsAdd8Temp1
    ; A += unsAdd8Temp2
    clc
    adc <unsAdd8Temp2
    ; 結果を退避する
    sta <unsAdd8Temp1
    ; 2以上ならば結果をUpに設定
    ; if A < 2 then goto ADD_TWO_LESS_THAN
    cmp #2
    bcc .CMP_2_LESS_THAN\@
    ; unsAdd8ResultUp = 1
    lda #1
    sta <unsAdd8ResultUp
.CMP_2_LESS_THAN\@:
    ; unsAdd8Temp1 >>>= 1
    lda <unsAdd8Temp1
    ror A
    ; unsAdd8Temp1 = A & $80
    and #%10000000
    sta <unsAdd8Temp1
    ; unsAdd8ResultLow = unsAdd8ResultLow & $7f | unsAdd8Temp1
    lda <unsAdd8ResultLow
    and #%01111111
    ora <unsAdd8Temp1
    sta <unsAdd8ResultLow
.UNSADD8_FINISH\@:
    .ENDM

; ==============================================
; サブルーチン版 符号なし8bitの足し算
; ==============================================
subUnsAdd8 .MACRO
funcUnsAdd8:
    unsAdd8
    rts
    .ENDM

; ==============================================
; 符号なし16bit + 符号なし16bit = 符号なし16bitの足し算
; @param unsAdd16LeftOpeUp 左オペランド 符号なし上位8bit
; @param unsAdd16LeftOpeLow 左オペランド 符号なし下位8bit
; @param unsAdd16RightOpeUp 右オペランド 符号なし上位8bit
; @param unsAdd16RightOpeLow 右オペランド 符号なし下位8bit
; @return 結果上位8bit:unsAdd16ResultUp
;         結果下位8bit:unsAdd16ResultLow
; ==============================================
unsAdd16LeftOpeLow = $01
unsAdd16LeftOpeUp = $02
unsAdd16RightOpeLow = $03
unsAdd16RightOpeUp = $04
unsAdd16ResultLow = $05
unsAdd16ResultUp = $06
unsAdd16Temp1 = $07
unsAdd16Temp2 = $08
unsAdd16Temp3 = $09
unsAdd16 .MACRO
    ; 初期化
    lda #0
    sta <unsAdd16ResultUp
    sta <unsAdd16ResultLow
    ; ループの初期化
    ldx #0
.CALCULATION_LOOP\@:
    lda #1
    sta <unsAdd16Temp1
.BIT_SHIFT_LOOP\@:
    ; unsAdd16Temp2 = left & unsAdd16Temp1
    lda <unsAdd16LeftOpeLow, X
    and <unsAdd16Temp1
    sta <unsAdd16Temp2
    ; unsAdd16Temp3 = right & unsAdd16Temp1
    lda <unsAdd16RightOpeLow, X
    and <unsAdd16Temp1
    sta <unsAdd16Temp3
    ; A = unsAdd16Temp2 & unsAdd16Temp3
    and <unsAdd16Temp2
    ; if A == 0 then goto BIT_AND_ZERO
    beq .BIT_AND_ZERO\@
.ADD_CARRY_BIT\@:
    ; どちらも1なので桁上がり
    ; A = unsAdd16Temp1 << 1
    lda <unsAdd16Temp1
    asl A
    ; キャリーしてしまった
    bcs .TEMP1_ASL_CARRY_ON\@
.ADD_BIT\@:
    ; unsAdd16Result |= A
    ora <unsAdd16ResultLow, X
    sta <unsAdd16ResultLow, X
    jmp .TEMP1_BIT_SHIFT\@
.BIT_AND_ZERO\@:
    ; A = unsAdd16Temp2 | unsAdd16Temp3
    lda <unsAdd16Temp2
    ora <unsAdd16Temp3
    ; 両方とも0なので次のステップへ
    beq .TEMP1_BIT_SHIFT\@
    ; どちらかが1なので1を加算する
    ; A = unsAdd16Result & unsAdd16Temp1
    lda <unsAdd16ResultLow, X
    and <unsAdd16Temp1
    ; 既存Bitはゼロなのでそのまま加算へ
    beq .A_AND_TEMP1_CARRY_OFF\@
    ; どちらも1なので桁上がり
    ; 現在のBitをクリア unsAdd16Result &= ^unsAdd16Temp1
    lda <unsAdd16Temp1
    eor #%11111111
    and <unsAdd16ResultLow, X
    sta <unsAdd16ResultLow, X
    jmp .ADD_CARRY_BIT\@
.A_AND_TEMP1_CARRY_OFF\@:
    ; 桁上がりではない形で追加へ
    lda <unsAdd16Temp1
    jmp .ADD_BIT\@
.TEMP1_ASL_CARRY_ON\@:
    ; if A != 0
    txa
    ; TODO: 上位バイトならば無視しちゃう？
    bne .TEMP1_BIT_SHIFT\@
    ; 上位バイトに1を設定する
    lda #1
    sta <unsAdd16ResultUp
.TEMP1_BIT_SHIFT\@:
    ; temp1 <<= 1
    asl <unsAdd16Temp1
    ; キャリーフラグが立ってないので次のビットへ
    bcc .BIT_SHIFT_LOOP\@
    ; X++
    inx
    ; 2ならば終了する if X >= 2 then goto .UNS_ADD16_FINISH
    txa
    cmp #2
    bcs .UNS_ADD16_FINISH\@
    jmp .CALCULATION_LOOP\@
.UNS_ADD16_FINISH\@:
    .ENDM

; ==============================================
; サブルーチン版 符号なし16bitの足し算
; ==============================================
subUnsAdd16 .MACRO
funcUnsAdd16:
    unsAdd16
    rts
    .ENDM
