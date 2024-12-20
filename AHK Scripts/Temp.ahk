#Requires AutoHotkey v2.0
#SingleInstance force
#Include SamFunctions.ahk
#Include Monitor.ahk
#Include ExpirementalFunctions.ahk
#Include TempFunctions.ahk
#Include ..\Lib\TapHoldManager.ahk ; Retative path to this file





thm := TapHoldManager()
;thm.Add("3", TestFunction())

thm.Add("1", MyFunc1)
thm.Add("2", MyFunc2)
