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


!f::
Send, {Left}
Return
!j::
Send, {Right}
Return

!g::
Send, {Home}
Return
!h::
Send, {End}
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


!+d::
Send, /**
Send, {Enter}
Send, *
Send, {Enter}
Send, */
Send, {Up}
Send, {Tab}
Return

^+!f::
Run  display64.exe /rotate:180 /toggle
Return


!m::
Run chrome.exe "https://moodle.rose-hulman.edu/" " --new-window "
Sleep, 1000
Send, {Tab}
Sleep, 1000
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


F8::Suspend
Return


!Esc::ExitApp
Return

!z::
  while GetKeyState("z")
  {
    Click
    Sleep, 34
  }
return


;move mouse to top left corner of window
!l::
MouseMove, 0, 0
Return

!space::reload
return


!x::
;Run,C:\Users\chanb\Gopher (Controller to Mouse)\Gopher.exe, C:\Users\chanb\Gopher (Controller to Mouse)
Run, C:\Users\Brian\Downloads\Gopher.exe
Return


!y::
Run, cmd.exe , C:\Users\Brian\Desktop\youtube-dl
Sleep, 100
Send, youtube-dl
Send, {Space}
Send, {Control Down}
Sleep, 100
Send, v
Sleep, 100
Send, {Control Up}
Return

!+y::
Run, cmd.exe , C:\Users\Brian\Desktop\youtube-dl
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
Run, cmd.exe , C:\Users\Brian\Desktop\youtube-dl
Sleep, 100
SendRaw, yt-dlp -x --audio-format mp3 -o "G:\\My Drive\\`%(title)s.`%(ext)s"
Send, {Space} 
Send, {Control down}
Sleep, 100
Send, v
Sleep, 100
Send, {Control up}
Return

!+t::
Run, cmd.exe , C:\Users\Brian\Desktop\youtube-dl
Sleep, 100
SendRaw, youtube-dl -x --audio-format mp3 -o "D:\\youtube-dl-output\`%(title)s.`%(ext)s"
Send, {Space} 
Send, {Control down}
Sleep, 100
Send, v
Sleep, 100
Send, {Control up}
Return

sticks = 0

!+p::
sticksTrading := !sticksTrading
   while, sticksTrading
	{
				Click, 635, 311
				sleep, 50
				Click, 1337, 369
				sleep,  50
	}
return

!+l::
sticksCrafting := !sticksCrafting
   while, sticksCrafting
	{
				Click, 420, 378
				sleep, 50
				Click, 1580, 350
				sleep,  50
	}
return

!+o::
planksCrafting := !planksCrafting
   while, planksCrafting
	{
				Click, 520, 378
				sleep, 50
				Click, 1580, 350
				sleep,  50
	}
return

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

::haachamapanik::
Send, https://tenor.com/view/akai-haato-hololive-not-like-this-panic-shake-gif-17045844
Return

::haachamaslam::
Send, https://tenor.com/view/akai-haato-hololive-slam-fist-why-gif-17712177
Return

::okayuflash::
Send, https://tenor.com/view/okayu-nekomata-okayu-blinding-gif-17979062
Return

::okayudance::
Send, https://tenor.com/view/nekomata-okayu-hololive-dancing-vtuber-gif-17712180
Return

::okayuspin::
Send, https://tenor.com/view/okayu-hololive-spinning-dizzy-roll-gif-16214013
Return

::okapekojam::
Send, https://tenor.com/view/usada-pekora-nekomata-okayu-hololive-vtuber-gif-16460095
Return

::koronemath::
Send, https://tenor.com/view/inugami-korone-hololive-thinking-anime-confused-gif-17902545
Return

::fubukiconfuse::
Send, https://imgur.com/cjBnf2L
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
;InputBox, password, 「ROKKU ZA TASUKUBAARU」, paste what you want to paste`, edit and click ok to confirm paste
;Send, %password%
Send, %clipboard%
Return

Numpad0::
KeyDown := !KeyDown
If KeyDown
	SendInput {v down}
Else
	SendInput {v up}
Return

Numpad1::
tog:=!tog
if(tog)
    SetTimer, clk, 10, On
else
    SetTimer, clk, Off
return
 
clk:
Click
return