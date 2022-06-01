; ------------------------
; 画面描画の状態取得 を行う読み取り（入力）専用のI/Oポート
; ------------------------

; vBlankの発生状態 (0: 描画中, 1: vBlank中)
ppuDrawStsDrawing = %00000000
ppuDrawStsVblank = %00000100
; 0番スプライトの描画 (0: 未検出, 1: 検出)
ppuDrawSts0SpDetected = %00000000
ppuDrawSts0SpNotDetected = %00000010
; 描画ラインのスプライト描画上限 (0: 8以下, 1: 9以上)
ppuDrawStsSp8OrLess = %00000000
ppuDrawStsSpOver8 = %00000001

; 画面描画の状態取得
; @return aレジスタに状態
getPpuDrawSts .MACRO
    lda memMapPpuDrawSts
    .ENDM
