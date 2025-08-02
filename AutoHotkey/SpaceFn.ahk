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
    ; Alt + Space の場合は通常の Alt + Space 動作にする
    if altSpace {
        altSpace := false
        Return
    }
    if !spaceFnTriggered
        ; Space を1000msec以内に単独で押した場合は通常の Space 動作
        if (A_TickCount - SpaceDownTime < 1000)
            Send "{Blind}{Space}"
        else
            while (A_TimeIdlePhysical < 60)  ; スペースと他キーがほぼ同時に離れた場合の判定バッファ
                Sleep 10
    ToolTip ""

    whenSpaceFn := false, altSpace := false, spaceFnTriggered := false
}
sendKeyWithSpaceFn(key) {
    global spaceFnTriggered := true
    SendEvent "{Blind}{" key "}"
}

#HotIf whenSpaceFn ; SpaceFnモードが有効なときのみ以下のホットキーを有効化

*j:: sendKeyWithSpaceFn("Left")         ; j → 左矢印
*k:: sendKeyWithSpaceFn("Down")         ; k → 下矢印
*l:: sendKeyWithSpaceFn("Right")        ; l → 右矢印
*i:: sendKeyWithSpaceFn("Up")           ; i → 上矢印
*u:: sendKeyWithSpaceFn("Home")         ; u → Home
*o:: sendKeyWithSpaceFn("End")          ; o → End
*n:: sendKeyWithSpaceFn("Delete")       ; n → Delete
*m:: sendKeyWithSpaceFn("PgUp")         ; m → PageUp
*.:: sendKeyWithSpaceFn("PgDn")         ; . → PageDown
*,:: sendKeyWithSpaceFn("PrintScreen")  ; , → PrintScreen

*g:: sendKeyWithSpaceFn("BROWSER_FORWARD") ; g → ブラウザ進む
*h:: sendKeyWithSpaceFn("BROWSER_BACK")    ; h → ブラウザ戻る

*;:: sendKeyWithSpaceFn("Enter")        ; ; → Enter
*p:: sendKeyWithSpaceFn("Backspace")    ; p → Backspace

*1:: sendKeyWithSpaceFn("F1")           ; 1 → F1
*2:: sendKeyWithSpaceFn("F2")           ; 2 → F2
*3:: sendKeyWithSpaceFn("F3")           ; 3 → F3
*4:: sendKeyWithSpaceFn("F4")           ; 4 → F4
*5:: sendKeyWithSpaceFn("F5")           ; 5 → F5
*6:: sendKeyWithSpaceFn("F6")           ; 6 → F6
*7:: sendKeyWithSpaceFn("F7")           ; 7 → F7
*8:: sendKeyWithSpaceFn("F8")           ; 8 → F8
*9:: sendKeyWithSpaceFn("F9")           ; 9 → F9
*0:: sendKeyWithSpaceFn("F10")          ; 0 → F10
*-:: sendKeyWithSpaceFn("F11")          ; - → F11
if (isJIS) {
    *^:: sendKeyWithSpaceFn("F12")      ; JISキーボードでは ^ キーが F12
}
else {
    *=:: sendKeyWithSpaceFn("F12")      ; USキーボードでは = キーが F12
}
; *Esc:: sendKeyWithSpaceFn("vkF3sc029") ; Esc → Escape

*q:: sendKeyWithSpaceFn("+")            ; q → +
*a:: sendKeyWithSpaceFn("-")            ; a → -
*z:: sendKeyWithSpaceFn("=")            ; z → =
*x:: sendKeyWithSpaceFn("*")            ; x → *
*c:: sendKeyWithSpaceFn("'")            ; c → '
*v:: sendKeyWithSpaceFn("`"")           ; v → "

*w:: sendKeyWithSpaceFn("(")            ; w → (
*s:: sendKeyWithSpaceFn(")")            ; s → )
*e:: sendKeyWithSpaceFn("{")            ; e → {
*d:: sendKeyWithSpaceFn("}")            ; d → }
*r:: sendKeyWithSpaceFn("[")            ; r → [
*f:: sendKeyWithSpaceFn("]")            ; f → ]

*[:: sendKeyWithSpaceFn("Volume_Up")    ; [ → 音量アップ
*]:: sendKeyWithSpaceFn("Volume_Down")  ; ] → 音量ダウン

*y:: sendKeyWithSpaceFn("ESC")          ; y → Esc


;  *Esc:: sendKeyWithSpaceFn("vk1C") ; Esc → IME切り替え（vk1CはIMEのオン/オフ）
; *sc029:: sendKeyWithSpaceFn("Volume_Mute") ; ;キー → ミュート

#HotIf


;HotStringの設定
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
::jjt:: {
    SendText("``")
}
::jjp:: {
    SendText("+")
}