/* (T4) this is banter_sod.d: Biff's banters in "dialogue style" format, for the optional component to transform his banters. Triggered by his OVERRIDE script. */

BEGIN xxBiffB //dlg needs to be created once

/* 1st with Corwin, "xxBiff01.baf". Minsc interjects if he's present */
CHAIN
IF WEIGHT #-1
/* We only need the checking variable here. All other checks (whether NPCs can talk etc. was done inside the script. */
~Global("xxBiff_SoD_CorwinBanter","GLOBAL",2)~ THEN xxBiffB xxbiff_corwin_sod_1
~I'm not sure what I should be talking about. I know all the other NPC's lines, though! Pretend I'm Minsc, yes?~
DO ~SetGlobal("xxBiff_SoD_CorwinBanter","GLOBAL",3)~ //we need to close the variable for dialogue style, too.
/* Minsc's line - will only show if he's present and can talk. */
== BDMINSCB IF ~IfValidForPartyDialogue("MINSC")~ THEN ~Ah, but Biff will never be a real Minsc, without a giant space hamster!~
/* the "%2%" is for unifying string reference numbers for SoD and EET. Definition and use please refer to Modding Tutorial Part 3, Chapter "Training the Recruits in the Coalition Camp". */
== BDCORWIB #%2%58849 
== xxBiffB #%2%58850
== BDCORWIB #%2%58851
== xxBiffB #%2%58852
EXIT

/* 2nd with Corwin, "xxBiff02.baf" - started by Corwin */
CHAIN
IF WEIGHT #-1
/* We only need the checking variable here. All other checks (whether NPCs can talk etc. was done inside the script. */
~Global("xxBiff_SoD_CorwinBanter","GLOBAL",5)~ THEN BDCORWIB xxbiff_corwin_sod_2
~So, what does it feel like, being a real NPC and not only the Understudy?~
DO ~SetGlobal("xxBiff_SoD_CorwinBanter","GLOBAL",6)~ //we need to close the variable for dialogue style, too.
== xxBiffB ~Wait, I don't know that line... Oh, it's a real question! Thank you! Thank you, Corwin! I feel great!~
EXIT