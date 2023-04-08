/* This file contains Biff's dialogues and other dialogue additions */
BEGIN xxBiffJ //we need to define the dlg somewhere. In this mod, this is the first place to do so.

/* (T1) This goes into a .d file: Make Corwin mention Biff's whereabouts in BG city (new game or in case the NPC was in party in BG1) */
I_C_T bdschael 39 xxBiff_bdschael_39
== bdschael IF ~!Dead("xxBiff") !InPartyAllowDead("xxBiff") 
OR(2)
	BeenInParty("xxBiff")
	Global("SOD_fromimport","GLOBAL",0)~ THEN ~Also, Biff the Understudy was seen right in front of the Ducal Palace's gates not long ago.~
END

/* (T3) PC threatens to kill the crusaders with the spikes in bd7230.are */
I_C_T bdkharmy 6 xxBiff_bdkharmy_6
== xxBiffJ IF ~IsValidForPartyDialogue("xxBiff")~ THEN ~Wow, eeeevil.~
END

/* (T3) PC handed over the Bridgefort Castle to the crusaders */
I_C_T BDKHALIJ 33 xxBiff_betrayal_discussion //"xxBiff_betrayal_discussion" is the name of the global variable
== xxBiffJ IF ~IsValidForPartyDialogue("xxBiff")~ THEN ~Well, this was definitely faster.~
END

/* (T3) The Chicken, the Well, and the Dog Easter Egg */
I_C_T BDDOGW01 7 C#BE_BDDOGW01_7
== xxBiffJ IF ~IfValidForPartyDialogue("xxBiff")~ THEN ~We washed the chicken in the well and the dog came to collect it. Never gets old!~
== BDDOGW01 IF ~IfValidForPartyDialogue("xxBiff")~ THEN ~Woof!~
END

/* (T3) Training the Recruits in the Coalition Camp */

/* Clovis */
EXTEND_BOTTOM BDCLOVIS 3
+ ~IfValidForPartyDialogue("xxBiff")~ + ~[PC reply]Biff, any advice?~ EXTERN xxBiffJ teach_clovis
END

CHAIN
IF ~~ THEN xxBiffJ teach_clovis
~I see a mistake smaller men do when trained by taller ones. Fighting wears your arms out quite a bit, doesn't it?~
== BDCLOVIS #%2%48085 /* ~I do tire pretty quickly during drills. I thought I just needed more training.~ */
== xxBiffJ ~Focus on weak spots were you do not have to reach upwards. There are more than you might think. The foes will fear you for it - and you will wear out less quickly.~
END
IF ~~ THEN DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_clovista_skill","global",2)~ EXTERN BDCLOVIS 5

/* Danine */
EXTEND_BOTTOM BDDANINE 3
+ ~IfValidForPartyDialogue("xxBiff")~ + ~Biff, you think you can teach this recruit to improve her skills?~ EXTERN xxBiffJ teach_danine
END

/* there will be a short fighting scene, then Biff talks again */
EXTEND_BOTTOM BDDANINE 4
IF ~IfValidForPartyDialogue("xxBiff")~ THEN DO ~SetGlobal("BD_DANINE_INTRO","BD3000",2)
SetGlobal("xxBiff_BD_DANINE","BD3000",1)
PlaySound("ACT_07")
ReallyForceSpellRES("BDDANIN2",Myself)
JumpToPoint([108.656])
FaceObject("BDCLOVIS")
Wait(1)
ReallyForceSpellRES("BDDANIN1",Myself)
ApplyDamage("BDCLOVIS",1,1)
SetSequence(SEQ_ATTACK)
ActionOverride("BDCLOVIS",SetSequence(SEQ_DIE))
Wait(1)
ActionOverride("BDCLOVIS",SetSequence(SEQ_AWAKE))
Wait(1)
ActionOverride("xxBiff",StartDialogNoSet("bddanine"))
~ EXIT
END

APPEND xxBiffJ
IF ~~ THEN teach_danine
SAY ~I do. Try to be at places the foe doesn't expect you to be, be it yourself - or just your knife.~
  IF ~~ THEN EXTERN ~BDDANINE~ 4
END

/* final dialogue after Danine tried out the advice */
IF WEIGHT #-1 
~Global("xxBiff_BD_DANINE","BD3000",1)~ THEN teach_danine_01
  SAY ~Yes, that's it.~
  IF ~~ THEN DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_danine_skill","global",2)
SetGlobal("xxBiff_BD_DANINE","BD3000",2)
~ EXTERN ~BDDANINE~ 5
END
END //APPEND

/* Garrold */
EXTEND_BOTTOM BDGARROL 1
+ ~IfValidForPartyDialogue("xxBiff")~ + ~Biff, you seem like you want to say something?~ EXTERN xxBiffJ teach_garrold
END

CHAIN
IF ~~ THEN xxBiffJ teach_garrold
~You definitely have potential. More than with what you do here. Would the battle mages take on new recruits as well?~
END
IF ~~ THEN DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_garrold_skill","global",2)~ EXTERN BDGARROL 3


/* Hester */
/* Hester has two possible states for reply options */
EXTEND_BOTTOM BDHESTER 6
+ ~IfValidForPartyDialogue("xxBiff")~ + ~Biff, you think you can teach this recruit to improve his skills?~ EXTERN xxBiffJ teach_hester
END

EXTEND_BOTTOM BDHESTER 7
+ ~IfValidForPartyDialogue("xxBiff")~ + ~Biff, you think you can teach this recruit to improve his skills?~ EXTERN xxBiffJ teach_hester
END

CHAIN
IF ~~ THEN xxBiffJ teach_hester
~You need to focus on *why* you are here. The only thing worth being afraid of is that your foe will overpower you - and not because of yourself, but because of your friends and the ones that depend on you!~
== BDHESTER #%2%48006 /* ~So by trying to avoid battle and all that comes with it, I'm missing out on my life now...?~ */
== xxBiffJ ~Exactly.~
END
IF ~~ THEN DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_hester_skill","global",2)
~ EXTERN ~BDHESTER~ 10

/* Morlis */
/* #1 The first example is for the advice a fighter would give. If your NPC recognizes Morlis' joy in killing, the dialogue would go differently, see below. */
//--> take out from here if you want to use option #2 instead
EXTEND_BOTTOM BDMORLIS 4
+ ~IfValidForPartyDialogue("xxBiff")~ + ~Biff, can you give some advice as a fighter?~ EXTERN xxBiffJ teach_morlis
END

CHAIN
IF ~~ THEN xxBiffJ teach_morlis
~You are strong and do not shy away from being hit. You need to focus that strength on the foe. Try to be in the first row. It is where your skill will be useful the most, as you do not have to watch out not to hit allies.~
END
IF ~~ THEN DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_morlis_skill","global",2)~ EXTERN BDMORLIS 8
// <-- take out until here if you want to use option #2

/* #2 Morlis, possibility to interact for an evil NPC */
/* - taken out - remove this line if you want tuse option #2
EXTEND_BOTTOM BDMORLIS 4
+ ~IfValidForPartyDialogue("xxBiff")~ + ~Biff, you look like you want to say something?~ EXTERN xxBiffJ teach_morlis_evil
END

CHAIN
IF ~~ THEN xxBiffJ teach_morlis_evil
~(Imitating Dorn's voice) I sense something in you, soldier. A darkness that reminds me of my own. You like killing, don't you?~
== #%2%47935 /* ~I... yes. I do enjoy it. I thought if I said so, though, they wouldn't let me in the militia.~ */
== xxBiffJ ~Well, it seems we really need every man we get. Make sure you're in the front row, though.~
END
IF ~~ THEN DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_morlis_skill","global",2)~ EXTERN BDMORLIS 6
*/ //remove this line if you want to use option #2

/* Taield */
EXTEND_BOTTOM BDTAIELD 1
+ ~IfValidForPartyDialogue("xxBiff")~ + ~Biff, can you give this private some advice?~ EXTERN xxBiffJ teach_taield
END

CHAIN
IF ~~ THEN xxBiffJ teach_taield
~You seem to feel not full part of the group. I can sympathize with that... I'm always only seen as the second choice myself.~
== BDTAIELD #%2%48070 /* ~I admit I've felt somewhat alienated. It's hard to feel part of the team when I'm so obviously different.~ */
== xxBiffJ ~(Imitating Jaheira's voice) Everyone has a reason to feel alone. We each make our own paths and fight for our own causes. You must find the strength within to endure, as do we all.~
END
IF ~~ THEN DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_taield_skill","global",2)~ EXTERN BDTAIELD 6


APPEND xxBiffJ

/* (T3) Comment before entering the Cave with the blind Wyrmlings (bd5100aw.bcs) */
IF ~Global("xxBiff_BD_SDD317_WYRMS","BD5100",1)~ THEN blind_wyrm_comment
SAY ~There is something weird and dangerous in the cave in front of us.~
IF ~~ THEN DO ~SetGlobal("xxBiff_BD_SDD317_WYRMS","BD5100",2)~ EXIT
END

/* (T3) Comment after killing the blind Wyrmlings in Cave (bd0113.bcs) */
IF ~Global("xxBiff_BD_SDD317_WYRMS","BD5100",3)~ THEN blind_wyrm_comment
SAY ~Now they are dead.~
IF ~~ THEN DO ~SetGlobal("xxBiff_BD_SDD317_WYRMS","BD5100",4)~ EXIT
END

/* (T3) PC lost paladinhood / rangerhood due to the spike trap */
IF ~Global("xxBiff_SpikeTrapFall","GLOBAL",2)~ THEN spiketrap_fall
SAY ~Whoa, <CHARNAME>. As a paladin or ranger, I would totally go nuts right now!~
IF ~~ THEN DO ~SetGlobal("xxBiff_SpikeTrapFall","GLOBAL",3) 
/* uncomment the following line if it makes sense for your NPC */
//SetLeavePartyDialogFile() LeaveParty() Enemy() Attack(Player1)
~ EXIT
END

END //APPEND


/* (T3) Thrix' Game */

/* Thrix will not propose gamble if there is no NPC available: add Biff here */
ADD_TRANS_TRIGGER BDTHRIX 13 ~!IsValidForPartyDialogue("xxBiff")~ DO 2 IF ~!Is?f?ValidForPartyDialogue("Rasaad")~


/* Thrix' game: add Biff for certain randomness to the blocks of 4 dialogue states each */
/* 1st states of 4 state blocks: add Biff to the end */
EXTEND_BOTTOM BDTHRIX 21 26 30 34 38 42 46 50 54 58 62 66 70 74 78 82 86 90
IF ~Global("xxBiff_SoDThrix","GLOBAL",0) IsValidForPartyDialogue("xxBiff")~ THEN + xxbiff_thrix
END
/* 2nd states of 4 state blocks: add Biff at the top, i.e. position "1" as "0" is in case there is no more NPC available */
EXTEND_TOP BDTHRIX 22 27 31 35 39 43 47 51 55 59 63 67 71 75 79 83 87 91 #1
IF ~Global("xxBiff_SoDThrix","GLOBAL",0) IsValidForPartyDialogue("xxBiff")~ THEN + xxbiff_thrix
END
/* 3rd states of 4 state blocks: add Biff at position 10 */
EXTEND_TOP BDTHRIX 23 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 #10
IF ~Global("xxBiff_SoDThrix","GLOBAL",0) IsValidForPartyDialogue("xxBiff")~ THEN + xxbiff_thrix
END
/* 4th states of 4 state blocks: add Biff at position 5 */
EXTEND_TOP BDTHRIX 24 29 33 37 41 45 49 53 57 61 65 69 73 77 81 85 89 93 #5
IF ~Global("xxBiff_SoDThrix","GLOBAL",0) IsValidForPartyDialogue("xxBiff")~ THEN + xxbiff_thrix
END

/* in case PC lost and Biff was chosen: Thrix claims him (only verbally) */
EXTEND_BOTTOM BDTHRIX 118 119 120 121 
IF ~Global("xxBiff_SoDThrix","GLOBAL",2) IsValidForPartyDialogue("xxBiff")~ THEN + xxBiff_chosen
END

/* Thrix new dialogue for our NPC */
APPEND BDTHRIX

IF ~~ THEN BEGIN xxbiff_thrix 
  SAY ~The Understudy... always so well prepared. I will take his soul and show him that he is not prepared, at all.~
  IF ~~ THEN REPLY ~You want Biff? Then he will be yours if I lose.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",1)
SetGlobal("bd_thrix_sacrifice_companion","global",1)
~ EXTERN xxBiffJ thrix_01

  IF ~RandomNum(4,1)~ THEN REPLY ~Biff is with me on a path of education. You will not get his soul.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",2) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 70
  IF ~RandomNum(4,2)~ THEN REPLY ~Biff is with me on a path of education. You will not get his soul.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",2) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 71
  IF ~RandomNum(4,3)~ THEN REPLY ~Biff is with me on a path of education. You will not get his soul.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",2) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 72
  IF ~RandomNum(4,4)~ THEN REPLY ~Biff is with me on a path of education. You will not get his soul.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",2) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 73

  IF ~!Global("BD_NumInParty","bd4500",1)
!Global("BD_NumInParty","bd4500",2)
!Global("BD_NumInParty","bd4500",3)
!Global("BD_NumInParty","bd4500",4)~ THEN REPLY ~Biff is with me on a path of education. You will not get his soul.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",2)~ + 114

  IF ~~ THEN REPLY ~He has his faults, but I'll not risk Biff's soul in so blithe a fashion. If I cannot answer your riddle, mine is the soul you will take. Agreed?~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",3)~ GOTO 113
  IF ~~ THEN REPLY ~I'll feed you your own limbs if you don't let me into the tower, you wretched creature. I'm done playing games with you.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",5)~ GOTO 12
END

IF ~~ THEN xxBiff_chosen
SAY ~Thrix has marked your soul, Understudy. Your soul is mine!~ 
++ ~Whoops. Sorry, Biff.~ DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",4)~ EXTERN xxBiffJ thrix_02
++ ~No, you will not take his soul, devil. We will fight you!~ GOTO 10
END

END //APPEND

/* Biff's reactions in Thrix' dialogue */
APPEND xxBiffJ

IF ~~ THEN thrix_01
SAY ~(gulp) I don't like where this is going.~
IF ~~ THEN EXTERN ~BDTHRIX~ 116
END

IF ~~ THEN thrix_02
  SAY ~(Fortunately I know that he never really comes to claim the soul, you know.)~
  IF ~~ THEN DO ~SetGlobal("bd_thrix_won","global",1) //this is for an achievement
  ~ EXTERN ~BDTHRIX~ 140
END 

END //APPEND

/* Biff reacts to Thrix's game */
/* I do the reaction in one CHAIN. Change this to whatever dialogue tree fits your NPC. */
CHAIN
IF ~OR(2)
    Global("xxBiff_SoDThrix","GLOBAL",6)
//  Global("xxBiff_SoDThrix","GLOBAL",7) //etc.: according to where your NPC should react and adjust the OR() accordingly
    Global("xxBiff_SoDThrix","GLOBAL",9)~ THEN xxBiffJ after_thrix
~You were quite ready to give my soul to that fiend, <CHARNAME>.~ 
== xxBiffJ IF ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ THEN ~Luckily, you won the game, so no harm done.~
== xxBiffJ IF ~Global("xxBiff_SoDThrix","GLOBAL",6) !Global("BD_Thrix_riddle_won","GLOBAL",1)~ THEN ~I appreciate you tried to fight the fiend in the end, but unluckily, the harm was done.~
== xxBiffJ IF ~Global("xxBiff_SoDThrix","GLOBAL",9) !Global("BD_Thrix_riddle_won","GLOBAL",1)~ THEN ~Why did you do that? Trading my soul to a fiend! You gave my soul a little bit too readily for my taste, you know.~
END
IF ~~ THEN DO ~SetGlobal("xxBiff_SoDThrix","GLOBAL",11)~ EXIT // We need to do this here or the checks above will not work.



/* (T2) Biff visits PC in prison */
APPEND xxBiffsP 
/* non-romance case, PC was found guilty in the trial */
IF WEIGHT #-1 //we make this higher weighted so it triggers instead of his valid kickout dialogue
~Global("xxBiff_jail_visitors","bd0104",1)
Global("bd_player_exiled","global",0)
!Global("xxBiff_sod_romanceactive","global",2)~ THEN prison_visit_guilty
SAY ~Hey there, <CHARNAME>. I know it sounds weird, but... you'll be fine, so hang in there, alright?~
IF ~~ THEN DO ~SetGlobal("xxBiff_jail_visitors","bd0104",2) 
SetGlobal("bd_jail_visitors","bd0104",4) //we reset the variable to "4" so other romance interests can show - if present. If none is present, the script bd0104.bcs will move on.
SetGlobal("bd_visit_player","locals",1) //this will let Biff EscapeArea() via bdvisit.bcs
~ EXIT
END
/* non-romance case, PC was found innocent in the trial */
IF WEIGHT #-1 //we make this higher weighted so it triggers instead of his valid kickout dialogue
~Global("xxBiff_jail_visitors","bd0104",1)
GlobalGT("bd_player_exiled","global",0)
!Global("xxBiff_sod_romanceactive","global",2)~ THEN prison_visit_innocent
SAY ~Hey there, <CHARNAME>. I know it sounds weird, but... you'll be fine, so hang in there, alright?~
IF ~~ THEN DO ~SetGlobal("xxBiff_jail_visitors","bd0104",2) 
SetGlobal("bd_jail_visitors","bd0104",4) //we reset the variable to "4" so other romance interests can show - if present. If none is present, the script bd0104.bcs will move on.
SetGlobal("bd_visit_player","locals",1) //this will let Biff EscapeArea() via bdvisit.bcs
~ EXIT
END
/* commented out, There is no Biff romance. Enable this as needed.
/* romance case, PC was found guilty in the trial: */
IF WEIGHT #-1 //we make this higher weighted so it triggers instead of his valid kickout dialogue
~Global("xxBiff_jail_visitors","bd0104",1)
Global("bd_player_exiled","global",0)
Global("xxBiff_sod_romanceactive","global",2)~ THEN prison_visit_guilty_romance
SAY ~Hey there, <CHARNAME>. I know it sounds weird, but... you'll be fine, so hang in there, love, alright?~
IF ~~ THEN DO ~SetGlobal("xxBiff_jail_visitors","bd0104",2) 
SetGlobal("bd_jail_visitors","bd0104",4) //we reset the variable to "4" so other romance interests can show - if present. If none is present, the script bd0104.bcs will move on.
SetGlobal("bd_visit_player","locals",1) //this will let Biff EscapeArea() via bdvisit.bcs
~ EXIT
END
/* romance case, PC was found innocent in the trial: */
IF WEIGHT #-1 //we make this higher weighted so it triggers instead of his valid kickout dialogue
~Global("xxBiff_jail_visitors","bd0104",1)
GlobalGT("bd_player_exiled","global",0)
Global("xxBiff_sod_romanceactive","global",2)~ THEN prison_visit_innovent_romance
SAY ~Hey there, <CHARNAME>. I know it sounds weird, but... you'll be fine, so hang in there, love, alright?~
IF ~~ THEN DO ~SetGlobal("xxBiff_jail_visitors","bd0104",2) 
SetGlobal("bd_jail_visitors","bd0104",4) //we reset the variable to "4" so other romance interests can show - if present. If none is present, the script bd0104.bcs will move on.
SetGlobal("bd_visit_player","locals",1) //this will let Biff EscapeArea() via bdvisit.bcs
~ EXIT
END
*/
END //APPEND


/* (T2) PC escaped from the prison. All NPCs say a greeting */
I_C_T3 BDIMOEN 99 xxBiff_SoDMurderComment 
/* PC is believed to be the murderer */
== xxBiffsP IF ~Global("bd_player_exiled","global",0)
!Dead("xxBiff")
InMyArea("xxBiff")
!InParty("xxBiff")~ THEN ~Good you made it out. Sorry about all the blood.~
/* PC is believed to be innocent */
== xxBiffsP IF ~!Global("bd_player_exiled","global",0)
!Dead("xxBiff")
InMyArea("xxBiff")
!InParty("xxBiff")~ THEN ~Good to see you. I like this ending way better!~
END


/* PC can ask Imoen about Biff in last meeting if Biff will not come along */
/* ## commented out, Biff will be there
EXTEND_BOTTOM bdimoen 104
  + ~Global("xxBiff_SoDparty_epilogue","GLOBAL",1)~ + ~I was expecting to see Biff amongst you.~ + ask_about_biff
END
EXTEND_BOTTOM bdimoen 109
  + ~Global("xxBiff_SoDparty_epilogue","GLOBAL",1)~ + ~I was expecting to see Biff amongst you.~ + ask_about_biff
END
APPEND bdimoen
IF ~~ THEN ask_about_biff
  SAY ~Biff? Ah, he said something about having to rehearse for BGII and went off, sorry.~
  IF ~~ THEN GOTO 119
END
## */
