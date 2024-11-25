#Requires AutoHotkey v2.0
#SingleInstance force
Persistent
SetNumLockState "AlwaysOn"

ChangeCase(Text) {
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


/************* End Initialization *********************************/
/******************************************************************/
/*************  Start LabVIEW Keys ********************************/

#HotIf WinActive("ahk_exe LabVIEW.exe")

/************** Start Quick Action **********************************/

!a:: ;ALT+A Auto Align Labels
{
    Send "^ "
    Sleep 200
    Send "^a"
}

!n:: ;ALT+N Insert New Sub Vi
{
    Send "^ "
    Sleep 200
    Send "^n"
}

!b:: ;ALT+B Insert Bundle By Name
{
    Send "^ "
    Sleep 200
    Send "Bundle By Name"
    Sleep 200
    Send "^i"
}

!f:: ;ALT+F Align the Panel Size And ReArrange Front Panel Controls
{
    Send "^ "
    Sleep 200
    Send "^f"
}

!w:: ;ALT+W Wire All The Terminals
{
    Send "^ "
    Sleep 200
    Send "^w"
}

!v:: ;ALT+V Replace with clipboard
{
    Send "^ "
    Sleep 200
    Send "^v"
}

!Delete:: ;ALT+Delete
{
    Send "^ "
    Sleep 250
    Send "^r"
}


/************** End Quick Action ************************************/
/************** Start Quick Pick **********************************/


/************** End Quick Pick ************************************/

!u:: ;ALT+U
::.un::
{
    Send "^ "
    Sleep 200
    Send "Unbundle By Name"
    Sleep 250
    Send "{Enter}"
} 

!p:: ;ALT+P
::.pn::
{
    Send "^ "
    Sleep 200
    Send "Property Node"
    Sleep 250
    Send "{Enter}"
}

::.in::
{
    Send "^ "
    Sleep 200
    Send "Invoke Node"
    Sleep 250
    Send "{Enter}"
}

::.bu:: ;ALT+B
{
    Send "^ "
    Sleep 200
    Send "Bundle By Name"
    Sleep 250
    Send "{Enter}"
}

!s:: ;ALT+S
::.specific::
{
    Send "^ "
    Sleep 200
    Send "To More Specific Class"
    Sleep 250
    Send "{Enter}"
}

!g:: ;ALT+G
::.generic::
{
    Send "^ "
    Sleep 200
    Send "To More Generic Class"
    Sleep 250
    Send "{Enter}"
}

::.for::
{
    Send "^ "
    Sleep 200
    Send "For Loop"
    Sleep 250
    Send "{Enter}"
}

::.index::
{
    Send "^ "
    Sleep 200
    Send "Index Array"
    Sleep 250
    Send "{Enter}"
}

::.search::
{
    Send "^ "
    Sleep 200
    Send "Search 1D Array"
    Sleep 250
    Send "{Enter}"
}

::.while::
{
    Send "^ "
    Sleep 200
    Send "While Loop"
    Sleep 250
    Send "{Enter}"
}

::.case::
{
    Send "^ "
    Sleep 200
    Send "Case Structure"
    Sleep 250
    Send "{Enter}"
}

::.c::
::.close::
{
    Send "^ "
    Sleep 200
    Send "Close Reference"
    Sleep 250
    Send "{Enter}"
}

::.ea::
{
    Send "^ "
    Sleep 200
    Send "ea"
    Sleep 250
    Send "{Enter}"
}

::.as::
{
    Send "^ "
    Sleep 200
    Send "Array Size"
    Sleep 250
    Send "{Enter}"
}

::.ba::
::.build::
{
    Send "^ "
    Sleep 200
    Send "Build Array"
    Sleep 250
    Send "{Enter}"
}

::.,::
{
    Send "^ "
    Sleep 200
    Send "Less Than 0"
    Sleep 250
    Send "{Enter}"
}

::.,::
{
    Send "^ "
    Sleep 200
    Send "Less Than 0"
    Sleep 250
    Send "{Enter}"
}

::..::
{
    Send "^ "
    Sleep 200
    Send "Greater Or Equal To 0"
    Sleep 250
    Send "{Enter}"
}

::.fs::
{
    Send "^ "
    Sleep 200
    Send "Format Into String"
    Sleep 250
    Send "{Enter}"
}

::.one::
::.obd::
{
    Send "^ "
    Sleep 200
    Send "One Button Dialog"
    Sleep 250
    Send "{Enter}"
}

::.clear::
::.ce::
{
    Send "^ "
    Sleep 200
    Send "Clear Errors"
    Sleep 250
    Send "{Enter}"
}

::.match::
::.mp::
{
    Send "^ "
    Sleep 200
    Send "Match Pattern"
    Sleep 250
    Send "{Enter}"
}

::.v::
::.variant::
{
    Send "^ "
    Sleep 200
    Send "Variant To Data"
    Sleep 250
    Send "{Enter}"
}

::.1::
::.not::
{
    Send "^ "
    Sleep 200
    Send "Not Equal?"
    Sleep 250
    Send "{Enter}"
}

::.build::
::.ba::
{
    Send "^ "
    Sleep 200
    Send "Build Array"
    Sleep 250
    Send "{Enter}"
}

::cn::
^!n::
{
    Send "!f" "{Down}" "{Down}" "{Down}" "{Right}"  "{Down}"  "{Down}" "{Down}"  "{Down}"   "{Down}"  "{Down}" "{Enter}"
}



/************* End LabVIEW Keys ***********************************/
/******************************************************************/
/*************  Start Test App  ***********************************/

#HotIf WinExist("ahk_exe Telegram.exe")
#n::
{
    MsgBox("This hotkey works only in Telegram! Hey","Title Sam2")
    WinActivate
}

/*************  End Test App *********************************/
/******************************************************************/
/*************  Start Global Keys ********************************/

#HotIf 
::gbp.::£
::rs.::₹
::eur.::€
::usd.::$
::+-::
::+.::±
:*:deg.::°
:*:micro.::µ


::asap.::as soon as possible.
::eod.::end of the day.
::gm.::Good Morning
::uan::100330286155
::sj.::samueljames84@gmail.com
::sv.::sajam@vestas.com
:RO:vp.::ZionHouse#082024


::>help::
{
    Run("C:\Program Files\AutoHotkey\v2\AutoHotkey.chm")
}

::dt.::
{
    Send FormatTime(, "yyyyMMdd")
}

::dt-::
{
	Send FormatTime(, "yyyy-MM-dd")
}

::q.::      ;for both "q." and  "qod." same code will be executed
::qod.::
{
	Send "{*}QOD " FormatTime(, "dd-MM-yyyy") "{*}"
}

^!+.:: ;(CTRL + ALT + SHIFT + .) Exit the sctipt
{
	ExitApp
}

/************* End Global Keys**************************************/
/************* Start Windows Scripts *******************************/

#c::
{
    ClipSaved := ClipboardAll ; Save the current clipboard to restore later
    A_Clipboard := "" ; Clear the clipboard
    Send "^c" ; Copy the selected text to clipboard
    ClipWait ; Wait for the clipboard to contain data
    Text := A_Clipboard  ; Get the clipboard data
    if (Text != "") {
        ClipVariable := ChangeCase(Text) ; Convert to title case
        A_Clipboard := ClipVariable ; assign value to clipboard
        Send "^v" ; Paste the modified text
    }
    return
}

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


/**************** END OF SCRIPT ***********************************/
/******************************************************************/


/* ==== HELP ======
^ CTRL
+ SHIFT
! ALT 
# WIN

^j:: MsgBox("This hotkey works in Generic CTRL+J ","Title Sam")
*/


