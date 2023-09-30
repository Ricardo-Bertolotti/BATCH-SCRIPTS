@if (@CodeSection == @Batch) @then

PAUSE

@ECHO OFF

SET SendKeys=CScript //nologo //E:JScript "%~F0"

GOTO :EOF

@end
// JScript section
var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.SendKeys(WScript.Arguments(0));0

REM -------------------------------------------------------------------------------------------------------------------------
REM			 KEYS				=						CODES 					   =					COMMAND LINE
REM -------------------------------------------------------------------------------------------------------------------------



REM -------------------------------------------------------------------------------------------------------------------------
REM "ANY TEXT"					=			"ABCDEFGH..." 						   =			%SendKeys% "ABCDE"

REM "ANY HOTKEY"				=			"HOTKEY"							   =			%SendKeys% "^"

REM "ANY COMMAND"				=			"{COMMAND}" 						   =			%SendKeys% "{ENTER}"

REM "HOTKEY + TEXT"				=			"HOTKEY + TEXT" 					   =			%SendKeys% "^a"

REM "HOTKEY + COMMAND"			=			"HOTKEY + {COMMAND}" 				   =			%SendKeys% "^a"

REM "HOTKEY + ALL HELD DOWN"	=			"HOTKEY + (TEXT)" 				   	   =			%SendKeys% "+(ec)"

REM "HOTKEY + HELD + TEXT"		=			"HOTKEY + TEXT + TEXT" 				   =			%SendKeys% "+ec"
REM -------------------------------------------------------------------------------------------------------------------------



REM -------------------------------------------------------------------------------------------------------------------------
REM CONTROL						=			^						  			   =			%SendKeys% "^"

REM SHIFT						= 			+							   		   =			%SendKeys% "+"

REM ALT							=			%   		  						   =			%SendKeys% "%"
REM -------------------------------------------------------------------------------------------------------------------------



REM -------------------------------------------------------------------------------------------------------------------------
REM Enter						=			{ENTER} ou ~ 						   =			%SendKeys% "{ENTER}"

REM TAB							= 			{TAB}								   =			%SendKeys% "{TAB}"

REM BACKSPACE					=			{BACKSPACE}, {BS}ou {BKSP}   		   =			%SendKeys% "{BACKSPACE}"

REM DEL ou DELETE				=			{DELETE} ou {DEL} 					   =			%SendKeys% "{DELETE}"

REM SETA PARA CIMA				= 			{UP}								   =			%SendKeys% "{UP}"

REM SETA PARA BAIXO				=			{DOWN} 								   =			%SendKeys% "{DOWN}"

REM SETA PARA A DIREITA			=			{RIGHT}   							   =			%SendKeys% "{RIGHT}"


REM SETA PARA A ESQUERDA		=			{LEFT}								   =			%SendKeys% "{LEFT}"

REM ESC							=			{ESC} 								   =			%SendKeys% "{ESC}"

REM CAPS LOCK					=			{CAPSLOCK} 							   =			%SendKeys% "{CAPSLOCK}"
REM -------------------------------------------------------------------------------------------------------------------------



REM -------------------------------------------------------------------------------------------------------------------------
REM HOME						=			{HOME}								   =			%SendKeys% "{HOME}"

REM END							=			{END} 								   =			%SendKeys% "{END}"

REM PAGE UP						=			{PGUP} 								   =			%SendKeys% "{PGUP}"

REM PAGE DOWN					=			{PGDN} 								   =			%SendKeys% "{PGDN}"

REM INS ou INSERT				=			{INSERT} ou {INS} 					   =			%SendKeys% "{INSERT}"

REM BREAK						=			{BREAK} 							   =			%SendKeys% "{BREAK}"

REM NUM LOCK					=			{NUMLOCK} 							   =			%SendKeys% "{NUMLOCK}"

REM SCROLL LOCK					= 			{SCROLLLOCK}						   =			%SendKeys% "{SCROLLLOCK}"

REM TELA DE IMPRESSÃO			=			{PRTSC} (reservado para uso futuro)    =			%SendKeys% "{PRTSC}"

REM HELP						=			{HELP} 								   =			%SendKeys% "{HELP}"
REM -------------------------------------------------------------------------------------------------------------------------



REM -------------------------------------------------------------------------------------------------------------------------
REM F1							= 			{F1}								   =			%SendKeys% "{F1}"

REM F2							= 			{F2}								   =			%SendKeys% "{F2}"

REM F3							= 			{F3}							   	   =			%SendKeys% "{F3}"

REM F4							= 			{F4}								   =			%SendKeys% "{F4}"

REM F5							= 			{F5}								   =			%SendKeys% "{F5}"

REM F6							= 			{F6}								   =			%SendKeys% "{F6}"

REM F7							= 			{F7}							   	   =			%SendKeys% "{F7}"

REM F8							= 			{F8}								   =			%SendKeys% "{F8}"

REM F9							= 			{F9}								   =			%SendKeys% "{F9}"

REM F10							= 			{F10}								   =			%SendKeys% "{F10}"

REM F11							= 			{F11}								   =			%SendKeys% "{F11}"

REM F12							= 			{F12}								   =			%SendKeys% "{F12}"

REM F13							= 			{F13}								   =			%SendKeys% "{F13}"

REM F14							= 			{F14}								   =			%SendKeys% "{F14"

REM F15							= 			{F15}								   =			%SendKeys% "{F15"

REM F16							= 			{F16}								   =			%SendKeys% "{F16}"
REM -------------------------------------------------------------------------------------------------------------------------



REM -------------------------------------------------------------------------------------------------------------------------
REM Adicionar teclado			=			{ADD}								   =			%SendKeys% "{ADD}"

REM Subtraído do teclado		=			{SUBTRACT}							   =			%SendKeys% "{SUBTRACT}"

REM Multiplicação do teclado    =			{MULTIPLY}							   =			%SendKeys% "{MULTIPLY}"

REM Divisão do teclado			=			{DIVIDE}							   =			%SendKeys% "{DIVIDE}"
REM -------------------------------------------------------------------------------------------------------------------------
