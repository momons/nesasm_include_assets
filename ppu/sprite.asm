; ==============================================
; スプライトRAM (OAM) への入出力を行うI/Oポート
; ==============================================

; スプライトオプション
; 垂直反転(1で反転)
spOptVerticalMirror = %10000000
; 水平反転(1で反転)
spOptHorizontalMirror = %01000000
; BGとの優先順位(0:手前、1:奥)
spOptBgBackward = %00100000
; パレットの上位2bit
spOptPalletNo0 = %00000000 ; No.0〜3
spOptPalletNo1 = %00000001 ; No.4〜7
spOptPalletNo2 = %00000010 ; No.8〜11
spOptPalletNo3 = %00000011 ; No.12〜15

; ==============================================
; スプライトを表示する
; @param 1 スプライトNo
; @param 2 X座標
; @param 3 Y座標
; @param 4 オプション
; ==============================================
drawSp .MACRO
    lda \3
    sta memMapOamData
    lda \1
    sta memMapOamData
    lda \4
    sta memMapOamData
    lda \2
    sta memMapOamData
    .ENDM
