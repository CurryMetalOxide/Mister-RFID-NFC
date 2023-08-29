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
   "80818059") echo load_core /media/fat/MGL_FILES/_Genesis/'Castlevania - Bloodlines (U).mgl'> /dev/MiSTer_cmd;;
   "69913740") echo load_core /media/fat/MGL_FILES/_Gameboy/_T/'Tetris (World) (Rev A).mgl'> /dev/MiSTer_cmd;;
   "82271884") echo load_core /media/fat/MGL_FILES/_PSX/'Policenauts Disk 1.mgl'> /dev/MiSTer_cmd;;
   "71234049") echo load_core /media/fat/MGL_FILES/_SNES/_T/'Teenage Mutant Ninja Turtles IV - Turtles in Time (USA).mgl'> /dev/MiSTer_cmd;;
   "69940815") echo load_core /media/fat/MGL_FILES/_GBA/_M/'Metroid - Zero Mission (USA).mgl'> /dev/MiSTer_cmd;;
   "72490242") echo load_core /media/fat/MGL_FILES/_NES/_USA/_D/'Double Dragon II - The Revenge (USA).mgl'> /dev/MiSTer_cmd;;
esac
