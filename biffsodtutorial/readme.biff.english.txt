			Biff the Understudy - Tutorial NPC for SoD 
					by jastey 
					Version 7


This mod is meant as a tutorial for modders how to script the basic structure needed for an SoD NPC.
Biff is a "fighter" with STR 9, DEX 9, CON 9, INT 9, WIS 9, CHA 9, no items, no portrait, and no soundset. The mod is not meant for playing, but knock yourself out! The mod should definitely *work* in SoD.

Please note: The mod was revised and updated according to the changes in the tutorials. Details and specifics have changed compared to v4 at various places!

The "biffsodtutorial.ini" file is for ALIEN's Project Infinity automated installer:
https://forums.beamdog.com/discussion/74335/project-infinity-public-beta/p1

The contents of this mod is based on my SoD Modding Tutorials:
Modding Tutorial Part 1: Automatic Transition of NPCs into SoD and between Camps in SoD, version 9:
https://gibberlings3.github.io/modding-resources/Tutorial_NPCMoveCampsSoD.html

Modding Tutorial Part 2: Make Your NPC Comment and Move Along at the End of SoD, version 8:
https://gibberlings3.github.io/modding-resources/Tutorial_NPC_SoDGameEnd.html

Modding Tutorial Part 3: Add Other General SoD Behavior to Your NPC: XP Adjustment, Actions in Story Cutscenes, Commenting of Main Story Events, version 4: 
https://gibberlings3.github.io/modding-resources/Tutorial_SoDGeneralNPCThings.html

Modding Tutorial Part 4: How to Script the SoD Banter System for Your NPC, version 4:
https://gibberlings3.github.io/modding-resources/Tutorial_SoDBanterSystem.html

The mod is not fully traify-ed yet, meaning that all texts for Biff's actual ingame dialogues and comments via scripts are still inside the d- and baf-files, which so far make translations impossible. For tutorial on how to work with d/tra pairs please refer to Kulyok's NPC Tutorial 1-day mod NPC "Branwen" at Pocket Plane Group: https://www.pocketplane.net/one-day-npcs/

In addition to the tutorials' contents, there is more reactions in "sod_important_reactions_scripts.baf" and "sod_important_reactions_dialogues.d".
The dialogues there are not listed in a tutorial, and most depend on the mod Road to Discovery (component 2: "Main Component: Tracking System") to be installed for them to trigger. 
They will flesh out the NPC and their reactions to the main story events *in addition* to what the SoD NPCs react to in general (i.e. all that is not covered by the tutorials). 
The there listed dialogue possibilities are only suggestions. Use them, adapt them, or leave them out depending on your NPC's character and interests. Trying to use all of them might lead to your NPC sounding like a generic know-it-all.

INSTALLATION

This mod is not meant to be played. It's a serious tutorial mod package, but Biff's dialogues are meant tongue-in-cheek and are rather 4th wall breaking, and his stats are rather... average. 
Biff would be honored, though.
If you read this for info, this is what I usually put into my readmes concerning installation.

NOTE: If you've previously installed the mod, remove it before extracting a new version. To do this, uninstall all previously installed components and delete the mod folder and executables.
Make sure the game is not running while installing the mod.
When installing or uninstalling, do not close the DOS window by clicking on the X button! Instead, press the Enter key when instructed to do so.

If you use SoD from GOG or Steam, you need to prepare your game with DLC Merger or modmerge before installing any mods: (if in doubt, use use argent77's "DLC Merger: Merge Steam/GOG SoD DLC or custom DLCs with the main game" which has the advantage that it can be deinstalled like a mod: 
https://forums.beamdog.com/discussion/71305/mod-dlc-merger-merge-steam-gog-sod-dlc-or-custom-dlcs-with-the-main-game).

For Enhanced Edition it is important that you istall the mod to the language version you are playing the game in. Otherwise, the dialogues of the mod will not show but give error messages.
The EE games are actively supported games. Please note that every patch update will wipe your current mod setup! If in the middle of a modded game you might want to delay the patch update as even after reinstalling the mods, you might not be able to continue with your old savegames. 

 
General (Windows, Mac OS X, and Linux)
Make sure you back up your game acordingly, just to be sure. 

Extract the contents of the mod archive to your game's main directory. 
NOTE: For the Enhanced Edition games it is important that you istall the mod to the language version you are playing the game in. Otherwise, the dialogues of the mod will not show but give error messages.


Windows
Extract the contents of the mod archive to your game's main directory which contains the CHITIN.KEY file. On successful extraction, there should be an biffsodtutorial folder and a setup-biffsodtutorial.exe file in your game folder. To install, simply double-click setup-biffsodtutorial.exe and follow the instructions on screen.
Run setup-biffsodtutorial.exe in your game folder to reinstall, uninstall or otherwise change components.

MacOS
Extract the mod archive, then copy the contents of the folder into your game folder (BG:EE/SOD/BG2/BGT/BGII:EE/EET which contains the CHITIN.KEY file). If properly extracted, you should have a "biffsodtutorial" folder, setup-biffsodtutorial, and setup-biffsodtutorial.command in your game folder. To install, simply double-click setup-biffsodtutorial.command and follow the instructions on screen.
Run setup-biffsodtutorial.command in your game folder to reinstall, uninstall or otherwise change components.

Linux
Extract the contents of the mod to the folder of the game you wish to modify. Download the latest version of WeiDU for Linux from https://github.com/WeiDUorg/weidu/releases and copy WeiDU and WeInstall to /usr/bin. Following that, open a terminal and cd to your BG2 installation directory, run 'tolower' and answer Y to both queries. You can avoid running the second option (linux.ini) if you've already ran it once in the same directory. If you're unsure, running tolower and choosing both options is the safe bet.
Run WeInstall biffsodtutorial in your game folder to install the mod. Then run wine BGMain.exe and start playing. 


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

Version 7
-Optimized script and dialogue templates for using Road to Discovery's trigger variable system for reactions to the main story elements.
-The mod tempate is now alphatested with regard to general bugs, triggers, and appropriate timers.

Version 6
-Integrated script and dialogue templates for using Road to Discovery's trigger variable system for reactions to the main story elements.

Version 5
-Updated the mod to the Tutorial updates: Tutorial 1 v9, Tutorial 2 v8, Tutorial 3 v4, Tutorial 4 v4. Please note: The mod was revised and updated according to the changes in the tutorials. Filenames, details and specifics have changed at various places!

Version 4
-Updated the mod to the Tutorial updates: Tutorial 1 v8, Tutorial 2 v7, Tutorial 3 v3, Tutorial 4 v3. Please note: The mod was revised and updated according to the changes in the tutorials. Details and specifics have changed at various places!
-Added example of German language choice (not active) and traify-ed all lines in the tp2 (not many).
-Changed handling of texts: setup.tra contains lines needed for setup, all ingame text from tp2 moved into game.tra.
-Added dynamic order syntax and globally unique labels to biffsodtutorial.ini and tp2 to include support for Project Infinity, with explanations.
-Updated Readme.

Version 3
-corrected script so Biff will not spawn double in front of Palace (in bd0101_patch.baf).
-changed variable from "bdxxxx" to "MYAREA" to make using the script templates easier (in bd0010_patch.baf, bd0101_patch.baf, bd1000_patch.baf, bd3000_patch.baf, bd7100_patch.baf).
-Added compatibility with mods that lets skip parts of SoD (bd1000_patch.baf, bd3000_patch.baf, bd7100_patch.baf).

Version 2
-added EET compatibility 
-corrected copy&paste errors where Minsc's death variable was inside scripts instead of Biff's
-corrected trigger of second script block in bd0101_patch.baf to close the oversight that Biff wouldn't (re)spawn here in case he was already spawned in bd0010.are but not taken into the group
-added "Biff visits PC in prison"
-added "Corwin will mention Biff's whereabouts in BG city if asked about the former companions"
-the mod now uses a tra file (albeit only for the line needed for EET fate spirit) and HANDLE_CHARSETS for text conversion

Version 1

-first public release