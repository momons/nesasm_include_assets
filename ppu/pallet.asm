; ==============================================
; 指定アドレスのパレットをロードする
; @param 1 memMapPalletBg or memMapPalletSp
; @param 2 パレットデータアドレス(必ず16個)
; ==============================================
loadPallet .MACRO
    lda #(\1 / $100)
    sta memMapPpuAdd
    lda #(\1 % $100)
    sta memMapPpuAdd
    ldx #0
    ldy #16
.COPY_PALLET\@:
    lda \2, x
    sta memMapPpuData
    inx
    dey
    bne .COPY_PALLET\@
    .ENDM
