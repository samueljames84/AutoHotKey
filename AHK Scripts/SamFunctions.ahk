;====================================================================================
; ChangeCase >>Convert a sentence with the every 1st letter of the word with capital letter
ChangeCase()
{
    ClipSaved := ClipboardAll ; Save the current clipboard to restore later
    A_Clipboard := "" ; Clear the clipboard
    Send "^c" ; Copy the selected text to clipboard
    ClipWait ; Wait for the clipboard to contain data
    Text := A_Clipboard  ; Get the clipboard data
    if (Text != "") {
        ClipVariable := ChangeText(Text) ; Convert to title case "ChangeCase" defined in samfunctions
        A_Clipboard := ClipVariable ; assign value to clipboard
        Send "^v" ; Paste the modified text
    }
    return
}
;====================================================================================

ChangeText(Text) {
    ; Split the text into words
    Words := StrSplit(Text, " ")
    NewText := ""
    
    ; Loop through each word
    for Index, Word in Words {
        ; Convert the first letter to uppercase and the rest to lowercase
        NewText .= (Index = 1 ? "" : " ") . StrUpper(SubStr(Word, 1, 1)) . StrLower(SubStr(Word, 2))
    }
    return NewText
}
;====================================================================================

GetMonitorNumber(WinID)
{
    WinGetPos &X, &Y, &W, &H, WinID  
    X:=X+10
    Y:=Y+10
    ; MsgBox(", " X "<->" Y )
    MonitorCount := SysGet(80)
    Loop MonitorCount
        {
            MonitorGet A_Index, &Left, &Top, &Right, &Bottom  
            if (X >= Left && Y >= Top && X <= Right && Y <= Bottom){
                MonNum := A_Index
                break
            }
        } return MonNum
}
;====================================================================================

GetNoOfInstances(ProcessName,ClassName)
{
    i := 0
    if (ProcessName == "") {
        PID:= -1
    } else {
        PID := ProcessExist(ProcessName)
    }
    
    for WinID in WinGetList(ClassName) {
        CurrentProcessName := WinGetProcessName(WinID)
        if (CurrentProcessName == ProcessName || PID == -1) {
            i:= i+1
        }
    }
    return i
}
;====================================================================================

GetWinList(ProcessName,ClassName)
{
    WinArray := []
    if (ProcessName == "") {
        PID:= -1
    } else {
        PID := ProcessExist(ProcessName)
    }
    
    for WinID in WinGetList(ClassName) {
        CurrentProcessName := WinGetProcessName(WinID)
        if (CurrentProcessName == ProcessName || PID == -1) {
            WinArray.Push(WinID)
        }
    }
    return WinArray
}

;====================================================================================

ActivateAll(ProcessName,ClassName)
{
    if (ProcessName == "") {
        PID:= -1
    } else {
        PID := ProcessExist(ProcessName)
    }
    for WinID in WinGetList(ClassName) { ; Find all File Explorer windows
        CurrentProcessName := WinGetProcessName(WinID)
        if (CurrentProcessName == ProcessName || PID == -1) {
            WinActivate(WinID) ; Activate each window
        }
    }
    return
}
;====================================================================================

ActivateWinList(WinArray)
{
    for WinID in WinArray { ; Find all File Explorer windows
        WinActivate(WinID) ; Activate each window
        }
    return
}

;====================================================================================

ShowOrHideHiddenFiles()
{
    RegKeyVar := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    HiddenFilesStatus := RegRead(RegKeyVar, "Hidden")
        if (HiddenFilesStatus = 2) {
            RegWrite(1, "REG_DWORD", RegKeyVar, "Hidden")
            RegWrite(1, "REG_DWORD", RegKeyVar, "ShowSuperHidden")
        } else {
            RegWrite(2, "REG_DWORD", RegKeyVar, "Hidden")
            RegWrite(0, "REG_DWORD", RegKeyVar, "ShowSuperHidden")
        }
        PostMessage(0x111, 28931, 0, , ) ;Refresh the Explorer window inside container
        PostMessage(0x111, 41504, 0, , ) ;Refresh the Explorer window 
    }
;====================================================================================

ShowOrHideFileExtension()
{
    RegKeyVar := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    FileExtStatus := RegRead(RegKeyVar, "HideFileExt")
        if (FileExtStatus = 1) {
            RegWrite(0, "REG_DWORD", RegKeyVar, "HideFileExt")
            } else {
                RegWrite(1, "REG_DWORD", RegKeyVar, "HideFileExt")
            }
            PostMessage(0x111, 28931, 0, , ) ;Refresh the Explorer window inside container
            PostMessage(0x111, 41504, 0, , ) ;Refresh the Explorer window 
    }
;====================================================================================

NewFolderFromClipboard()
{
    if (A_Clipboard != "") {
        Send("!h" "n")
        Sleep 500
        Send ("^v")
        Sleep 100
        Send ("{Enter}")
        Sleep 100
        Send ("{Enter}")
    } 
}
;====================================================================================

Tip(Text,Time)
{
    ToolTip(Text)
    Sleep Time
    Tooltip
}