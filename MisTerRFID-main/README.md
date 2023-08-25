# MisTer RFID/NFC
Enables RFID/NFC card launching of games for MiSTer FPGA. Launches games without any menu being display using the MiSTer Game Launcher files (MGL) method. Must use a version of MiSTer from Feb 24, 2022 or after to support this method of launching. I have confirmed this working with all Arcade, Megadrive, SNES, SMS, NES, GB, GBA, PSX cores.

## Hardware Needed
- Arduino Nano V3.0 (Nano328P)
- RC522 RFID Card Reader Module Board (3.3V)
- Mi-fare door access cards and/or NTAG215 NFC Tags
- MiSTer FPGA with the extra USB ports board.

## Arduino Hardware Setup
| RC522 Module Pin | Arduino Pin|
|---|---|
|RST|D9|
|SDA|D10|
|MOSI|D11|
|MISO|D12|
|SCK|D13|
|VCC|3.3V|
|GRD|GRD|

The first step is to write the misterrfid_RFID_AND_NFC.ino file to your Arduino.

On your computer, attach the serial monitor to your Arduino and you should see it repeating `. rfid_process.sh noscan` about every second. As soon as your scan a RFID card, it should output `. rfid_process.sh 12345678`. The number is that card's unique ID. The reader will not scan the same card two times in a row. Make note of the card's unique id.

## MiSTer Setup
Copy the files to your MiSTer SD card based on the structure of this repo. Edit case statement of the "rfid_process.sh" script to associate your RFID card UIDs with the roms files on your MiSTer. (Sample cores and UID's are provided in the file)

## Use
After editing the rfid_process.sh script, turn off your MiSTer. Plug your Arduino into an available USB port on your USB board module and turn on your MiSTer. Depending on how many scripts you have running, it can take up to 30 seconds from first turning on the power to the RFID reader becoming available. Once the RFID reader is available, you can scan your RFID card to launch any core.

Note: This can be combined with MisTer.ini option bootcore= to automatically launch an arcade core (MRA file) upon starting up your MisTer. The rfid_process.sh will run in the background waiting for a card to be presented.

rfid_process.sh included has my setup for MGL links included as examples.

## MGL Location
I stored my MGL files in the following location /media/fat/MGL_FILES/ on my SD Card

Example MGL for Streets of Rage 2

"3100851986") echo load_core /media/fat/MGL_FILES/_Genesis/'Streets of Rage 2 (U).mgl'> /dev/MiSTer_cmd;;


### Disclaimer
I'm not a Programmer, but the code works for me.


### THANK YOU
Thank you to illusion-pasture-program from all of this code. I just adapted it to work inside my Mister project. 

*** Additional thanks to syntax_x	for his automated batch file https://misterfpga.org/viewtopic.php?t=4359

I edited 	code below to make it work with my setup.

echo \^<mistergamedescription\^>  
echo	 \^<rbf\^>**\_Console**/!console!\^</rbf\^>  
echo	 \^<file !settings! path="!FileName!"/\^>  
echo \^</mistergamedescription\^>


## Still to do
Find a way to change Region for Certain cores.
Also find a way to auto launch PSX games, currently i havee to choose reset from the menu for the game to boot after scan.
