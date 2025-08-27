; SpaceFn 実装
SpaceFnMode := false, SpaceAny := false, SpaceDownTime := 0
SpaceMaxTime := 300
isJIS := (GetKeySC("¥") == "07D") ; JISキーボード判定

*Space:: {
    global
    if !SpaceFnMode
        SpaceDownTime := A_TickCount, SpaceFnMode := true
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

#HotIf SpaceFnMode ; SpaceFnモード時のみ有効


; --- ファンクションキー ---
*1:: sendSpaceAny("F1")
*2:: sendSpaceAny("F2")
*3:: sendSpaceAny("F3")
*4:: sendSpaceAny("F4")
*5:: sendSpaceAny("F5")
*6:: sendSpaceAny("F6")
*7:: sendSpaceAny("F7")
*8:: sendSpaceAny("F8")
*9:: sendSpaceAny("F9")
*0:: sendSpaceAny("F10")
*-:: sendSpaceAny("F11")
if (isJIS) {
    *^:: sendSpaceAny("F12")
}
else {
    *=:: sendSpaceAny("F12")
}

; --- QWERT ---
*q:: sendSpaceAnyC("&")
*w:: sendSpaceAnyC("|")
*e:: sendSpaceAnyC("!")
*r:: sendSpaceAnyC("/")
;*t:: sendSpaceAnyC("(")
+*q:: sendSpaceAnyC("$")
+*w:: sendSpaceAnyC("\")
+*e:: sendSpaceAnyC("?")
;+*r:: sendSpaceAnyC("/")
;+*t:: sendSpaceAnyC("¥")

; --- YUIOP ---
*y:: sendSpaceAny("ESC")
*u:: sendSpaceAny("Home")
*i:: sendSpaceAny("Up")
*o:: sendSpaceAny("End")
*p:: sendSpaceAny("Backspace")


; --- ASDFG ---
*a:: sendSpaceAnyC("+")
*s:: sendSpaceAnyC("-")
*d:: sendSpaceAnyC("*")
*f:: sendSpaceAnyC("/")
;*g:: sendSpaceAnyC("[")
+*a:: sendSpaceAnyC("#")
+*s:: sendSpaceAnyC("_")
+*d:: sendSpaceAnyC("^")
+*f:: sendSpaceAnyC("%")
;+*g:: sendSpaceAnyC("}")

; --- HJKL; ---
*h:: sendSpaceAny("Delete")
*j:: sendSpaceAny("Left")
*k:: sendSpaceAny("Down")
*l:: sendSpaceAny("Right")
*;:: sendSpaceAny("Enter")
;+*h:: sendSpaceAnyC("]")


; --- ZXCVB ---
*z:: sendSpaceAnyC("=")
*x:: sendSpaceAnyC(";")
*c:: sendSpaceAnyC(":")
*v:: sendSpaceAnyC("¥")
*b:: sendSpaceAnyC("@")
+*z:: sendSpaceAnyC("^")
+*x:: sendSpaceAnyC("%")
;+*c:: sendSpaceAnyC("%")
;+*v:: sendSpaceAnyC("¥")
;+*b:: sendSpaceAnyC("@")

; --- NM,./ ---
*n:: sendSpaceAnyC("[")
*m:: sendSpaceAnyC("]")
*,:: sendSpaceAnyC("(")
*.:: sendSpaceAnyC(")")
*/:: sendSpaceAnyC("'")
+*n:: sendSpaceAnyC("{")
+*m:: sendSpaceAnyC("}")
+*,:: sendSpaceAnyC("<")
+*.:: sendSpaceAnyC(">")
+*/:: sendSpaceAnyC("`"")


*ESC:: sendSpaceAnyC("``")
*Tab:: sendSpaceAny("Delete")
+*ESC:: sendSpaceAnyC("~")
;+*Tab:: sendSpaceAnyC("\")


; --- その他 ---
*[:: sendSpaceAny("Volume_Down")
*]:: sendSpaceAny("Volume_Up")
+*[:: sendSpaceAny("BROWSER_BACK")
+*]:: sendSpaceAny("BROWSER_FORWARD")
*Enter:: sendSpaceAny("WheelDown 4")
*BackSpace:: sendSpaceAny("WheelUp 4")
*\:: sendSpaceAny("Volume_Mute")
;+*\:: sendSpaceAnyC("Launch_Media")

*':: GUI_test() ; layer1.jpg
+*':: GUI_test(true) ; layer2.jpg


; --- NumPad ---
<!<^<#*n:: sendSpaceAnyC("Numpad0")
<!<^<#*m:: sendSpaceAnyC("Numpad1")
<!<^<#*,:: sendSpaceAnyC("Numpad2")
<!<^<#*.:: sendSpaceAnyC("Numpad3")
<!<^<#*j:: sendSpaceAnyC("Numpad4")
<!<^<#*k:: sendSpaceAnyC("Numpad5")
<!<^<#*l:: sendSpaceAnyC("Numpad6")
<!<^<#*u:: sendSpaceAnyC("Numpad7")
<!<^<#*i:: sendSpaceAnyC("Numpad8")
<!<^<#*o:: sendSpaceAnyC("Numpad9")
<!<^<#*/:: sendSpaceAnyC(".")
;<!<^<#*/:: sendSpaceAnyC("NumpadDot")
<!<^<#*h:: sendSpaceAnyC("=")
<!<^<#*;:: sendSpaceAnyC("NumpadEnter")
<!<^<#*Enter:: sendSpaceAnyC("NumpadEnter")
<!<^<#*p:: sendSpaceAnyC("Backspace")
<!<^<#*BackSpace:: sendSpaceAnyC("Backspace")
<!<^<#*Tab:: sendSpaceAnyC("NumpadDel")
;<!<^<#*c:: sendSpaceAnyC("NumpadClear")
<!<^<#*f:: sendSpaceAnyC("NumpadAdd")
<!<^<#*g:: sendSpaceAnyC("NumpadSub")
<!<^<#*v:: sendSpaceAnyC("NumpadMult")
<!<^<#*b:: sendSpaceAnyC("NumpadDiv")
<!<^<#*[:: sendSpaceAnyC("(")
<!<^<#*]:: sendSpaceAnyC(")")
<!<^<#*7:: sendSpaceAnyC("Left")
<!<^<#*8:: sendSpaceAnyC("Up")
<!<^<#*9:: sendSpaceAnyC("Down")
<!<^<#*0:: sendSpaceAnyC("Right")
<!<^<#*ESC:: sendSpaceAnyC("NumLock")


#HotIf

;#Include MyHotString.ahk
; #Include ForSplashtop.ahk
#Include TestGUI.ahk
#Include SCFn.ahk