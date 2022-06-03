; ------------------------
; DPCM制御
; ※動作未確認
; ------------------------

; ノイズ制御の設定
; @param 1 サンプルレートビット数(0〜7)
; @param 2 ボリューム(0〜255)
; @param 3 音声テーブルのアドレス(Nx$40+$c000)
; @param 4 テーブルバイトサイズ(Nx16+1)
setApuDpcm .MACRO
    lda \1
    sta memMapDpcmCtl1
    lda \2
    sta memMapDpcmCtl2
    lda \3
    sta memMapDpcmCtl3
    lda \4
    sta memMapDpcmCtl4
    .ENDM
