; ------------------------
; スプライトRAM (OAM) への入出力を行うI/Oポート
; ------------------------

; メモリマップ
memMapSpAdd = $2003 ; OAMアクセス先指定
memMapSpAccess = $2004 ; OAM入出力

; スプライトオプション
; 垂直反転(1で反転)
spOptVerticalMirror = %10000000
; 水平反転(1で反転)
spOptHorizontalMirror = %01000000
; BGとの優先順位(0:手前、1:奥)
spOptBgBackward = %00100000
; パレットの上位2bit
spOptPalletNo0 = %00000000
spOptPalletNo1 = %00000001
spOptPalletNo2 = %00000010
spOptPalletNo3 = %00000011

; 画面の表示位置を指定
; @param 1 スプライトNo
; @param 2 X座標
; @param 3 Y座標
; @param 4 オプション
drawSprite .MACRO
    lda \3
    sta memMapSpAccess
    lda \1
    sta memMapSpAccess
    lda \4
    sta memMapSpAccess
    lda \2
    sta memMapSpAccess
    .ENDM


