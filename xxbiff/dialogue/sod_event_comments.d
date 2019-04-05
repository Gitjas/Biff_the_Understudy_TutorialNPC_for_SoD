
/* PC escaped from the prison. All NPCs say a greeting */

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