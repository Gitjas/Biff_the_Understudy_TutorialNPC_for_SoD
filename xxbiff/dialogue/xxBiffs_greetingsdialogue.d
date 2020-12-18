/* Biff's SoD greetings dialogue */

BEGIN xxBiffs

/* we need an always true "can I join you" block, because this dialogue might also trigger if Biff was left standing in BG city and is now waiting either in front of the Ducal Palace when the PC is leaving for the crusade, or even in one of the camps! */
IF ~True()~ THEN sod_meeting
  SAY ~<CHARNAME>! Can I join you?~
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
