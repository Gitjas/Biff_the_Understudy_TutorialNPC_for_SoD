/* NPC reactions to specific crucial knowledge about Caelar's plans */

/* This template is making use of the variable tracking system of the Road to Discovery mod.
In addition, some reactions are also triggered by game events if the Road to Discovery mod is not installed.
I made the following assumptions in case Road to Discovery is NOT installed:
-The PC knows who Hephernaan is after the parley with Caelar at Coastway Crossing (GlobalGT("bd_plot","global",169) ).
-The PC knows that Caelar wants to free souls from Avernus after the parley at Coastway Crossing (GlobalGT("bd_plot","global",169) ).
-The PC knows that Hephernaan is betraying Caelar if they watched the scry pool scene ( Global("xxBiff_HepherScryPool","GLOBAL",2) ) OR after the actual betrayal ( GlobalGT("bd_plot","global",484) ). I do not check for Hephernaan's mirror scene or what the ghost Daeros tells the group - tracking these kind of instances is why I wrote Road to Discovery.
-The only other source to know about Aun Argent being trapped in Avernus BEFORE meeting him is either a mod setting the Road to Discovery variable or the Stat Based Reactions component from Themed Tweaks. 
-The PC will know about Caelar being no Bhaalchild if Caelar told so explicitely at the parley at Coastway Crossing ( BhaalGlobalGT("bd_mdd018","global",0) ).
-The NPC can conclude that Caelar wants to open a portal to Avernus after the parley at Coastway Crossing AND if the group either found the treatise (bdbook11) OR watched Hephernaan in the scry pool scene.
-PC will know that Caelar is planning on opening a portal to Avernus after the parley at Dead Man's Pass.
-The NPC can conclude that Caelar needs the PC's blood if they found the treatise (bdbook11), know that Caelar is no Bhaalchild, and know that she is planning on opening a portal.

The trigger work in the following way:
-If Road to Discovery is installed (i.e. Global("C#RtD_RoadToDiscovery","GLOBAL",1) ), ONLY the variables of its tracking system should give true.
-If Road to Discovery is not installed (i.e. Global("C#RtD_RoadToDiscovery","GLOBAL",0) ), the ingame triggers listed above should be used OR the variables from RtD's tracking system if they were set by another mod.

This template has two kind of reactions: CONCLUSIONS and general REACTIONS.
-Conclusions are only for smart NPCs (WIS or INT greater than 15). Use this dialogue template only if you also activated the script blocks for it.

Script blocks are in "sod_important_reactions_scripts.baf". */

/* CONTENT */
/* 1. Hephernaan is working for a Fiend/the Umbral: knowledge gained BEFORE the portal scene at Dragonspear basement */
	/* 1.1 Conclusion that Hephernaan is working for a fiend: after seeing him at Coastway Crossing / knowing who Hephernaan is AND seeing the scry pool scene. */
	/* 1.2 General reaction to Hephernaan is betraying Caelar: knowledge gained BEFORE the portal scene at Dragonspear basement; PC does NOT know that he is working for a fiend yet. */
	/* 1.3 General reaction to the knowledge that Hephernaan is working for a fiend: knowledge gained BEFORE the portal scene at Dragonspear basement */

/* 2. Caelar's ulterior motive is to save her uncle Aun. */
	/* 2.1 Conclude that Caelar's ulterior motive is to save her uncle: After knowing that she is planning on freeing souls from Avernus AND knowing that Aun went to Avernus for her. */
	/* 2.2 General reaction to the knowledge that Caelar's only motive was to free her uncle BEFORE meeting Aun. */
	/* 2.3 General reaction to the knowledge that Caelar's only motive was to free her uncle AFTER meeting Aun. */

/* 3. Detection: Found treatise "bdbook11": learn about the dormant portal and that godly blood is needed to open it - no specific dialogue attached to this one. */

/* 4. Caelar is no child of Bhaal. */
	/* 4.1 Conclusion that Caelar is no child of Bhaal: after PC reasons / concludes / speculates that Caelar / Hephernaan want PC's blood for [open portal to Avernus] AND hearing rumors that she is a child of Bhaal (or the portal would already be open / she wouldn't go for the PC.) */
	/* 4.2 Reaction to the knowledge that Caelar is no Bhaalchild. */

/* 5. Caelar wants to open a portal to Avernus. */
	/* 5.1 Conclusion that Caelar wants to open a portal to Avernus: if PC knows that Caelar is planning on marching into Avernus AND Hephernaan is working for a fiend. */
	/* 5.2 Conclusion that Caelar wants to open a portal to Avernus: if PC knows that Caelar is planning on marching into Avernus AND that there is a dormant rift below Dragonspear Castle. */
	/* 5.3 Conclusion that Caelar wants to open a portal to Avernus: if PC knows that Caelar is planning on marching into Avernus AND that PC's blood is needed to open portal below Dragonspear Castle. */
	/* 5.4 General reaction: Caelar wants to open a portal to Avernus. (No reaction to needed blood, PC does not know yet.) BEFORE portal scene at Dragonspear Castle */

/* 6. Caelar wants the PC for something */
	/* 6.1 Conclusion that Caelar didn't want to kill the PC but only kidnap after hearing about weak poison. */
	/* 6.2 Reaction after learning that Caelar needs the PC / PC's blood for something but does NOT know any specifics (BEFORE portal scene) */

/* 7. Caelar needs the PC's blood to open the portal. */
	/* 7.1 Conclusion that Caelar needs the PC's blood to open the portal: if Caelar needs Bhaalblood AND PC knows that she is no Bhaalspawn herself. */
	/* 7.2 Conclusion that Caelar needs the PC's blood to open the portal: if Caelar needs Bhaalblood AND wanted to kidnap the PC. */
	/* 7.3 General reaction to the knowledge that Caelar needs the PC's blood to open the portal (BEFORE portal betrayal scene): NPC already reacted to Caelar's plans to open a portal. */
	/* 7.4 General reaction to the knowledge that Caelar needs the PC's blood to open the portal (BEFORE portal betrayal scene): NPC did NOT yet react to Caelar's plans to open a portal. */


/* 8. Reaction to betrayal at the portal */
/* 8.1. PC knew about PC's blood needed to open the portal BUT didn't suspect anything about Hephernaan's plans */
/* 8.2 PC knew about Hephernaan's own plans before BUT didn't know about PC's blood needed to open the portal */
/* 8.3 PC knew about PC's blood needed to open the portal AND about Hephernaan's own plans before */


/* 9. Incident at Boareskyr Bridge. */
	/* 9.1 Quick reaction line: will only show if The Boareskyr Bridge Scene mod is not installed / didn't run. Uses the same line! -> crossmod with TBBS is in the tp2. */
	/* 9.2 General dialogue after bridge incident. Will run after timer. (True also in case The Boareskyr Bridge Scene mod is installed and the above quick reaction line run.) This follow-up dialogue triggers after timer is run. */



/* 1. Hephernaan is working for a Fiend/the Umbral: knowledge gained BEFORE the portal scene at Dragonspear basement */
	
/* detect NPC's presence in scrying pool scene */
/* we add a variable for the NPC to the scrying pool / Hooded man scene */
ADD_TRANS_ACTION BDIRENI BEGIN 78 END BEGIN END ~IncrementGlobal("xxBiff_HepherScryPool","GLOBAL",1)~

APPEND xxBiffJ
/* 1.1 Conclusion that Hephernaan is working for a fiend: after seeing him at Coastway Crossing / knowing who Hephernaan is AND seeing the scry pool scene. */
/* Conclusions are only for smart NPCs. Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_HepherScryPool","GLOBAL",3)~ THEN hephernaan_scrying_pool
SAY ~(Conclusion that Hephernaan is working for a fiend: after seeing him at Coastway Crossing / knowing who Hephernaan is AND seeing the scry pool scene.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_HepherScryPool","GLOBAL",4)
SetGlobal("C#RtD_HephernaanFiend_SET","GLOBAL",2) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END


/* 1.2 General reaction to Hephernaan is betraying Caelar: knowledge gained BEFORE the portal scene at Dragonspear basement; PC does NOT know that he is working for a fiend yet. */
IF ~Global("xxBiff_HephernaanBetrayal","GLOBAL",1)~ THEN hephernaan_betraying_caelar
SAY ~(General reaction to Hephernaan is betraying Caelar: knowledge gained BEFORE the portal scene at Dragonspear basement; PC does NOT know that he is working for a fiend yet.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_HephernaanBetrayal","GLOBAL",2) SetGlobal("C#RtD_HephernaanBetrayal_SET","GLOBAL",2) SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

/* 1.3 General reaction to the knowledge that Hephernaan is working for a fiend: knowledge gained BEFORE the portal scene at Dragonspear basement */
IF ~Global("xxBiff_HephernaanFiend","GLOBAL",1)~ THEN hephernaan_working_for_fiend
SAY ~(General reaction to the knowledge that Hephernaan is working for a fiend: knowledge gained BEFORE the portal scene at Dragonspear basement.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_HephernaanFiend","GLOBAL",2)~ EXIT
END


/* 2. Caelar's ulterior motive is to save her uncle Aun. */

/* 2.1 Conclude that Caelar's ulterior motive is to save her uncle: After knowing that she is planning on freeing souls from Avernus and knowing that Aun went to Avernus for her. */
/* Conclusions are only for smart NPCs. Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_CaelarPlanAun","GLOBAL",1)~ THEN caelar_plan_aun
SAY ~(Conclude that Caelar's ulterior motive is to save her uncle: After knowing that she is planning on freeing souls from Avernus and knowing that Aun went to Avernus for her.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_CaelarPlanAun","GLOBAL",2)
SetGlobal("C#RtD_CaelarPlan_SET","GLOBAL",5) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

/* 2.2 General reaction to the knowledge that Caelar's only motive was to free her uncle BEFORE meeting Aun. */
IF ~Global("xxBiff_AllForAun","GLOBAL",1)
GlobalGT("bd_plot","global",564)~ THEN all_for_aun
SAY ~(General reaction to the knowledge that Caelar's only motive was to free her uncle BEFORE meeting Aun.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_AllForAun","GLOBAL",2)~ EXIT
END

/* 2.3 General reaction to the knowledge that Caelar's only motive was to free her uncle AFTER meeting Aun. */
IF ~Global("xxBiff_AllForAun","GLOBAL",1)
GlobalLT("bd_plot","global",485)~ THEN all_for_aun_2
SAY ~(General reaction to the knowledge that Caelar's only motive was to free her uncle AFTER meeting Aun.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_AllForAun","GLOBAL",2)~ EXIT
END


/* 4. Caelar is no child of Bhaal. */

/* 4.1 Conclusion that Caelar is no child of Bhaal: after PC reasons / concludes / speculates that Caelar / Hephernaan want PC's blood for [open portal to Avernus] AND hearing rumors that she is a child of Bhaal (or the portal would already be open / she wouldn't go for the PC.) */
/* Conclusions are only for smart NPCs. Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_CaelarNoBhaalChild","GLOBAL",1)~ THEN caelar_no_bhaalchild_conclusion_1
SAY ~(Conclusion that Caelar is no child of Bhaal: after knowing that she needs godly blood to open the portal and hearing rumors that she is a child of Bhaal (or the portal would already be open / she wouldn't go for the PC.))~
IF ~~ THEN DO ~SetGlobal("C#RtD_CaelarBhaalChild_SET","GLOBAL",2) 
SetGlobal("xxBiff_CaelarNoBhaalChild","GLOBAL",2)~ EXIT
END

/* 4.2 Reaction to the knowledge that Caelar is no Bhaalchild. */
IF ~Global("xxBiff_CaelarNoBhaalChild","GLOBAL",3)~ THEN caelar_no_bhaalchild
SAY ~(Reaction to the knowledge that Caelar is no Bhaalchild.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_CaelarNoBhaalChild","GLOBAL",4)
SetGlobal("C#RtD_CaelarBhaalChild_SET","GLOBAL",2) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END


/* 5. Caelar wants to open a portal to Avernus. */

/* 5.1 Conclusion that Caelar wants to open a portal to Avernus: if PC knows that Caelar is planning on marching into Avernus AND Hephernaan is working for a fiend. */
/* Conclusions are only for smart NPCs. Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_SoD_PortalConclusion","GLOBAL",1)~ THEN conclusion_portal_1
SAY ~(Conclusion that Caelar wants to open a portal to Avernus: if PC knows that Caelar is planning on marching into Avernus AND Hephernaan is working for a fiend.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoD_PortalConclusion","GLOBAL",4)
SetGlobal("C#RtD_CaelarPlan_SET","GLOBAL",4) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

/* 5.2 Conclusion that Caelar wants to open a portal to Avernus: if PC knows that Caelar is planning on marching into Avernus AND that there is a dormant rift below Dragonspear Castle. */
/* Conclusions are only for smart NPCs. Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_SoD_PortalConclusion","GLOBAL",2)~ THEN conclusion_portal_2
SAY ~(Conclusion that Caelar wants to open a portal to Avernus: if PC knows that Caelar is planning on marching into Avernus AND that there is a dormant rift below Dragonspear Castle.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoD_PortalConclusion","GLOBAL",4)
SetGlobal("C#RtD_CaelarPlan_SET","GLOBAL",4)
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

/* 5.3 Conclusion that Caelar wants to open a portal to Avernus: if PC knows that Caelar is planning on marching into Avernus AND that PC's blood is needed to open portal below Dragonspear Castle. */
/* Conclusions are only for smart NPCs. Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_SoD_PortalConclusion","GLOBAL",3)~ THEN conclusion_portal_3
SAY ~(Conclusion that Caelar wants to open a portal to Avernus: if PC knows that Caelar is planning on marching into Avernus AND that PC's blood is needed to open portal below Dragonspear Castle.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoD_PortalConclusion","GLOBAL",4)
SetGlobal("C#RtD_CaelarPlan_SET","GLOBAL",4) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END 


/* 5.4 General reaction: Caelar wants to open a portal to Avernus. (No reaction to needed blood, PC does not know yet.) BEFORE portal scene at Dragonspear Castle */
IF ~Global("xxBiff_PortalAvernus","GLOBAL",1)~ THEN knows_avernus_portal
SAY ~(General reaction: Caelar wants to open a portal to Avernus. (No reaction to needed blood, PC does not know yet.) BEFORE portal scene at Dragonspear Castle.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_PortalAvernus","GLOBAL",2)~ EXIT
END


/* 6. Caelar wants the PC for something */

/* 6.1 Conclusion that Caelar didn't want to kill the PC but only kidnap after hearing about weak poison. */
/* Conclusions are only for smart NPCs. Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_SoDKidnapConclusion","GLOBAL",1)~ THEN kidnap_conclusion
SAY ~(Conclusion: Caelar didn't want to kill the PC but only kidnap after hearing about weak poison.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoDKidnapConclusion","GLOBAL",2)
SetGlobal("C#RtD_CaelarKidnap_SET","GLOBAL",1) 
//SetGlobal("C#RtD_CaelarWantsPC_SET","GLOBAL",1) will be set by script in RtD
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

/* 6.2 Reaction after learning that Caelar needs the PC / PC's blood for something but does NOT know any specifics (BEFORE portal scene) */
IF ~Global("xxBiff_SoDCaelarWantsPC","GLOBAL",1)~ THEN caelar_wants_pc
SAY ~(Reaction after learning that Caelar needs the PC / PC's blood for something but does NOT know any specifics (BEFORE portal scene).)~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoDCaelarWantsPC","GLOBAL",2)~ EXIT
END

/* 7. Caelar needs the PC's blood to open the portal. */

/* 7.1 Conclusion that Caelar needs the PC's blood to open the portal: if Caelar needs Bhaalblood AND PC knows that she is no Bhaalspawn herself. */
/* Conclusions are only for smart NPCs. Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_PortalPCBloodConclusion","GLOBAL",1)~ THEN portal_needs_pc_blood_conclusion_1
SAY ~(Conclusion that Caelar needs the PC's blood to open the portal: if Caelar needs Bhaalblood AND PC knows that she is no Bhaalspawn herself.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_PortalPCBloodConclusion","GLOBAL",3)
SetGlobal("C#RtD_KnowsPortalBlood_SET","GLOBAL",3) 
//SetGlobal("C#RtD_WantBhaalBlood_SET","GLOBAL",2) will be set by script
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

/* 7.2 Conclusion that Caelar needs the PC's blood to open the portal: if Caelar needs Bhaalblood AND wanted to kidnap the PC. */
/* Conclusions are only for smart NPCs. Use this dialogue template only if you also activated the script blocks for it. */
IF ~Global("xxBiff_PortalPCBloodConclusion","GLOBAL",2)~ THEN portal_needs_pc_blood_conclusion_2
SAY ~(Conclusion that Caelar needs the PC's blood to open the portal: if Caelar needs Bhaalblood AND wanted to kidnap the PC.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_PortalPCBloodConclusion","GLOBAL",3)
SetGlobal("C#RtD_KnowsPortalBlood_SET","GLOBAL",3)
//SetGlobal("C#RtD_WantBhaalBlood_SET","GLOBAL",2) will be set by script
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END


/* 7.3 General reaction to the knowledge that Caelar needs the PC's blood to open the portal (BEFORE portal betrayal scene): NPC already reacted to Caelar's plans to open a portal. */
/* Knowledge is gained before Hephernaan's betrayal/going to Avernus */
IF ~Global("xxBiff_PortalPCBlood","GLOBAL",1)
Global("xxBiff_PortalAvernus","GLOBAL",2)~ THEN portal_needs_pc_blood
SAY ~(General reaction to the knowledge that Caelar needs the PC's blood to open the portal (BEFORE portal betrayal scene): NPC already reacted to Caelar's plans to open a portal.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_PortalPCBlood","GLOBAL",2)~ EXIT
END

/* 7.4 General reaction to the knowledge that Caelar needs the PC's blood to open the portal (BEFORE portal betrayal scene): NPC did NOT yet react to Caelar's plans to open a portal. */
/* Knowledge is gained before Hephernaan's betrayal/going to Avernus */
IF ~Global("xxBiff_PortalPCBlood","GLOBAL",1)
GlobalLT("xxBiff_PortalAvernus","GLOBAL",2)~ THEN portal_needs_pc_blood_2
SAY ~(General reaction to the knowledge that Caelar needs the PC's blood to open the portal (BEFORE portal betrayal scene): NPC did NOT yet react to Caelar's plans to open a portal.)~
IF ~~ THEN DO ~SetGlobal("xxBiff_PortalPCBlood","GLOBAL",2)
SetGlobal("xxBiff_PortalAvernus","GLOBAL",2)~ EXIT
END


/* 8. Reaction to betrayal at the portal */
/* 8.1. PC knew about PC's blood needed to open the portal BUT didn't suspect anything about Hephernaan's plans */
/* 8.2 PC knew about Hephernaan's own plans before BUT didn't know about PC's blood needed to open the portal */
/* 8.3 PC knew about PC's blood needed to open the portal AND about Hephernaan's own plans before */

/* 8. Reaction to betrayal at the portal */
/* 8.1. PC knew about PC's blood needed to open the portal BUT didn't suspect anything about Hephernaan's plans */
IF ~Global("xxBiff_SoDPortalScene","GLOBAL",1)
GlobalGT("xxBiff_PortalPCBlood","GLOBAL",0)
Global("xxBiff_HephernaanBetrayal","GLOBAL",0)
Global("xxBiff_HephernaanFiend","GLOBAL",0)~ THEN portal_betrayal_reaction_1
SAY ~(PC knew about PC's blood needed to open the portal BUT didn't suspect anything about Hephernaan's plans).)~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoDPortalScene","GLOBAL",2)~ EXIT
END
/* 8.2 PC knew about Hephernaan's own plans before BUT didn't know about PC's blood needed to open the portal */
IF ~Global("xxBiff_SoDPortalScene","GLOBAL",1)
Global("xxBiff_PortalPCBlood","GLOBAL",0)
OR(2)
	GlobalGT("xxBiff_HephernaanBetrayal","GLOBAL",0)
	GlobalGT("xxBiff_HephernaanFiend","GLOBAL",0)~ THEN portal_betrayal_reaction_2
SAY ~(PC knew about Hephernaan's own plans before BUT didn't know about PC's blood needed to open the portal).)~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoDPortalScene","GLOBAL",2)~ EXIT
END
/* 8.3 PC knew about PC's blood needed to open the portal AND about Hephernaan's own plans before */
IF ~Global("xxBiff_SoDPortalScene","GLOBAL",1)
GlobalGT("xxBiff_PortalPCBlood","GLOBAL",0)
OR(2)
	GlobalGT("xxBiff_HephernaanBetrayal","GLOBAL",0)
	GlobalGT("xxBiff_HephernaanFiend","GLOBAL",0)~ THEN portal_betrayal_reaction_3
SAY ~(PC knew about PC's blood needed to open the portal AND about Hephernaan's own plans before).)~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoDPortalScene","GLOBAL",2)~ EXIT
END


/* 9. Incident at Boareskyr Bridge. */

/* 9.1 Quick reaction line: will only show if The Boareskyr Bridge Scene mod is not installed / didn't run. Uses the same line! -> crossmod with TBBS is in the tp2. */
IF ~Global("xxBiff_SoDBoareskyrBridgeScene","GLOBAL",1)
Global("xxBiff_c#stff24_10","GLOBAL",0)~ THEN bhaal_bridge
SAY @100 /* ~Boom! Always impressive, this scull appearing around you.~ */
IF ~~ THEN DO ~SetGlobal("xxBiff_SoDBoareskyrBridgeScene","GLOBAL",2)~ EXIT
END

/* 9.2 General dialogue after bridge incident. Will run after timer. (True also in case The Boareskyr Bridge mod is installed and the above quick reaction line didn't run.) Tthis follow-up dialogue triggers after timer is run. */
IF ~Global("xxBiff_SoDBoareskyrBridgeScene","GLOBAL",3)
Global("xxBiff_c#stff24_10","GLOBAL",1)~ THEN bhaal_bridge_00
SAY ~What happened at the Boareskyr bridge will leave an impression on people, I can tell you that.~
IF ~~ THEN DO ~SetGlobal("xxBiff_SoDBoareskyrBridgeScene","GLOBAL",4)~ EXIT
END

END //APPEND