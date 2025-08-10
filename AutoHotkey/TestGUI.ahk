GUI_test(isShift := false) {
    ; GUIの初期化
    If WinExist("AHK Menu")
    {
        WinActivate
        return
    }

    MyGui := Gui(, "AHK Menu")
    if (isShift) {
        MyGui.Add("Pic", , "htmleditor/layer2.jpg")
    } else {
        MyGui.Add("Pic", , "htmleditor/layer1.jpg")
    }
    MyGui.OnEvent("Escape", CloseWindow) ; [ESC] キーで閉じる
    CloseWindow(*)
    {
        MyGui.Destroy()
    }
    MyGui.Show()
}


; GUI_menu()
; {
;     If WinExist("AHK Menu")
;     {
;         WinActivate
;         return
;     }

;     MyGui := Gui(, "AHK Menu")

;     MyGui.BackColor := "00EE99"  ; RGB color
;     MyGui.SetFont("s12")  ; フォントサイズ(ポイント)を設定

;     MyGui.Add("Button", " default", "Obsidian").OnEvent("Click", Obsidian_click) ;
;     MyGui.Add("Button", " x+8", "Date").OnEvent("Click", Date_click) ;
;     MyGui.Add("Button", " x+8", "Time").OnEvent("Click", Time_click) ;
;     MyGui.Add("Button", " X+8 ", "-").OnEvent("Click", Add_item_click) ;
;     MyGui.Add("Button", " X+8 ", "- [ ] ").OnEvent("Click", Add_checkitem_click) ;

;     MyGui.Add("Button", " x16 y+20", "Google").OnEvent("Click", Chrome_click) ;
;     MyGui.Add("Button", " x+20", "Chrome URL get").OnEvent("Click", Chrome_get_click) ;

;     MyGui.Add("Button", " x16 y+20", "Gmail").OnEvent("Click", Gmail_click) ;
;     MyGui.Add("Button", " x+20", "Calendar").OnEvent("Click", Gcalendar_click) ;

;     MyGui.Add("Button", " X16 y+20", "Edit Autohotkey ").OnEvent("Click", Edit_ahk_click) ;
;     MyGui.Add("Button", " x+8", "Edit ahk GUI").OnEvent("Click", Edit_ahk_gui_click) ;
;     MyGui.Add("Button", " x+8", "Reload AHK").OnEvent("Click", Reload_ahk_click) ;

;     ;--------
;     MyGui.Add("Button", " X16 y+40", "←").OnEvent("Click", Arrow_Left) ;
;     MyGui.Add("Button", " X+8 ", "↓").OnEvent("Click", Arrow_Down) ;
;     MyGui.Add("Button", " X+8 ", "↑").OnEvent("Click", Arrow_Up) ;
;     MyGui.Add("Button", " X+8 ", "→").OnEvent("Click", Arrow_Right) ;
;     MyGui.Add("Button", " X+20 ", "^{Home}").OnEvent("Click", Goto_Head) ;
;     MyGui.Add("Button", " X+8 ", "^{End}").OnEvent("Click", Goto_Tail) ;
;     MyGui.Add("Button", " X+8 ", "BS").OnEvent("Click", Back_space) ;Z

;     MyGui.Add("Button", " X16 y+40 ", "SPC").OnEvent("Click", Hankaku_space) ;
;     MyGui.Add("Button", " X+8 ", "全角空白　").OnEvent("Click", Zenkaku_space) ;
;     MyGui.Add("Button", " X+8 ", "Tab").OnEvent("Click", Tab_space) ;
;     MyGui.Add("Button", " X+8 ", "Enter").OnEvent("Click", Enter) ;

;     MyGui.Add("Button", " x16 y+40", "Win+Shift+s").OnEvent("Click", Capture_click) ;
;     MyGui.Add("Button", " x+8", "Win+PrtScn(全画面cap)").OnEvent("Click", FullCapture_click) ;

;     MyGui.Add("Button", " X16 y+40", "1").OnEvent("Click", Win_1) ;
;     MyGui.Add("Button", " X+8 ", "2").OnEvent("Click", Win_2) ;
;     MyGui.Add("Button", " X+8 ", "3").OnEvent("Click", Win_3) ;
;     MyGui.Add("Button", " X+8 ", "4").OnEvent("Click", Win_4) ;
;     MyGui.Add("Button", " X+20 ", "Win+Tab").OnEvent("Click", Win_Tab) ;

;     MyGui.Add("Button", "      y+40 cRed", "Task Mgr").OnEvent("Click", TaskManager_click) ;
;     MyGui.Add("Button", " x+16 cRed", "Shutdown").OnEvent("Click", Shutdown_click) ;

;     Aaa := WinActive("A")
;     if (Aaa != 0) {
;         Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;     } else {
;         Title := "no active"
;     }
;     MyGui.Add("Text", " x16 y+20", Title)

;     MyGui.OnEvent("Escape", CloseWindow) ; [ESC] キーで閉じる
;     MyGui.OnEvent("Close", CloseWindow) ; X で閉じる

;     ;SetTimer(UpdateMenu, 5000) ;5秒後にメニューを閉じる (2024-06-23 add ;)
;     MyGui.Show("x1800 y100")

;     ;--------------------
;     UpdateMenu(*)
;     {
;         CloseWindow()
;     }
;     ;---MyGui を閉じる関数-----
;     CloseWindow(*)
;     {
;         SetTimer(UpdateMenu, 0)
;         Sleep(100)
;         MyGui.Destroy()
;     }
;     ;--------------------
;     Date_click(*)
;     {
;         MyGui.Destroy()
;         ;IME_set(0)
;         now := FormatTime(, "yyyy-MM-dd")
;         Sleep(100)
;         Send(now)
;         Send(A_Space)
;     }

;     Time_click(*)
;     {
;         MyGui.Destroy()
;         ;IME_set(0)
;         now := FormatTime(, "HH:mm")
;         Sleep(100)
;         Send(now)
;         Send(A_Space)
;     }

;     Edit_ahk_click(*)
;     {
;         MyGui.Destroy()
;         Run("notepad++.exe `"" A_ScriptDir "\AutoHotkey_V2.ahk`"") ;このスクリプトを編集
;     }

;     Edit_ahk_gui_click(*)
;     {
;         MyGui.Destroy()
;         Run("notepad++.exe `"" A_ScriptDir "\GUI.ahk`"") ;このスクリプトを編集
;     }

;     Reload_ahk_click(*)
;     {
;         msg := "`"Reload Autohotkey `""
;         ToolTip(msg)
;         Sleep(500)
;         ToolTip()
;         Reload()    ;このスクリプトをリロードして適用
;         return
;     }

;     Chrome_click(*)
;     {
;         MyGui.Destroy()
;         func_chrome_open()
;     }

;     Chrome_get_click(*)
;     {
;         MyGui.Destroy()
;         func_chrome_capture()
;     }

;     Capture_click(*)
;     {
;         MyGui.Destroy()
;         Send "#+s"  ; Win+Shift+s
;     }

;     FullCapture_click(*)
;     {
;         MyGui.Destroy()
;         Sleep(1000)
;         Send("#{PrintScreen}")
;         Sleep(1000)
;         Run("C:\Users\xxxxxxxx\Pictures\Screenshots")   ; xxxxxxx -> User名  キャプチャした画像のFolderを開く（最新ファイル順に並べてあるとすぐアクセスできる)
;         return
;     }

;     Gmail_click(*)
;     {
;         MyGui.Destroy()
;         browser := "C:\Program Files\Google\Chrome\Application\chrome.exe --disk-cache-dir=R:\Temp"
;         Run(browser " `"https://mail.google.com/mail/u/0/#inbox`"")
;     }

;     Gcalendar_click(*)
;     {
;         MyGui.Destroy()
;         browser := "C:\Program Files\Google\Chrome\Application\chrome.exe --disk-cache-dir=R:\Temp"
;         Run(browser " `"https://calendar.google.com/calendar/u/0/r?pli=1`"")
;     }


;     Obsidian_Click(*)
;     {
;         MyGui.Destroy()
;         func_obsidian()
;     }

;     Add_item_click(*)
;     {
;         MyGui.Destroy()
;         Sleep(50)
;         Send "- "           ; 行末へ移動
;     }
;     Add_checkitem_click(*)
;     {
;         MyGui.Destroy()
;         Sleep(50)
;         Send "- [ ] "           ; 行末へ移動
;     }

;     ;---画面リストアする(またメニューを表示する)-----
;     Arrow_Left(*)
;     {
;         MyGui.Hide()    ; メニュー消す (アクティブがエディタ画面に)
;         Sleep(50)       ; ちょっと待つ（速すぎるとアクティブが切り替わらない）
;         Send "{Left}"   ; ←移動
;         Sleep(50)       ; ちょっと待つ
;         Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         MyGui.Restore() ; Guiメニューを表示する
;         ;SetTimer(UpdateMenu, 5000)
;     }
;     Arrow_Right(*)
;     {
;         MyGui.Hide()
;         Sleep(50)
;         Send "{Right}"          ; →移動
;         Sleep(50)
;         Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         MyGui.Restore() ; Gui を表示する
;         ;SetTimer(UpdateMenu, 5000)
;     }
;     Arrow_Down(*)
;     {
;         MyGui.Hide()
;         Sleep(50)
;         Send "{Down}"           ; ↓移動
;         Sleep(50)
;         Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         MyGui.Restore() ; Gui を表示する
;         ;SetTimer(UpdateMenu, 5000)
;     }
;     Arrow_Up(*)
;     {
;         MyGui.Hide()
;         Sleep(50)
;         Send "{Up}"         ; ↑移動
;         Sleep(50)
;         Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         MyGui.Restore() ; Gui を表示する
;         ;SetTimer(UpdateMenu, 5000)
;     }
;     Goto_Head(*)
;     {
;         MyGui.Hide()
;         Sleep(50)
;         Send "^{Home}"  ; 先頭へ移動
;         Sleep(100)
;         Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         MyGui.show() ; Gui を表示する
;         ;SetTimer(UpdateMenu, 5000)
;     }
;     Goto_Tail(*)
;     {
;         MyGui.Hide()
;         Sleep(50)
;         Send "^{End}"           ; 末尾へ移動
;         Sleep(100)
;         Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         MyGui.show() ; Gui を表示する
;         ;SetTimer(UpdateMenu, 5000)
;     }

;     Zenkaku_space(*)
;     {
;         MyGui.Hide()
;         Sleep(50)
;         Send "　"
;         Sleep(100)
;         Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         MyGui.show() ; Gui を表示する
;         ;SetTimer(UpdateMenu, 5000)
;     }

;     Hankaku_space(*)
;     {
;         MyGui.Hide()
;         Sleep(50)
;         Send " "
;         Sleep(100)
;         Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         MyGui.show() ; Gui を表示する
;         ;SetTimer(UpdateMenu, 5000)
;     }

;     Enter(*)
;     {
;         MyGui.Hide()
;         Sleep(50)
;         Send("{Enter}")
;         Sleep(100)
;         Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         MyGui.show() ; Gui を表示する
;         ;SetTimer(UpdateMenu, 5000)
;     }

;     Tab_space(*)
;     {
;         MyGui.Hide()
;         Sleep(50)
;         Send("{Tab}")
;         Sleep(100)
;         Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         MyGui.show() ; Gui を表示する
;         ;SetTimer(UpdateMenu, 5000)
;     }

;     Back_space(*)
;     {
;         MyGui.Hide()
;         Sleep(50)
;         Send("{BS}")
;         Sleep(100)
;         Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         MyGui.show() ; Gui を表示する
;         ;SetTimer(UpdateMenu, 5000)
;     }

;     ;---画面リストアする(またメニューを表示する)-----
;     Win_1(*)
;     {
;         MyGui.Hide()    ; メニュー消す (アクティブがエディタ画面に)
;         ;       Sleep(50)       ; ちょっと待つ（速すぎるとアクティブが切り替わらない）
;         Send("#^{Left}#^{Left}#^{Left}")
;         ;       Sleep(50)       ; ちょっと待つ
;         ;       Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         ;       MyGui.Restore() ; Guiメニューを表示する
;         ;       SetTimer(UpdateMenu, 5000)
;     }
;     Win_2(*)
;     {
;         ;       MyGui.Hide()    ; メニュー消す (アクティブがエディタ画面に)
;         Sleep(50)       ; ちょっと待つ（速すぎるとアクティブが切り替わらない）
;         Send("#^{Left}#^{Left}#^{Left}#^{Right}")
;         ;       Sleep(50)       ; ちょっと待つ
;         ;       Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         ;       MyGui.Restore() ; Guiメニューを表示する
;         ;       SetTimer(UpdateMenu, 5000)
;     }
;     Win_3(*)
;     {
;         ;       MyGui.Hide()    ; メニュー消す (アクティブがエディタ画面に)
;         Sleep(50)       ; ちょっと待つ（速すぎるとアクティブが切り替わらない）
;         Send("#^{Right}#^{Right}#^{Right}#^{Left}")
;         ;       Sleep(50)       ; ちょっと待つ
;         ;       Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         ;       MyGui.Restore() ; Guiメニューを表示する
;         ;       SetTimer(UpdateMenu, 5000)
;     }
;     Win_4(*)
;     {
;         ;       MyGui.Hide()    ; メニュー消す (アクティブがエディタ画面に)
;         Sleep(50)       ; ちょっと待つ（速すぎるとアクティブが切り替わらない）
;         Send("#^{Right}#^{Right}#^{Right}")
;         ;       Sleep(50)       ; ちょっと待つ
;         ;       Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         ;       MyGui.Restore() ; Guiメニューを表示する
;         ;       SetTimer(UpdateMenu, 5000)
;     }
;     Win_Tab(*)
;     {
;         MyGui.Hide()    ; メニュー消す (アクティブがエディタ画面に)
;         Sleep(50)       ; ちょっと待つ（速すぎるとアクティブが切り替わらない）
;         Send("#{Tab}")
;         ;       Sleep(50)       ; ちょっと待つ
;         ;       Title := WinGetTitle("A")   ;アクティブ タイトル名を取得し Title へ格納
;         ;       MyGui.Restore() ; Guiメニューを表示する
;         ;       SetTimer(UpdateMenu, 5000)
;     }

;     TaskManager_Click(*)
;     {
;         MyGui.Destroy()
;         Run("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\Task Manager.lnk")
;     }

;     Shutdown_click(*)
;     {
;         MyGui.Destroy()
;         func_shutdown()
;     }

; }

; func_shutdown()
; {
;     MyGui := Gui(, "Shutdown")
;     MyGui.BackColor := "FF0000"  ; 赤
;     MyGui.SetFont("s32")  ; 大きなフォント
;     MyGui.Add("Text", , "Shutdown")
;     MyGui.Add("Button", " default", "OK").OnEvent("Click", OK_click) ; ;
;     MyGui.OnEvent("Escape", CloseWindow) ; [ESC]でダイアログを閉じる
;     MyGui.show() ; Gui を表示する

;     OK_Click(*)
;     {
;         Run("C:\Windows\system32\shutdown.exe /s /f /t 0")
;         return
;     }
;     CloseWindow(*)
;     {
;         MyGui.Destroy()
;     }
; }
