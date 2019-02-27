#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force ; Forces the script to only run one at a time.
SetTitleMatchMode, 2 ; Sets mode for ifwinactive window.
#ifwinactive Apex Legends

currentGun := 0
Mode := 0
myLock := 0

~$*0::
	if (Mode == 0) {
		Mode := 1
		ToolTip("PK_King ON")
	} else {
		Mode := 0
		ToolTip("PK_King OFF")
	}
	KeyWait, 0
Return

~$*1::
	SendInput, {1}
	;Sleep, 20
	SendInput, {LControl}
	currentGun := 1
	KeyWait, 1
	; ToolTip(currentGun)
Return

~$*2::
	SendInput, {2}
	;Sleep, 20
	SendInput, {LControl}
	currentGun := 2
	KeyWait, 2
	; ToolTip(currentGun)
Return

~$*3::
	currentGun := 3
	; ToolTip(currentGun)
Return

~$*4::
	currentGun := 4
	; ToolTip(currentGun)
Return

~$*g::
	currentGun := 5
	; ToolTip(currentGun)
Return

~$*LButton::
 	if (myLock == 0 && currentGun == 2 && Mode == 1) {
 		myLock := 1
 		SendInput, {LButton}
 		Sleep, 150
 		SendInput, {R}
 		Sleep, 200
		SendInput, {3}
		Sleep, 50
		SendInput, {2}
		Sleep, 180
		KeyWait, LButton
		myLock := 0
 	}
Return

RemoveToolTip:	; Used to remove tooltips.
	SetTimer, RemoveToolTip, Off
	tooltip
Return

ToolTip(label) ;Function to show a tooltip when activating, deactivating or changing values.
{
  	ToolTip, %label%, 930, 650 ;Tooltips are shown under crosshair for FullHD monitors.
  	SetTimer, RemoveToolTip, 1000 ;Removes tooltip after 1.3 seconds.
  	Return
}