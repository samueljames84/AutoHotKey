#Requires AutoHotkey v2.0
; ^ CTRL | + SHIFT | ! ALT  | # WIN

ActiveWindowName := WinActive("A")                              ; Get the current active Windows ID
GetWindowID := WinGetID("ahk_class Clover_WidgetWin_0")         ; Get the Window ID from Class Name
GetWindowID := WinGetID("Window Title <1st line from Spy>")     ; Get the Window ID from Class Name
ProcessName := WinGetProcessName(WinID)                         ; Get the process name from hwnd or WindowsID
ClassName := WinGetClass(WinID)                                 ; Get Class Name from hwnd or WindowID
ClassName := "ahk_class " . WinGetClass(WinActive("A"))         ; Get Class Name with prefix

MonitorGet 1, &Left, &Top, &Right, &Bottom                      ; Get monitor coordinates 1 rep 1st monitor can be replaced with variable
WinGetPos &X, &Y, &W, &H, "A"                                   ; Get Window position
WinGetPos &X, &Y, , , "A"                                       ; Get Window position only starting x,y coordinates
PrimaryMonitorNumber := MonitorGetPrimary()                     ; Get Primary Monitor Number


#q::
{
    WinID := WinActive("A")
    MonitorNumber := GetMonitorNumber(WinID)
    MsgBox "Window RRon Monitor #" MonitorNumber
}

#p::
{
    ;Instances := GetNoOfInstances("Code.exe","ahk_class Chrome_WidgetWin_1")
    Instances := GetNoOfInstances("","ahk_class LVDChild")
    ;Instances := GetNoOfInstances(ProcessName,ClassName)
    MsgBox("No of Instances = " Instances)
}


;====================================================================================

returnObject() {
    Test := {id: 789, val: "HIJ"}
    return Test
}

ObjectVariable := returnObject()
MsgBox "Name: " . ObjectVariable.id
MsgBox "Value: " . ObjectVariable.val


;====================================================================================
returnArray2() {
    x := 456
    y := "EFG"
    return [x, y]
}
ArrayVariable := returnArray2()
FirstElement := ArrayVariable[1] ; Gets the x value from the function

