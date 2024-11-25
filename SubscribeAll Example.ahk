#SingleInstance force
Persistent
#include Lib\AutoHotInterception.ahk

AHI := AutoHotInterception()

keyboardId := AHI.GetKeyboardId(0x13BA, 0x0001)
AHI.SubscribeKeyboard(keyboardId, true, KeyEvent)

;mouseId := AHI.GetMouseId(0x046D, 0xC00C)
;AHI.SubscribeMouseButtons(mouseId, false, MouseButtonEvent)
return

KeyEvent(code, state){
	ToolTip("Keyboard Key - Code: " code ", State: " state)
}

;MouseButtonEvent(code, state){
;	ToolTip("Mouse Button - Code: " code ", State: " state)
;}

^Esc::
{
	ExitApp
}

