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
*y:: sendSpaceAny("ESC")       ; y → Esc
+*u:: sendSpaceAnyC("vkF2sc070")      ; Shift + u → IME On
;*u:: sendSpaceAnyC("vkF2sc070 `" `"vkF3sc029")      ; u → IME Off
*u:: {
    sendSpaceAnyC("vkF2sc070")      ; u → IME Off
    sendSpaceAnyC("vkF3sc029")      ; u → IME Off
}
*i:: sendSpaceAny("Up")        ; i → ↑
*o:: sendSpaceAny("Delete")       ; o → End
*p:: sendSpaceAny("BackSpace") ; p → Backspace

*h:: sendSpaceAny("TAB") ; h → 半角/全角
*j:: sendSpaceAny("Left")      ; j → ←
*k:: sendSpaceAny("Down")      ; k → ↓
*l:: sendSpaceAny("Right")     ; l → →
*;:: sendSpaceAny("Enter")     ; ; → Enter

*n:: sendSpaceAny("vk1Dsc07B")    ; n → Delete
*m:: sendSpaceAny("Home") ; m → 無変換
;*m:: sendSpaceAny("vk1Dsc07B") ; m → 無変換
*,:: sendSpaceAny("PgUp")      ; , → PageUp
*.:: sendSpaceAny("PgDn")      ; . → PageDown
*/:: sendSpaceAny("End")     ; / → Enter
;*/:: sendSpaceAny("vk1Csc079") ; / → 変換

; --- ファンクションキー ---
*1:: sendSpaceAny("F1")         ; 1 → F1
*2:: sendSpaceAny("F2")         ; 2 → F2
*3:: sendSpaceAny("F3")         ; 3 → F3
*4:: sendSpaceAny("F4")         ; 4 → F4
*5:: sendSpaceAny("F5")         ; 5 → F5
*6:: sendSpaceAny("F6")         ; 6 → F6
*7:: sendSpaceAny("F7")         ; 7 → F7
*8:: sendSpaceAny("F8")         ; 8 → F8
*9:: sendSpaceAny("F9")         ; 9 → F9
*0:: sendSpaceAny("F10")        ; 0 → F10
*-:: sendSpaceAny("F11")        ; - → F11
if (isJIS) {
    *^:: sendSpaceAny("F12") ; ^ → F12
}
else {
    *=:: sendSpaceAny("F12") ; US: ^ → F12
}
*ESC:: sendSpaceAnyC("``")     ; ESC → &
*Tab:: sendSpaceAnyC("|")      ; Tab → |

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
+*ESC:: sendSpaceAnyC("~")      ; Shft+Tab → \
+*Tab:: sendSpaceAnyC("\")      ; Shft+Tab → \

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

+*z:: sendSpaceAnyC("&")      ; Shift+z → `
+*c:: sendSpaceAnyC(";")       ; Shift+c → ;
+*v:: sendSpaceAnyC("`"")      ; Shift+v → "@
;*\:: MsgBox("AppKey") ; アプリケーションキー


; --- その他 ---


*[:: sendSpaceAny("Volume_Down")        ; [ → 音量ダウン
*]:: sendSpaceAny("Volume_Up")          ; ] → 音量アップ
+*[:: sendSpaceAny("BROWSER_BACK")      ; Shift + [ → ブラウザ戻る
+*]:: sendSpaceAny("BROWSER_FORWARD")   ; Shift + ] → ブラウザ進む
*Enter:: sendSpaceAny("WheelDown 4")    ; Enter → ホイールダウン
*BackSpace:: sendSpaceAny("WheelUp 4")  ; BackSpace → ホイールアップ

+*':: GUI_test(true) ; layer2.jpg
*':: GUI_test() ; layer1.jpg


#HotIf

;#Include MyHotString.ahk
; #Include ForSplashtop.ahk
#Include TestGUI.ahk