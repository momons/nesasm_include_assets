; ------------------------
; 矩形波制御
; ------------------------

; 矩形波制御の設定
; @param 1 チャンネル(0:CH1、1:CH2)
; @param 2 Duty比(0〜3)
; @param 3 長さ無効(0:設定した時間, 1:鳴り続ける)
; @param 4 減衰無効(0:@param5に依存, 1:減衰なし)
; @param 5 減衰率(0〜255)
; @param 6 スイーブ有効(0:無効, 1:有効)
; @param 7 変化率(0〜7)
; @param 8 方向(0:尻下がり、1:尻上がり)
; @param 9 変化量(000:変化なし、短音〜長音)
setAudioSqWvCtl .MACRO
    lda #(\2 << 6 | \3 << 5 | \4 << 4 | \5)
    .IF \1 = 0
        sta memMapSqWvCh1Ctl1
    .ELSE
        sta memMapSqWvCh2Ctl1
    .ENDIF
    lda #(\6 << 7 | \7 << 4 | \8 << 3 | \9)
    .IF \1 = 0
        sta memMapSqWvCh1Ctl2
    .ELSE
        sta memMapSqWvCh2Ctl2
    .ENDIF
    .ENDM

; 矩形波周波数制御の設定
; @param 1 チャンネル(0:CH1、1:CH2)
; @param 2 周波数(高音:0〜2047:低音)
; @param 3 長さ無効をゼロにした際の再生時間(0〜31)
setAudioSqWvVal .MACRO
    lda #(\2 % $100)
    .IF \1 = 0
        sta memMapSqWvCh1Val1
    .ELSE
        sta memMapSqWvCh2Val1
    .ENDIF
    lda #(\3 << 3 | \2 / $100)
    .IF \1 = 0
        sta memMapSqWvCh1Val2
    .ELSE
        sta memMapSqWvCh2Val2
    .ENDIF
    .ENDM