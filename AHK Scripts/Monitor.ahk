#Requires AutoHotkey v2.0
;====================================================================================
;====================================================================================

SetWindowPosition(MonitorNumber, Position, WinID)
{
    WinRestore(WinID)
    TaskBarOffset := 40 ; Task bar height
    ;MonitorGet MonitorNumber, &Left, &Top, &Right, &Bottom
    MonitorGetWorkArea MonitorNumber, &Left, &Top, &Right, &Bottom
    MonitorWidth := Right - Left
    MonitorHeight := Bottom - Top
    Width:=MonitorWidth
    Height:= MonitorHeight
    ;MonitorHeight := Bottom - Top - TaskBarOffset
    If Position = 1 {
        PosLeft := Left
        PosTop := Top
        Width := MonitorWidth
        Height := MonitorHeight    
    }   else if Position = 2 {
        PosLeft := Left + Ceil(MonitorWidth/3)
        PosTop := Top
        Width := Ceil(MonitorWidth/3*2) 
        Height := MonitorHeight 
    }   else if Position = 12 {
        PosLeft := Left
        PosTop := Top
        Width := Ceil(MonitorWidth/2) 
        Height := MonitorHeight 
    }   else if Position = 22 {
        PosLeft := Left + Ceil(MonitorWidth/2) 
        PosTop := Top 
        Width := Ceil(MonitorWidth/2) 
        Height := MonitorHeight 
    }   else if Position = 13 {
        PosLeft := Left 
        PosTop := Top 
        Width := Ceil(MonitorWidth/3) 
        Height := MonitorHeight 
    }   else if Position = 23 {
        PosLeft := Left + Ceil(MonitorWidth/3) 
        PosTop := Top 
        Width := Ceil(MonitorWidth/3) 
        Height := MonitorHeight
    }   else if Position = 33 {
        PosLeft := Left + Ceil(MonitorWidth/3*2)
        PosTop := Top 
        Width := Ceil(MonitorWidth/3)
        Height := MonitorHeight     
    }   else if Position = 14 {
        PosLeft := Left
        PosTop := Top 
        Width := Ceil(MonitorWidth/2)
        Height := Ceil(MonitorHeight/2)  
    }   else if Position = 24 {
        PosLeft := Left + Ceil(MonitorWidth/2)
        PosTop := Top
        Width := Ceil(MonitorWidth/2)
        Height := Ceil(MonitorHeight/2)       
    }   else if Position = 34 {
        PosLeft := Left
        PosTop := Top  + Ceil(MonitorHeight/2)
        Width := Ceil(MonitorWidth/2)
        Height := Ceil(MonitorHeight/2)
    }   else if Position = 44 {
        PosLeft := Left + Ceil(MonitorWidth/2)
        PosTop := Top  + Ceil(MonitorHeight/2)
        Width := Ceil(MonitorWidth/2)
        Height := Ceil(MonitorHeight/2) 
    }   else if Position = 16 {
        PosLeft := Left
        PosTop := Top 
        Width := Ceil(MonitorWidth/3)
        Height := Ceil(MonitorHeight/2) 
    }   else if Position = 26 {
        PosLeft := Left + Ceil(MonitorWidth/3)
        PosTop := Top
        Width := Ceil(MonitorWidth/3)
        Height := Ceil(MonitorHeight/2)        
    }   else if Position = 36 {
        PosLeft := Left + Ceil(MonitorWidth/3*2)
        PosTop := Top
        Width := Ceil(MonitorWidth/3)
        Height := Ceil(MonitorHeight/2)        
    }   else if Position = 46 {
        PosLeft := Left
        PosTop := Top + Ceil(MonitorHeight/2) 
        Width := Ceil(MonitorWidth/3)
        Height := Ceil(MonitorHeight/2)      
    }   else if Position = 56 {
        PosLeft := Left + + Ceil(MonitorWidth/3)
        PosTop := Top  + Ceil(MonitorHeight/2)
        Width := Ceil(MonitorWidth/3)
        Height := Ceil(MonitorHeight/2)        
    }   else if Position = 66 {
        PosLeft := Left + Ceil(MonitorWidth/3*2)
        PosTop := Top  + Ceil(MonitorHeight/2)
        Width := Ceil(MonitorWidth/3)
        Height := Ceil(MonitorHeight/2)    
    } else {
        Position := 1    
    }
    
    WinMove PosLeft, PosTop, Width, Height, WinID
    if Position = 1 {
        WinMaximize(WinID)
    }
    return 
}
;====================================================================================

GetMonitorNumber(WinID)
{
    WinGetPos &X, &Y, &W, &H, WinID  
    X:=X+10
    Y:=Y+10
    MonNum := MonitorGetPrimary()
    ; MsgBox(", " X "<->" Y )
    MonitorCount := SysGet(80)
    Loop MonitorCount
        {
            MonitorGet A_Index, &Left, &Top, &Right, &Bottom  
            if (X >= Left && Y >= Top && X <= Right && Y <= Bottom){
                MonNum := A_Index ; A_Index = get or set the number of the current loop iteration 
                break
            }
        } return MonNum
}
;====================================================================================

SetAllWindowPosition(WinList)
{
    NoOfInst := WinList.Length
    MonitorNumber := GetMonitorNumber(WinList[1])
    If NoOfInst = 1 {
        SetWindowPosition(MonitorNumber, 1, WinList[1])
    } else if NoOfInst = 2 {
        SetWindowPosition(MonitorNumber, 12, WinList[1])
        SetWindowPosition(MonitorNumber, 22, WinList[2])
    } else if NoOfInst = 3 {
        SetWindowPosition(MonitorNumber, 13, WinList[1])
        SetWindowPosition(MonitorNumber, 23, WinList[2])
        SetWindowPosition(MonitorNumber, 33, WinList[3])
    } else if NoOfInst = 4 {
        SetWindowPosition(MonitorNumber, 14, WinList[1])
        SetWindowPosition(MonitorNumber, 24, WinList[2])
        SetWindowPosition(MonitorNumber, 34, WinList[3])
        SetWindowPosition(MonitorNumber, 44, WinList[4])
    } else if NoOfInst = 5 {
        SetWindowPosition(MonitorNumber, 14, WinList[1])
        SetWindowPosition(MonitorNumber, 24, WinList[2])
        SetWindowPosition(MonitorNumber, 46, WinList[3])
        SetWindowPosition(MonitorNumber, 56, WinList[4])
        SetWindowPosition(MonitorNumber, 66, WinList[5])
    }else if NoOfInst > 5 {
        SetWindowPosition(MonitorNumber, 16, WinList[1])
        SetWindowPosition(MonitorNumber, 26, WinList[2])
        SetWindowPosition(MonitorNumber, 36, WinList[3])
        SetWindowPosition(MonitorNumber, 46, WinList[4])
        SetWindowPosition(MonitorNumber, 56, WinList[5])
        SetWindowPosition(MonitorNumber, 66, WinList[6])
    }
}
;====================================================================================
AlignFileExplorer()
{
    ActivateAll("","ahk_class Clover_WidgetWin_0")
    WinList := GetWinList("","ahk_class Clover_WidgetWin_0")
    If WinList.Length > 0 {
    SetAllWindowPosition(WinList)
    } else {
        Run("explorer.exe")
    }
}
;====================================================================================

SetWindow(Position)
{
    WinID := WinActive("A")
    MonitorNumber := GetMonitorNumber(WinID)
    SetWindowPosition(MonitorNumber, Position, WinID)
}

GetProcessAndClassName(WinID)
{
    ClassName := "ahk_class " . WinGetClass(WinID)
    ProcessName := WinGetProcessName(WinID) 
    If ProcessName == "explorer.exe"{
        ProcessName := ""
        ClassName := "ahk_class Clover_WidgetWin_0"
    }
    ObjectVar := {ProcessName: ProcessName, ClassName: ClassName}
    return ObjectVar
}