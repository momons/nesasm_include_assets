; ------------------------
; メモリマップ
; 各ファイルでも使用しているので
; 必ず最初にincludeしなければいけない
; ------------------------

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

; DMA転送
memMapDma = $4014

; コントローラ P1
memMapKeypadP1 = $4016
; コントローラ P2
memMapKeypadP2 = $4017

