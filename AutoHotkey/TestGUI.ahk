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