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

; パターンテーブル0 (ROMから読み込まれる)
memMapPatternTable0 = $0000
; パターンテーブル1 (ROMから読み込まれる)
memMapPatternTable1 = $1000

; 画面0のネームテーブル
memMapBgNameTable0 = $2000
; 画面0の属性テーブル
memMapBgAttrTable0 = $23C0
; 画面1のネームテーブル
memMapBgNameTable1 = $2400
; 画面1の属性テーブル
memMapBgAttrTable1 = $27C0
; 画面2のネームテーブル
memMapBgNameTable2 = $2800
; 画面2の属性テーブル
memMapBgAttrTable2 = $2BC0
; 画面3のネームテーブル
memMapBgNameTable3 = $2C00
; 画面3の属性テーブル
memMapBgAttrTable3 = $2FC0

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

; BGパレットテーブルアドレス
memMapPalletBg = $3f00
; スプライトパレットテーブルアドレス
memMapPalletSp = $3f10

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
memMapAudioChCtl = $4015

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
