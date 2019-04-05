/* xxBiffsP.dlg Biff's kickout dialogue for SoD */
BEGIN ~xxBiffsP~

/* If kicked out in Avernus (so Caelar can join) in bd4700.are
This sets Global("xxBiff_kicked_bd4700","global",1) which is used in xxbdcut59b.baf */
/* Biff can't go home from here - so he will stay and say something brave. */
IF ~AreaCheck("bd4700")
    GlobalLT("bd_plot","global",570)~ THEN BEGIN kickout_1
  SAY ~Sure, er, I'll stay around... and fight.~
  IF ~~ THEN DO ~SetGlobal("xxBiff_kicked_bd4700","global",1)
                 SetGlobal("bd_joined","locals",0)~ EXIT
END

/* If kicked out in Korlasz's tomb */
/* Again, we don't need this since Biff's not available in Korlasz's crypt, this is for demonstrating purposes, only */
IF ~OR(2)
      AreaCheck("bd0120")
      AreaCheck("bd0130")
    GlobalGT("bd_joined","locals",0)~ THEN BEGIN kickout_2
  SAY ~You want me to go?~
  ++ ~Just remain here and await my return, all right?~ + kickout_3
  ++ ~No, stay with the group.~ + kickout_4
END

IF ~~ THEN BEGIN kickout_3
  SAY ~Fine, I'll be around.~
  IF ~~ THEN DO ~SetGlobal("bd_joined","locals",0)~ EXIT
END

IF ~~ THEN BEGIN kickout_4
  SAY ~My pleasure!~
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

/* kicked out somewhere else (not bd4700.are in Avernus, not Korlasz's tomb) */
IF ~GlobalGT("bd_joined","locals",0)~ THEN BEGIN kickout_5
  SAY ~You want me to go?~
  + ~GlobalGT("bd_npc_camp_chapter","global",1)
     GlobalLT("bd_npc_camp_chapter","global",5)
     OR(2)
       !Range("ff_camp",999)
       NextTriggerObject("ff_camp")
     !IsOverMe("xxBiff")~ + ~Please go back to the camp.~ DO ~SetGlobal("bd_npc_camp","locals",1)~ + kickout_6
  ++ ~Just remain here and await my return, all right?~ + kickout_3
  ++ ~No, stay with the group.~ + kickout_4
END

IF ~~ THEN BEGIN kickout_6
  SAY ~I will.~
  IF ~~ THEN DO ~SetGlobal("bd_joined","locals",0)~ EXIT
END

/* join-up after leaving the group */
IF ~Global("bd_joined","locals",0)~ THEN join_again
  SAY ~Want me to join again?~
  ++ ~Yes, please come along once more.~ + kickout_4
  ++ ~Just remain here and await my return, all right?~ + kickout_3
END