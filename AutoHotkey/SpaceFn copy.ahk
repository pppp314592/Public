; SpaceFn 実装
whenSpaceFn := false
spaceFnTriggered := false
altSpace := false
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
    whenSpaceFn := true
}
*Space up::
{
    global whenSpaceFn
    global spaceFnTriggered
    global altSpace
    ; Alt + Space では通常の Alt + Space 動作にする
    if altSpace {
        altSpace := false
        Return
    }

    if !spaceFnTriggered {
        ; Space 単体押しの場合は通常の Space 動作
        Send "{Blind}{Space}"
    } else {
        ; スペースとコンビネーションキーがほぼ同時に離れた際の判定バッファ
        while (A_TimeIdlePhysical < 60) {
            Sleep 10
        }
    }
    whenSpaceFn := false
    spaceFnTriggered := false
    altSpace := false
}
sendKeyWithSpaceFn(key) {
    global spaceFnTriggered
    spaceFnTriggered := true
    SendEvent "{Blind}{" . key . "}"
}
sendKeyAfterSpace(key) {
    global spaceFnTriggered
    if spaceFnTriggered {
        Send "{Blind}{" . key . "}"
    } else {
        spaceFnTriggered := true
        Send "{Blind}{Space}{" . key . "}"
    }
}
#HotIf whenSpaceFn
*j:: sendKeyWithSpaceFn("Left")
*m:: sendKeyWithSpaceFn("Down")
*k:: sendKeyWithSpaceFn("Right")
*i:: sendKeyWithSpaceFn("Up")
*h:: sendKeyWithSpaceFn("Home")
;*sc027::sendKeyWithSpaceFn("End") ; ;キー
*l:: sendKeyWithSpaceFn("End") ; ;キー
*,:: sendKeyWithSpaceFn("Backspace")
*n:: sendKeyWithSpaceFn("Delete")
*u:: sendKeyWithSpaceFn("PgUp") ; ,キー
;*sc033::sendKeyWithSpaceFn("PgUp") ; ,キー
*o:: sendKeyWithSpaceFn("PgDn") ; .キー
;*sc034::sendKeyWithSpaceFn("PgDn") ; .キー
;*p::sendKeyWithSpaceFn("PrintScreen")

*Enter:: sendKeyAfterSpace("Enter")
*Left:: sendKeyAfterSpace("Left")
*Right:: sendKeyAfterSpace("Right")
*Up:: sendKeyAfterSpace("Up")
*Down:: sendKeyAfterSpace("Down")
#HotIf