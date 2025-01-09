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
AutoArrange()
{
    ObjVar := GetProcessAndClassName(WinActive("A"))
    WinList := GetWinList(ObjVar.ProcessName,ObjVar.ClassName)
    NoOfInst := WinList.Length
    ActivateAll(ObjVar.ProcessName,ObjVar.ClassName)
    SetAllWindowPosition(WinList)
}
;====================================================================================
ActivateGroup()
{
    ObjVar := GetProcessAndClassName(WinActive("A"))
    ActivateAll(ObjVar.ProcessName,ObjVar.ClassName)
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


ActivateZoom()
{
    If WinExist("ahk_exe Zoom.exe"){
        ;WinActivate("ahk_class ConfMultiTabContentWndClass")
        try{
            WinActivate("ahk_class ZPFloatVideoWndClass")
            WinGetPos &X, &Y, &W, &H, "ahk_class ZPFloatVideoWndClass"    
            MouseMove X+50, Y+50
            MouseClick "left", X+W-10, Y+10 
        }
        try{
            WinMaximize("ahk_class ConfMultiTabContentWndClass") ; Maximize the Zoom window
        }
    } try {
        Run('"C:\Users\Sam\AppData\Roaming\Zoom\bin\Zoom.exe" --url="https://us02web.zoom.us/j/9500123870?pwd=UGo2a0Vnby9MU2xIRVZIaWZRaTBHZz09"')
    }
}
;====================================================================================

RenameFromClipboard()
{
    if (A_Clipboard != "") {
        Send("{F2}")
        Send ("^v{Enter}")
    } 
}
;====================================================================================

OpenWithVScode(filePath)
{
    vscodePath:='"C:\Users\sajam\AppData\Local\Programs\Microsoft VS Code\Code.exe"'
    ClipClear:=0
    if not FileExist(filePath){
        filePath := ClipPath()
        ClipClear:=1
    }
    if not FileExist(filePath){
        Send("^c")
        Sleep 50
        filePath := ClipPath()
        ClipClear:=1
    }
    if (FileExist(filePath) && FileGetSize(filePath) < 1048576) {
        if ClipClear == 1 {
            A_Clipboard := ""
        }
        RunApp:= vscodePath . ' "' . filePath . '"'
        Run(RunApp)  ; Open the file in VSCode
    } else {
    MsgBox("Not a Valid file to open in VScode: `n" filePath)
    }
}

ClipPath()
{
    clipboardText := A_Clipboard  ; Get the text from the clipboard
    clipboardText:=StrReplace(clipboardText, "`r")
    clipboardText:=StrReplace(clipboardText, "`n")
    filePath := clipboardText   ; Store clipboard text as a file path
    return filePath
}
;====================================================================================
GetSelectedItemsInExplorer() {
    hwnd := WinActive("ahk_class CabinetWClass") ; Active Explorer window
    if !hwnd
        hwnd := WinActive("ahk_class ExploreWClass") ; Fallback for older versions of Explorer
    if !hwnd
        return ; No Explorer window is active

    ; Get the shell application COM object
    shellApp := ComObject("Shell.Application")
    for window in shellApp.Windows {
        if hwnd = WinExist(window.HWND) {
            selectedItems := window.document.SelectedItems
            selectedPaths := []
            for item in selectedItems {
                selectedPaths.Push(item.Path) ; Add the item's path to the array
            }
            return selectedPaths ; Return the array of selected paths
        }
    }
    return [] ; Return an empty string if no selection
}
;====================================================================================

MoveFiles(FolderPath)
{
    FilesList:=GetSelectedItemsInExplorer()
    for file in FilesList {
        try {
            FileName:=SplitPath(file, &name)
            FileMove(file, FolderPath "\" FileName)
        }
    }
}
;====================================================================================*/
ShowExifInfo()
{
    FilesList:=GetSelectedItemsInExplorer()
    for file in FilesList {
        try {
            FileName:=SplitPath(file, &name)
            Argument:="exifinfo.bat" . ' "' . file . '"'
            Run(Argument)
        }
    }
}

;RunApp:= vscodePath . ' "' . filePath . '"'
;Run(RunApp)  ; Open the file in VSCode
;====================================================================================*/


/* 
Run(Target [, WorkingDir := A_WorkingDir, LaunchOpt := '', &OutputPID]) => EmptyString
Zoom Workplace
ahk_class ZPPTMainFrmWndClassEx
ahk_exe Zoom.exe
ahk_class ZPFloatVideoWndClass