


; Change Case auto select whole line and change case
#+c:: ;WIN+SHIFT+C 
{
    ClipSaved := ClipboardAll ; Save the current clipboard to restore later
    A_Clipboard := "" ; Clear the clipboard
    Send "{End}" ; Move cursor to end
    Send "+{Home}" ; Select characters to end
    Send "^c" ; Copy the selected text to clipboard
    ClipWait ; Wait for the clipboard to contain data
    Text := A_Clipboard  ; Get the clipboard data
;    MsgBox Text
    if (Text != "") {
        ClipVariable := ChangeCase(Text) ; Convert to title case
        Sleep 50
;        MsgBox ClipVariable
        A_Clipboard := ClipVariable ; assign value to clipboard
        Sleep 2000
        Send "^v" ; Paste the modified text
    }
    return
}


OpenWithVScode()
{
    vscodePath:='"C:\Users\sajam\AppData\Local\Programs\Microsoft VS Code\Code.exe"'
    clipboardText := A_Clipboard  ; Get the text from the clipboard
    clipboardText:=StrReplace(clipboardText, "`r")
    clipboardText:=StrReplace(clipboardText, "`n")
    filePath := clipboardText   ; Store clipboard text as a file path
    RunApp:= vscodePath . ' "' . filePath . '"'
    if not FileExist(filePath){
        Send("^c")
    }

    if (FileExist(filePath) && FileGetSize(filePath) < 1048576) {
        A_Clipboard := ""
        Run(RunApp)  ; Open the file in VSCode
    } else {
    MsgBox("Not a Valid file to open in VScode: `n" filePath)
    }
}
