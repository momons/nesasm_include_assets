; ------------------------
; 掛け算、サブルーチン
; @param 1 左オペランド 8bit
; @param 2 右オペランド 8bit
; ------------------------
mul16 .MACRO
    ; 結果領域を初期化
    lda #0
    sta .resultUpper\@
    sta .resultLower\@
    ; 作業用領域を初期化
    sta .tempUpper\@
    lda \1
    sta .tempLower\@
    ; 右オペランド領域にセット
    lda \2
    sta .rightOperand\@
    ; 8bit分ループする
    ldx #8
.CALCULATION_LOOP\@:
    ; 右オペランドを右シフト
    clc
    lsr .rightOperand\@
    bcc .RIGHT_SHIFT_CURRY_OFF\@
    ; キャリーフラグがONならば
    clc
    ; 上位バイト同士を加算(オーバーフローフラグは見ない)
    lda .tempUpper\@
    adc .resultUpper\@
    sta .resultUpper\@
    ; 下位バイト同士を加算
    clv
    lda .tempLower\@
    adc .resultLower\@
    sta .resultLower\@
    bvc .RIGHT_SHIFT_CURRY_OFF\@
    ; オーバーフローフラグがONならば、上位バイトに1加算する
    inc .resultUpper\@
.RIGHT_SHIFT_CURRY_OFF\@:
    ; カウント減算
    dex
    beq .FINISH_MUL16\@
    ; 左シフト
    asl .tempUpper\@
    clc
    asl .tempLower\@
    bcc .LEFT_SHIFT_CURRY_OFF\@
    ; アッパーバイトをインクリメント
    inc .tempUpper\@
.LEFT_SHIFT_CURRY_OFF\@:
    jmp .CALCULATION_LOOP\@

    ;作業メモリ領域
.rightOperand\@: .DB #0
.resultUpper\@: .DB #0
.resultLower\@: .DB #0
.tempUpper\@: .DB #0
.tempLower\@: .DB #0

.FINISH_MUL16\@:
    lda .resultUpper\@
    tax
    lda .resultLower\@
    tay
    .ENDM
