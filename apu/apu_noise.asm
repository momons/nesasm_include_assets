; ------------------------
; ノイズ制御
; ------------------------

; ノイズ制御の設定
; @param 1 長さ無効(0:設定した時間, 1:鳴り続ける)
; @param 2 減衰無効(0:@param3に依存, 1:減衰なし)
; @param 3 減衰率(0〜255)
; @param 4 乱数タイプ(0:32kbit, 1:93kbit)
; @param 5 波長(0〜15)
; @param 6 再生時間(0〜31)
setApuNoise .MACRO
    lda #(\1 << 5 | \2 << 4 | \3)
    sta memMapNoiseCtl
    lda #(\4 << 7 | \5)
    sta memMapNoiseRnd
    lda #(\6 << 3)
    sta memMapNoiseTime
    .ENDM
