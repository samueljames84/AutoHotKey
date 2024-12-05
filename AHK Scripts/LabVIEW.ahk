;====================================================================================
;====================================================================================
;====================================================================================
QuickDrop(ItemName)
{
    Send "^ "
    Sleep 200
    Send (ItemName)
    Sleep 250
    Send "{Enter}"
} 
;====================================================================================

QuickAction(ActionName)
{
    Send "^ "
    Sleep 200
    Send (ActionName)
} 
;====================================================================================
InsertBundleByName()
{
    Send "^ "
    Sleep 200
    Send "Bundle By Name"
    Sleep 200
    Send "^i"
}
;====================================================================================
;====================================================================================
;====================================================================================

#HotIf WinActive("ahk_exe LabVIEW.exe")
!a::QuickAction("^a") ;ALT+A Auto Align Labels
!n::QuickAction("^n") ;ALT+N Insert New Sub Vi
!f::QuickAction("^f") ;ALT+F Align the Panel Size And ReArrange Front Panel Controls
!w::QuickAction("^w") ;ALT+W Wire All The Terminals
!v::QuickAction("^v") ;ALT+V Replace with clipboard
!Delete:: QuickAction("^r") ;ALT+Delete
!b::InsertBundleByName() ;ALT+B Insert Bundle By Name

!u:: ;ALT+U
::.un::{
    QuickDrop("Unbundle By Name")
}

!p:: ;ALT+P
::.pn::{
    QuickDrop("Property Node")
    }

::.in::{
    QuickDrop("Invoke Node")
    }

::.bu::{
    QuickDrop("Unbundle By Name")
    } 

!s::
::.specific::{
    QuickDrop("To More Specific Class")
}

!g:: ;ALT+G
::.generic::{
    QuickDrop("To More Generic Class")
    }

::.fl::
::.for::{
    QuickDrop("For Loop")
    }

::.ia::
::.index::{
    QuickDrop("Index Array")
    }

::.search::{
    QuickDrop("Search 1D Array")
    }

::.wl::
::.while::{
    QuickDrop("While Loop")
    }

::.type::
::.tc::{
    QuickDrop("Type Cast")
    }

::.cs::
::.case::{
    QuickDrop("Case Structure")
    }

::.cr::
::.close::{
    QuickDrop("Close Reference")
    }

::.ra::{ 
    QuickDrop("Replace Array Subset")
    }

::.as::{
    QuickDrop("Array Size")
    }

::.ba::
::.build::{
    QuickDrop("Build Array")
    }

::.lt::{    
    QuickDrop("Less Than 0")
    }

::gt::{
    QuickDrop("Greater Or Equal To 0")
    }

::.format::
::.fs::{
    QuickDrop("Format Into String")
    }

::.one::
::.obd::{
    QuickDrop("One Button Dialog")
    }

::.clear::
::.ce::{
    QuickDrop("Clear Errors")
    }

::.match::
::.mp::{
    QuickDrop("Match Pattern")
    }

::.v::
::.variant::{
    QuickDrop("Variant To Data")
    }

::.1::
::.not::{
    QuickDrop("Not Equal?")
    }

::.build::
::.ba::{
    QuickDrop("Build Array")
    }

::cn::
^!n::{
    Send "!f" "{Down}" "{Down}" "{Down}" "{Right}"  "{Down}"  "{Down}" "{Down}"  "{Down}"   "{Down}"  "{Down}" "{Enter}"
}

