#SingleInstance force
#Requires AutoHotkey v2.0
#Include SamFunctions.ahk



#2:: ; Press F1 to activate all File Explorer windows
{
    WinID := WinGetID("A")
    Monitor := GetMonitorInfoFromWindow(WinID)
 ;   activeWindow 
    MsgBox(Monitor)

}

GetMonitorInfoFromWindow(hwnd) {
    ; Get the monitor containing the window
    monitorHandle := DllCall("MonitorFromWindow", "ptr", hwnd, "uint", 2, "ptr") ; MONITOR_DEFAULTTONEAREST = 2
    if !monitorHandle
        return

    ; Create a buffer for the MONITORINFO structure
    buffer := Buffer(40, 0)
    buffer.NumPut(40, 0, "UInt") ; Set the size of the structure

    if !DllCall("GetMonitorInfo", "ptr", monitorHandle, "ptr", buffer.Ptr)
        return

    return {
        MonitorLeft: buffer.NumGet(4, "Int"),
        MonitorTop: buffer.NumGet(8, "Int"),
        MonitorRight: buffer.NumGet(12, "Int"),
        MonitorBottom: buffer.NumGet(16, "Int")
    }
}

/*
;====================================================================================================
#2:: ; Change F1 to your preferred hotkey
{
    ; Retrieve all windows with the class name "CabinetWClass" (File Explorer)
    windows := WinGetList("ahk_class CabinetWClass")
        if (windows.Length > 0)  ; Check if any File Explorer windows are found
    {
        for win in windows
        {
            WinActivate(win)  ; Activate each window
            Sleep(100)        ; Optional delay between activations
        }
    }
    else
    {
        MsgBox("No File Explorer windows are open.")
    }
    return
}

;====================================================================================================
#3:: ; Press F1 to resize the active File Explorer window
{
    hwnd := WinGetID("A") ; Get the handle of the active window
    if !IsExplorerWindow(hwnd)
    {
        MsgBox("The active window is not a File Explorer.")
        return
    }

    ; Get the screen dimensions of the monitor containing the window
    monitor := MonitorFromWindow(hwnd)
    if !monitor
    {
        MsgBox("Unable to retrieve monitor information.")
        return
    }

    left := monitor.WorkAreaLeft
    top := monitor.WorkAreaTop
    width := (monitor.WorkAreaRight - monitor.WorkAreaLeft) // 2 ; Half the screen width
    height := monitor.WorkAreaBottom - monitor.WorkAreaTop ; Full screen height

    ; Resize the window
    WinMove(hwnd, left, top, width, height)
}

IsExplorerWindow(hwnd) {
    return WinGetClass(hwnd) = "CabinetWClass"
}

MonitorFromWindow(hwnd) {
    ; Get the monitor containing the window
    monitor := DllCall("MonitorFromWindow", "ptr", hwnd, "uint", 2, "ptr") ; MONITOR_DEFAULTTONEAREST = 2
    if !monitor
        return
    info := Buffer(40, 0) ; Create a buffer for MONITORINFO structure
    info.NumPut(40, 0, "UInt") ; Set the size of the structure
    if !DllCall("GetMonitorInfo", "ptr", monitor, "ptr", info.Ptr)
        return
    return {
        WorkAreaLeft: info.NumGet(4, "Int"),
        WorkAreaTop: info.NumGet(8, "Int"),
        WorkAreaRight: info.NumGet(12, "Int"),
        WorkAreaBottom: info.NumGet(16, "Int")
    }
}
;====================================================================================================


; Function to get the monitor resolution of the monitor containing a specific window
GetWindowMonitorResolution(windowID) {
    ; Get the monitor containing the specified window
    SysGet, monitor, Monitor, windowID
    
    ; Calculate the width and height of the monitor
    width := monitor.Right - monitor.Left
    height := monitor.Bottom - monitor.Top
    
    return {Width: width, Height: height}
}

; Prompt the user to enter a window ID
InputBox, windowID, Enter Window ID, Please enter the window ID:

; Retrieve the resolution of the monitor containing the specified window
resolution := GetWindowMonitorResolution(windowID)

; Display the resolution in a message box
MsgBox "Monitor Resolution for Window ID " windowID ": " resolution.Width "x" resolution.Height
