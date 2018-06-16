Welcome To (S)NESC Save State Shortcuts!

(S)NESC Save State Shortcuts v1.2 created by EthanR12

Description:
============
This script will make SHORTCUTS for all games that you have saves for and place
them all in a folder located on your mini's home menu. Making finding your saved
games much quicker and less frustrating!

Requirements:
=============
- Works With -
NESC Normal NAND mod
NESC USB-Host mod
NESC USB-Linked Export
SNESC Normal NAND mod
SNESC USB-Host mod
SNESC USB-Linked Export

It works with Hakchi CE 1.2.4 and later. It has NOT been
tested with earlier versions of CE or with ClusterM's hakchi.

SAVES WARNING!!!
================
SRAM saves get created very frequently for some systems without your knowledge!
A single folder can only hold so many games so if you have too many, the folder
could potentially give you C8 errors when trying to access it. Be very cautious
of your saves if you choose to use SRAM!

How To Use:
===========
1. Inside this folder are 3 versions of my script and 1 optional setup file if you need

Refresh_Suspend.sh    -Only handles GUI Suspend Points
Refresh_Cartridge.sh  -Only handles SRAM (cartridge) saves
Refresh_All.sh        -Handles both GUI Suspend Points & SRAM
Folder Setup.bat      -Adds necessary folder to home menu automatically

2. Choose which kind of saves you want to manage and add it to hakchi as a normal "game".
   You may change the name or artwork as you see fit.
   
3. Set your folder settings to custom. Above game list is a button that says "Structure". Click
   that and select the 2nd option "Custom". Click custom again to open up folders manager.

4. You must create a folder ON THE HOME MENU and name it "Saves", but without quotation marks.
   You may change the position (Leftmost, Left of Games, Right of Games, Rightmost) and art.
   Alternatively, you can move "Folder Setup.bat" into your hakchi directory and double click it.
   It will automatically create this folder with defualt art and position.

5. Synchronize games or Export to your USB drive and boot it up. Find wherever you put the
   script and click it like any other game. I would recommend not having more than 30 saves
   at a time when running "Refresh" script. You should get kicked back after a few seconds.
   
6. Go to home menu and go into your "Saves" folder. You should now have easy access to
   all games that you are working on! No more navigating several sub-directories to find
   your games!
   
Limitations:
============
- Script CANNOT be placed inside of "Saves" folder. It will freeze the system, forcing a resync.
- For USB users, file structure on flash drive is very particular. It should be as follows

  USB-Drive/hakchi/games/snes-usa/000  -the 'snes-usa' portion will be different depending on system
  USB-Drive/hakchi/saves
  
- USB devices cannot have setups for more than one system! Within the 'games' folder of the above
  directory, only a single folder is allowed, otherwise the script will not run and just kick you out. There is
  a workaround I can help with if anyone has this setup.
- Only allows for a single "Saves" folder on the home menu. Script will give C7 error with more than 1 saves folder
- If there is no folders_snes_usa.xml, or any other region varient, present in hakchi/config
  folder, the automatic "Folder Setup.bat" file will not work.
   
Notes:
======
- This does not "Move" your games to the Saves folder. It simply creates a shortcut for it.
- I would recommend using hakchi save state manager to gain an understanding on how
  many SRAM saves have been created.  Alternatively, you can go to your usb/hakchi/saves
  directory and search *.sram and clear the ones that you don't want manually.
- USB mod that is not using linked export will take longer to run, as there are more files.
Thanks To:
==========
/r/miniSNESmods, TeamShinkansen, DanTheMan827, MDFMKanic, and strikelight
