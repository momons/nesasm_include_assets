; ------------------------
; DMA転送を使ったスプライトデータ一括設定
; ------------------------

; メモリマップ
pageSpDmaData = 3 ; スプライトデータの格納先を$0300を使用する

; DMA転送領域を設定
; $0300〜$03ff領域を使用する
setSpDmaMap .MACRO
    .BANK bankProgram
    .ORG pageSpDmaData * $100
dmaSp0:
dmaSp0Y:    .DB 0
dmaSp0No:   .DB 0
dmaSp0Op:   .DB 0
dmaSp0X:    .DB 0
dmaSp1:
dmaSp1Y:    .DB 0
dmaSp1No:   .DB 0
dmaSp1Op:   .DB 0
dmaSp1X:    .DB 0
dmaSp2:
dmaSp2Y:    .DB 0
dmaSp2No:   .DB 0
dmaSp2Op:   .DB 0
dmaSp2X:    .DB 0
dmaSp3:
dmaSp3Y:    .DB 0
dmaSp3No:   .DB 0
dmaSp3Op:   .DB 0
dmaSp3X:    .DB 0
dmaSp4:
dmaSp4Y:    .DB 0
dmaSp4No:   .DB 0
dmaSp4Op:   .DB 0
dmaSp4X:    .DB 0
dmaSp5:
dmaSp5Y:    .DB 0
dmaSp5No:   .DB 0
dmaSp5Op:   .DB 0
dmaSp5X:    .DB 0
dmaSp6:
dmaSp6Y:    .DB 0
dmaSp6No:   .DB 0
dmaSp6Op:   .DB 0
dmaSp6X:    .DB 0
dmaSp7:
dmaSp7Y:    .DB 0
dmaSp7No:   .DB 0
dmaSp7Op:   .DB 0
dmaSp7X:    .DB 0
dmaSp8:
dmaSp8Y:    .DB 0
dmaSp8No:   .DB 0
dmaSp8Op:   .DB 0
dmaSp8X:    .DB 0
dmaSp9:
dmaSp9Y:    .DB 0
dmaSp9No:   .DB 0
dmaSp9Op:   .DB 0
dmaSp9X:    .DB 0
dmaSp10:
dmaSp10Y:    .DB 0
dmaSp10No:   .DB 0
dmaSp10Op:   .DB 0
dmaSp10X:    .DB 0
dmaSp11:
dmaSp11Y:    .DB 0
dmaSp11No:   .DB 0
dmaSp11Op:   .DB 0
dmaSp11X:    .DB 0
dmaSp12:
dmaSp12Y:    .DB 0
dmaSp12No:   .DB 0
dmaSp12Op:   .DB 0
dmaSp12X:    .DB 0
dmaSp13:
dmaSp13Y:    .DB 0
dmaSp13No:   .DB 0
dmaSp13Op:   .DB 0
dmaSp13X:    .DB 0
dmaSp14:
dmaSp14Y:    .DB 0
dmaSp14No:   .DB 0
dmaSp14Op:   .DB 0
dmaSp14X:    .DB 0
dmaSp15:
dmaSp15Y:    .DB 0
dmaSp15No:   .DB 0
dmaSp15Op:   .DB 0
dmaSp15X:    .DB 0
dmaSp16:
dmaSp16Y:    .DB 0
dmaSp16No:   .DB 0
dmaSp16Op:   .DB 0
dmaSp16X:    .DB 0
dmaSp17:
dmaSp17Y:    .DB 0
dmaSp17No:   .DB 0
dmaSp17Op:   .DB 0
dmaSp17X:    .DB 0
dmaSp18:
dmaSp18Y:    .DB 0
dmaSp18No:   .DB 0
dmaSp18Op:   .DB 0
dmaSp18X:    .DB 0
dmaSp19:
dmaSp19Y:    .DB 0
dmaSp19No:   .DB 0
dmaSp19Op:   .DB 0
dmaSp19X:    .DB 0
dmaSp20:
dmaSp20Y:    .DB 0
dmaSp20No:   .DB 0
dmaSp20Op:   .DB 0
dmaSp20X:    .DB 0
dmaSp21:
dmaSp21Y:    .DB 0
dmaSp21No:   .DB 0
dmaSp21Op:   .DB 0
dmaSp21X:    .DB 0
dmaSp22:
dmaSp22Y:    .DB 0
dmaSp22No:   .DB 0
dmaSp22Op:   .DB 0
dmaSp22X:    .DB 0
dmaSp23:
dmaSp23Y:    .DB 0
dmaSp23No:   .DB 0
dmaSp23Op:   .DB 0
dmaSp23X:    .DB 0
dmaSp24:
dmaSp24Y:    .DB 0
dmaSp24No:   .DB 0
dmaSp24Op:   .DB 0
dmaSp24X:    .DB 0
dmaSp25:
dmaSp25Y:    .DB 0
dmaSp25No:   .DB 0
dmaSp25Op:   .DB 0
dmaSp25X:    .DB 0
dmaSp26:
dmaSp26Y:    .DB 0
dmaSp26No:   .DB 0
dmaSp26Op:   .DB 0
dmaSp26X:    .DB 0
dmaSp27:
dmaSp27Y:    .DB 0
dmaSp27No:   .DB 0
dmaSp27Op:   .DB 0
dmaSp27X:    .DB 0
dmaSp28:
dmaSp28Y:    .DB 0
dmaSp28No:   .DB 0
dmaSp28Op:   .DB 0
dmaSp28X:    .DB 0
dmaSp29:
dmaSp29Y:    .DB 0
dmaSp29No:   .DB 0
dmaSp29Op:   .DB 0
dmaSp29X:    .DB 0
dmaSp30:
dmaSp30Y:    .DB 0
dmaSp30No:   .DB 0
dmaSp30Op:   .DB 0
dmaSp30X:    .DB 0
dmaSp31:
dmaSp31Y:    .DB 0
dmaSp31No:   .DB 0
dmaSp31Op:   .DB 0
dmaSp31X:    .DB 0
dmaSp32:
dmaSp32Y:    .DB 0
dmaSp32No:   .DB 0
dmaSp32Op:   .DB 0
dmaSp32X:    .DB 0
dmaSp33:
dmaSp33Y:    .DB 0
dmaSp33No:   .DB 0
dmaSp33Op:   .DB 0
dmaSp33X:    .DB 0
dmaSp34:
dmaSp34Y:    .DB 0
dmaSp34No:   .DB 0
dmaSp34Op:   .DB 0
dmaSp34X:    .DB 0
dmaSp35:
dmaSp35Y:    .DB 0
dmaSp35No:   .DB 0
dmaSp35Op:   .DB 0
dmaSp35X:    .DB 0
dmaSp36:
dmaSp36Y:    .DB 0
dmaSp36No:   .DB 0
dmaSp36Op:   .DB 0
dmaSp36X:    .DB 0
dmaSp37:
dmaSp37Y:    .DB 0
dmaSp37No:   .DB 0
dmaSp37Op:   .DB 0
dmaSp37X:    .DB 0
dmaSp38:
dmaSp38Y:    .DB 0
dmaSp38No:   .DB 0
dmaSp38Op:   .DB 0
dmaSp38X:    .DB 0
dmaSp39:
dmaSp39Y:    .DB 0
dmaSp39No:   .DB 0
dmaSp39Op:   .DB 0
dmaSp39X:    .DB 0
dmaSp40:
dmaSp40Y:    .DB 0
dmaSp40No:   .DB 0
dmaSp40Op:   .DB 0
dmaSp40X:    .DB 0
dmaSp41:
dmaSp41Y:    .DB 0
dmaSp41No:   .DB 0
dmaSp41Op:   .DB 0
dmaSp41X:    .DB 0
dmaSp42:
dmaSp42Y:    .DB 0
dmaSp42No:   .DB 0
dmaSp42Op:   .DB 0
dmaSp42X:    .DB 0
dmaSp43:
dmaSp43Y:    .DB 0
dmaSp43No:   .DB 0
dmaSp43Op:   .DB 0
dmaSp43X:    .DB 0
dmaSp44:
dmaSp44Y:    .DB 0
dmaSp44No:   .DB 0
dmaSp44Op:   .DB 0
dmaSp44X:    .DB 0
dmaSp45:
dmaSp45Y:    .DB 0
dmaSp45No:   .DB 0
dmaSp45Op:   .DB 0
dmaSp45X:    .DB 0
dmaSp46:
dmaSp46Y:    .DB 0
dmaSp46No:   .DB 0
dmaSp46Op:   .DB 0
dmaSp46X:    .DB 0
dmaSp47:
dmaSp47Y:    .DB 0
dmaSp47No:   .DB 0
dmaSp47Op:   .DB 0
dmaSp47X:    .DB 0
dmaSp48:
dmaSp48Y:    .DB 0
dmaSp48No:   .DB 0
dmaSp48Op:   .DB 0
dmaSp48X:    .DB 0
dmaSp49:
dmaSp49Y:    .DB 0
dmaSp49No:   .DB 0
dmaSp49Op:   .DB 0
dmaSp49X:    .DB 0
dmaSp50:
dmaSp50Y:    .DB 0
dmaSp50No:   .DB 0
dmaSp50Op:   .DB 0
dmaSp50X:    .DB 0
dmaSp51:
dmaSp51Y:    .DB 0
dmaSp51No:   .DB 0
dmaSp51Op:   .DB 0
dmaSp51X:    .DB 0
dmaSp52:
dmaSp52Y:    .DB 0
dmaSp52No:   .DB 0
dmaSp52Op:   .DB 0
dmaSp52X:    .DB 0
dmaSp53:
dmaSp53Y:    .DB 0
dmaSp53No:   .DB 0
dmaSp53Op:   .DB 0
dmaSp53X:    .DB 0
dmaSp54:
dmaSp54Y:    .DB 0
dmaSp54No:   .DB 0
dmaSp54Op:   .DB 0
dmaSp54X:    .DB 0
dmaSp55:
dmaSp55Y:    .DB 0
dmaSp55No:   .DB 0
dmaSp55Op:   .DB 0
dmaSp55X:    .DB 0
dmaSp56:
dmaSp56Y:    .DB 0
dmaSp56No:   .DB 0
dmaSp56Op:   .DB 0
dmaSp56X:    .DB 0
dmaSp57:
dmaSp57Y:    .DB 0
dmaSp57No:   .DB 0
dmaSp57Op:   .DB 0
dmaSp57X:    .DB 0
dmaSp58:
dmaSp58Y:    .DB 0
dmaSp58No:   .DB 0
dmaSp58Op:   .DB 0
dmaSp58X:    .DB 0
dmaSp59:
dmaSp59Y:    .DB 0
dmaSp59No:   .DB 0
dmaSp59Op:   .DB 0
dmaSp59X:    .DB 0
dmaSp60:
dmaSp60Y:    .DB 0
dmaSp60No:   .DB 0
dmaSp60Op:   .DB 0
dmaSp60X:    .DB 0
dmaSp61:
dmaSp61Y:    .DB 0
dmaSp61No:   .DB 0
dmaSp61Op:   .DB 0
dmaSp61X:    .DB 0
dmaSp62:
dmaSp62Y:    .DB 0
dmaSp62No:   .DB 0
dmaSp62Op:   .DB 0
dmaSp62X:    .DB 0
dmaSp63:
dmaSp63Y:    .DB 0
dmaSp63No:   .DB 0
dmaSp63Op:   .DB 0
dmaSp63X:    .DB 0
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
    lda #0
    sta memMapOamAddr
    lda #pageSpDmaData
    sta memMapDma
    .ENDM
