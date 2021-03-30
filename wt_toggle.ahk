#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^`::ToggleTerminal()

ShowTerminal()
{
    WinShow ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    WinActivate ahk_class CASCADIA_HOSTING_WINDOW_CLASS
}

ToggleTerminal()
{
    WinMatcher := "ahk_class CASCADIA_HOSTING_WINDOW_CLASS"

    DetectHiddenWindows, On

    if WinExist(WinMatcher)
    {
        DetectHiddenWindows, Off

        if !WinExist(WinMatcher) || !WinActive(WinMatcher)
        {
            ShowTerminal()
        }
        else if WinExist(WinMatcher)
        {
            WinHide ahk_class CASCADIA_HOSTING_WINDOW_CLASS
        }
    }
    else
    {
        Run, wt.ext
        ShowTerminal()
    }
}