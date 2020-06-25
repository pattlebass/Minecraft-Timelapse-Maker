#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

time := 0
loops := 24
step := 1000
delay := 1000

F10::

InputBox, numberOfPhotos, Timelapse Maker, Enter how many photos you want.
InputBox, userDelay, Timelapse Maker, Enter the delay between the screenshots being taken in ms (Default: 1000)
loops := numberOfPhotos
step := Floor(24000 / loops)
delay := userDelay

Send, {Escape}
Send, {F1}

Loop, %loops% {
Send /
Sleep, 100
Send, time set %time%
Send, {Return}
time := time + step
Sleep, %delay%
Send, {F2}
}

Send, {F1}
time := 0
return