;#SingleInstance force
;#Requires AutoHotkey v2.0
;#Include SamFunctions.ahk

TestFunction()
{
    Send "How are you"
}

MyFunc1(isHold, taps, state){
    ToolTip("1`n" (isHold ? "HOLD" : "TAP") "`nTaps: " taps "`nState: " state)
}

MyFunc2(isHold, taps, state){
    ToolTip("2`n" (isHold ? "HOLD" : "TAP") "`nTaps: " taps "`nState: " state)
}