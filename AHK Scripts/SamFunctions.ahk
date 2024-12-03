;====================================================================================
; ChangeCase >>Convert a sentence with the every 1st letter of the word with capital letter
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
;====================================================================================
GetMonitorNumber(WinID)
{
    WinGetPos &X, &Y, &W, &H, WinID  
    X:=X+10
    Y:=Y+10
    ; MsgBox(", " X "<->" Y )
    MonitorCount := SysGet(80)
    Loop MonitorCount
        {
            MonitorGet A_Index, &Left, &Top, &Right, &Bottom  
            if (X >= Left && Y >= Top && X <= Right && Y <= Bottom){
                MonNum := A_Index
                break
            }
        } return MonNum
}
;====================================================================================
GetNoOfInstances(ProcessName,ClassName)
{
    i := 0
    if (ProcessName == "") {
        PID:= -1
    } else {
        PID := ProcessExist(ProcessName)
    }
    
    for WinID in WinGetList(ClassName) {
        CurrentProcessName := WinGetProcessName(WinID)
        ; MsgBox(CurrentProcessName)
        if (CurrentProcessName == ProcessName || PID == -1) {
            i:= i+1
            ;MsgBox("Iteration" i)
        }
    }
    return i
}
;====================================================================================


