#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force ; Forces the script to only run one at a time.

myLock := 0

~0 & LButton::
 	if (myLock == 0) {
 		myLock := 1
 		SendInput, {LButton}
 		Sleep, 150
 		SendInput, {R}
 		Sleep, 200
		SendInput, {3}
		Sleep, 50
		SendInput, {2}
		Sleep, 30
		SendInput, {LControl}
		Sleep, 200
		KeyWait, LButton
		myLock := 0
 	}
Return