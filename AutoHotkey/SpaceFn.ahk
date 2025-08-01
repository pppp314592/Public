; SpaceFn 実装
whenSpaceFn := false
spaceFnTriggered := false
altSpace := false
SpaceDownTime := 0
~!Space::
{
    ; Alt + Space では通常の Alt + Space 動作にする
    global altSpace
    altSpace := true
    Return
}
*Space::
{
    global whenSpaceFn
    global SpaceDownTime
    if !whenSpaceFn {
        ; SpaceFnモードが有効でない場合は、Spaceを押したときにSpaceFnモードを有効化
        SpaceDownTime := A_TickCount
        ToolTip "SpaceFnモードが有効になりました。"
    }
    whenSpaceFn := true
}
*Space up::
{
    global whenSpaceFn
    global spaceFnTriggered
    global altSpace
    global SpaceDownTime
    ; Alt + Space では通常の Alt + Space 動作にする
    if altSpace {
        altSpace := false
        Return
    }

    if !spaceFnTriggered {
        ; Space 単体押しの場合は通常の Space 動作
        if (A_TickCount - SpaceDownTime < 1000) {
            ; Spaceが押されてから1000ms以内に離された場合は通常のSpace動作
            Send "{Blind}{Space}"
        } else {
            ; 500ms以上経過している場合はSpaceFnモードを終了
        }
    } else {
        ; スペースとコンビネーションキーがほぼ同時に離れた際の判定バッファ
        while (A_TimeIdlePhysical < 60) {
            Sleep 10
        }
    }
    ToolTip "SpaceFnモードが無効になりました。"
    SetTimer () => ToolTip(), -10000

    whenSpaceFn := false
    spaceFnTriggered := false
    altSpace := false
}
sendKeyWithSpaceFn(key) {
    global spaceFnTriggered
    spaceFnTriggered := true
    SendEvent "{Blind}{" key "}"
}
sendKeyAfterSpace(key) {
    global spaceFnTriggered
    if spaceFnTriggered {
        Send "{Blind}{" key "}"
    } else {
        spaceFnTriggered := true
        Send "{Blind}{Space}{" key "}"
    }
}


#HotIf whenSpaceFn ; SpaceFnモードが有効なときのみ以下のホットキーを有効化

*j:: sendKeyWithSpaceFn("Left")       ; j → ←
*k:: sendKeyWithSpaceFn("Down")       ; m → ↓
*l:: sendKeyWithSpaceFn("Right")      ; l → →
*i:: sendKeyWithSpaceFn("Up")         ; i → ↑
*u:: sendKeyWithSpaceFn("Home")       ; u → Home
*o:: sendKeyWithSpaceFn("End")        ; o → End
*n:: sendKeyWithSpaceFn("Delete")     ; n → Delete
*m:: sendKeyWithSpaceFn("PgUp")       ; , → PageUp
*.:: sendKeyWithSpaceFn("PgDn")       ; . → PageDown
*,:: sendKeyWithSpaceFn("PrintScreen")       ; . → PageDown


;*g:: sendKeyWithSpaceFn("Up 5")          ; . → PageDown
;*h:: sendKeyWithSpaceFn("Down 5")       ; . → PageDown
*g:: sendKeyWithSpaceFn("BROWSER_FORWARD")    ; g →  進む
*h:: sendKeyWithSpaceFn("BROWSER_BACK")       ; . → 戻る

*;:: sendKeyWithSpaceFn("Enter")      ; ; → Enter
*p:: sendKeyWithSpaceFn("Backspace")  ; p → Backspace

*1:: sendKeyWithSpaceFn("F1")         ; 数字キー → F1〜F12
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
*=:: sendKeyWithSpaceFn("F12")

; *z:: sendKeyWithSpaceFn("0")          ; z〜r → 数字キー
; *x:: sendKeyWithSpaceFn("1")
; *c:: sendKeyWithSpaceFn("2")
; *v:: sendKeyWithSpaceFn("3")
; *s:: sendKeyWithSpaceFn("4")
; *d:: sendKeyWithSpaceFn("5")
; *f:: sendKeyWithSpaceFn("6")
; *w:: sendKeyWithSpaceFn("7")
; *e:: sendKeyWithSpaceFn("8")
; *r:: sendKeyWithSpaceFn("9")
*q:: sendKeyWithSpaceFn("+")
*a:: sendKeyWithSpaceFn("-")         ; ` → `キー


*w:: sendKeyWithSpaceFn("(") ; w → (
*x:: sendKeyWithSpaceFn(")") ; x → )
*e:: sendKeyWithSpaceFn("{") ; e → {
*d:: sendKeyWithSpaceFn("}") ; d → }
*r:: sendKeyWithSpaceFn("[") ; r → [
*f:: sendKeyWithSpaceFn("]") ; f → ]


*[:: sendKeyWithSpaceFn("Volume_Up")    ; [ → 音量アップ
*]:: sendKeyWithSpaceFn("Volume_Down")  ; ] → 音量ダウン

*y:: sendKeyWithSpaceFn("ESC")        ; y → Esc


;  *Esc:: sendKeyWithSpaceFn("vk1C") ; Esc → IME切り替え（vk1CはIMEのオン/オフ）


; *sc029:: sendKeyWithSpaceFn("Volume_Mute") ; ;キー → ミュート

; increment := 15
; *f:: MouseMove(increment, 0, 0, "R") ; マウスカーソルを右に10px移動
; *d:: MouseMove(-increment, 0, 0, "R") ; マウスカーソルを左に10px移動

; *Enter:: sendKeyAfterSpace("Enter")
; *Left:: sendKeyAfterSpace("Left")
; *Right:: sendKeyAfterSpace("Right")
; *Up:: sendKeyAfterSpace("Up")
; *Down:: sendKeyAfterSpace("Down")

#HotIf