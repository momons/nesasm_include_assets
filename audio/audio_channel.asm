; ------------------------
; 音声チャンネル制御
; ------------------------

; 矩形波CH1
audioSqCh1Off = %00000000
audioSqCh1On = %00000001
; 矩形波CH2
audioSqCh2Off = %00000000
audioSqCh2On = %00000010
; 三角波
audioTriOff = %00000000
audioTriOn = %00000100
; ノイズ
audioNoiseOff = %00000000
audioNoiseOn = %00001000
; DPCM
audioDpcmOff = %00000000
audioDpcmOn = %00010000

; 音声チャンネル制御を一度に行う
; @param 1 矩形波CH1 ON/OFF (audioSqCh1Off or audioSqCh1On)
; @param 2 矩形波CH2 ON/OFF (audioSqCh2Off or audioSqCh2On)
; @param 3 三角波 ON/OFF (audioTriOff or audioTriOn)
; @param 4 ノイズ ON/OFF (audioNoiseOff or audioNoiseOn)
; @param 5 DPCM ON/OFF (audioDpcmOff or audioDpcmOn)
setAudioChAll .MACRO
    lda #(\1 | \2 | \3 | \4 | \5)
    sta memMapAudioChCtl
    .ENDM

; 音声チャンネル制御を個別に行う
; @param 1 ON/OFF
setAudioCh .MACRO
    lda memMapAudioChCtl
    .IF \1 != $00
        ora #\1
    .ELSE
        and #\1
    .ENDIF
    sta memMapAudioChCtl
    .ENDM
