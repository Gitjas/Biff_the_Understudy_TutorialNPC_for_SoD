/* Dialogues as triggered in sod_important_reactions_scripts.baf */

APPEND xxBiffJ

/* 1. Hephernaan's own plans */
	
/* 1.1 General reaction to Hephernaan is betraying Caelar: knowledge gained BEFORE the portal scene at Dragonspear basement; PC does NOT know that he is working for a fiend yet. */
IF ~Global("xxBiff_HephernaanBetrayal","GLOBAL",1)~ THEN hephernaan_betraying_caelar
SAY ~(General reaction to Hephernaan is betraying Caelar: knowledge gained BEFORE the portal scene at Dragonspear basement; PC does NOT know that he is working for a fiend yet.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_HephernaanBetrayal","GLOBAL",2)~ EXIT
END

/* 1.2 General reaction to the knowledge that Hephernaan is working for a fiend: knowledge gained BEFORE the portal scene at Dragonspear basement */
IF ~Global("xxBiff_HephernaanFiend","GLOBAL",1)
GlobalLT("bd_plot","global",485) //before the portal is opened
~ THEN hephernaan_working_for_fiend
SAY ~(General reaction to the knowledge that Hephernaan is working for a fiend: knowledge gained BEFORE the portal scene at Dragonspear basement.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_HephernaanFiend","GLOBAL",2)~ EXIT
END

/* 1.3 General reaction to the knowledge that Hephernaan is working for a fiend: knowledge gained AFTER the portal scene at Dragonspear basement */
IF ~Global("xxBiff_HephernaanFiend","GLOBAL",1)
GlobalGT("bd_plot","global",484) //after the portal is opened
~ THEN hephernaan_working_for_fiend_2
SAY ~(General reaction to the knowledge that Hephernaan is working for a fiend: knowledge gained AFTER the portal scene at Dragonspear basement.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_HephernaanFiend","GLOBAL",2)~ EXIT
END


/* 2. Caelar's ulterior motive is to save her uncle Aun. */

/* 2.1 Conclude that Caelar's ulterior motive is to save her uncle: After knowing that she is planning on freeing souls from Avernus and knowing that Aun went to Avernus for her. */
/* Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_CaelarPlanAun","GLOBAL",1)~ THEN caelar_plan_aun
SAY ~(NPC's summary that Caelar is planning on freeing souls from Avernus and knowing that Aun went to Avernus for her.)~
++ ~(PC Concludes that Caelar's ulterior motive is to save her uncle.)~ + caelar_plan_aun_01
++ ~What do you mean?~ + caelar_plan_aun_02
++ ~Even if - I don't care. We'll see how it all plays out.~ + caelar_plan_aun_03
END

IF ~~ THEN caelar_plan_aun_01
SAY ~(Affirmative NPC reply to conclusion.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_CaelarPlanAun","GLOBAL",2)
SetGlobal("C#SoD_CaelarPlanAun","GLOBAL",1) //cross-mod variable: prevent other NPCs to come with the same conclusion.
SetGlobal("C#RtD_CaelarPlan_SET","GLOBAL",5) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

IF ~~ THEN caelar_plan_aun_02
SAY ~(Summary of conclusion that Caelar's ulterior motive is to save her uncle.)~
++ ~I think you are right! This is an important finding.~ + caelar_plan_aun_01
++ ~Even if - I don't care. We'll see how it all plays out.~ + caelar_plan_aun_03
END

IF ~~ THEN caelar_plan_aun_03
SAY ~(NPC accepts PC's reply.[No variable will be set, knowledge will not be counted.])~
IF ~~ THEN DO ~SetGlobal("xxBiff_CaelarPlanAun","GLOBAL",-1) 
SetGlobal("C#SoD_CaelarPlanAun","GLOBAL",1) //cross-mod variable: prevent other NPCs to come with the same conclusion.
~ EXIT
END

/* 2.2 General reaction to the knowledge that Caelar's ulterior motive is to free her uncle BEFORE meeting Aun. */
IF ~Global("xxBiff_AllForAun","GLOBAL",1)
GlobalLT("bd_plot","global",485)~ THEN all_for_aun
SAY ~(General reaction to the knowledge that Caelar's ulterior motive is to free her uncle BEFORE meeting Aun.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_AllForAun","GLOBAL",2)~ EXIT
END

/* 2.3 General reaction to the knowledge that Caelar's ulterior motive was to free her uncle AFTER meeting Aun. */
IF ~Global("xxBiff_AllForAun","GLOBAL",1)
GlobalGT("bd_plot","global",564)~ THEN all_for_aun_2
SAY ~(General reaction to the knowledge that Caelar's ulterior motive was to free her uncle AFTER meeting Aun.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_AllForAun","GLOBAL",2)~ EXIT
END

/* 4. Incident at Boareskyr Bridge. */

/* 4.1 Quick reaction line: will only show if The Boareskyr Bridge Scene mod is not installed / didn't run. Uses the same line! -> crossmod with TBBS is in the tp2. */
IF ~Global("xxBiff_SoDBoareskyrBridgeScene","GLOBAL",1)
Global("xxBiff_c#stff24_10","GLOBAL",0)~ THEN bhaal_bridge
SAY @100 /* ~Boom! Always impressive, this scull appearing around you.~ */
IF ~~ THEN DO ~SetGlobal("xxBiff_SoDBoareskyrBridgeScene","GLOBAL",2)~ EXIT
END

/* 4.2 General dialogue after bridge incident. Will run after timer. (True also in case The Boareskyr Bridge mod is installed and the above quick reaction line didn't run.) Tthis follow-up dialogue triggers after timer is run. */
IF ~Global("xxBiff_SoDBoareskyrBridgeScene","GLOBAL",3)
Global("xxBiff_c#stff24_10","GLOBAL",1)~ THEN bhaal_bridge_00
SAY ~What happened at the Boareskyr bridge will leave an impression on people, I can tell you that.~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoDBoareskyrBridgeScene","GLOBAL",4)~ EXIT
END


/* 5. Caelar wants to open a portal to Avernus. */

/* 5.1 Conclusion that Caelar wants to open a portal to Avernus: if PC knows that Caelar is planning on marching into Avernus AND Hephernaan is working for a fiend. */
/* Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_SoD_PortalConclusion","GLOBAL",1)~ THEN 1_conclusion_portal
SAY ~(NPC summarizes that PC knows that Caelar is planning on marching into Avernus AND Hephernaan is working for a fiend.)~
++ ~(PC's Conclusion that Caelar wants to open a portal to Avernus.)~ DO ~SetGlobal("C#SoD_PortalConclusion_1","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion.
+ conclusion_portal_01
++ ~What do you mean?~ DO ~SetGlobal("C#SoD_PortalConclusion_1","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion.
+ conclusion_portal_02
++ ~Even if - I don't care. We'll see how it all plays out.~ DO ~SetGlobal("C#SoD_PortalConclusion_1","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion.
+ conclusion_portal_03
END

/* 5.2 Conclusion that Caelar wants to open a portal to Avernus: if PC knows that Caelar is planning on marching into Avernus AND that there is a dormant rift below Dragonspear Castle. */
/* Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_SoD_PortalConclusion","GLOBAL",2)~ THEN 2_conclusion_portal
SAY ~(NPC summarizes that PC knows that Caelar is planning on marching into Avernus AND that there is a dormant rift below Dragonspear Castle.)~
++ ~(PC's Conclusion that Caelar wants to open a portal to Avernus.)~ DO ~SetGlobal("C#SoD_PortalConclusion_2","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion.
+ conclusion_portal_01
++ ~What do you mean?~ DO ~SetGlobal("C#SoD_PortalConclusion_2","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion.
+ conclusion_portal_02
++ ~Even if - I don't care. We'll see how it all plays out.~ DO ~SetGlobal("C#SoD_PortalConclusion_2","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion.
+ conclusion_portal_03
END

/* 5.3 Conclusion that Caelar wants to open a portal to Avernus: if PC knows that Caelar is planning on marching into Avernus AND that PC's blood is needed to open portal below Dragonspear Castle. */
/* Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_SoD_PortalConclusion","GLOBAL",3)~ THEN 3_conclusion_portal
SAY ~(NPC summarizes that PC knows that Caelar is planning on marching into Avernus AND that PC's blood is needed to open portal below Dragonspear Castle.)~
++ ~(PC's Conclusion that Caelar wants to open a portal to Avernus.)~ DO ~SetGlobal("C#SoD_PortalConclusion_3","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion.
+ conclusion_portal_01
++ ~What do you mean?~ DO ~SetGlobal("C#SoD_PortalConclusion_3","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion.
+ conclusion_portal_02
++ ~Even if - I don't care. We'll see how it all plays out.~ DO ~SetGlobal("C#SoD_PortalConclusion_3","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion.
+ conclusion_portal_03
END

IF ~~ THEN conclusion_portal_01
SAY ~(Affirmative NPC reply to conclusion.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoD_PortalConclusion","GLOBAL",4)
SetGlobal("C#RtD_CaelarPlan_SET","GLOBAL",4)
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

IF ~~ THEN conclusion_portal_02
SAY ~(Summary of Conclusion that Caelar wants to open a portal to Avernus.)~
++ ~I think you are right! This is an important finding.~ + conclusion_portal_01
++ ~Even if - I don't care. We'll see how it all plays out.~ + conclusion_portal_03
END

IF ~~ THEN conclusion_portal_03
SAY ~(NPC accepts PC's reply.[No variable will be set, knowledge will not be counted.])~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoD_PortalConclusion","GLOBAL",-1)~ EXIT
END


/* 5.4 General reaction: Caelar wants to open a portal to Avernus. (No reaction to needed blood, PC might not know yet.) BEFORE portal scene at Dragonspear Castle */
IF ~Global("xxBiff_PortalAvernus","GLOBAL",1)~ THEN knows_avernus_portal
SAY ~(General reaction: Caelar wants to open a portal to Avernus. (No reaction to needed blood, PC does not know yet.) BEFORE portal scene at Dragonspear Castle.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_PortalAvernus","GLOBAL",2)~ EXIT
END


/* 6. Caelar wants the PC for something */

/* 6.1 Conclusion that Caelar didn't want to kill the PC but only kidnap after hearing about weak poison. */
/* Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_SoDKidnapConclusion","GLOBAL",1)~ THEN kidnap_conclusion
SAY ~(NPC summarizes hearing about weak poison.)~
++ ~(PC's Conclusion that Caelar didn't want to kill the PC but only kidnap.)~ + kidnap_conclusion_01
++ ~What do you mean?~ + kidnap_conclusion_02
++ ~Even if - I don't care. We'll see how it all plays out.~ + kidnap_conclusion_03
END

IF ~~ THEN kidnap_conclusion_01
SAY ~(Affirmative NPC reply to conclusion.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoDKidnapConclusion","GLOBAL",2)
SetGlobal("C#SoD_KidnapConclusion","GLOBAL",1) //cross-mod variable: prevent other NPCs to come with the same conclusion.
SetGlobal("C#RtD_CaelarKidnap_SET","GLOBAL",1) 
//SetGlobal("C#RtD_CaelarWantsPC_SET","GLOBAL",1) will be set by script in RtD
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

IF ~~ THEN kidnap_conclusion_02
SAY ~(Summary of Conclusion that Caelar didn't want to kill the PC but only kidnap.)~
++ ~I think you are right! This is an important finding.~ + kidnap_conclusion_01
++ ~Even if - I don't care. We'll see how it all plays out.~ + kidnap_conclusion_03
END

IF ~~ THEN kidnap_conclusion_03
SAY ~(NPC accepts PC's reply.[No variable will be set, knowledge will not be counted.])~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoDKidnapConclusion","GLOBAL",-1) 
SetGlobal("C#SoD_KidnapConclusion","GLOBAL",1) //cross-mod variable: prevent other NPCs to come with the same conclusion.
~ EXIT
END

/* 6.2 Reaction after learning that Caelar needs the PC for something / wanted to kidnap the PC but does NOT know any specifics (BEFORE portal scene) */
IF ~Global("xxBiff_SoDCaelarWantsPC","GLOBAL",1)~ THEN caelar_wants_pc
SAY ~(Reaction after learning that Caelar needs the PC for something / wanted to kidnap the PC but does NOT know any specifics (BEFORE portal scene).)~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoDCaelarWantsPC","GLOBAL",2)~ EXIT
END

/* 7. Caelar needs the PC's blood to open the portal. */

/* 7.1 Conclusion that Caelar needs the PC's blood to open the portal: if Caelar needs Bhaalblood AND PC knows that she is no Bhaalspawn herself. */
/* Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_PortalPCBloodConclusion","GLOBAL",1)~ THEN 1_portal_needs_pc_blood_conclusion
SAY ~(NPC summarizes that Caelar needs Bhaalblood AND PC knows that she is no Bhaalspawn herself.)~
++ ~(PC's Conclusion that Caelar needs the PC's blood to open the portal.)~ DO ~SetGlobal("C#SoD_PortalPCBloodConclusion_1","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion. 
+ portal_needs_pc_blood_conclusion_01
++ ~What do you mean?~ DO ~SetGlobal("C#SoD_PortalPCBloodConclusion_1","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion. 
+ portal_needs_pc_blood_conclusion_02
++ ~Even if - I don't care. We'll see how it all plays out.~ DO ~SetGlobal("C#SoD_PortalPCBloodConclusion_1","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion. 
+ portal_needs_pc_blood_conclusion_03
END

/* 7.2 Conclusion that Caelar needs the PC's blood to open the portal: if Caelar needs Bhaalblood AND wanted to kidnap the PC. */
/* Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_PortalPCBloodConclusion","GLOBAL",2)~ THEN 2_portal_needs_pc_blood_conclusion
SAY ~(NPC summarizes that Caelar needs Bhaalblood AND wanted to kidnap the PC.)~
++ ~(PC's Conclusion that Caelar needs the PC's blood to open the portal.)~ DO ~SetGlobal("C#SoD_PortalPCBloodConclusion_2","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion. 
+ portal_needs_pc_blood_conclusion_01
++ ~What do you mean?~ DO ~SetGlobal("C#SoD_PortalPCBloodConclusion_2","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion. 
+ portal_needs_pc_blood_conclusion_02
++ ~Even if - I don't care. We'll see how it all plays out.~ DO ~SetGlobal("C#SoD_PortalPCBloodConclusion_2","GLOBAL",1)~ //cross-mod variable: prevent other NPCs to come with the same conclusion. 
+ portal_needs_pc_blood_conclusion_03
END

IF ~~ THEN portal_needs_pc_blood_conclusion_01
SAY ~(Affirmative NPC reply to conclusion.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_PortalPCBloodConclusion","GLOBAL",3)
SetGlobal("C#RtD_KnowsPortalBlood_SET","GLOBAL",3) 
//SetGlobal("C#RtD_WantBhaalBlood_SET","GLOBAL",2) will be set by script
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

IF ~~ THEN portal_needs_pc_blood_conclusion_02
SAY ~(Summary of Conclusion that Caelar needs the PC's blood to open the portal.)~
++ ~I think you are right! This is an important finding.~ + portal_needs_pc_blood_conclusion_01
++ ~Even if - I don't care. We'll see how it all plays out.~ + portal_needs_pc_blood_conclusion_03
END

IF ~~ THEN portal_needs_pc_blood_conclusion_03
SAY ~(NPC accepts PC's reply.[No variable will be set, knowledge will not be counted.])~
IF ~~ THEN DO ~SetGlobal("xxBiff_PortalPCBloodConclusion","GLOBAL",-1)~ EXIT
END


/* 7.3 General reaction to the knowledge that Caelar needs the PC's blood to open the portal (BEFORE portal betrayal scene): NPC already reacted to Caelar's plans to open a portal. */
/* Knowledge is gained before Hephernaan's betrayal/going to Avernus */
IF ~Global("xxBiff_PortalPCBlood","GLOBAL",1)
Global("xxBiff_PortalAvernus","GLOBAL",2)
GlobalLT("bd_plot","global",485) //not after Heph's betrayal
~ THEN portal_needs_pc_blood
SAY ~(General reaction to the knowledge that Caelar needs the PC's blood to open the portal (BEFORE portal betrayal scene): NPC already reacted to Caelar's plans to open a portal.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_PortalPCBlood","GLOBAL",2)~ EXIT
END

/* 7.4 General reaction to the knowledge that Caelar needs the PC's blood to open the portal (BEFORE portal betrayal scene): NPC did NOT yet react to Caelar's plans to open a portal. */
/* Knowledge is gained before Hephernaan's betrayal/going to Avernus */
IF ~Global("xxBiff_PortalPCBlood","GLOBAL",1)
GlobalLT("xxBiff_PortalAvernus","GLOBAL",2)
GlobalLT("bd_plot","global",485) //not after Heph's betrayal
~ THEN portal_needs_pc_blood_2
SAY ~(General reaction to the knowledge that Caelar needs the PC's blood to open the portal (BEFORE portal betrayal scene): NPC did NOT yet react to Caelar's plans to open a portal.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_PortalPCBlood","GLOBAL",2)
SetGlobal("xxBiff_PortalAvernus","GLOBAL",2)~ EXIT
END

/* 7.5 General reaction to the knowledge that Caelar needs the PC's blood to open the portal (AFTER portal betrayal scene). */
IF ~Global("xxBiff_PortalPCBlood","GLOBAL",1)
GlobalLT("xxBiff_PortalAvernus","GLOBAL",2)
GlobalGT("bd_plot","global",484) //after Heph's betrayal
~ THEN portal_needs_pc_blood_3
SAY ~(General reaction to the knowledge that Caelar needs the PC's blood to open the portal (AFTER portal betrayal scene).)~
IF ~~ THEN DO ~SetGlobal("xxBiff_PortalPCBlood","GLOBAL",2)
SetGlobal("xxBiff_PortalAvernus","GLOBAL",2)~ EXIT
END


/* 8. Caelar is no child of Bhaal. */

/* 8.1 Conclusion that Caelar is no child of Bhaal: after PC reasons / concludes / speculates that Caelar / Hephernaan want PC's blood for [open portal to Avernus] AND hearing rumors that she is a child of Bhaal (or the portal would already be open / she wouldn't go for the PC.) */
/* Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_CaelarNoBhaalChild","GLOBAL",1)~ THEN caelar_no_bhaalchild_conclusion
SAY ~(NPC summarizes that PC reasoned / concluded / speculated that Caelar / Hephernaan want PC's blood for [open portal to Avernus] AND hearing rumors that she is a child of Bhaal.)~
++ ~(PC Concludes that Caelar is no child of Bhaal or the portal would already be open / she wouldn't go for the PC.)~ + caelar_no_bhaalchild_conclusion_01
++ ~What do you mean?~ + caelar_no_bhaalchild_conclusion_02
++ ~Even if - I don't care. We'll see how it all plays out.~ + caelar_no_bhaalchild_conclusion_03
END

IF ~~ THEN caelar_no_bhaalchild_conclusion_01
SAY ~(Affirmative NPC reply to conclusion.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_CaelarNoBhaalChild","GLOBAL",2)
SetGlobal("C#SoD_CaelarNoBhaalChild","GLOBAL",1) //cross-mod variable: prevent other NPCs to come with the same conclusion.
SetGlobal("C#RtD_CaelarBhaalChild_SET","GLOBAL",2) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

IF ~~ THEN caelar_no_bhaalchild_conclusion_02
SAY ~(Summary of Conclusion that Caelar is no child of Bhaal or the portal would already be open / she wouldn't go for the PC.)~
++ ~I think you are right! This is an important finding.~ + caelar_no_bhaalchild_conclusion_01
++ ~Even if - I don't care. We'll see how it all plays out.~ + caelar_no_bhaalchild_conclusion_03
END

IF ~~ THEN caelar_no_bhaalchild_conclusion_03
SAY ~(NPC accepts PC's reply.[No variable will be set, knowledge will not be counted.])~
IF ~~ THEN DO ~SetGlobal("xxBiff_CaelarNoBhaalChild","GLOBAL",-1) 
SetGlobal("C#SoD_CaelarNoBhaalChild","GLOBAL",1) //cross-mod variable: prevent other NPCs to come with the same conclusion.
~ EXIT
END

/* 8.2 Reaction to the knowledge that Caelar is no Bhaalchild. */
IF ~Global("xxBiff_CaelarNoBhaalChild","GLOBAL",3)~ THEN caelar_no_bhaalchild
SAY ~(Reaction to the knowledge that Caelar is no Bhaalchild.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_CaelarNoBhaalChild","GLOBAL",4)~ EXIT
END

END //APPEND


/* 9. Reaction to betrayal at the portal */

/* IF ~~ THEN BEGIN 16 // from:
  SAY #38474 /* ~You'll find out soon enough, my puppet, once the devils begin their march into this world. Bleed, Bhaalspawn. Bleed for my master.~ [BD38474] */
  IF ~~ THEN EXTERN ~BDBENCE~ 62
  IF ~  IsValidForPartyDialogue("CORWIN")
~ THEN EXTERN ~BDCORWIJ~ 181
END
*/
I_C_T3 BDHEPHER 16 xxBiff_SoDPortalScene
/* 9.1. PC knew about PC's blood needed to open the portal BUT didn't suspect anything about Hephernaan's plans */
== xxBiffJ IF ~IsValidForPartyDialogue("xxBiff")
GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)
Global("C#RtD_HephernaanBetrayal","GLOBAL",0)
Global("C#RtD_HephernaanFiend","GLOBAL",0)~ THEN ~(PC knew about PC's blood needed to open the portal BUT didn't suspect anything about Hephernaan's plans).)~
/* 8.2 PC knew about Hephernaan's own plans before BUT didn't know about PC's blood needed to open the portal */
== xxBiffJ IF ~IsValidForPartyDialogue("xxBiff")
GlobalLT("C#RtD_KnowsPortalBlood","GLOBAL",3)
OR(2)
	GlobalGT("C#RtD_HephernaanBetrayal","GLOBAL",0)
	GlobalGT("C#RtD_HephernaanFiend","GLOBAL",0)~ THEN ~(PC knew about Hephernaan's own plans before BUT didn't know about PC's blood needed to open the portal).)~
/* 9.3 PC knew about PC's blood needed to open the portal AND about Hephernaan's own plans before */
== xxBiffJ IF ~IsValidForPartyDialogue("xxBiff")
GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)
OR(2)
	GlobalGT("C#RtD_HephernaanBetrayal","GLOBAL",0)
	GlobalGT("C#RtD_HephernaanFiend","GLOBAL",0)~ THEN ~(PC knew about PC's blood needed to open the portal AND about Hephernaan's own plans before).)~
/* 8.4 PC didn't suspect anything (didn't know about Hephernaan's plans AND didn't know about PC's blood needed to open the portal) */
== xxBiffJ IF ~IsValidForPartyDialogue("xxBiff")
GlobalLT("C#RtD_KnowsPortalBlood","GLOBAL",3)
Global("C#RtD_HephernaanBetrayal","GLOBAL",0)
Global("C#RtD_HephernaanFiend","GLOBAL",0)~ THEN ~(PC didn't suspect anything (didn't know about Hephernaan's plans AND didn't know about PC's blood needed to open the portal).)~
END

