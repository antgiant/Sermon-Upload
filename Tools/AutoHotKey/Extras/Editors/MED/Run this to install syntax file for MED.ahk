; v0.2 by Wolfgang Reszel (Tekl)

; set language-specific strings
StringRight, Lng, A_Language, 2
if Lng = 07  ; = Deutsch (0407, 0807, 0c07 ...)
{
   lng_close         = Bitte MED vorher schließen!
   lng_installed     = Die AutoHotkey-Syntax und die TextLib wurden für MED installiert.
   lng_noMed         = MED ist nicht richtig installiert worden.
}
else        ; = other languages (english)
{
   lng_close         = Please close MED!
   lng_installed     = The AutoHotkey-Syntax and the TextLib have been installed to MED!
   lng_noMed         = MED is not properly installed.
}

; Get path where MED is installed
RegRead, medpathroot, HKEY_LOCAL_MACHINE, SOFTWARE\Utopia Planitia\MED,Home

; Set users syntax-folder
medpath= %medpathroot%\med\profiles\%Username%

; Get path of AHKs help-file
ahkpath = %A_WorkingDir%
StringGetPos, pos, ahkpath, \, R3
StringLeft, ahkpath,ahkpath, %pos%

; MED does not like whitespace
StringReplace, ahkpath,ahkpath, %A_Space%,|

; Checks if the syntax-folder exist
IfExist, %medpath%
{
   ; Checks if MED is running
   IfWinExist, ahk_class MRED_MAINWIN_CLASS
   {
      MsgBox, 48,, %lng_close%
      ExitApp
   }

   ; Read the header for the syntax-file
   FileRead, SyntaxFile, MEDSynHeader.txt

   ; Set the path to the Helpfile
   StringReplace, SyntaxFile, SyntaxFile, C:\Program|Files\AutoHotkey\, %ahkpath%\

   ; Commands
   SyntaxFile = %SyntaxFile%`ncolor: darkblue, normal, black, bold
   CommandCount = 0
   Loop, Read, ..\Syntax\CommandNames.txt
   {
      IfInString, A_LoopReadLine, `;
         continue
      If A_LoopReadLine =
         continue

      If CommandCount = 0
         SyntaxFile = %SyntaxFile%`ntoken:

      StringReplace, ReadLine, A_LoopReadLine, %A_Space%, _, A

      IfInString, ReadLine, If_Else
         ReadLine = If
      IfInString, ReadLine, If_Var
         continue
      If ReadLine = Loop`,_
         continue

      SyntaxFile := SyntaxFile " " ReadLine

      CommandCount++
      If CommandCount > 4
         CommandCount = 0
   }

   ; Variables
   SyntaxFile = %SyntaxFile%`n`ncolor: red, normal, black, italic
   CommandCount = 0
   Loop, Read, ..\Syntax\Variables.txt
   {
      IfInString, A_LoopReadLine, `;
         continue
      If A_LoopReadLine =
         continue

      If CommandCount = 0
         SyntaxFile = %SyntaxFile%`ntoken:

      StringReplace, ReadLine, A_LoopReadLine, %A_Space%, _, A
      SyntaxFile := SyntaxFile " " ReadLine
      ;SyntaxFile := SyntaxFile " %" ReadLine "%"

      CommandCount++
      If CommandCount > 4
         CommandCount = 0
   }

   ; Keywords
   SyntaxFile = %SyntaxFile%`n`ncolor: darkpink, normal, black, normal
   CommandCount = 0
   Loop, Read, ..\Syntax\Keywords.txt
   {
      IfInString, A_LoopReadLine, `;
         continue
      If A_LoopReadLine =
         continue

      If CommandCount = 0
         SyntaxFile = %SyntaxFile%`ntoken:

      StringReplace, ReadLine, A_LoopReadLine, %A_Space%, _, A
      SyntaxFile := SyntaxFile " " ReadLine

      CommandCount++
      If CommandCount > 4
         CommandCount = 0
   }

   ; Keys
   SyntaxFile = %SyntaxFile%`n`ncolor: darkgreen, normal, black, underline
   CommandCount = 0
   Loop, Read, ..\Syntax\Keys.txt
   {
      IfInString, A_LoopReadLine, `;
         continue
      If A_LoopReadLine =
         continue

      If CommandCount = 0
         SyntaxFile = %SyntaxFile%`ntoken:

      StringReplace, ReadLine, A_LoopReadLine, %A_Space%, _, A
      SyntaxFile := SyntaxFile " " ReadLine
      ;SyntaxFile := SyntaxFile " {" ReadLine "}"

      CommandCount++
      If CommandCount > 4
         CommandCount = 0
   }

   ; Last line
   SyntaxFile = %SyntaxFile%`n`n#===========================================================

   ; Delete old syntax-file
   FileDelete, %medpath%\med-syn\AutoHotkey.syn
   FileDelete, %medpathroot%\med\profile_skeleton\med-syn\AutoHotkey.syn
   ; Write new syntax-file
   FileAppend, %SyntaxFile%, %medpath%\med-syn\AutoHotkey.syn
   FileAppend, %SyntaxFile%, %medpathroot%\med\profile_skeleton\med-syn\AutoHotkey.syn

   ; Read the header for the TextLib-file
   FileRead, LibFile, MEDMclHeader.txt

   Loop, Read, ..\Syntax\Commands.txt
   {
      StringReplace, ReadLine, A_LoopReadLine, ``n, `n , A
      StringReplace, ReadLine, ReadLine, ``t, % "   ", A
      StringGetPos, Pos, ReadLine, %A_Space%
      StringLeft, CommandOnly, ReadLine, %Pos%

      IfInString, ReadLine, If Var = Value
         CommandOnly = If =
      IfInString, ReadLine, If Var [not] between
         CommandOnly = If between
      IfInString, ReadLine, If Var [not] contains
         CommandOnly = If contains
      IfInString, ReadLine, If Var [not] in
         CommandOnly = If in
      IfInString, ReadLine, If Var is [not] type
         CommandOnly = If is type
      IfInString, ReadLine, Loop`, FilePattern
         CommandOnly = Loop FilePattern
      IfInString, ReadLine, Loop`, Parse
         CommandOnly = Loop Parse
      IfInString, ReadLine, Loop`, Read
         CommandOnly = Loop Read
      IfInString, ReadLine, Loop`, Reg
         CommandOnly = Loop Reg

      StringReplace, CommandOnly, CommandOnly, `,,
      If CommandOnly =
         continue
      LibFile := LibFile "`n!TEXT=" CommandOnly "`n" ReadLine "`n!"
   }

   ; Delete old TextLib-file
   FileDelete, %medpath%\med-mcl\AutoHotkey.mcl
   FileDelete, %medpathroot%\med\profile_skeleton\med-mcl\AutoHotkey.mcl
   ; Write new TextLib-file
   FileAppend, %LibFile%, %medpath%\med-mcl\AutoHotkey.mcl
   FileAppend, %LibFile%, %medpathroot%\med\profile_skeleton\med-mcl\AutoHotkey.mcl

   ; Set 'Edit Script' to MED
   RegWrite, REG_SZ,HKEY_CLASSES_ROOT,AutoHotkeyScript\Shell\Edit\Command,, %medpathroot%\med.exe "`%1"
   MsgBox, 64,, %lng_installed%
}
else
{
   MsgBox, 16,, %lng_noMed%
}

