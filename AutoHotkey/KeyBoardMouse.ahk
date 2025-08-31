#HotIf


; --- 方向・編集キー ---
moveX := 100
moveXs := 15

>!p:: MouseMove(0, -movex, 0, "R") ; w → 上に移動
>!;:: MouseMove(0, moveX, 0, "R") ; s → 下に移動
>!':: MouseMove(moveX, 0, 0, "R") ; d → 右に移動
>!l:: MouseMove(-moveX, 0, 0, "R") ; f → 左に移動

>!>+p:: MouseMove(0, -movexs, 0, "R") ; w → 上に移動
>!>+;:: MouseMove(0, moveXs, 0, "R") ; s → 下に移動
>!>+':: MouseMove(moveXs, 0, 0, "R") ; d → 右に移動
>!>+l:: MouseMove(-moveXs, 0, 0, "R") ; f → 左に移動

>!.:: MouseClick("Left") ; q → 左クリWheelUp 2ック
>!/:: MouseClick("Right") ; e → 右クリック


>![:: SendInput("{WheelDown}")
>!o:: SendInput("{WheelUp}")

; *1:: MouseMove(940, 550)
; *2:: MouseMove(940, 1080 + 550)
; *3:: MouseMove(-940, 550)

#HotIf

;#Include SpaceFn.ahk
