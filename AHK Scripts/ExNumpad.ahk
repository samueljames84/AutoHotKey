Persistent
#SingleInstance force
#Requires AutoHotkey v2.0
#include <AutoHotInterception>
#Include SamFunctions.ahk
#Include LabVIEW.ahk
#Include Monitor.ahk

global UserProfile := EnvGet("USERPROFILE")
AHI := AutoHotInterception()

keyboardId := AHI.GetKeyboardId(0x13BA, 0x0001)
AHI.SubscribeKeyboard(keyboardId, true, KeyEvent)
AHI.SendKeyEvent(keyboardId, 325, true) ;Turn on Num Lock

SetNumLockState "AlwaysOn"
return

/*************  Start LabVIEW Keys *******************************
Backspace = 14|Asterisk(*) = 55|NumPad7 = 71|NumPad8 = 72|NumPad9 = 73|Minus(-) = 74|NumPad4 = 75|NumPad5 = 76|NumPad6 = 77
Plus(+) = 78|NumPad1 = 79|NumPad2 = 80|NumPad3 = 81|NumPad0 = 82|Dot(.)/Delete = 83|Enter = 284|Slash(/) = 309|NumLock = 325|
/*************  Start LabVIEW Keys *******************************/

KeyEvent(code, state){
If state = true {
	if code = 1000 {	    ;Dummy Not used just to use everything in else if in a uniform way

	} else if code = 14 {	;Backspace > Smart Paste
        If WinActive("ahk_exe LabVIEW.exe"){
			QuickAction("^v")
        }
	} else if code = 55 {	;Asterisk(*)
		NoOfInst := GetNoOfInstances("Code.exe","ahk_class Chrome_WidgetWin_1")
		If NoOfInst != 0 {
			ActivateAll("Code.exe","ahk_class Chrome_WidgetWin_1")
		} else {
            Run(UserProfile "\AppData\Local\Programs\Microsoft VS Code\Code.exe")
        }
	} else if code = 71 {	;Numpad7 > Place Unbundle By Name
        If WinActive("ahk_exe LabVIEW.exe"){
			QuickDrop("Unbundle By Name")
        }
	} else if code = 72 {	;Numpad8 > Place property Node
        If WinActive("ahk_exe LabVIEW.exe"){
			QuickDrop("Property Node")
        }
;	} else if code = 73 {	;Numpad9
	} else if code = 74 {	;Minus(_) > Smart Delete/Remove 
        If WinActive("ahk_exe LabVIEW.exe"){
			QuickAction("^r")
        }
	} else if code = 75 {	;Numpad4 > Place Bundle by name
        If WinActive("ahk_exe LabVIEW.exe"){
			QuickDrop("Bundle By Name")
        }
	} else if code = 76 {	;Numpad5 > Place Invoke Node
        If WinActive("ahk_exe LabVIEW.exe"){
			QuickDrop("Invoke Node")
        }
;	} else if code = 77 {	;Numpad6
	} else if code = 78 {	;Numpad+ > Insert New VI
        If WinActive("ahk_exe LabVIEW.exe"){
			QuickAction("^n")
		}
	} else if code = 79 {	;Numpad1 > Auto Align
        If WinActive("ahk_exe LabVIEW.exe"){
			QuickAction("^a")
        }
	} else if code = 80 {	;Numpad2 > Frontpanel Align Controls with connector pane 
        If WinActive("ahk_exe LabVIEW.exe"){
			QuickAction("^f")
        }
	} else if code = 81 {	;Numpad3 > Smart Operations
        If WinActive("ahk_exe LabVIEW.exe"){
			QuickAction("^s")
        }
	} else if code = 82 {	;Numpad0 > Copy
		Send "^c"
		Tip("Copied", 500)
	} else if code = 83 {	;Dot/Delete
		Send "^x"
		Tip("Cut", 500)
	} else if code = 284 {	;Enter >>>>>>> Reserved >>>>>> For Paste
		Send "^v"
	} else if code = 309 {	;Slash
		NoOfInst := GetNoOfInstances("","ahk_class Clover_WidgetWin_0")
		If NoOfInst != 0 {
			ActivateAll("","ahk_class Clover_WidgetWin_0")
		} else {
            Run("explorer.exe") 
        }
;    } else if code = 325 {	;NumLock >>>>>>> Reserved >>>>>> Cannot be used
	} else {
		ToolTip("Unregistered Key Code: " code ", State: " state)
		Sleep 1000
		Tooltip
	}
}
}
/*********************End of Static Keys************************* */
/*********************ALL KeyBoards****************************** */
#!.:: ExitApp ;(WIN + ALT + .) Exit the sctipt
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
