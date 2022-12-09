/* Biff's SoD greetings dialogue */

BEGIN xxBiffsG

/* First meeting in SoD */
IF ~Global("xxBiff_SoDGreeting","GLOBAL",0)~ THEN hello
SAY ~Er, yes. I was asked to offer to join you on your quest. What say you?~
  ++ ~Sure!~ DO ~SetGlobal("xxBiff_SoDGreeting","GLOBAL",1)~ + sod_meeting_01
  ++ ~Not right now, but make sure to stay around in case I need you later!~ DO ~SetGlobal("xxBiff_SoDGreeting","GLOBAL",1)~ + sod_meeting_02
END

/* second meeting */
IF ~Global("xxBiff_SoDGreeting","GLOBAL",1)~ THEN sod_meeting
  SAY ~<CHARNAME>! Can I join you now?~
  ++ ~Sure!~ + sod_meeting_01
  ++ ~Not right now, but make sure to stay around in case I need you later!~ + sod_meeting_02
END

IF ~~ THEN sod_meeting_01
  SAY ~Thank you!~
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN sod_meeting_02
  SAY ~I will do that.~
  IF ~~ THEN EXIT
END
