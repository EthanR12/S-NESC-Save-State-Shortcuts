Welcome To S/NESC Save State Shortcuts!

S/NESC Save State Shortcuts v1.3.1 created by EthanR12

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

Retroarch Saves have been tested with KMFDManic's retroarch Xtreme core, version 171 and newer. Also with
retroarch 'NEO' 172a and 173a. I cannot guarantee it will work outside of these versions!

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
Refresh_RA.sh         -Only handles Retroarch save states

2. Choose which kind of saves you want to manage and add it to hakchi as a normal "game".
   You may change the name or artwork as you see fit. You can choose to add all of them if you wish!
   
3. Set your folder settings to custom. Above game list is a button that says "Structure". Click
   that and select the 2nd option "Custom". Click custom again to open up folders manager.

4. You must create a folder anywhere on the system and name it accordingly.
   
   Refresh_Suspend.sh   - Suspend Saves
   Refresh_Cartridge.sh - SRAM Saves
   Refresh_All.sh       - Saves
   Refresh_RA.sh        - RA Saves
   
   UPPER CASE & lower case DO NOT matter! Spelling does!

5. Synchronize games or Export to your USB drive and boot it up. Find wherever you put the
   script and click it like any other game. I would recommend not having more than 30 saves
   at a time when running "Refresh" script. You should get kicked back after a few seconds.
   
6. Navigate into your corresponding saves folder for the script that was ran. You should now have easy access
   to all games that you are working on! No more navigating several sub-directories to find your games!
   
Retroarch:
==========
- (For NESC ONLY) Retroarch refresh script takes longer to run initially after every system start up. This is a
  necessary step to ensure an up to date game list. Everytime after the initial run, it runs very quickly.
  Depending on how many games you have, 2300 games took 10 seconds for the initial run.    
- Retroarch saves are only compatible with USB host!    
- Retroarch saves include an indicator to tell you which slot you are using before you launch the
  game from saves folder.    
- If you had 2 save slots for a game at number 9 and 14. the game title will be changed, for example    
    
    From:   Super Mario Bros.    
    
    To:     Super Mario Bros. (9) (14)    
    
    
- If you wish to turn this off, you must edit the script itself, only deleting 2 lines of text! There is an
  image attached highlighting which lines, located in the Visual Instructions folder named "Basic Retro".    
    
   
Notes:
======
- This does not "Move" your games to the Saves folder. It simply creates a shortcut for it.
  Your original folder structure stays the way you want it.
- I would recommend using hakchi save state manager to gain an understanding on how
  many SRAM saves have been created.  Alternatively, you can go to your usb/hakchi/saves
  directory and search *.sram and clear the ones that you don't want manually.
- USB mod that is not using linked export will take a little longer to run, as there are more files to move.

Thanks To:
==========
/r/miniSNESmods, TeamShinkansen, DanTheMan827, MDFMKanic, and strikelight
