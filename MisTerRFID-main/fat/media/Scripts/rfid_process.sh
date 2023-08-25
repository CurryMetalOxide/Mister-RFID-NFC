#!/bin/bash

qload_rom()
{
    if [ "$LASTROM" != "$3" ]
    then
	export LASTROM="$3"
	echo "$LASTROM"

        if [ ! -f /media/fat/Games/"$1"/"$2".mgl ]
            then
                echo "<mistergamedescription><rbf>_console/"$1"</rbf><file delay=\"2\" type=\"f\" index=\"0\" path=\"../../games/"$1"/"$2"\"/></mistergamedescription>" > "/media/fat/Games/"$1"/"$2".mgl"
        fi
        echo "load_core /media/fat/Games/"$1"/"$2".mgl" > /dev/MiSTer_cmd

    fi
}

case "$1" in
   "282644500") echo load_core /media/fat/_Arcade/'Robocop (World revision 4).mra' > /dev/MiSTer_cmd;;
   "553036052") echo load_core /media/fat/_Arcade/'Golden Axe (set 6, US) (8751 317-123A).mra' > /dev/MiSTer_cmd;;
   "2056963023") echo load_core /media/fat/_Arcade/'Cadillacs and Dinosaurs (World 930201).mra' > /dev/MiSTer_cmd;;
   "2316749775") echo load_core /media/fat/_Arcade/'R-Type (World).mra' > /dev/MiSTer_cmd;;
   "4201530062") echo load_core /media/fat/_Arcade/"Captain Commando (World 911202).mra" > /dev/MiSTer_cmd;;
   "3397868750") echo load_core /media/fat/_Arcade/'Altered Beast (set 8) (8751 317-0078).mra' > /dev/MiSTer_cmd;;
   "2060469454") echo load_core /media/fat/_Arcade/'Alien vs. Predator (Euro 940520).mra'> /dev/MiSTer_cmd;;
   "1783876047") echo load_core /media/fat/_Arcade/'Dungeons & Dragons Shadow over Mystara (Euro 960619).mra'> /dev/MiSTer_cmd;;
   "2049396686") echo load_core /media/fat/_Arcade/'E-Swat - Cyber Police (set 4, World) (FD1094 317-0130).mra'> /dev/MiSTer_cmd;;
   "3936930255") echo load_core /media/fat/_Arcade/'Black Tiger.mra'> /dev/MiSTer_cmd;;
   "2049263310") echo load_core /media/fat/_Arcade/'Knights of the Round (World 911127).mra'> /dev/MiSTer_cmd;;
   "3393307599") echo load_core /media/fat/_Arcade/'Ninja Baseball Bat Man (World).mra'> /dev/MiSTer_cmd;;
   "3100851986") echo load_core /media/fat/MGL_FILES/_Genesis/'Streets of Rage 2 (U).mgl'> /dev/MiSTer_cmd;;
   "80818059") echo load_core /media/fat/MGL_FILES/_Genesis/'Castlevania - Bloodlines (U).mgl'> /dev/MiSTer_cmd;;
   "80130700") echo load_core /media/fat/MGL_FILES/_Genesis/'Alien Soldier.mgl'> /dev/MiSTer_cmd;;
   "69913740") echo load_core /media/fat/MGL_FILES/_Gameboy/_T/'Tetris (World) (Rev A).mgl'> /dev/MiSTer_cmd;;
   "82271884") echo load_core /media/fat/MGL_FILES/_PSX/'Policenauts Disk 1.mgl'> /dev/MiSTer_cmd;;
   "71234049") echo load_core /media/fat/MGL_FILES/_SNES/_T/'Teenage Mutant Ninja Turtles IV - Turtles in Time (USA).mgl'> /dev/MiSTer_cmd;;
   "78967948") echo load_core /media/fat/MGL_FILES/_SNES/_C/'Chrono Trigger (USA).mgl'> /dev/MiSTer_cmd;;
   "77728651") echo load_core /media/fat/MGL_FILES/_SNES/_S/'Super Mario World (USA).mgl'> /dev/MiSTer_cmd;;
   "83295824") echo load_core /media/fat/MGL_FILES/_SNES/_L/'Legend of Zelda, The - A Link to the Past (USA).mgl'> /dev/MiSTer_cmd;;
   "73082447") echo load_core /media/fat/MGL_FILES/_SNES/_E/'EarthBound (USA).mgl'> /dev/MiSTer_cmd;;
   "80748367") echo load_core /media/fat/MGL_FILES/_SNES/_S/'Super Metroid (Japan, USA) (En,Ja).mgl'> /dev/MiSTer_cmd;;
   "69940815") echo load_core /media/fat/MGL_FILES/_GBA/_M/'Metroid - Zero Mission (USA).mgl'> /dev/MiSTer_cmd;;
   "72490242") echo load_core /media/fat/MGL_FILES/_NES/_USA/_D/'Double Dragon II - The Revenge (USA).mgl'> /dev/MiSTer_cmd;;
esac
