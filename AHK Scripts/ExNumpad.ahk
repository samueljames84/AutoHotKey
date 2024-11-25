#SingleInstance force
Persistent
#include <AutoHotInterception>

AHI := AutoHotInterception()

keyboardId := AHI.GetKeyboardId(0x13BA, 0x0001)
AHI.SubscribeKeyboard(keyboardId, true, KeyEvent)
AHI.SendKeyEvent(keyboardId, 325, true) ;Turn on Num Lock

SetNumLockState "AlwaysOn"
return
KeyEvent(code, state){

/*************  Start LabVIEW Keys *******************************/

If WinActive("ahk_exe LabVIEW.exe") and state = true {
	if code = 14 {	;Backspace > Paste with clipboard.
		Send "^ "
        Sleep 200
        Send "^v"
	} else if code = 81 {	;Numpad3
		Send "^ "
		Sleep 200
		Send "Property Node"
		Sleep 250
		Send "{Enter}"
	}else if code = 77 {	;Numpad6
		Send "^ "
		Sleep 200
		Send "Invoke Node"
		Sleep 250
		Send "{Enter}"
	}else if code = 79 {	;Numpad1
		Send "^ "
		Sleep 200
		Send "Unbundle By Name"
		Sleep 250
		Send "{Enter}"
	}else if code = 80 {	;Numpad2
		Send "^ "
		Sleep 200
		Send "Bundle By Name"
		Sleep 250
		Send "{Enter}"
	}else if code = 78 {	;Numpad+ Frontpanel Align Controls and vi windows
		Send "^ "
		Sleep 200
		Send "^f"
	}






} ;END |If WinActive("ahk_exe LabVIEW.exe"){|
/*************  End LabVIEW Keys ****************************** */


/***************Start of Static Keys************************* */

if code = 82 and state = true {	;Numpad0
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


/*********************End of Static Keys************************* */
} ;END | KeyEvent(code, state){ |
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