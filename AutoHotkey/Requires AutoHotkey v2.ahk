#Requires AutoHotkey v2.0

; 定数定義
OVERLAY_WIDTH := 240       ; オーバーレイの幅
OVERLAY_HEIGHT := 60       ; オーバーレイの高さ
OVERLAY_BG_NORMAL := "303030"  ; 通常モード時の背景色（暗めのグレー）
OVERLAY_BG_INSERT := "304030"  ; 挿入モード時の背景色（暗めの緑グレー）
OVERLAY_OPACITY := 180      ; 透明度 (0-255, 0が完全不透明)
OVERLAY_FONT := "s16 bold" ; オーバーレイのフォントスタイル
OVERLAY_FONT_FACE := "Arial" ; オーバーレイのフォント
OVERLAY_TEXT_COLOR := "FFFFFF" ; テキストの色（白）
DISPLAY_TIME := 1000       ; オーバーレイの表示時間（ミリ秒）
FADE_STEP := 20           ; フェードアウト時の透明度減少ステップ
FADE_INTERVAL := 5       ; フェードアウトの更新間隔（ミリ秒）
INSERT_MODE_TEXT := "INSERT MODE" ; 挿入モード時の表示テキスト
NORMAL_MODE_TEXT := "NORMAL MODE" ; 通常モード時の表示テキスト

; Caps Lockの標準機能を無効化
SetCapsLockState "AlwaysOff"

; オーバーレイウィンドウの初期化
class ModeOverlay {
    static gui := ""
    static textControl := ""
    static displayTimer := 0
    static fadeTimer := 0
    static currentOpacity := OVERLAY_OPACITY
    
    ; オーバーレイウィンドウの初期化
    static Init() {
        this.gui := Gui("+AlwaysOnTop -Caption +ToolWindow +E0x20")
        this.gui.BackColor := OVERLAY_BG_NORMAL
        ; フォントのパディングを設定（垂直方向のオフセットを追加）
        this.gui.SetFont(OVERLAY_FONT " c" OVERLAY_TEXT_COLOR, OVERLAY_FONT_FACE)
        ; テキストコントロールをGUI全体に広げて中央揃えにする
        ; 0x1: SS_CENTER - テキストを水平方向に中央揃え
        ; 0x200: SS_CENTERIMAGE - テキストを垂直方向に中央揃え
        ; 合計: 0x201 - 完全に中央揃え
        ; y2に設定して少し下方向に調整
        this.textControl := this.gui.Add("Text", "x0 y2 w" OVERLAY_WIDTH " h" OVERLAY_HEIGHT-4 " +0x201 Center", "")
        
        ; ウィンドウの透明度を設定
        WinSetTransparent(OVERLAY_OPACITY, this.gui)
    }
    
    ; オーバーレイを表示
    static Show(text, isInsertMode := false) {
        ; 透明度を初期値に戻す
        this.currentOpacity := OVERLAY_OPACITY
        
        ; フェードタイマーが動いていれば停止
        if this.fadeTimer
            SetTimer(this.fadeTimer, 0)
            
        ; 既存の表示タイマーをクリア
        if this.displayTimer
            SetTimer(this.displayTimer, 0)
        
        ; モードに応じて背景色を変更
        this.gui.BackColor := isInsertMode ? OVERLAY_BG_INSERT : OVERLAY_BG_NORMAL
        
        ; アクティブなウィンドウが属するモニターの中央に表示
        monitorRect := this.GetActiveMonitorRect()
        
        ; モニターの中央座標を計算
        x := monitorRect.left + (monitorRect.right - monitorRect.left) // 2 - OVERLAY_WIDTH // 2
        y := monitorRect.top + (monitorRect.bottom - monitorRect.top) // 2 - OVERLAY_HEIGHT // 2
        
        ; テキスト設定（上下中央に表示されるように垂直センタリングを追加）
        this.textControl.Value := text
        
        ; オーバーレイを表示
        this.gui.Show("x" x " y" y " w" OVERLAY_WIDTH " h" OVERLAY_HEIGHT " NoActivate")
        
        ; 透明度を再設定（色が変わった後にも透明度を維持するため）
        WinSetTransparent(OVERLAY_OPACITY, this.gui)
        
        ; 指定時間後にフェードアウト開始
        this.displayTimer := ObjBindMethod(this, "StartFadeOut")
        SetTimer(this.displayTimer, -DISPLAY_TIME)
    }
    
    ; フェードアウト開始
    static StartFadeOut() {
        this.fadeTimer := ObjBindMethod(this, "FadeStep")
        SetTimer(this.fadeTimer, FADE_INTERVAL)
    }
    
    ; フェードアウトのステップ処理
    static FadeStep() {
        ; 透明度を減少
        this.currentOpacity -= FADE_STEP
        
        ; 透明度が0以下になったら非表示にして終了
        if (this.currentOpacity <= 0) {
            SetTimer(this.fadeTimer, 0)
            this.gui.Hide()
            this.currentOpacity := OVERLAY_OPACITY
            return
        }
        
        ; 透明度を適用
        WinSetTransparent(this.currentOpacity, this.gui)
    }
    
    ; オーバーレイを即時非表示（フェードなし）
    static Hide() {
        ; フェードタイマーが動いていれば停止
        if this.fadeTimer
            SetTimer(this.fadeTimer, 0)
            
        this.gui.Hide()
        this.currentOpacity := OVERLAY_OPACITY
    }
    
    ; アクティブなモニターの領域を取得
    static GetActiveMonitorRect() {
        ; アクティブなウィンドウの情報を取得
        activeWin := WinGetID("A")
        
        ; アクティブなウィンドウが属するモニターのハンドルを取得
        ; MONITOR_DEFAULTTONEAREST = 2
        activeMonitor := DllCall("MonitorFromWindow", "Ptr", activeWin, "UInt", 2)
        
        ; MONITORINFO構造体を作成（40バイト: サイズ(4) + RECT(16) + RECT(16) + フラグ(4)）
        monitorInfo := Buffer(40, 0)
        NumPut("UInt", 40, monitorInfo, 0)  ; 構造体のサイズを設定
        
        ; モニター情報を取得
        DllCall("GetMonitorInfo", "Ptr", activeMonitor, "Ptr", monitorInfo)
        
        ; モニターの作業領域（タスクバーを除いた領域）を取得
        return {
            left: NumGet(monitorInfo, 20, "Int"),
            top: NumGet(monitorInfo, 24, "Int"),
            right: NumGet(monitorInfo, 28, "Int"),
            bottom: NumGet(monitorInfo, 32, "Int")
        }
    }
}

; オーバーレイを初期化
ModeOverlay.Init()

; モード管理クラス
class InputModeManager {
    static isInsertMode := true
    
    ; モードを切り替え
    static ToggleMode() {
        this.isInsertMode := !this.isInsertMode
        
        if this.isInsertMode {
            ModeOverlay.Show(INSERT_MODE_TEXT, false)
            SetCapsLockState "off"
        } else {
            ModeOverlay.Show(NORMAL_MODE_TEXT, true)
            SetCapsLockState "on"
        }
    }
}

; Caps Lockキーのホットキー設定
CapsLock::InputModeManager.ToggleMode()
