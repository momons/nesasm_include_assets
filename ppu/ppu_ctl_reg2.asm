; ------------------------
; PPUコントロールレジスタ2関連
; ------------------------

; メモリマップ
memMapPpuCtlReg2 = $2001

; 青を強調表示 (0: off, 1: on)
ppuCtlReg2BlueOff = %00000000
ppuCtlReg2BlueOn = %10000000

; 緑を強調表示 (0: off, 1: on)
ppuCtlReg2GreenOff = %00000000
ppuCtlReg2GreenOn = %01000000

; 赤を強調表示 (0: off, 1: on)
ppuCtlReg2RedOff = %00000000
ppuCtlReg2RedOn = %00100000

; スプライト表示 (0: off, 1: on)
ppuCtlReg2ShowSpOff = %00000000
ppuCtlReg2ShowSpOn = %00010000

; BG表示 (0: off, 1: on)
ppuCtlReg2ShowBgOff = %00000000
ppuCtlReg2ShowBgOn = %00001000

; 左端8x8のスプライト表示 (0: off, 1: on)
ppuCtlReg2LeftShowSpOff = %00000000
ppuCtlReg2LeftShowSpOn = %00000100

; 左端8x8のBG表示 (0: off, 1: on)
ppuCtlReg2LeftShowBgOff = %00000000
ppuCtlReg2LeftShowBgOn = %00000010

; モノクロ表示 (0: color, 1: mono)
ppuCtlReg2Color = %00000000
ppuCtlReg2Mono = %00000001

; PPUコントロールレジスタ2を設定する
; @param 1 青を強調表示
; @param 2 緑を強調表示
; @param 3 赤を強調表示
; @param 4 スプライト表示
; @param 5 BG表示
; @param 6 左端8x8のスプライト表示
; @param 7 左端8x8のBG表示
; @param 8 モノクロ/カラー表示
ppuCtlReg2 .MACRO
    lda #(\1 | \2 | \3 | \4 | \5 | \6 | \7 | \8)
    sta memMapPpuCtlReg2
    .ENDM

