Welcome To (S)NESC Save State Shortcuts!

(S)NESC Save State Shortcuts v1.3 created by EthanR12

Description:
============
This script will make SHORTCUTS for all games that you have saves for. It places
them all in a folder! Making finding your saved games much quicker and less frustrating!

Requirements:
=============
MUST HAVE! "Separate games for multiboot" option checked for this to work, even if not using multiboot!
It is on by default but to make sure, up at the settings tab in hakchi, go to "separate games for multiboot"
and make sure it is on. This option does nothing to hurt or alter your setup!

- Works With -
SNESC/NESC Normal NAND mod
SNESC/NESC USB-Host mod
SNESC/NESC USB-Linked Export
SNESC/NESC Multi-Boot

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
1. Inside this folder are 4 versions of my script

Refresh_Suspend.sh    -Only handles GUI Suspend Points
Refresh_Cartridge.sh  -Only handles SRAM (cartridge) saves
Refresh_All.sh        -Handles both GUI Suspend Points & SRAM

2. Choose which kind of saves you want to manage and add it to hakchi as a normal "game".
   You may change the name or artwork as you see fit. You can choose to add all of them if you wish!
   
3. Set your folder settings to custom. Above game list is a button that says "Structure". Click
   that and select the 2nd option "Custom". Click custom again to open up folders manager.

4. You must create a folder anywhere on the system and name it accordingly.
   
   Refresh_Suspend.sh   - Suspend Saves
   Refresh_Cartridge.sh - SRAM Saves
   Refresh_All.sh       - Saves
   
   UPPERCASE CASE & lower case DO NOT matter! Spelling does!

5. Synchronize games or Export to your USB drive and boot it up. Find wherever you put the
   script and click it like any other game. I would recommend not having more than 30 saves
   at a time when running "Refresh" script. You should get kicked back after a few seconds.
   
6. Navigate into your corresponding saves folder for the script that was ran. You should now have easy access
   to all games that you are working on! No more navigating several sub-directories to find your games!
   
Notes:
======
- This does not "Move" your games to the Saves folder. It simply creates a shortcut for it.
- I would recommend using hakchi save state manager to gain an understanding on how
  many SRAM saves have been created.  Alternatively, you can go to your usb/hakchi/saves
  directory and search *.sram and clear the ones that you don't want manually.
- USB mod that is not using linked export will take longer to run, as there are more files to move.

Thanks To:
==========
/r/miniSNESmods, TeamShinkansen, DanTheMan827, MDFMKanic, and strikelight
