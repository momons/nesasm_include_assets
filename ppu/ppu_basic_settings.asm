; ==============================================
; PPUの基本設定 を行う書き込み（出力）専用のI/Oポート
; ==============================================

; vBlank発生を割り込みで検出 (0: off, 1: on)
ppuBasicSetVbankOff = %00000000
ppuBasicSetVbankOn = %10000000

; PPU type (0: master, 1: slave)
ppuBasicSetPpuTypeMaster = %00000000
ppuBasicSetPpuTypeSlave = %01000000

; スプライトのサイズ (0: 8x8, 1: 8x16)
ppuBasicSetSpriteSize8x8 = %00000000
ppuBasicSetSpriteSize8x16 = %00100000

; BGのキャラクタテーブル番号 (0: $0000, 1: $1000)
ppuBasicSetBgTable0 = %00000000
ppuBasicSetBgTable1 = %00010000

; スプライトのキャラクタテーブル番号 (0: $0000, 1: $1000)
ppuBasicSetSpTable0 = %00000000
ppuBasicSetSpTable1 = %00001000

; VRAM入出力時のアドレス変化値 (0: +1, 1: +32)
ppuBasicSetVramAddVal1 = %00000000
ppuBasicSetVramAddVal32 = %00000100

; メインスクリーン (00: $2000, 01: $2400, 10: $2800, 11: $2C00)
ppuBasicSetMainScreen0 = %00000000
ppuBasicSetMainScreen1 = %00000001
ppuBasicSetMainScreen2 = %00000010
ppuBasicSetMainScreen3 = %00000011

; ==============================================
; PPUの基本設定
; @param 1 vBlank発生を割り込みで検出
; @param 2 PPU type
; @param 3 スプライトのサイズ
; @param 4 BGのキャラクタテーブル番号
; @param 5 スプライトのキャラクタテーブル番号
; @param 6 VRAM入出力時のアドレス変化値
; @param 7 メインスクリーン
; ==============================================
ppuBasicSet .MACRO
    lda #(\1 | \2 | \3 | \4 | \5 | \6 | \7)
    sta memMapPpuBasicSet
    .ENDM
