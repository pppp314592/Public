; SpaceFn 実装
whenSpaceFn := false, spaceFnTriggered := false, altSpace := false, SpaceDownTime := 0
isJIS := (GetKeySC("¥") == "07D") ; JISキーボードかどうかを判定

; Alt + Space では通常の Alt + Space 動作にする
~!Space:: global altSpace := true
; SpaceFnモードが有効でない場合は、Spaceを押したときにSpaceFnモードを有効化
*Space:: {
    global
    if !whenSpaceFn
        SpaceDownTime := A_TickCount
    whenSpaceFn := true
}
*Space up:: {
    global
    ; Alt + Space では通常の Alt + Space 動作にする
    if altSpace {
        altSpace := false
        Return
    }
    if !spaceFnTriggered
        ; Space 1000msec以内の単体押しの場合は通常の Space 動作
        if (A_TickCount - SpaceDownTime < 1000)
            Send "{Blind}{Space}"
        else
            while (A_TimeIdlePhysical < 60)  ; スペースとコンビネーションキーがほぼ同時に離れた際の判定バッファ
                Sleep 10
    ToolTip ""

    whenSpaceFn := false, altSpace := false, spaceFnTriggered := false
}
sendKeyWithSpaceFn(key) {
    global
    spaceFnTriggered := true
    SendEvent "{Blind}{" key "}"
}


#HotIf whenSpaceFn ; SpaceFnモードが有効なときのみ以下のホットキーを有効化

*j:: sendKeyWithSpaceFn("Left")
*k:: sendKeyWithSpaceFn("Down")
*l:: sendKeyWithSpaceFn("Right")
*i:: sendKeyWithSpaceFn("Up")
*u:: sendKeyWithSpaceFn("Home")
*o:: sendKeyWithSpaceFn("End")
*n:: sendKeyWithSpaceFn("Delete")
*m:: sendKeyWithSpaceFn("PgUp")
*.:: sendKeyWithSpaceFn("PgDn")
*,:: sendKeyWithSpaceFn("PrintScreen")

*g:: sendKeyWithSpaceFn("BROWSER_FORWARD")
*h:: sendKeyWithSpaceFn("BROWSER_BACK")

*;:: sendKeyWithSpaceFn("Enter")
*p:: sendKeyWithSpaceFn("Backspace")

*1:: sendKeyWithSpaceFn("F1")
*2:: sendKeyWithSpaceFn("F2")
*3:: sendKeyWithSpaceFn("F3")
*4:: sendKeyWithSpaceFn("F4")
*5:: sendKeyWithSpaceFn("F5")
*6:: sendKeyWithSpaceFn("F6")
*7:: sendKeyWithSpaceFn("F7")
*8:: sendKeyWithSpaceFn("F8")
*9:: sendKeyWithSpaceFn("F9")
*0:: sendKeyWithSpaceFn("F10")
*-:: sendKeyWithSpaceFn("F11")
if (isJIS) {
    *^:: sendKeyWithSpaceFn("F12") ; JISキーボードでは ^ キーが F12
}
else {
    *=:: sendKeyWithSpaceFn("F12") ; USキーボードでは + キーが F11
}
; *Esc:: sendKeyWithSpaceFn("vkF3sc029") ; Esc → Escape

*q:: sendKeyWithSpaceFn("+")
*a:: sendKeyWithSpaceFn("-")
*z:: sendKeyWithSpaceFn("=")
*x:: sendKeyWithSpaceFn("*")

*w:: sendKeyWithSpaceFn("(")
*s:: sendKeyWithSpaceFn(")")
*e:: sendKeyWithSpaceFn("{")
*d:: sendKeyWithSpaceFn("}")
*r:: sendKeyWithSpaceFn("[")
*f:: sendKeyWithSpaceFn("]")

*[:: sendKeyWithSpaceFn("Volume_Up")    ; [ → 音量アップ
*]:: sendKeyWithSpaceFn("Volume_Down")  ; ] → 音量ダウン

*y:: sendKeyWithSpaceFn("ESC")        ; y → Esc


;  *Esc:: sendKeyWithSpaceFn("vk1C") ; Esc → IME切り替え（vk1CはIMEのオン/オフ）
; *sc029:: sendKeyWithSpaceFn("Volume_Mute") ; ;キー → ミュート

#HotIf


;HotStrignの設定
#Hotstring EndChars `n`t
#Hotstring OC*?

::jjk:::
::jjm::-
::jja::@
::jjb::\
::jjs::/
::jjc::^
::jjd::"
::jjq::'
::jjp:: {
    SendText("+")
}