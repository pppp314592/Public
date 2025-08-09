; SpaceFn 実装
SpaceFnMode := false, SpaceAny := false, SpaceDownTime := 0
SpaceMaxTime := 300
isJIS := (GetKeySC("¥") == "07D") ; JISキーボードかどうかを判定

*Space:: {
    global
    if !SpaceFnMode {
        SpaceDownTime := A_TickCount
        SpaceFnMode := true
    }
}
*Space up:: {
    global
    if !SpaceAny && (A_TickCount - SpaceDownTime < SpaceMaxTime)
        Send "{Blind}{Space}"
    SpaceFnMode := false, SpaceAny := false
}
sendSpaceAny(key) {
    global SpaceAny := true
    SendEvent "{Blind}{" key "}"
}
sendSpaceAnyC(key) {
    global SpaceAny := true
    SendEvent "{" key "}"
}

#HotIf SpaceFnMode ; SpaceFnモードが有効なときのみ以下のホットキーを有効化

*j:: sendSpaceAny("Left")         ; j → 左矢印
*k:: sendSpaceAny("Down")         ; k → 下矢印
*l:: sendSpaceAny("Right")        ; l → 右矢印
*i:: sendSpaceAny("Up")           ; i → 上矢印
*u:: sendSpaceAny("Home")         ; u → Home
*o:: sendSpaceAny("End")          ; o → End
*n:: sendSpaceAny("Delete")       ; n → Delete
*,:: sendSpaceAny("PgUp")         ; m → PageUp
*.:: sendSpaceAny("PgDn")         ; . → PageDown
*;:: sendSpaceAny("Enter")        ; ; → Enter
*p:: sendSpaceAny("Backspace")    ; p → Backspace
*h:: sendSpaceAny("ESC")          ; y → Esc

*-:: sendSpaceAny("BROWSER_BACK") ; g → ブラウザ進む
if (isJIS) {
    *^:: sendSpaceAny("BROWSER_FORWARD")      ; JISキーボードでは ^ キーが F12
}
else {
    *=:: sendSpaceAny("BROWSER_FORWARD")      ; USキーボードでは = キーが F12
}

*y:: sendSpaceAny("vkF3sc029") ;  Esc → Escape
*m:: sendSpaceAny("vk1Csc079") ;  Esc → Escape
*/:: sendSpaceAny("vkF3sc029") ;  Esc → Escape

*1:: sendSpaceAny("F1")           ; 1 → F1
*2:: sendSpaceAny("F2")           ; 2 → F2
*3:: sendSpaceAny("F3")           ; 3 → F3
*4:: sendSpaceAny("F4")           ; 4 → F4
*5:: sendSpaceAny("F5")           ; 5 → F5
*6:: sendSpaceAny("F6")           ; 6 → F6
*7:: sendSpaceAny("F7")           ; 7 → F7
*8:: sendSpaceAny("F8")           ; 8 → F8
*9:: sendSpaceAny("F9")           ; 9 → F9
*0:: sendSpaceAny("F10")          ; 0 → F10
*ESC:: sendSpaceAnyC("F11")           ; v → "
*TAB:: sendSpaceAnyC("F12")           ; v → "

; *q:: sendSpaceAny("F11")          ; - → F11
; *w:: sendSpaceAny("F12")          ; - → F11

*a:: sendSpaceAnyC("+")            ; q → +
*s:: sendSpaceAnyC("-")            ; a → -
*z:: sendSpaceAnyC("=")            ; z → =
*x:: sendSpaceAnyC("*")            ; x → *
*q:: sendSpaceAnyC("&")            ; x → *
*w:: sendSpaceAnyC("|")            ; x → *

+*e:: sendSpaceAnyC("(")            ; w → (
+*r:: sendSpaceAnyC(")")            ; s → )　
+*d:: sendSpaceAnyC("{")            ; e → {
+*f:: sendSpaceAnyC("}")            ; d → }
+*c:: sendSpaceAnyC("[")            ; r → [
+*v:: sendSpaceAnyC("]")            ; f → ]

+*q:: sendSpaceAnyC("$")            ; c → <
+*w:: sendSpaceAnyC("%%")            ; v → >
+*a:: sendSpaceAnyC(":")            ; f → ]
+*s:: sendSpaceAnyC(";")            ; f → ]
+*z:: sendSpaceAnyC("'")            ; f → ]
+*x:: sendSpaceAnyC("`"")            ; f → ]

*d:: sendSpaceAnyC("^")            ; f → ]
*f:: sendSpaceAnyC("~")            ; f → ]
*g:: sendSpaceAnyC("``")            ; f → ]

*c:: sendSpaceAnyC("!")            ; f → ]
*v:: sendSpaceAnyC("?")            ; f → ]
*b:: sendSpaceAnyC("@")            ; f → ]

*e:: sendSpaceAnyC("/")           ; v → "
*r:: sendSpaceAnyC("\")           ; v → "
*t:: sendSpaceAnyC("¥")           ; v → "


*[:: sendSpaceAny("Volume_Down")    ; [ → 音量アップ
*]:: sendSpaceAny("Volume_Up")  ; ] → 音量ダウン
*Enter:: sendSpaceAny("WheelDown")  ; ] → 音量ダウン
*BackSpace:: sendSpaceAny("WheelUp")  ; ] → 音量ダウン

#HotIf

;#Include MyHotString.ahk
