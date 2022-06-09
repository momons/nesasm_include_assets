; ------------------------
; PPUアドレスの定義
; ------------------------

; パターンテーブル0 (ROMから読み込まれる)
ppuAddPatternTable0 = $0000
; パターンテーブル1 (ROMから読み込まれる)
ppuAddPatternTable1 = $1000

; 画面0のネームテーブル
ppuAddBgNameTable0 = $2000
; 画面0の属性テーブル
ppuAddBgAttrTable0 = $23C0
; 画面1のネームテーブル
ppuAddBgNameTable1 = $2400
; 画面1の属性テーブル
ppuAddBgAttrTable1 = $27C0
; 画面2のネームテーブル
ppuAddBgNameTable2 = $2800
; 画面2の属性テーブル
ppuAddBgAttrTable2 = $2BC0
; 画面3のネームテーブル
ppuAddBgNameTable3 = $2C00
; 画面3の属性テーブル
ppuAddBgAttrTable3 = $2FC0

; BGパレットテーブルアドレス
ppuAddPalletBg = $3f00
; スプライトパレットテーブルアドレス
ppuAddPalletSp = $3f10
