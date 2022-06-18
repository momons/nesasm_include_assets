; ------------------------
; メモリマップ、bankの定義
; 各ファイルでも使用しているので
; 必ず最初にincludeしなければいけない
; ------------------------

; プログラム領域
bankProgram = 0
; 割り込み領域
bankInterrupt = 1
; VRAM領域
bankVram = 2

; PPUの基本設定
memMapPpuBasicSet = $2000
; 画面表示の設定
memMapPpuMaskSet = $2001
; 画面描画の状態取得
memMapPpuDrawSts = $2002

; OAMアクセス先指定
memMapOamAddr = $2003
; OAM入出力
memMapOamData = $2004
; BGのスクリーン表示位置の設定
memMapBgPosition = $2005
; アクセスするPPUアドレスを指定
memMapPpuAdd = $2006
; PPUからデータをアクセスする
memMapPpuData = $2007

; 矩形波CH1制御レジスタ1(音の減衰を設定)
memMapSqWvCh1Ctl1 = $4000
; 矩形波CH1制御レジスタ2(音の変化を設定)
memMapSqWvCh1Ctl2 = $4001
; 矩形波CH1周波数値レジスタ1(周波数下位8ビット)
memMapSqWvCh1Val1 = $4002
; 矩形波CH1周波数値レジスタ2(再生時間・周波数上位3ビット)
memMapSqWvCh1Val2 = $4003
; 矩形波CH2制御レジスタ1(音の減衰を設定)
memMapSqWvCh2Ctl1 = $4004
; 矩形波CH2制御レジスタ2(音の変化を設定)
memMapSqWvCh2Ctl2 = $4005
; 矩形波CH2周波数値レジスタ1(周波数下位8ビット)
memMapSqWvCh2Val1 = $4006
; 矩形波CH2周波数値レジスタ2(再生時間・周波数上位3ビット)
memMapSqWvCh2Val2 = $4007
; 三角波制御レジスタ(音を鳴らす長さを設定)
memMapTriWvCtl = $4008
; 三角波周波数値レジスタ1
memMapTriWvVal1 = $400a
; 三角波周波数値レジスタ2
memMapTriWvVal2 = $400b
; ノイズ制御レジスタ(音の減衰を設定)
memMapNoiseCtl = $400c
; ノイズ乱数レジスタ
memMapNoiseRnd = $400e
; ノイズ時間レジスタ
memMapNoiseTime = $400f
; DPCM制御レジスタ1
memMapDpcmCtl1 = $4010
; DPCM制御レジスタ2
memMapDpcmCtl2 = $4011
; DPCM制御レジスタ3
memMapDpcmCtl3 = $4012
; DPCM制御レジスタ4
memMapDpcmCtl4 = $4013
; 音声チャンネル制御レジスタ
memMapApuChCtl = $4015

; DMA転送
memMapDma = $4014

; コントローラ P1
memMapKeypadP1 = $4016
; コントローラ P2
memMapKeypadP2 = $4017

; 拡張メモリ (Mapper0では使用不可)
memMapExRam = $4020
; バッテリーバックアップRAM (Mapper0では使用不可)
memMapBackupRam = $6000

; プログラムROM LOW (ROMから読み込まれる)
memMapProgramRomLow = $8000
; プログラムROM HIGH (ROMから読み込まれる)
memMapProgramRomHigh = $c000

; 割り込みプログラム領域 (ROMから読み込まれる)
memMapInterrupt = $fffa

;==== 計算の作業領域(calculation)

; 16bit符号なし掛け算
memMapMul16LeftOpe = $01
memMapMul16RightOpe = $02
memMapMul16ResultUpper = $03
memMapMul16ResultLower = $04
memMapMul16LeftTempUpper = $05
memMapMul16LeftTempLower = $06
memMapMul16RightTemp = $07
; 8bit符号なし掛け算
memMapMul8LeftOpe = $01
memMapMul8RightOpe = $02
memMapMul8Result = $03
memMapMul8LeftTemp = $04
memMapMul8RightTemp = $05

; 16bit割り算
memMapDiv16LeftOpe = $00
memMapDiv16RightOpe = $01
memMapDiv16ResultUpper = $02
memMapDiv16ResultLower = $03
memMapDiv16LeftTempUpper = $04
memMapDiv16LeftTempLower = $05
memMapDiv16RightTemp = $06
; 8bit割り算
memMapDiv8LeftOpe = $01
memMapDiv8RightOpe = $02
memMapDiv8Result = $03
memMapDiv8Remainder = $04
memMapDiv8LeftTemp = $05
memMapDiv8RightTemp = $06
memMapDiv8Temp = $07

