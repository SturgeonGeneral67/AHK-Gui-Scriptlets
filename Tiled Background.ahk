
; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
#NoEnv ; Recommended for performance and future compatibility.
#Persistent ; Keeps a script permanently running until user closes it or ExitApp is encountered.
#SingleInstance, Force ; Determines whether a script is allowed to run again when it is already running.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
Menu, Tray, Icon, wmploc.dll, 99
; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 

^T::

; = = = = = Use the included testing samples. Must remain in same location as script.
; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 

Gui,
    +Resize 		 ; Makes the window resizable and enables its maximize button in the title bar.
    +AlwaysOnTop 	 ; Makes a window stay on top of all other windows.

OnMessage(0x136,"WM_CTLCOLORDLG") 
; = = = = = WM_CTLCOLORDLG message:  Sent to a dialog box before the system draws the dialog box. By responding to this message, the dialog box can set its text and background colors using the specified display device context handle.

Gui, Margin, 15, 15
Gui, Font, S12 Bold, Arial Black

Gui, Add, Picture,x14 y16 Center vImage1 BackgroundTrans , %A_ScriptDir%/BATblack.png 	 ; Offset shadowed image.
Gui, Add, Picture,x10 y10 Center vImage2 BackgroundTrans , %A_ScriptDir%/BAT.png 	 ; Image inside Gui.

Gui, Show,, GUI with 'Tiled background' 
Sleep 10
Return

; = = = = = Must use bmp image. Change with personal choice below. "Weathered.bmp" is example.
WM_CTLCOLORDLG(){
	Static wBrush
	If !wBrush
	hBM:=DllCall("LoadImage",Int,0,Str,"Weathered.bmp",Int,0,Int,0,Int,0,UInt,0x2010),wBrush:=DllCall("CreatePatternBrush",UInt,hBM)
	Return wBrush
}
GuiClose:
GuiEscape:
    Reload
;    ExitApp

; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
RETURN

^Home::
    Reload 		 ; Ctrl + [Home]

^Esc::
    ExitApp 		 ; Ctrl + [Esc]
; = = = = = 
