; ==============================================
; 画面の表示位置を指定
; @param 1 X座標
; @param 2 Y座標
; ==============================================
bgPosition .MACRO
    lda \1
    sta memMapBgPosition
    lda \2
    sta memMapBgPosition
    .ENDM
