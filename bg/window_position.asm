; ------------------------
; BGのスクリーン表示位置の設定
; ------------------------

; メモリマップ
memMapWindowPosition = $2005

; 画面の表示位置を指定
; @param 1 X座標
; @param 2 Y座標
windowPosition .MACRO
    lda \1
    sta memMapWindowPosition
    lda \2
    sta memMapWindowPosition
    .ENDM
