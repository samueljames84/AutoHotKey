#SingleInstance force
#Requires AutoHotkey v2.0
Persistent
#include <AutoHotInterception>

AHI := AutoHotInterception()

keyboardId := AHI.GetKeyboardId(0x13BA, 0x0001)
AHI.SubscribeKeyboard(keyboardId, true, KeyEvent)
AHI.SendKeyEvent(keyboardId, 325, true) ;Turn on Num Lock

SetNumLockState "AlwaysOn"
return
KeyEvent(code, state){

/*************  Start LabVIEW Keys *******************************
Backspace = 14|Asterisk(*) = 55|NumPad7 = 71|NumPad8 = 72|NumPad9 = 73|Minus(-) = 74|NumPad4 = 75|NumPad5 = 76|NumPad6 = 77
Plus(+) = 78|NumPad1 = 79|NumPad2 = 80|NumPad3 = 81|NumPad0 = 82|Dot(.)/Delete = 83|Enter = 284|Slash(/) = 309|NumLock = 325|
/*************  Start LabVIEW Keys *******************************/

If state = true {
If WinActive("ahk_exe LabVIEW.exe") {
	if code = 14 {	;Backspace > Paste with clipboard.
		Send "^ "
        Sleep 200
        Send "^v"
;	} else if code = 55 {	;Asterisk(*)

	} else if code = 71 {	;Numpad7 > Place Unbundle By Name
		Send "^ "
		Sleep 200
		Send "Unbundle By Name"
		Sleep 250
		Send "{Enter}"
	} else if code = 72 {	;Numpad8 > Place property Node
		Send "^ "
		Sleep 200
		Send "Property Node"
		Sleep 250
		Send "{Enter}"
;	} else if code = 73 {	;Numpad9

	} else if code = 74 {	;Minus(_) > Smart Delete/Remove 
		Send "^ "
		Sleep 200
		Send "^r"
	} else if code = 75 {	;Numpad4 > Place Bundle by name
		Send "^ "
		Sleep 200
		Send "Bundle By Name"
		Sleep 250
		Send "{Enter}"
	} else if code = 76 {	;Numpad5 > Place Invoke Node
		Send "^ "
		Sleep 200
		Send "Invoke Node"
		Sleep 250
		Send "{Enter}"
;	} else if code = 77 {	;Numpad6

	} else if code = 78 {	;Numpad+ > Insert New VI
		Send "^ "
		Sleep 200
		Send "^n"
	} else if code = 79 {	;Numpad1 > Auto Align
		Send "^ "
        Sleep 200
        Send "^a"
	} else if code = 80 {	;Numpad2 > Frontpanel Align Controls with connector pane 
		Send "^ "
		Sleep 200
		Send "^f"
		Send "^ "
	} else if code = 81 {	;Numpad3 > Smart Operations
		Send "^ "
		Sleep 200
		Send "^s"
	} else if code = 82 {	;Numpad0 > Copy
		Send "^c"
		ToolTip("Copied")
		Sleep 500
		Tooltip
	} else if code = 83 {	;Dot/Delete
		Send "^x"
		ToolTip("Cut")
		Sleep 500
		Tooltip
	} else if code = 284 {	;Enter >>>>>>> Reserved >>>>>> For Paste
		Send "^v"
;	} else if code = 309 {	;Slash

;	} else if code = 325 {	;NumLock >>>>>>> Reserved >>>>>> Cannot be used

	} ;End above else if

} ;END |If WinActive("ahk_exe LabVIEW.exe"){|
/*************  End LabVIEW Keys ****************************** *
Backspace = 14|Asterisk(*) = 55|NumPad7 = 71|NumPad8 = 72|NumPad9 = 73|Minus(-) = 74|NumPad4 = 75|NumPad5 = 76|NumPad6 = 77
Plus(+) = 78|NumPad1 = 79|NumPad2 = 80|NumPad3 = 81|NumPad0 = 82|Dot(.)/Delete = 83|Enter = 284|NumLock = 325|Slash(/) = 309
/***************Start of Static Keys************************* */

else if code = 82 {	;Numpad0
		{
		Send "^c"
		ToolTip("Copied")
		Sleep 500
		Tooltip
	}
} else if code = 83 {	;NumpadDot
		Send "^x"
		ToolTip("Cut")
		Sleep 500
		Tooltip
} else if code = 284 {	;NumpadEnter
	Send "^v"
} else {
		ToolTip("Unregistered Keyboard Key - Code: " code ", State: " state)
		Sleep 1000
		Tooltip
	}

/*********************End of Static Keys************************* */
} ;END | KeyEvent(code, state){ |
} ;END | If state = true {
/*********************ALL KeyBoards****************************** */
^!+.:: ;(CTRL + ALT + SHIFT + .) Exit the sctipt
{
	ExitApp
}
/******************************************************************/
/*********************END OF CODE *********************************/
/******************************************************************

{======= NUMPAD ID ==================
;NumPad0 = 82
;NumPad1 = 79
;NumPad2 = 80
;NumPad3 = 81
;NumPad4 = 75
;NumPad5 = 76
;NumPad6 = 77
;NumPad7 = 71
;NumPad8 = 72
;NumPad9 = 73
;Backspace = 14
;NumLock = 325
;Slash(/) = 309
;Asterisk(*) = 55
;Minus(-) = 74
;Plus(+) = 78
;Enter = 284
;Dot(.)/Delete = 83
;}

;Backspace = 14
;Asterisk(*) = 55
;NumPad7 = 71
;NumPad8 = 72
;NumPad9 = 73
;Minus(-) = 74
;NumPad4 = 75
;NumPad5 = 76
;NumPad6 = 77
;Plus(+) = 78
;NumPad1 = 79
;NumPad2 = 80
;NumPad3 = 81
;NumPad0 = 82
;Dot(.)/Delete = 83
;Enter = 284
;NumLock = 325
;Slash(/) = 309


;:*:0x4C::MsgBox "You are in notepad"
;ToolTip("KeyCode: " code "")

;#IfWinActive, ahk_exe notepad.exe
;$*Numpad2:: MsgBox "You are in notepad2"

;#HotIf WinActive("ahk_exe notepad.exe")




/*
KeyEvent(code, state){
   
	if code = 82 and state = true {	;Numpad0
		;if WinActive("ahk_exe notepad.exe")
		{
		Send "^c"
		ToolTip("Copied")
		Sleep 400
		Tooltip
	}
} else if code = 83 and state = true {	;NumpadDot
		Send "^x"
		ToolTip("Cut")
		Sleep 400
		Tooltip
} else if code = 284 and state = true {	;NumpadEnter
		Send "^v"
} else {
		;ToolTip("Keyboard Key - Code: " code ", State: " state)
	}
}

*/