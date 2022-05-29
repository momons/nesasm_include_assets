; ------------------------
; 画面表示の設定 を行う書き込み（出力）専用のI/Oポート
; ------------------------

; メモリマップ
memMapPpuMaskSet = $2001

; 青を強調表示 (0: off, 1: on)
ppuMaskSetBlueOff = %00000000
ppuMaskSetBlueOn = %10000000

; 緑を強調表示 (0: off, 1: on)
ppuMaskSetGreenOff = %00000000
ppuMaskSetGreenOn = %01000000

; 赤を強調表示 (0: off, 1: on)
ppuMaskSetRedOff = %00000000
ppuMaskSetRedOn = %00100000

; スプライト表示 (0: off, 1: on)
ppuMaskSetShowSpOff = %00000000
ppuMaskSetShowSpOn = %00010000

; BG表示 (0: off, 1: on)
ppuMaskSetShowBgOff = %00000000
ppuMaskSetShowBgOn = %00001000

; 左端8x8のスプライト表示 (0: off, 1: on)
ppuMaskSetLeftShowSpOff = %00000000
ppuMaskSetLeftShowSpOn = %00000100

; 左端8x8のBG表示 (0: off, 1: on)
ppuMaskSetLeftShowBgOff = %00000000
ppuMaskSetLeftShowBgOn = %00000010

; モノクロ表示 (0: color, 1: mono)
ppuMaskSetColor = %00000000
ppuMaskSetMono = %00000001

; PPUコントロールレジスタ2を設定する
; @param 1 青を強調表示
; @param 2 緑を強調表示
; @param 3 赤を強調表示
; @param 4 スプライト表示
; @param 5 BG表示
; @param 6 左端8x8のスプライト表示
; @param 7 左端8x8のBG表示
; @param 8 モノクロ/カラー表示
ppuMaskSet .MACRO
    lda #(\1 | \2 | \3 | \4 | \5 | \6 | \7 | \8)
    sta memMapPpuMaskSet
    .ENDM

