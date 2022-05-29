; ------------------------
; PPUコントロールレジスタ1関連
; ------------------------

; メモリマップ
memMapPpuCtlReg1 = $2000

; vBlank発生を割り込みで検出 (0: off, 1: on)
ppuCtlReg1VbankOff = %00000000
ppuCtlReg1VbankOn = %10000000

; PPU type (0: master, 1: slave)
ppuCtlReg1PpuTypeMaster = %00000000
ppuCtlReg1PpuTypeSlave = %01000000

; スプライトのサイズ (0: 8x8, 1: 8x16)
ppuCtlReg1SpriteSize8x8 = %00000000
ppuCtlReg1SpriteSize8x16 = %00100000

; BGのキャラクタテーブル番号 (0: $0000, 1: $1000)
ppuCtlReg1BgTable0 = %00000000
ppuCtlReg1BgTable1 = %00010000

; スプライトのキャラクタテーブル番号 (0: $0000, 1: $1000)
ppuCtlReg1SpTable0 = %00000000
ppuCtlReg1SpTable1 = %00001000

; VRAM入出力時のアドレス変化値 (0: +1, 1: +32)
ppuCtlReg1VramAddVal1 = %00000000
ppuCtlReg1VramAddVal32 = %00000100

; メインスクリーン (00: $2000, 01: $2400, 10: $2800, 11: $2C00)
ppuCtlReg1MainScreen0 = %00000000
ppuCtlReg1MainScreen1 = %00000001
ppuCtlReg1MainScreen2 = %00000010
ppuCtlReg1MainScreen3 = %00000011

; PPUコントロールレジスタ1を設定する
; @param 1 vBlank発生を割り込みで検出
; @param 2 PPU type
; @param 3 スプライトのサイズ
; @param 4 BGのキャラクタテーブル番号
; @param 5 スプライトのキャラクタテーブル番号
; @param 6 VRAM入出力時のアドレス変化値
; @param 7 メインスクリーン
ppuCtlReg1 .MACRO
    lda #(\1 | \2 | \3 | \4 | \5 | \6 | \7)
    sta memMapPpuCtlReg1
    .ENDM
