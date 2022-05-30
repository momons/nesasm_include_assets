; ------------------------
; DMA転送を使ったスプライトデータ一括設定
; ------------------------

; メモリマップ
memMapDma = $4014 ; DMA転送
pageSpDmaData = 3 ; スプライトデータの格納先を$0300を使用する

; DMA転送領域を設定
; $0300領域を使用する
setSpDmaMap .MACRO
    .bank 0
    .org pageSpDmaData * $100
dmaSp0:
dmaSp0Y:    .db 0
dmaSp0No:   .db 0
dmaSp0Op:   .db 0
dmaSp0X:    .db 0
dmaSp1:
dmaSp1Y:    .db 0
dmaSp1No:   .db 0
dmaSp1Op:   .db 0
dmaSp1X:    .db 0
dmaSp2:
dmaSp2Y:    .db 0
dmaSp2No:   .db 0
dmaSp2Op:   .db 0
dmaSp2X:    .db 0
dmaSp3:
dmaSp3Y:    .db 0
dmaSp3No:   .db 0
dmaSp3Op:   .db 0
dmaSp3X:    .db 0
dmaSp4:
dmaSp4Y:    .db 0
dmaSp4No:   .db 0
dmaSp4Op:   .db 0
dmaSp4X:    .db 0
dmaSp5:
dmaSp5Y:    .db 0
dmaSp5No:   .db 0
dmaSp5Op:   .db 0
dmaSp5X:    .db 0
dmaSp6:
dmaSp6Y:    .db 0
dmaSp6No:   .db 0
dmaSp6Op:   .db 0
dmaSp6X:    .db 0
dmaSp7:
dmaSp7Y:    .db 0
dmaSp7No:   .db 0
dmaSp7Op:   .db 0
dmaSp7X:    .db 0
dmaSp8:
dmaSp8Y:    .db 0
dmaSp8No:   .db 0
dmaSp8Op:   .db 0
dmaSp8X:    .db 0
dmaSp9:
dmaSp9Y:    .db 0
dmaSp9No:   .db 0
dmaSp9Op:   .db 0
dmaSp9X:    .db 0
dmaSp10:
dmaSp10Y:    .db 0
dmaSp10No:   .db 0
dmaSp10Op:   .db 0
dmaSp10X:    .db 0
dmaSp11:
dmaSp11Y:    .db 0
dmaSp11No:   .db 0
dmaSp11Op:   .db 0
dmaSp11X:    .db 0
dmaSp12:
dmaSp12Y:    .db 0
dmaSp12No:   .db 0
dmaSp12Op:   .db 0
dmaSp12X:    .db 0
dmaSp13:
dmaSp13Y:    .db 0
dmaSp13No:   .db 0
dmaSp13Op:   .db 0
dmaSp13X:    .db 0
dmaSp14:
dmaSp14Y:    .db 0
dmaSp14No:   .db 0
dmaSp14Op:   .db 0
dmaSp14X:    .db 0
dmaSp15:
dmaSp15Y:    .db 0
dmaSp15No:   .db 0
dmaSp15Op:   .db 0
dmaSp15X:    .db 0
dmaSp16:
dmaSp16Y:    .db 0
dmaSp16No:   .db 0
dmaSp16Op:   .db 0
dmaSp16X:    .db 0
dmaSp17:
dmaSp17Y:    .db 0
dmaSp17No:   .db 0
dmaSp17Op:   .db 0
dmaSp17X:    .db 0
dmaSp18:
dmaSp18Y:    .db 0
dmaSp18No:   .db 0
dmaSp18Op:   .db 0
dmaSp18X:    .db 0
dmaSp19:
dmaSp19Y:    .db 0
dmaSp19No:   .db 0
dmaSp19Op:   .db 0
dmaSp19X:    .db 0
dmaSp20:
dmaSp20Y:    .db 0
dmaSp20No:   .db 0
dmaSp20Op:   .db 0
dmaSp20X:    .db 0
dmaSp21:
dmaSp21Y:    .db 0
dmaSp21No:   .db 0
dmaSp21Op:   .db 0
dmaSp21X:    .db 0
dmaSp22:
dmaSp22Y:    .db 0
dmaSp22No:   .db 0
dmaSp22Op:   .db 0
dmaSp22X:    .db 0
dmaSp23:
dmaSp23Y:    .db 0
dmaSp23No:   .db 0
dmaSp23Op:   .db 0
dmaSp23X:    .db 0
dmaSp24:
dmaSp24Y:    .db 0
dmaSp24No:   .db 0
dmaSp24Op:   .db 0
dmaSp24X:    .db 0
dmaSp25:
dmaSp25Y:    .db 0
dmaSp25No:   .db 0
dmaSp25Op:   .db 0
dmaSp25X:    .db 0
dmaSp26:
dmaSp26Y:    .db 0
dmaSp26No:   .db 0
dmaSp26Op:   .db 0
dmaSp26X:    .db 0
dmaSp27:
dmaSp27Y:    .db 0
dmaSp27No:   .db 0
dmaSp27Op:   .db 0
dmaSp27X:    .db 0
dmaSp28:
dmaSp28Y:    .db 0
dmaSp28No:   .db 0
dmaSp28Op:   .db 0
dmaSp28X:    .db 0
dmaSp29:
dmaSp29Y:    .db 0
dmaSp29No:   .db 0
dmaSp29Op:   .db 0
dmaSp29X:    .db 0
dmaSp30:
dmaSp30Y:    .db 0
dmaSp30No:   .db 0
dmaSp30Op:   .db 0
dmaSp30X:    .db 0
dmaSp31:
dmaSp31Y:    .db 0
dmaSp31No:   .db 0
dmaSp31Op:   .db 0
dmaSp31X:    .db 0
dmaSp32:
dmaSp32Y:    .db 0
dmaSp32No:   .db 0
dmaSp32Op:   .db 0
dmaSp32X:    .db 0
dmaSp33:
dmaSp33Y:    .db 0
dmaSp33No:   .db 0
dmaSp33Op:   .db 0
dmaSp33X:    .db 0
dmaSp34:
dmaSp34Y:    .db 0
dmaSp34No:   .db 0
dmaSp34Op:   .db 0
dmaSp34X:    .db 0
dmaSp35:
dmaSp35Y:    .db 0
dmaSp35No:   .db 0
dmaSp35Op:   .db 0
dmaSp35X:    .db 0
dmaSp36:
dmaSp36Y:    .db 0
dmaSp36No:   .db 0
dmaSp36Op:   .db 0
dmaSp36X:    .db 0
dmaSp37:
dmaSp37Y:    .db 0
dmaSp37No:   .db 0
dmaSp37Op:   .db 0
dmaSp37X:    .db 0
dmaSp38:
dmaSp38Y:    .db 0
dmaSp38No:   .db 0
dmaSp38Op:   .db 0
dmaSp38X:    .db 0
dmaSp39:
dmaSp39Y:    .db 0
dmaSp39No:   .db 0
dmaSp39Op:   .db 0
dmaSp39X:    .db 0
dmaSp40:
dmaSp40Y:    .db 0
dmaSp40No:   .db 0
dmaSp40Op:   .db 0
dmaSp40X:    .db 0
dmaSp41:
dmaSp41Y:    .db 0
dmaSp41No:   .db 0
dmaSp41Op:   .db 0
dmaSp41X:    .db 0
dmaSp42:
dmaSp42Y:    .db 0
dmaSp42No:   .db 0
dmaSp42Op:   .db 0
dmaSp42X:    .db 0
dmaSp43:
dmaSp43Y:    .db 0
dmaSp43No:   .db 0
dmaSp43Op:   .db 0
dmaSp43X:    .db 0
dmaSp44:
dmaSp44Y:    .db 0
dmaSp44No:   .db 0
dmaSp44Op:   .db 0
dmaSp44X:    .db 0
dmaSp45:
dmaSp45Y:    .db 0
dmaSp45No:   .db 0
dmaSp45Op:   .db 0
dmaSp45X:    .db 0
dmaSp46:
dmaSp46Y:    .db 0
dmaSp46No:   .db 0
dmaSp46Op:   .db 0
dmaSp46X:    .db 0
dmaSp47:
dmaSp47Y:    .db 0
dmaSp47No:   .db 0
dmaSp47Op:   .db 0
dmaSp47X:    .db 0
dmaSp48:
dmaSp48Y:    .db 0
dmaSp48No:   .db 0
dmaSp48Op:   .db 0
dmaSp48X:    .db 0
dmaSp49:
dmaSp49Y:    .db 0
dmaSp49No:   .db 0
dmaSp49Op:   .db 0
dmaSp49X:    .db 0
dmaSp50:
dmaSp50Y:    .db 0
dmaSp50No:   .db 0
dmaSp50Op:   .db 0
dmaSp50X:    .db 0
dmaSp51:
dmaSp51Y:    .db 0
dmaSp51No:   .db 0
dmaSp51Op:   .db 0
dmaSp51X:    .db 0
dmaSp52:
dmaSp52Y:    .db 0
dmaSp52No:   .db 0
dmaSp52Op:   .db 0
dmaSp52X:    .db 0
dmaSp53:
dmaSp53Y:    .db 0
dmaSp53No:   .db 0
dmaSp53Op:   .db 0
dmaSp53X:    .db 0
dmaSp54:
dmaSp54Y:    .db 0
dmaSp54No:   .db 0
dmaSp54Op:   .db 0
dmaSp54X:    .db 0
dmaSp55:
dmaSp55Y:    .db 0
dmaSp55No:   .db 0
dmaSp55Op:   .db 0
dmaSp55X:    .db 0
dmaSp56:
dmaSp56Y:    .db 0
dmaSp56No:   .db 0
dmaSp56Op:   .db 0
dmaSp56X:    .db 0
dmaSp57:
dmaSp57Y:    .db 0
dmaSp57No:   .db 0
dmaSp57Op:   .db 0
dmaSp57X:    .db 0
dmaSp58:
dmaSp58Y:    .db 0
dmaSp58No:   .db 0
dmaSp58Op:   .db 0
dmaSp58X:    .db 0
dmaSp59:
dmaSp59Y:    .db 0
dmaSp59No:   .db 0
dmaSp59Op:   .db 0
dmaSp59X:    .db 0
dmaSp60:
dmaSp60Y:    .db 0
dmaSp60No:   .db 0
dmaSp60Op:   .db 0
dmaSp60X:    .db 0
dmaSp61:
dmaSp61Y:    .db 0
dmaSp61No:   .db 0
dmaSp61Op:   .db 0
dmaSp61X:    .db 0
dmaSp62:
dmaSp62Y:    .db 0
dmaSp62No:   .db 0
dmaSp62Op:   .db 0
dmaSp62X:    .db 0
dmaSp63:
dmaSp63Y:    .db 0
dmaSp63No:   .db 0
dmaSp63Op:   .db 0
dmaSp63X:    .db 0
    .ENDM

; スプライトを情報を設定する
; @param 1 スプライトNo(アドレス指定)
; @param 2 パターンNo
; @param 3 X座標
; @param 4 Y座標
; @param 5 オプション
setSpSts .MACRO
    ldx #0
    lda \4
    sta \1, x
    inx
    lda \2
    sta \1, x
    inx
    lda \5
    sta \1, x
    inx
    lda \3
    sta \1, x
    .ENDM

; DMA転送し全てのスプライトを一度に反映する
drawSpAll .MACRO
    lda #pageSpDmaData
    sta memMapDma
    .ENDM
