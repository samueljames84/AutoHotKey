#Requires AutoHotkey v2.0

SetWindowPosition(MonitorNumber, Position, WinID)
{
    TaskBarOffset := 40 ; TRask bar height
    MonitorGet MonitorNumber, &Left, &Top, &Right, &Bottom
    MonitorWidth := Right - Left
    MonitorHeight := Bottom - Top - TaskBarOffset
    If Position == 11 {
        PosLeft := Left
        PosTop := Top
        Width := Integer(MonitorWidth/2)
        Height := MonitorHeight    
    }
    WinMove PosTop, PosTop, Width, Height, WinID
    return 
}