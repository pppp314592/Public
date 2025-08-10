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

; --- 方向・編集キー ---
*y:: sendSpaceAny("vkF3sc029") ; y → Esc
*u:: sendSpaceAny("Home")      ; u → Home
*i:: sendSpaceAny("Up")        ; i → ↑
*o:: sendSpaceAny("End")       ; o → End
*p:: sendSpaceAny("Backspace") ; p → Backspace

*h:: sendSpaceAny("ESC")       ; h → Esc
*j:: sendSpaceAny("Left")      ; j → ←
*k:: sendSpaceAny("Down")      ; k → ↓
*l:: sendSpaceAny("Right")     ; l → →
*;:: sendSpaceAny("Enter")     ; ; → Enter

*n:: sendSpaceAny("Delete")    ; n → Delete
*m:: sendSpaceAny("vk1Dsc07B") ; m → 無変換
*,:: sendSpaceAny("PgUp")      ; , → PageUp
*.:: sendSpaceAny("PgDn")      ; . → PageDown
*/:: sendSpaceAny("vk1Csc079") ; / → 変換

; --- ファンクションキー ---
*1:: sendSpaceAny("F1")        ; 1 → F1
*2:: sendSpaceAny("F2")        ; 2 → F2
*3:: sendSpaceAny("F3")        ; 3 → F3
*4:: sendSpaceAny("F4")        ; 4 → F4
*5:: sendSpaceAny("F5")        ; 5 → F5
*6:: sendSpaceAny("F6")        ; 6 → F6
*7:: sendSpaceAny("F7")        ; 7 → F7
*8:: sendSpaceAny("F8")        ; 8 → F8
*9:: sendSpaceAny("F9")        ; 9 → F9
*0:: sendSpaceAny("F10")       ; 0 → F10
*ESC:: sendSpaceAnyC("F11")    ; ESC → F11
*TAB:: sendSpaceAnyC("F12")    ; TAB → F12

; --- 記号キー ---
*q:: sendSpaceAnyC("&")        ; q → &
*w:: sendSpaceAnyC("|")        ; w → |
*e:: sendSpaceAnyC("!")        ; e → !
*r:: sendSpaceAnyC("(")        ; r → (
*t:: sendSpaceAnyC(")")        ; t → )

*a:: sendSpaceAnyC("+")        ; a → +
*s:: sendSpaceAnyC("-")        ; s → -
*d:: sendSpaceAnyC("*")        ; d → *
*f:: sendSpaceAnyC("[")        ; f → [
*g:: sendSpaceAnyC("]")        ; g → ]

*z:: sendSpaceAnyC("=")        ; z → =
*x:: sendSpaceAnyC("%")        ; x → %
*c:: sendSpaceAnyC(":")        ; c → :
*v:: sendSpaceAnyC("'")        ; v → '
*b:: sendSpaceAnyC("@")        ; b → @

; --- Shift+記号キー ---
+*q:: sendSpaceAnyC("$")       ; Shift+q → $
+*w:: sendSpaceAnyC("\")       ; Shift+w → \
+*e:: sendSpaceAnyC("?")       ; Shift+e → ?
+*r:: sendSpaceAnyC("/")       ; Shift+r → /
+*t:: sendSpaceAnyC("¥")       ; Shift+t → ¥

+*a:: sendSpaceAnyC("#")       ; Shift+a → #
+*s:: sendSpaceAnyC("_")       ; Shift+s → _
+*d:: sendSpaceAnyC("^")       ; Shift+d → ^
+*f:: sendSpaceAnyC("{")       ; Shift+f → {
+*g:: sendSpaceAnyC("}")       ; Shift+g → }

+*z:: sendSpaceAnyC("``")      ; Shift+z → `
+*x:: sendSpaceAnyC("~")       ; Shift+x → ~
+*c:: sendSpaceAnyC(";")       ; Shift+c → ;
+*v:: sendSpaceAnyC("`"")      ; Shift+v → "

; --- その他 ---
*-:: sendSpaceAny("BROWSER_BACK") ; - → ブラウザ戻る
if (isJIS) {
    *^:: sendSpaceAny("BROWSER_FORWARD") ; JIS: ^ → ブラウザ進む
}
else {
    *=:: sendSpaceAny("BROWSER_FORWARD") ; US: = → ブラウザ進む
}

*[:: sendSpaceAny("Volume_Down")    ; [ → 音量ダウン
*]:: sendSpaceAny("Volume_Up")      ; ] → 音量アップ
*Enter:: sendSpaceAny("WheelDown 4")  ; Enter → ホイールダウン
*BackSpace:: sendSpaceAny("WheelUp 4") ; BackSpace → ホイールアップ

#HotIf

;#Include MyHotString.ahk
