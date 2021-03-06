#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

!^Right::send, #^{Right down}{Right up}
!^Left::send, #^{Left down}{Left up}
^!d::send, #^d
^q::send,#^{F4}

;Shift + Windows + Up (maximize a window across all displays) https://stackoverflow.com/a/9830200/470749
^+Up:: DoubleMaximum()
^!Space:: Run, brave,,max
DoubleMaximum()
{
    WinGetActiveTitle, Title
    WinRestore, %Title%
   SysGet, X1, 76
   SysGet, Y1, 77
   SysGet, Width, 78
   SysGet, Height, 79
   WinMove, %Title%,, X1, Y1, Width, Height

}
^+Down:: Maximum()
Maximum()
{
	WinShow ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    WinActivate ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    WinMaximize, %hwnd%
}
F12::ToggleTerminal()

ShowAndPositionTerminal()
{
    WinShow ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    WinActivate ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    WinMaximize, %hwnd%
}

ToggleTerminal()
{
    WinMatcher := "ahk_class CASCADIA_HOSTING_WINDOW_CLASS"

    DetectHiddenWindows, On

    if WinExist(WinMatcher)
    ; Window Exists
    {
        DetectHiddenWindows, Off

        ; Check if its hidden
        if !WinExist(WinMatcher) || !WinActive(WinMatcher)
        {
            ShowAndPositionTerminal()
        }
        else if WinExist(WinMatcher)
        {
            ; Script sees it without detecting hidden windows, so..
            WinHide ahk_class CASCADIA_HOSTING_WINDOW_CLASS
            Send !{Esc}
        }
    }
    else
    {
        Run "C:\Users\Leylan\AppData\Local\Microsoft\WindowsApps\wt.exe"
        Sleep, 1000
        ShowAndPositionTerminal()
    }
}