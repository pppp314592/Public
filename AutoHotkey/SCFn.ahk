; SCFn 実装
SCFnMode := false, SCAny := false, SCDownTime := 0
SCeMaxTime := 300
isJIS := (GetKeySC("¥") == "07D") ; JISキーボード判定

*;:: {
    global
    if !SCFnMode
        SCDownTime := A_TickCount, SCFnMode := true
}
*; up:: {
    global
    if !SCAny && (A_TickCount - SCDownTime < SCeMaxTime)
        Send "{Blind}{;}"
    SCFnMode := false, SCAny := false
}
sendSCAny(key) {
    global SCAny := true
    SendEvent "{Blind}{" key "}"
}
sendSCAnyC(key) {
    global SCAny := true
    SendEvent "{" key "}"
}

#HotIf SCFnMode ; SCFnモード時のみ有効


; --- ファンクションキー ---

; --- QWERT ---
*q:: sendSCAnyC("&")
*w:: sendSCAnyC("|")
*e:: sendSCAnyC("!")
*r:: sendSCAnyC("=")
*t:: sendSCAnyC("$")

; --- YUIOP ---
*y:: sendSCAnyC("?")
*u:: sendSCAnyC("(")
*i:: sendSCAnyC(")")
*o:: sendSCAnyC(":")
*p:: sendSCAnyC("<")


; --- ASDFG ---
*a:: sendSCAnyC("+")
*s:: sendSCAnyC("-")
*d:: sendSCAnyC("*")
*f:: sendSCAnyC("/")
*g:: sendSCAnyC("\")

; --- HJKL; ---
*h:: sendSCAnyC("'")
*j:: sendSCAnyC("[")
*k:: sendSCAnyC("]")
*l:: sendSCAnyC("¥")
;*;:: sendSpaceAnyC("")


; --- ZXCVB ---
*z:: sendSCAnyC("#")
*x:: sendSCAnyC("_")
*c:: sendSCAnyC("^")
*v:: sendSCAnyC("%")
*b:: sendSCAnyC("@")

; --- NM,./ ---
*n:: sendSCAnyC("`"")
*m:: sendSCAnyC("{")
*,:: sendSCAnyC("}")
*.:: sendSCAnyC("'")
*/:: sendSCAnyC(">")


*ESC:: sendSCAnyC("``")
*Tab:: sendSCAny("~")


#HotIf

;#Include MyHotString.ahk
; #Include ForSplashtop.ahk
;#Include TestGUI.ahk
