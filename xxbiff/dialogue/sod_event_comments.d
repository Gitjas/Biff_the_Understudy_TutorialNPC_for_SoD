
/* (T1) This goes into a .d file: Make Corwin mention Biff's whereabouts in BG city */
EXTEND_BOTTOM bdschael 39
IF ~!Dead("xxBiff") !InPartyAllowDead("xxBiff") BeenInParty("xxBiff")~ THEN + mynpc
END

APPEND bdschael

IF ~~ THEN mynpc
SAY ~Also, Biff the Understudy was seen right in front of the Ducal Palace's gates not long ago.~
COPY_TRANS bdschael 39 //This will add all transactions from bdschael.dlg state 39 here, so nothing of the original gets lost (also none of the mods installed before Biff)
END

END //APPEND




/* (T2) Biff visits PC in prison */

APPEND xxBiffsP 

IF WEIGHT #-1
~Global("xxBiff_jail_visitors","bd0104",1)~ THEN prison_visit
SAY ~Hey there, <CHARNAME>. I know it sounds weird, but... you'll be fine, so hang in there, alright?~
= ~I haven't much to say to you, I'm only here because jastey wanted to test the "visit PC in prison" script additions. So... See you soon!~
IF ~~ THEN DO ~SetGlobal("xxBiff_jail_visitors","bd0104",2) 
SetGlobal("bd_visit_player","locals",1) //this will let Biff EscapeArea() via bdvisit.bcs
~ EXIT
END
END //APPEND


/* (T2) PC escaped from the prison. All NPCs say a greeting */

I_C_T3 BDIMOEN 99 xxBiff_SoDMurderComment 
== xxBiffsP IF ~Global("bd_player_exiled","global",0)
!Dead("xxBiff")
InMyArea("xxBiff")
!InParty("xxBiff")~ THEN ~Good you made it out. Sorry about all the blood.~
== xxBiffsP IF ~!Global("bd_player_exiled","global",0)
!Dead("xxBiff")
InMyArea("xxBiff")
!InParty("xxBiff")~ THEN ~Good to see you. I like this ending way better!~
END


