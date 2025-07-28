#Requires AutoHotkey v2.0

; 管理者権限で再起動（必要なら）
if !A_IsAdmin {
    Run '*RunAs "' A_ScriptFullPath '"'
    ExitApp
}

lastWinID := ""

SetTimer(CheckActiveWindow, 300)

CheckActiveWindow() {
    global lastWinID

    currentWinID := WinExist("A")
    if (currentWinID != lastWinID) {
        lastWinID := currentWinID

        mx := 0, my := 0
        MouseGetPos(&mx, &my)

        monitorCount := SysGet(80) ; モニター数
        loop monitorCount {
            monitorIndex := A_Index
            MonitorGetWorkArea(monitorIndex, &left, &top, &right, &bottom)

            if (mx >= left && mx <= right && my >= top && my <= bottom) {
                ; ウィンドウが存在するか確認
                if WinExist("ahk_id " . currentWinID) {
                    WinRestore(currentWinID)

                    ; ウィンドウサイズ取得
                    WinGetPos(&wx, &wy, &ww, &wh, currentWinID)

                    ; 中央座標計算
                    centerX := left + ((right - left - ww) // 2)
                    centerY := top + ((bottom - top - wh) // 2)

                    ; 中央に移動
                    WinMove(currentWinID, centerX, centerY)
                }
                break
            }
        }
    }
}

; 常駐ループ（任意）
Loop {
    Sleep(1000)
}