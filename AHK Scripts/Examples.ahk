#Requires AutoHotkey v2.0
; ^ CTRL | + SHIFT | ! ALT  | # WIN

ActiveWindowName := WinActive("A")                              ; Get the current active Windows ID
GetWindowID := WinGetID("ahk_class Clover_WidgetWin_0")         ; Get the Window ID from Class Name
GetWindowID := WinGetID("Window Title <1st line from Spy>")     ; Get the Window ID from Class Name
ProcessName := WinGetProcessName(WinID)                         ; Get the process name from hwnd or WindowsID
ClassName := WinGetClass(WinID)                                 ; Get Class Name from hwnd or WindowID

MonitorGet 1, &Left, &Top, &Right, &Bottom                      ; Get monitor coordinates 1 rep 1st monitor can be replaced with variable
WinGetPos &X, &Y, &W, &H, "A"                                   ; Get Window position
WinGetPos &X, &Y, , , "A"                                       ; Get Window position only starting x,y coordinates
PrimaryMonitorNumber := MonitorGetPrimary()                     ; Get Primary Monitor Number
