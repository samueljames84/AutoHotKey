#Requires AutoHotkey v2.0
#SingleInstance force
#Include SamFunctions.ahk
#Include LabVIEW.ahk

Persistent
SetNumLockState "AlwaysOn"
global UserProfile := EnvGet("USERPROFILE")

/************* End Initialization *********************************/
/*       | ^ CTRL | + SHIFT | ! ALT | # WIN |
/******************************************************************/
#HotIf WinExist("ahk_exe Code.exe")
#!v::WinActivate("ahk_exe Code.exe")

#HotIf WinActive("ahk_exe explorer.exe")
^!v::NewFolderFromClipboard() ;Create a New folder with the name in from clipboard and open the folder
^p::Run("shell:::{A8A91A66-3A7D-4424-8D24-04E180695C7A}") ;Open Printers Window in file explorer
^u::Run("appwiz.cpl")
^h::ShowOrHideHiddenFiles() ; Show/Hide hidden Files
^e::ShowOrHideFileExtension() ; Show Hide File Extension

#HotIf WinExist("ahk_exe clover.exe")
#e:: ActivateAll("","ahk_class Clover_WidgetWin_0") ; Press WIN+E to activate all File Explorer windows
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
::+-::±
::+.::±
:*:deg.::°
:*:micro.::µ
::asap.::as soon as possible.
::eod.::end of the day.
::gm.::Good Morning
:O:uan::100330286155
::sj.::samueljames84@gmail.com
::sv.::sajam@vestas.com
:RO:vp.::ZionHouse#082024
#!v:: Run(UserProfile "\AppData\Local\Programs\Microsoft VS Code\Code.exe")

::>help::{
    Run("C:\Program Files\AutoHotkey\v2\AutoHotkey.chm")
}

::dt.::{
    Send FormatTime(, "yyyyMMdd")
}

::dt-::{
	Send FormatTime(, "yyyy-MM-dd")
}

::q.::      ;for both "q." and  "qod." same code will be executed
::qod.::{
	Send "QOD " FormatTime(, "dd-MM-yyyy")
}

::q*::      ;for both "q." and  "qod." same code will be executed
::qod*::{
	Send "{*}QOD " FormatTime(, "dd-MM-yyyy") "{*}"
}

^!+.::{ ;(CTRL + ALT + SHIFT + .) Exit the sctipt
	ExitApp
}

/************* End Global Keys**************************************/
/************* Start Windows Scripts *******************************/

#a::{
    ClassName := "ahk_class " . WinGetClass(WinActive("A"))
    ProcessName := WinGetProcessName(WinActive("A")) 
    ActivateAll(ProcessName, ClassName)
}
#c::ChangeCase()
#^+s::Run("winspy")

/**************** END OF SCRIPT ***********************************/
/******************************************************************/

