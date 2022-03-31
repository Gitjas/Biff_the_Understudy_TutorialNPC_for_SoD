			Biff the Understudy - Tutorial NPC for SoD 
					by jastey 
					Version 4


This mod is meant as a tutorial for modders how to script the basic structure needed for an SoD NPC.
Biff is a "fighter" with STR 9, DEX 9, CON 9, INT 9, WIS 9, CHA 9, no items, no portrait, and no soundset. The mod is not meant for playing, but knock yourself out! The mod should definitely *work* in SoD.

Please note: The mod was revised and updated according to the changes in the tutorials. Details and specifics have changed compared to v3 at various places!

The "xxbiff.ini" file is for ALIEN's Project Infinity automated installer:
https://forums.beamdog.com/discussion/74335/project-infinity-public-beta/p1

The contents of this mod is based on my SoD Modding Tutorials:
Modding Tutorial Part 1: Automatic Transition of NPCs into SoD and between Camps in SoD, version 8:
https://gibberlings3.github.io/modding-resources/Tutorial_NPCMoveCampsSoD.html

Modding Tutorial Part 2: Make Your NPC Comment and Move Along at the End of SoD, version 7:
https://gibberlings3.github.io/modding-resources/Tutorial_NPC_SoDGameEnd.html

Modding Tutorial Part 3: Add Other General SoD Behavior to Your NPC: XP Adjustment, Actions in Story Cutscenes, Commenting of Main Story Events, version 3: 
https://gibberlings3.github.io/modding-resources/Tutorial_SoDGeneralNPCThings.html

Modding Tutorial Part 4: How to Script the SoD Banter System for Your NPC, version 3:
https://gibberlings3.github.io/modding-resources/Tutorial_SoDBanterSystem.html

The mod is not fully traify-ed yet, meaning that all texts for Biff's actual ingame dialogues and comments via scripts are still inside the d- and baf-files, which so far make translations impossible. For tutorial on how to work with d/tra pairs please refer to Kulyok's NPC Tutorial 1-day mod NPC "Branwen" at Pocket Plane Group: https://www.pocketplane.net/one-day-npcs/

INSTALLATION

This mod is not meant to be played. It's a serious tutorial mod package, but Biff's dialogues are meant tongue-in-cheek and are rather 4th wall breaking, and his stats are rather... average. 
Biff would be honored, though.
If you read this for info, this is what I usually put into my readmes concerning installation.

SoD:
If you use SoD from GOG or Steam, you need to prepare your game with either modmerge before installing any mods:
https://forums.beamdog.com/discussion/50441/modmerge-merge-your-steam-gog-zip-based-dlc-into-something-weidu-nearinfinity-dltcep-can-use/p1

Instead of modmerge, you can also use argent77's "DLC Merger: Merge Steam/GOG SoD DLC or custom DLCs with the main game" which has the advantage that it can be deinstalled like a mod: 
https://forums.beamdog.com/discussion/71305/mod-dlc-merger-merge-steam-gog-sod-dlc-or-custom-dlcs-with-the-main-game

 
General (Windows, Mac OS X, and Linux)
Make sure you back up your game acordingly, just to be sure. 

Extract the contents of the mod archive to your game's main directory. 
NOTE: For the Enhanced Edition games it is important that you istall the mod to the language version you are playing the game in. Otherwise, the dialogues of the mod will not show but give error messages.


Windows
On successful extraction, there should be an xxBiff folder and a setup-xxbiff.exe file in your game folder. To install, simply double-click setup-xxbiff.exe and follow the instructions on screen.
Run setup-xxbiff.exe in your game folder to reinstall, uninstall or otherwise change components.

Mac OS X
The Mac OS X version of the mod is named "osx-xxBiff-vX.zip". If properly extracted, you should have a xxbiff folder, setup-xxbiff, and setup-xxbiff.command in your game's main directory folder. To install, simply double-click setup-xxbiff.command and follow the instructions on screen.

Linux
The Linux version of the mod is named "lin-xxbiff-vX.zip".
Download the latest version of WeiDU for Linux from WeiDU.org and copy WeiDU and WeInstall to /usr/bin. Following that, open a terminal, cd to your BG installation directory, run 'tolower' and answer Y to both queries. You can avoid running the second option (linux.ini) if you have already ran it once in the same directory. To save time, the archive is already tolowered, so there is no need to run the first option (lowercasing file names) either if you have extracted only this mod since the last time you lower cased file name. If you are unsure, running tolower and choosing both options is the safe bet.
Run WeInstall setup-xxbiff in your game folder to install the mod. Then run wine BGMain.exe and start playing.


NOTE: BG(II):EE are actively supported games. Please note that every patch update will wipe your current mod setup! If in the middle of a modded game you might want to delay the patch update as even after reinstalling the mods, you might not be able to continue with your old savegames. 


If you have installation problems or encounter any bugs, please post your bug report in one of the forum threads given below.

BeamDog forums: https://forums.beamdog.com/discussion/74907/tutorial-jasteys-sod-npc-modding-tutorials

Gibberlings Three: https://www.gibberlings3.net/forums/topic/30139-jasteys-sod-npc-modding-tutorials/

Spellhold Studios: http://www.shsforums.net/topic/60416-jasteys-sod-npc-modding-tutorials/

COMPATIBILITY

Biff the Understudy Tutorial Mod is coded using WeiDU and does not overwrite any files. It should be compatible with most other (WeiDU) mods. 

I want to thank all who have helped me making this mod.

Have fun studying this NPC mod, and I hope that it saves you a lot of time for your own NPC project!

jastey




CREDITS

argent77: help with html file


TOOLS USED

IESDP					https://gibberlings3.github.io/iesdp/index.htm
Near Infinity				https://forums.beamdog.com/discussion/30593/new-versions-of-nearinfinity-available/p1
WeiDU					http://www.weidu.org

Modding communities, tutorials and technical assistance:

Modder's Notes for Baldur's Gate: Enhanced Edition Trilogy (EET):
https://cdn.rawgit.com/K4thos/EET/master/EET/docs/Modder's Notes.html

The Gibberlings Three			https://www.gibberlings3.net/
Pocket Plane Group			http://pocketplane.net
Spellhold Studios			http://www.shsforums.net/
Kerzenburgforum (German)		https://www.baldurs-gate.de/index.php


LEGAL INFORMATION

=============================================================================
This Mod is unofficial Fan Content permitted under the Fan Content Policy. Not approved/endorsed by Wizards. Portions of the materials used are property of Wizards of the Coast. ©Wizards of the Coast LLC.
This mod is not developed, supported, or endorsed by BioWare, Black Isle Studios, Interplay Entertainment Corp., the Wizards of the Coast, Overhaul Games or Beamdog. All other trademarks and copyrights are property of their respective owners.
=============================================================================



HISTORY

Version 4
-Updated the mod to the Tutorial updates: Tutorial 1 v8, Tutorial 2 v7, Tutorial 3 v3, Tutorial 4 v3. Please note: The mod was revised and updated according to the changes in the tutorials. Details and specifics have changed at various places!
-Added example of German language choice (not active) and traify-ed all lines in the tp2 (not many).
-Changed handling of texts: setup-xxbiff.tra contains lines needed for setup, all ingame text from tp2 moved into game-xxbiff.tra.
-Added dynamic order syntax and globally unique labels to xxbiff.ini and tp2 to include support for Project Infinity, with explanations.
-Updated Readme.

Version 3
-corrected script so Biff will not spawn double in front of Palace (in xxbd0101.baf).
-changed variable from "bdxxxx" to "MYAREA" to make using the script templates easier (in xxbd0010.baf, xxbd0101.baf, xxbd1000.baf, xxbd3000.baf, xxbd7100.baf).
-Added compatibility with mods that lets skip parts of SoD (xxbd1000.baf, xxbd3000.baf, xxbd7100.baf).

Version 2
-added EET compatibility 
-corrected copy&paste errors where Minsc's death variable was inside scripts instead of Biff's
-corrected trigger of second script block in xxbd0101.baf to close the oversight that Biff wouldn't (re)spawn here in case he was already spawned in bd0010.are but not taken into the group
-added "Biff visits PC in prison"
-added "Corwin will mention Biff's whereabouts in BG city if asked about the former companions"
-the mod now uses a tra file (albeit only for the line needed for EET fate spirit) and HANDLE_CHARSETS for text conversion

Version 1

-first public release