; ------------------------
; 音声チャンネル制御
; ------------------------

; 矩形波CH1
apuSqCh1Off = %00000000
apuSqCh1On = %00000001
; 矩形波CH2
apuSqCh2Off = %00000000
apuSqCh2On = %00000010
; 三角波
apuTriOff = %00000000
apuTriOn = %00000100
; ノイズ
apuNoiseOff = %00000000
apuNoiseOn = %00001000
; DPCM
apuDpcmOff = %00000000
apuDpcmOn = %00010000

; 音声チャンネル制御を一度に行う
; @param 1 矩形波CH1 ON/OFF (apuSqCh1Off or apuSqCh1On)
; @param 2 矩形波CH2 ON/OFF (apuSqCh2Off or apuSqCh2On)
; @param 3 三角波 ON/OFF (apuTriOff or apuTriOn)
; @param 4 ノイズ ON/OFF (apuNoiseOff or apuNoiseOn)
; @param 5 DPCM ON/OFF (apuDpcmOff or apuDpcmOn)
setApuChAll .MACRO
    lda #(\1 | \2 | \3 | \4 | \5)
    sta memMapApuChCtl
    .ENDM

; 音声チャンネル制御を個別に行う
; @param 1 ON/OFF
setApuCh .MACRO
    lda memMapApuChCtl
    .IF \1 != $00
        ora #\1
    .ELSE
        and #\1
    .ENDIF
    sta memMapApuChCtl
    .ENDM
