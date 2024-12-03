
; Make all opened File Explorer windows active
#1:: ; Press F1 to activate all File Explorer windows
{
    for win in WinGetList("ahk_class Clover_WidgetWin_0") ; Find all File Explorer windows
    {
        WinActivate(win) ; Activate each window
;        WinID := WinGetID("A") #info get active window ID
;        MsgBox(win)
        Sleep(100) ; Optional: Add a delay between activations
    }
    return
}


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

