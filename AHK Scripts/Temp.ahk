#Requires AutoHotkey v2.0
#SingleInstance force
#Include SamFunctions.ahk
#Include ExpirementalFunctions.ahk
#Include Monitor.ahk

#0::{
    MonitorNo := GetMonitorNumber(WinActive("A"))
    ClassName := "ahk_class " . WinGetClass(WinActive("A"))
    ProcessName := WinGetProcessName(WinActive("A")) 
    If ProcessName == "explorer.exe"{
        ProcessName := ""
        ClassName := "ahk_class Clover_WidgetWin_0"
    }
    WinList := GetWinList(ProcessName,ClassName)
    NoOfInst := WinList.Length
    SetWindowPosition(1, 11, WinList[1])
}
