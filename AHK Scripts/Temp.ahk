#Requires AutoHotkey v2.0
#SingleInstance force
#Include SamFunctions.ahk
#Include Monitor.ahk
;#Include ExpirementalFunctions.ahk

#!.:: ExitApp ;(WIN + ALT + .) Exit the sctipt



/*
#9::{
    ;MonitorNo := GetMonitorNumber(WinActive("A"))
    ClassName := "ahk_class " . WinGetClass(WinActive("A"))
    ProcessName := WinGetProcessName(WinActive("A")) 
    If ProcessName == "explorer.exe"{
        ProcessName := ""
        ClassName := "ahk_class Clover_WidgetWin_0"
    }
    WinList := GetWinList(ProcessName,ClassName)
    NoOfInst := WinList.Length
    ActivateAll(ProcessName,ClassName)
    SetAllWindowPosition(WinList)

    ;SetWindowPosition(MonitorNo, 1, WinList[1])
}
*/



#8::{
    ;SysGet, OutputVar, MonitorWorkArea, 1E
    MonitorGetWorkArea 1, &Left, &Top, &Right, &Bottom
    MsgBox(Left " | " Top " | " Right " | " Bottom)
}

