; ------------------------
; カラーパレットの設定
; ------------------------

; メモリマップ
memMapPalletAdd = $2006 ; パレットをロードするアドレスを指定
memMapPalletBg = $3f00; ; BGパレットテーブルアドレス
memMapPalletSp = $3f10; ; スプライトパレットテーブルアドレス

; 指定アドレスのパレットをロードする
; @param 1 memMapPalletBg or memMapPalletSp
; @param 2 パレットデータアドレス(必ず16個)
loadPallet .MACRO
    lda #(\1 / $100)
    sta $2006
    lda #(\1 % $100)
    sta $2006
    ldx #0
    ldy #16
.COPY_PALLET\@:
    lda \2, x
    sta $2007
    inx
    dey
    bne .COPY_PALLET\@
    .ENDM
