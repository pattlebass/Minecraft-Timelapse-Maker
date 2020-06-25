#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

time := 0
loops := 24
step := 1000

F10::

InputBox, numberOfPhotos, Timelapse Maker, Enter how many photos you want`n24 if you want one photo for every hour`, 48 if you want one for every 30 minutes`, etc
loops := numberOfPhotos
step := Floor(24000 / loops)

Send, {Escape}
Send, {F1}

Loop, %loops% {
Send /
Sleep, 100
Send, time set %time%
Send, {Return}
time := time + step
Sleep, 1000
Send, {F2}
}

Send, {F1}
time := 0
return