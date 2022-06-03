; ------------------------
; 三角波制御
; ------------------------

; 三角波制御の設定
; @param 1 カウンタ使用(0:@param4に影響、1:リニアカウンターを使用 @param2に影響)
; @param 2 長さ(0〜63)
; @param 3 周波数(高音:0〜2047:低音)
; @param 4 再生時間(0〜31)
setApuTriWv .MACRO
    lda #(\1 << 6 | \2)
    sta memMapTriWvCtl
    lda #(\3 % $100)
    sta memMapTriWvVal1
    lda #(\4 << 3 | \3 / $100)
    sta memMapTriWvVal2
    .ENDM
