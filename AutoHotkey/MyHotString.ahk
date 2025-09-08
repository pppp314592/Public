;HotStringの設定
#Hotstring EndChars `n`t
#Hotstring OC*?

; ::jjk:::
; ::jjm::-
; ::jja::@
; ::jjb::\
; ::jjs::/
; ::jjc::^
; ::jjd::"
; ::jjq::'
; ::jjt:: {
;     SendText("``")
; }
; ::jjp:: {
;     SendText("+")
; }


; ;HotStringの設定
; #Hotstring EndChars `n`t
; #Hotstring OC*?

; ::hsjmotto:: {
;     SendText("JM0731829")
; }

loopstop := false

::llllll:: {
    global
    loopstop := false
    Loop 10000 {
        ; SendText("p")
        SendEvent "{p}"
        Sleep 15000
        if (loopstop)
            break
    }
}

::ssssss:: {
    global loopstop := true
    SendEvent "{e}"

}