#Requires AutoHotkey v2.0

ActiveWindowName := WinActive("A")                                      ; Get the current active windows ID
GetWindowID := WinGetID("ahk_class Clover_WidgetWin_0")                 ; Get the Window ID from Class Name
GetWindowID := WinGetID("Window Title <1st line from Windows Spy>")     ; Get the Window ID from Class Name
