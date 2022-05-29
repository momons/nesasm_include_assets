; ------------------------
; コントローラの状態を検出する
; ------------------------

; メモリマップ
memMapKeypadP1 = $4016
memMapKeypadP2 = $4017

; キーの状態
keypadA = %10000000
keypadB = %01000000
keypadSelect = %00100000
keypadStart = %00010000
keypadUp = %00001000
keypadDown = %00000100
keypadLeft = %00000010
keypadRight = %00000001

; コントローラの状態を取得する
; @param 1 memMapKeypadP1 or memMapKeypadP2
; @return 状態をyレジスタに登録する
getKeypad .MACRO
    ; 読み取りのための前準備
    lda #$01
    sta \1
    lda #$00
    sta \1
    ; Aボタン
    ldy #0
    lda \1
    and #$01
    beq .SKIP_PUSH_A\@
    ; Aボタンを押した時の処理
    tya
    ora #keypadA
    tay
.SKIP_PUSH_A\@:
    ; Bボタン
    lda \1
    and #$01
    beq .SKIP_PUSH_B\@
    ; Bボタンを押した時の処理
    tya
    ora #keypadB
    tay
.SKIP_PUSH_B\@:
    ; SELECTボタン
    lda \1
    and #$01
    beq  .SKIP_PUSH_SELECT\@
    ; SELECTボタンを押した時の処理
    tya
    ora #keypadSelect
    tay
.SKIP_PUSH_SELECT\@:
    ; STARTボタン
    lda \1
    and #$01
    beq .SKIP_PUSH_START\@
    ; STARTボタンを押した時の処理
    tya
    ora #keypadStart
    tay
.SKIP_PUSH_START\@:
    ; 上ボタン
    lda \1
    and #$01
    beq .SKIP_PUSH_UP\@
    ; 上ボタンを押した時の処理
    tya
    ora #keypadUp
    tay
.SKIP_PUSH_UP\@:
    ; 下ボタン
    lda \1
    and #$01
    beq .SKIP_PUSH_DOWN\@
    ; 下ボタンを押した時の処理
    tya
    ora #keypadDown
    tay
.SKIP_PUSH_DOWN\@:
    ; LEFTボタン
    lda \1
    and #$01
    beq .SKIP_PUSH_LEFT\@
    ; 左ボタンを押した時の処理
    tya
    ora #keypadLeft
    tay
.SKIP_PUSH_LEFT\@:
    ; 右ボタン
    lda \1
    and #$01
    beq .SKIP_PUSH_RIGHT\@
    ; 右ボタンを押した時の処理
    tya
    ora #keypadRight
    tay
.SKIP_PUSH_RIGHT\@:
    .ENDM
