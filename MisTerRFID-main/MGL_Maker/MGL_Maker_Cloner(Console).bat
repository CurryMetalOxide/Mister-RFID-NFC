@echo off
setlocal EnableExtensions DisableDelayedExpansion
cls
echo/
echo This .bat MUST be run from your selected CORE games folder.
echo/
echo/
echo Example: USB0/Games/SNES ^<------- In this folder
echo/
echo Select a CORE to create MGL files for:
echo/
echo	1. AtariLynx
echo	2. FamicomDiskSystem
echo	3. Sega32X
echo	4. Gameboy
echo	5. GBA
echo	6. Genesis
echo	7. Jaguar
echo	8. MegaCD
echo	9. NEXT PAGE.....
echo/
echo/
:ConsoleA0
%SystemRoot%\System32\choice.exe /C 123456789 /N /M "Please make your selection:"
goto ConsoleA%ErrorLevel%

:ConsoleA1
set "consoleloop=CopyTime"
set "console=AtariLynx"
set "settings=delay="1" type="f" index="1""
set "extensions=*.lnx"
goto GetBasePathLength

:ConsoleA2
set "consoleloop=FDS"
set "console=NES"
set "settings=delay="2" type="F" index="1""
set "extensions=*.*"
goto GetBasePathLength

:ConsoleA3
set "consoleloop=CopyTime"
set "console=S32X"
set "settings=delay="1" type="f" index="1""
set "extensions=*.32x"
goto GetBasePathLength

:ConsoleA4
set "consoleloop=CopyTime"
set "console=Gameboy"
set "settings=delay="1" type="f" index="1""
set "extensions=*.GBC,*.GB"
goto GetBasePathLength

:ConsoleA5
set "consoleloop=CopyTime"
set "console=GBA"
set "settings=delay="2" type="f" index="1""
set "extensions=*.GBA"
goto GetBasePathLength

:ConsoleA6
set "consoleloop=CopyTime"
set "console=Genesis"
set "settings=delay="1" type="F" index="1""
set "extensions=*.BIN,*.GEN,*.MD"
goto GetBasePathLength

:ConsoleA7
set "consoleloop=CopyTime"
set "console=Jaguar"
set "settings=delay="1" type="F" index="0""
set "extensions=*.JAG"
goto GetBasePathLength

:ConsoleA8
set "consoleloop=CopyTime"
set "console=MegaCD"
set "settings=delay="1" type="S" index="0""
set "extensions=*.CUE,*.CHD"
goto GetBasePathLength

:ConsoleA9
cls
echo/
echo This .bat MUST be run from your selected CORE games folder.
echo/
echo Example: USB0/Games/SNES ^<------- In this folder
echo/
echo Select a system to create MGL files for:
echo/
echo	1. NeoGeo
echo	2. NES
echo	3. PSX
echo	4. SMS
echo	5. SNES
echo	6. TurboGrafx16/CD
echo	7. Vectrex
echo	8. WonderSwan
echo/
echo/

:ConsoleB0
%SystemRoot%\System32\choice.exe /C 12345678 /N /M "Please make your selection:"
goto ConsoleB%ErrorLevel%

:ConsoleB1
set "consoleloop=CopyTime"
set "console=NeoGeo"
set "settings=delay="2" type="f" index="0""
set "extensions=*.NEO,*.ZIP"
goto GetBasePathLength

:ConsoleB2
set "consoleloop=CopyTime"
set "console=NES"
set "settings=delay="2" type="f" index="1""
set "extensions=*.NES,*.FDS,*.NSF"
goto GetBasePathLength

:ConsoleB3
set "consoleloop=CopyTime"
set "console=PSX"
set "settings=delay="1" type="s" index="1""
set "extensions=*.CUE,*.CHD"
goto GetBasePathLength

:ConsoleB4
set "consoleloop=CopyTime"
set "console=SMS"
set "settings=delay="1" type="f" index="1""
set "extensions=*.SMS,*.SG"
goto GetBasePathLength

:SMS0
set "consoleloop=CopyTime"
set "console=SMS"
set "settings=delay="1" type="f" index="2""
set "extensions=*.GG"
goto GetBasePathLength

:ConsoleB5
set "consoleloop=CopyTime"
set "console=SNES"
set "settings=delay="2" type="f" index="0""
set "extensions=*.SFC,*.SMC,*.BIN,*.BS"
goto GetBasePathLength

:ConsoleB6
set "consoleloop=TGFX160"
set "console=TurboGrafx16"
set "settings=delay="1" type="f" index="0""
set "extensions=*.PCE,*.BIN"
goto GetBasePathLength

:TGFX160
set "consoleloop=TGFX161"
set "console=TGFX161"
set "settings=delay="1" type="F" index="1""
set "extensions=*.SGX"
goto GetBasePathLength

:TGFX161
set "consoleloop=CopyTime"
set "console=TGFX161"
set "settings=delay="1" type="s" index="0""
set "extensions=*.CUE,*.CHD"
goto GetBasePathLength

:ConsoleB7
set "consoleloop=CopyTime"
set "console=Vectrex"
set "settings=delay="1" type="f" index="1""
set "extensions=*.OVR,*.VEC,*.BIN,*.ROM"
goto GetBasePathLength

:ConsoleB8
set "consoleloop=CopyTime"
set "console=WonderSwan"
set "settings=delay="1" type="f" index="1""
set "extensions=*.WSC,*.WS"
goto GetBasePathLength

:ConsoleB9
goto EndBatch
set "console=PLACEHOLDER"
set "settings=delay="PLACEHOLDER" type="PLACEHOLDER" index="PLACEHOLDER""
set "extensions=PLACEHOLDER"
goto GetBasePathLength

:GetBasePathLength
set "BasePath=_%CD%"
if not "%BasePath:~-1%" == "\" set "BasePath=%BasePath%\"
setlocal EnableDelayedExpansion
set "BasePathLength=0"
for /L %%I in (12,-1,0) do (
	set /A "BasePathLength|=1<<%%I"
	for %%J in (!BasePathLength!) do if "!BasePath:~%%J,1!" == "" set /A "BasePathLength&=~1<<%%I"
)
endlocal & set "BasePathLength=%BasePathLength%"
for /R %%I in (%extensions%) do (
	set "FileName=%%I"
	set "OutputFile=%%~npI.mgl"
	setlocal EnableDelayedExpansion
	set "FileName=!FileName:~%BasePathLength%!"
	set "FileName=!FileName:\=/!"
	(
		echo ^<mistergamedescription^>
		echo	 ^<rbf^>_Console/!console!^</rbf^>
		echo	 ^<file !settings! path="!FileName!"/^>
		echo ^</mistergamedescription^>
	)>"!OutputFile!"
	endlocal
)

goto %consoleloop%

:CopyTime

ROBOCOPY . MGL_FILES\%console% *.mgl /XD %console% /s /mov 

SetLocal EnableExtensions DisableDelayedExpansion
cd "MGL_FILES\"
For /D /R %%A In ("*") Do (Set "CN=%%~nxA"
    SetLocal EnableDelayedExpansion
	Ren "%%A" "_!CN!"
    EndLocal)
Pause

goto EndBatch

:EndBatch
endlocal

rem ATARI2600        1 F 0 *
rem ATARI7800        1 F 1 A78 A26 BIN
rem ATARILYNX        1 F 0 LNX
rem C64              1 F 1 PRG CRT REU TAP
rem COLECO           1 F 0 COL BIN ROM SG
rem GAMEBOY          1 F 1 GBC GB    
rem GBA              1 F 0 GBA
rem GENESIS          1 F 0 BIN GEN MD    
rem JAGUAR           1 F 0 JAG
rem MEGACD           1 S 0 CUE CHD
rem NEOGEO           1 F 1 NEO ZIP
rem                  1 S 1 ISO BIN
rem NES              1 F 0 NES FDS NSF
rem PSX              1 S 1 CUE CHD
rem SMS              1 F 1 SMS SG
rem                  1 F 2 GG
rem SNES             2 F 0 SFC SMC BIN BS
rem TGFX16           1 F 0 PCE BIN
rem                  1 F 1 SGX
rem                  1 S 0 CUE CHD
rem VECTREX          1 F 1 OVR VEC BIN ROM    
rem WONDERSWAN       1 F 1 WSC WS
rem x_X
