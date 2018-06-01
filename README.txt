Welcome To (S)NESC Save State Shortcuts!

(S)NESC Save State Shortcuts v1.0 created by EthanR12

Description:
============
This script will make shortcuts for all games that you have saves for and place
them in a folder located on your mini's home menu.  Making finding your saved games
much quicker and less frustrating!

Requirements:
=============
This, for the moment, works on USB host ONLY!  It will work with or without linked
export, with all regions of both NESC and SNESC, and with SRAM and GUI Save States.

It works with Hakchi CE 1.2.4 and later. It has NOT been
tested with earlier versions of CE or with ClusterM's hakchi.

How To Use:
===========
1. Unzip 7z to find 3 different .sh files.

		Refresh_state        -Only handles GUI Save State
		Refresh_sram         -Only handles SRAM (cartridge) saves
		Refresh_state_sram   -Handles both GUI Save States & SRAM
		
								WARNING!!!!
   =================================================================================
   SRAM saves get created very frequently for some systems without your knowledge!
   A single folder can only hold so many games so if you have too many, the folder
   could potentially give you C8 errors when trying to access it.  Be very cautious
   of your saves if you choose to use SRAM!
	
2. Choose which kind of saves you want to manage and add it to hakchi as a normal "game"

3. You must create a folder named "Saves", but without quotation marks, and place
   it on the home menu. IT WILL NOT WORK IF PLACED ANYWHERE ELSE OR NAMED ANYTHING ELSE!!
   
4. You can change the name of the SCRIPT as you see fit and place it anywhere on system.

5. Export your games to your USB drive and boot it up.  Find wherever you put the script
   and click it like any other game.  The script will take anywhere from 5-10 seconds
   to run, depending on how many games you have and how many have saves.  DO NOT BE
   ALARMED IF YOU SEE A BLACK SCREEN FOR 10 SECONDS!  I would recommend not having more
   than 30 saves at a time when running "Refresh" script.
   
6. Go to home menu and find your "Saves" folder and you should now have easy access to
   all games that you are working on!  No more navigating several sub-directories to
   find your games!
   
Notes:
======
- Depending on demand for it, I may branch out to make this work without USB mod at all
- I would recommend using hakchi save state manager to gain an understanding on how
  many SRAM saves have been created.  Alternatively, you can go to your usb/hakchi/saves
  directory and search *.sram and clear the ones you don't want manually.

Thanks To:
==========
/r/miniSNESmods as well as /r/nesclassicmods, DanTheMan827, MDFMKanic, and many more!