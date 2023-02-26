#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

HideTrayTip() {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200  ; It may be necessary to adjust this sleep.
        Menu Tray, Icon
    }
}

#MaxThreadsPerHotkey, 2
Toggle = 0

;^s::

;return

;!f::
;Send, {Left}
;Return
!j::
Send, {Right}
Return

!g::
Send, {Home}
Return
!h::
Send, {End}
Return 

!+c::
ToggleClk := !ToggleClk
Loop
{
If (!ToggleClk)
Break
Click
Sleep 83 ; Make this number higher for slower clicks, lower for faster.
}
Return

XButton1:
  Send, {F23 down}
  Sleep, 60
  Send, {F23 up}
return


XButton2:
if WinActive("ahk_class WindowsForms10.Window.8.app.0.116c861_r13_ad1")
{
  Send, {F24 down}
  Sleep, 60
  Send, {F24 up}

}
Return


^+u::                                                                 ; convert text to upper
 Sendinput, ^{c}
 StringUpper Clipboard, Clipboard
 Send %Clipboard%
RETURN

^+l::                                                                 ; convert text to lower
 Sendinput, ^{c}
 StringLower Clipboard, Clipboard
 Send %Clipboard%
RETURN

+^k::                                                                ; convert text to sentence case
 Sendinput, ^{c}
 StringUpper Clipboard, Clipboard, T
 Send %Clipboard%
RETURN
; flip screen, only works on laptop
^+!f::
if (A_ComputerName == "RHIT-R90VFC8R") {
Run  display64.exe /rotate:180 /toggle
}
Return


!m::
Run chrome.exe "https://moodle.rose-hulman.edu/" " --new-window "
Sleep, 1000
Send, {Tab}
Sleep, 100
Send, {Tab}
Sleep, 100
Send, {Enter}
Return


!p::
Run \\print.rose-hulman.edu
Return

!t::
if (A_ComputerName == "RHIT-R90VFC8R") {
	Run C:\Users\chanb\Desktop\TETR.IO.lnk
}
Return

;close all windows with this name, closes all windows if no name is specified lol
!+k::
InputBox, searchforthisstring, Window Deleter, Enter the name of the window you would like to erase from the face of the earth.
DetectHiddenWindows, Off
SetTitleMatchMode, 2
WinGet, WindowList, List

Loop, %WindowList%
{
   WinGetTitle, Title, % "ahk_id " . WindowList%A_Index%
   IfInString, Title, %searchforthisstring%
	{
   		WinClose, % "ahk_id " . WindowList%A_Index%
	}
}
Return

;when accidentally hit windows tab, do nothing cause fuck win tab
#Tab::
Return

; This is part of my AutoHotkey [1] script that puts my computer to sleep when I
; press Win+F12.

; I chose that keyboard shortcut because it's very similar to the Fn+F12
; keyboard shortcut on my laptop.

; I don't have my PC set to require a password to resume, so I also have a
; second version (Win+Shift+F12) in case I want to lock the PC first.

; [1]: http://www.autohotkey.com/


; Win+F12 - Sleep
#F12::
    ; Sleep/Suspend:
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
    ; Hibernate:
    ;DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
    Return

; Win+Shift+F12 - Lock and sleep
#+F12::
    ; Lock:
    Run rundll32.exe user32.dll`,LockWorkStation
    Sleep 1000
    ; Sleep/Suspend:
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
    ; Hibernate:
    ;DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
    Return






; Custom volume buttons
!]:: Send {Volume_Up} ; alt + ] increases volume
![:: Send {Volume_Down} ; alt + [ decreases volume
!\::Send {Volume_Mute} ; alt + \ mutes volume
return

; scroll to adjust volume
!WheelUp::
Send, {Volume_Up}
return

!WheelDown::
Send, {Volume_Down} 
Return

!MButton:: 
Send, {Volume_Mute} 
Return

; pause music?
!+s::
Send, {Media_Play_Pause}
Return



; Empty trash
#Delete::FileRecycleEmpty ; win + del
return


!a::
breakToggle := !breakToggle
TrayTip, break toggle, break toggle %breakToggle%
Loop
{
If (!breakToggle)
Break
Sleep, 900000
TrayTip, stand/stretch/break, stand/stretch/break, 10
}
Return

F8::Suspend
Return


!Esc::ExitApp
Return


!space::reload
return

; alt y download youtube video as video 
!y::
if (A_ComputerName == "RHIT-R90VFC8R") {
Run, cmd.exe , C:\Users\chanb\Desktop\youtube-dl
} else {
Run, cmd.exe , C:\Users\Brian\Desktop\youtube-dl
}
Sleep, 100
Send, yt-dlp -o "G:\\My Drive\\yt-dlp-videos\`%(title)s.`%(ext)s"
Send, {Space}
Send, {Control Down}
Sleep, 100
Send, v
Sleep, 100
Send, {Control Up}
Return

;alt shift y for download as audio, into asmr folder
!+y::
if (A_ComputerName == "RHIT-R90VFC8R") {
Run, cmd.exe , C:\Users\chanb\Desktop\youtube-dl
} else {
Run, cmd.exe , C:\Users\Brian\Desktop\youtube-dl
}
Sleep, 100
SendRaw, yt-dlp -x --audio-format mp3 -o "G:\\My Drive\\ASMR Megacollection\`%(title)s.`%(ext)s"
Send, {Space} 
Send, {Control down}
Sleep, 100
Send, v
Sleep, 100
Send, {Control up}
Return

!+u::
if (A_ComputerName == "RHIT-R90VFC8R") {
Run, cmd.exe , C:\Users\chanb\Desktop\youtube-dl
} else {
Run, cmd.exe , C:\Users\Brian\Desktop\youtube-dl
}
Sleep, 100
SendRaw, yt-dlp -x --audio-format mp3 -o "G:\\My Drive\\yt-dlp-music\`%(title)s.`%(ext)s"
Send, {Space} 
Send, {Control down}
Sleep, 100
Send, v
Sleep, 100
Send, {Control up}
Return

!+t::
if (A_ComputerName == "RHIT-R90VFC8R") {
Run, cmd.exe , C:\Users\chanb\Desktop\youtube-dl
} else {
Run, cmd.exe , C:\Users\Brian\Desktop\youtube-dl
}
Sleep, 100
SendRaw, youtube-dl -x --audio-format mp3 -o "G:\\My Drive\\yt-dlp-music\`%(playlist)s/`%(playlist_index)s - `%(title)s.`%(ext)s"
Send, {Space} 
Send, {Control down}
Sleep, 100
Send, v
Sleep, 100
Send, {Control up}
Return

;best hotstring
::resumee::résumé 
Return

;hotstring section is down here if you havent realized yet

::rardencam::
Send, http://subway-cam.rose-hulman.edu/en/mjpgmain.asp
Sleep, 25
Send, {Enter}
Return

::sutando::
Send, 「」
Send, {Left}
Return

::bonfoodd::
Send, https://rose-hulman.cafebonappetit.com/
Sleep, 25
Send, {Enter}
Return


::lennyface::
Send, ( ͡° ͜ʖ ͡°)
Return

::checkmarkk::
Send, ✔
Return

::kusaa::
Send, 草
Return

::tagg::
SendRaw, <>
Send, {Left}
Return

::tagn::
SendRaw, </>
Send, {Left}
Return

::curll::
SendRaw, {}
Send, {Left}
Return

::tiemm::
Send, ™
Return

!v::
InputBox, password, 「ROKKU ZA TASUKUBAARU」, paste what you want to paste`, edit and click ok to confirm paste
Send, %password%
;Send, %clipboard%
Return

!Backspace::
If(GetKeyState("Backspace", "P" = 1))
Send {Backspace 5}
return

::gauzz::
run, cmd.exe
sleep, 250
sendraw, ssh chanb@glados.csse.rose-hulman.edu
sleep, 250
send, {enter}
return

clk:
Click
return