Scriptname bac_mcm extends SKI_ConfigBase

bac_utilities Property BACUtilities Auto
bac_config Property BACConfig Auto
bac_update Property BACUpdate Auto
bac_actor Property BACActor Auto
bac_main Property BACMain Auto
bac_quest_ctr Property questCtr Auto
bac_store Property BACStore Auto
bac_beingacow Property BACRQ Auto
bacBlacksmithQuest Property itemCtrl Auto

Quest Property bac_blacksmith Auto
Quest Property bac_whoiam Auto
Quest Property bac_unownedq Auto
Quest Property bac_huntersgonnahunt Auto
Quest Property bac_capturedcow Auto
Quest Property bac_capturedcow2 Auto
Quest Property bac_tears1 Auto
Quest Property bac_beingacowq Auto
Quest Property bac_afterstorm Auto

bac_tears_c Property BACTearsControll Auto
Scene Property bac_blacksmith_mainscene Auto

Actor Property face Auto

Actor Property bacHunterMaster Auto


bool needToClearTats

Event OnGameReload()
	parent.OnGameReload()
	Return
EndEvent

Event OnVersionUpdate(Int ver)
	OnConfigInit()
	Return
EndEvent

Int Function GetVersion()
  OnConfigInit()
  Return (BACMain.getVersion()*100) as int
EndFunction

Event OnConfigClose()

	int i = 0
	while i < BACActor.getArrayCount()
		if BACActor.npcs_ref[i]!=None
			BACActor.clearEffects(i)
			BACActor.removeAdditionalItems(i)
			;if needToClearTats == true
				;BACActor.removeTats(i,-1,"Brown")
				;BACActor.removeTats(i,-1,"White")
				;BACActor.removeTats(i,-1,"Spots")
				;BACActor.removeTats(i,-1,"Brown open")
				;BACActor.removeTats(i,-1,"White open")
				;BACActor.removeTats(i,-1,"Spots open")				
			;endif			
		endif
	i+=1
	endwhile

	if BACConfig.modEnabled == false
		
	else
		BACMain.reEnableMod()
		BACMain.onLocationChange()
		
	;	if bac_blacksmith.getStage()==20
	;		questCtr.setStageQ("blacksmith",21)
	;		questCtr.setStageQ("blacksmith",20)
	;	endif
		;bac_blacksmith.start()
	endif
	
	
	
	BACConfig.maintenance = false
	
EndEvent

Event OnConfigInit()
	needToClearTats = false
	tempo = new String[3]
	tempo[0] = "Fast"
	tempo[1] = "Normal"
	tempo[2] = "Slow"
	
	color = new String[3]
	color[0] = "Brown"
	color[1] = "White"
	color[2] = "Brown (Spots)"
	;color[3] = "Brown (Open)"
	;color[4] = "White (Open)"
	;color[5] = "Brown (Spots) (Open)"

	ModName = "Being a Cow"
	Pages = new String[6]
	;Pages = new String[4]
	Pages[0] = "About "	
	Pages[1] = "Settings "
	Pages[2] = "Mutations "
	Pages[3] = "Story "
	Pages[4] = "MilkMaids "
	Pages[5] = "Debug "
	
	;Pages[2] = "Utilities"	
	;Pages[3] = "Credits"	
	;Pages[4] = "Debug"
	
	BACConfig.maintenance = true

	generalEnabled = 0
	
	if BACConfig.modEnabled == true
		generalEnabled  = 1
	endif
	
	int id = BACActor.isRegistered(Game.getPlayer())
	if (id >= 0)
		BACConfig.PlayerSlot = id
	endif
	
	
	Return
EndEvent


Event OnPageReset(string page)
	OnConfigInit()
	SetCursorFillMode(TOP_TO_BOTTOM)
	
	;debug.notification("0:"+Game.getPlayer().GetActorBase().GetFacePreset(0))
	;debug.notification("0:"+Game.getPlayer().GetActorBase().GetFacePreset(2))
	;debug.notification("0:"+Game.getPlayer().GetActorBase().GetFacePreset(3))
  
	if (page == "About " || page == "")
		SetCursorPosition(0)
		SetTitleText("About, version: "+BACMain.getDisplayVersion())		
		AddHeaderOption("Mod status")	
		modEnabled = AddToggleOption("Mod enabled",BACConfig.modEnabled)			

		SetCursorPosition(1)

		AddHeaderOption("Detected mods:")
			static1 = AddToggleOption("SlaveTats founded:",BACConfig.slaveTatsPack,OPTION_FLAG_DISABLED)
			static1 = AddToggleOption("Milk Mod Economy founded:",BACConfig.milkModPack,OPTION_FLAG_DISABLED)
			static1 = AddToggleOption("SLIF founded:",BACConfig.slifPack,OPTION_FLAG_DISABLED)

		AddEmptyOption()	

		AddHeaderOption("Misc")	
			showConsoleOutput = AddToggleOption("Console output",BACConfig.showConsoleOutput,getEnableFlag(generalEnabled))			
			showTraceOutput   = AddToggleOption("Papyrus.log output",BACConfig.showTraceOutput,getEnableFlag(generalEnabled))		

			AddEmptyOption()	
			static1 = AddTextOption("Detected follower:",BACConfig.teammate.GetLeveledActorBase().GetName(),OPTION_FLAG_DISABLED)
		AddEmptyOption()	
		
		AddHeaderOption("Debug/help")	
		
		
		reenable = AddTextOption("BAC scene stuck? Try it.", "Click")
		restoreMarc  = AddTextOption("Restore Marc if stucked", "Click")
		
		

		
			;static1 = AddToggleOption("Soulgem Oven III founded:",BACConfig.soulGemPack,OPTION_FLAG_DISABLED)
				
	endIf
	
	if (page == "Settings ")
		SetTitleText("Milk Mod - Being a Cow - Settings")
		AddHeaderOption("General")
			;buildInLevelSystem	= AddToggleOption("Use buildIn MME milk monitor",BACConfig.buildInLevelSystem, getEnableFlag(generalEnabled))		
			transformationTempo  = AddMenuOption("Transformation speed", tempo[BACConfig.transformationTempo as int],getEnableFlag(generalEnabled * BACConfig.buildInLevelSystem as int ))
			hardcoreMode = AddToggleOption("Hardcore mode",BACConfig.hardcoreMode,getEnableFlag(generalEnabled))
		
		AddEmptyOption()              
		AddHeaderOption("Immersion")	
			painLevelEnabled = AddToggleOption("Pain support",BACConfig.painLevelEnabled, getEnableFlag(generalEnabled))	
			painLevel = AddSliderOption("Count of milk couse pain",BACConfig.painLevel,"{0}", getEnableFlag(generalEnabled * BACConfig.painLevelEnabled as int))	
		AddEmptyOption()
		
		AddHeaderOption("Effects")					
				allowTats = AddToggleOption("Allow Tats",BACConfig.allowTats, getEnableFlag(generalEnabled * BACConfig.slaveTatsPack as int))	
				addSounds = AddToggleOption("Allow Sounds effect",BACConfig.addSounds, getEnableFlag(generalEnabled ))	
				addFacialExp = AddToggleOption("Allow Facial effect",BACConfig.addFacialExp, getEnableFlag(generalEnabled ))	
				AddEmptyOption()
				allowTailSound = AddToggleOption("Tail sounds",BACConfig.allowTailSound, getEnableFlag(generalEnabled ))
				;bellVolume = AddSliderOption("Bell volume",BACConfig.bellVolume,"{0}", getEnableFlag(generalEnabled ))	
				;horseshoeVolume = AddSliderOption("Horseshoe volume",BACConfig.horseshoeVolume,"{0}", getEnableFlag(generalEnabled ))	
				AddEmptyOption()
				commentProb = AddSliderOption("Comments prob",BACConfig.commentProb,"{0}", getEnableFlag(generalEnabled ))	
		SetCursorPosition(1)	
		
				AddHeaderOption("Tats  ")
				allowToSpreadColours = AddToggleOption("Allow to cover whole body",BACConfig.allowToSpreadColours)
				tatsColor = AddMenuOption("Tats color", color[BACActor.npcs_color[BACActor.isRegistered(Game.getPlayer())]])
				
				AddHeaderOption("Body weights  ")
				allowToChangeBodyWeight = AddToggleOption("Allow to change body weight",BACConfig.allowToChangeBodyWeight)				
				supportDynamicWeight = AddToggleOption("Allow to dynamic body weight",BACConfig.supportDynamicWeight,getEnableFlag(BACConfig.allowToChangeBodyWeight as int))				
				allowToLegsDeformation = AddToggleOption("Allow to deform limbs",BACConfig.allowToLegsDeformation)				
				if BACConfig.slifPack == true
					bodyButt = AddSliderOption("Butt scale",BACConfig.bodyButt,"{1}")
					bodyBelly = AddSliderOption("Belly scale",BACConfig.bodyBelly,"{1}")
					slifExtraValue = AddToggleOption("Plus 1 to values",BACConfig.slifExtraValue)				
				endif
				AddEmptyOption()
				AddHeaderOption("Random attr. ")
				bellyMultFakePreg = AddSliderOption("Imaginary pregnancy mult",BACConfig.bellyMultFakePreg,"{1}", getEnableFlag(generalEnabled * BACConfig.slifPack as int))					
				solveDirt = AddToggleOption("Dirt cow enabled",BACConfig.solveDirt, getEnableFlag(generalEnabled ))				

				
			AddEmptyOption()
		
		;debug1 = AddSliderOption("d1",BACConfig.PlayerfatFactor1,"{2}")	
		;debug2 = AddSliderOption("d2",BACConfig.PlayerfatFactor2,"{2}")	
			
		
		AddHeaderOption("Items")
			solveUdders = AddToggleOption("Allow udders",BACConfig.solveUdders, getEnableFlag(generalEnabled))
			solveHands = AddToggleOption("Allow hand hooves",BACConfig.solveHands, getEnableFlag(generalEnabled))
	AddEmptyOption()
		AddHeaderOption("Other")
				questPause = AddSliderOption("Quest freq. in days",BACConfig.questPause,"{0}", getEnableFlag(generalEnabled))				
		hpTriggerHit = AddSliderOption("Over % HP to be defeat",BACConfig.hpTriggerHit,"{0}", getEnableFlag(generalEnabled ))	
	
	EndIf
	
	if (page == "Story ")
		String status = "No data "
		AddHeaderOption("Quest status:")
			
			status = "No data "
			if bac_blacksmith.IsStarting()
				status = "Starting ["+bac_blacksmith.getStage()+"]"				
			endif
			if bac_blacksmith.IsRunning()
				status = "Running ["+bac_blacksmith.getStage()+"]"				
			endif			
			if bac_blacksmith.IsStopping()
				status = "Stopping ["+bac_blacksmith.getStage()+"]"				
			endif						
			if bac_blacksmith.IsStopped()
				status = "Stopped ["+bac_blacksmith.getStage()+"]"			
			endif			
			if bac_blacksmith.IsCompleted()
				status = "Completed ["+bac_blacksmith.getStage()+"]"			
			endif			
			
			static1 =  AddTextOption("Blacksmith quest", status, OPTION_FLAG_DISABLED)
			
			status = "No data "
			if bac_whoiam.IsStarting()
				status = "Starting ["+bac_whoiam.getStage()+"]"				
			endif
			if bac_whoiam.IsRunning()
				status = "Running ["+bac_whoiam.getStage()+"]"				
			endif			
			if bac_whoiam.IsStopping()
				status = "Stopping ["+bac_whoiam.getStage()+"]"				
			endif						
			if bac_whoiam.IsStopped()
				status = "Stopped ["+bac_whoiam.getStage()+"]"			
			endif			
			if bac_whoiam.IsCompleted()
				status = "Completed ["+bac_whoiam.getStage()+"]"			
			endif						
			static2 =  AddTextOption("Who I Am quest", status, OPTION_FLAG_DISABLED)
			
			status = "No data "
			if bac_unownedq.IsStarting()
				status = "Starting ["+bac_unownedq.getStage()+"]"				
			endif
			if bac_unownedq.IsRunning()
				status = "Running ["+bac_unownedq.getStage()+"]"				
			endif			
			if bac_unownedq.IsStopping()
				status = "Stopping ["+bac_unownedq.getStage()+"]"				
			endif						
			if bac_unownedq.IsStopped()
				status = "Stopped ["+bac_unownedq.getStage()+"]"			
			endif			
			if bac_unownedq.IsCompleted()
				status = "Completed ["+bac_unownedq.getStage()+"]"			
			endif						
			static1 =  AddTextOption("Unowned quest", status, OPTION_FLAG_DISABLED)
			
			status = "No data "
			if bac_huntersgonnahunt.IsStarting()
				status = "Starting ["+bac_huntersgonnahunt.getStage()+"]"				
			endif
			if bac_huntersgonnahunt.IsRunning()
				status = "Running ["+bac_huntersgonnahunt.getStage()+"]"				
			endif			
			if bac_huntersgonnahunt.IsStopping()
				status = "Stopping ["+bac_huntersgonnahunt.getStage()+"]"				
			endif						
			if bac_huntersgonnahunt.IsStopped()
				status = "Stopped ["+bac_huntersgonnahunt.getStage()+"]"			
			endif			
			if bac_huntersgonnahunt.IsCompleted()
				status = "Completed ["+bac_huntersgonnahunt.getStage()+"]"			
			endif						
			static2 =  AddTextOption("Hunters gona hunt", status, OPTION_FLAG_DISABLED)
			
			status = "No data "
			if bac_capturedcow.IsStarting()
				status = "Starting ["+bac_capturedcow.getStage()+"]"				
			endif
			if bac_capturedcow.IsRunning()
				status = "Running ["+bac_capturedcow.getStage()+"]"				
			endif			
			if bac_capturedcow.IsStopping()
				status = "Stopping ["+bac_capturedcow.getStage()+"]"				
			endif						
			if bac_capturedcow.IsStopped()
				status = "Stopped ["+bac_capturedcow.getStage()+"]"			
			endif			
			if bac_capturedcow.IsCompleted()
				status = "Completed ["+bac_capturedcow.getStage()+"]"			
			endif						
			static1 =  AddTextOption("Enslaved cow quest", status, OPTION_FLAG_DISABLED)			
			
			status = "No data "
			if bac_tears1.IsStarting()
				status = "Starting ["+bac_tears1.getStage()+"]"				
			endif
			if bac_tears1.IsRunning()
				status = "Running ["+bac_tears1.getStage()+"]"				
			endif			
			if bac_tears1.IsStopping()
				status = "Stopping ["+bac_tears1.getStage()+"]"				
			endif						
			if bac_tears1.IsStopped()
				status = "Stopped ["+bac_tears1.getStage()+"]"			
			endif			
			if bac_tears1.IsCompleted()
				status = "Completed ["+bac_tears1.getStage()+"]"			
			endif						
			static1 =  AddTextOption("Cows tears quest", status, OPTION_FLAG_DISABLED)		
			
			status = "No data "
			if bac_capturedcow2.IsStarting()
				status = "Starting ["+bac_capturedcow2.getStage()+"]"				
			endif
			if bac_capturedcow2.IsRunning()
				status = "Running ["+bac_capturedcow2.getStage()+"]"				
			endif			
			if bac_capturedcow2.IsStopping()
				status = "Stopping ["+bac_capturedcow2.getStage()+"]"				
			endif						
			if bac_capturedcow2.IsStopped()
				status = "Stopped ["+bac_capturedcow2.getStage()+"]"			
			endif			
			if bac_capturedcow2.IsCompleted()
				status = "Completed ["+bac_capturedcow2.getStage()+"]"			
			endif						
			static1 =  AddTextOption("Enslaved cow quest2", status, OPTION_FLAG_DISABLED)			
			
	endIf
	
	if (page == "MilkMaids ")
	SetCursorPosition(0)
		AddHeaderOption("MilkMaids full transformation progress")	
		int i = 0
		while i < BACActor.getArrayCount()
			if BACActor.npcs_ref[i] != none								
				static1 = AddTextOption(BACActor.npcs_ref[i].GetLeveledActorBase().GetName()+":",BACActor.npcs_phase[i]*100/BACMain.setMaxPhase()+"%" ,OPTION_FLAG_DISABLED)
			endif
			
			i+=1
		endWhile
		SetCursorPosition(1)	
		AddHeaderOption("Player attributes")
		
		if BACConfig.supportDynamicWeight == true
		static1 =  AddTextOption("Weight bonus", BACActor.npcs_weightMod[BACActor.isRegistered(Game.getPlayer())], OPTION_FLAG_DISABLED)
		endif
		
		AddEmptyOption()		
		static1 = AddToggleOption("Wet cow ",BACActor.npcs_wetCow[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		static1 = AddToggleOption("  Horny cow ",BACActor.npcs_hornyCow[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		static1 = AddToggleOption("  Imaginary pregnancy ",BACActor.npcs_pregCow[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		static1 = AddToggleOption("    Belly stretch",BACActor.npcs_pregStratches[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		AddEmptyOption()
		static1 = AddToggleOption("Short body ",BACActor.npcs_shortBody[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)	
		static1 = AddToggleOption("Tall body ",BACActor.npcs_tallBody[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)	
		AddEmptyOption()
		static1 = AddToggleOption("Big udders ",BACActor.npcs_bigUdders[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)	
		AddEmptyOption()		
		static1 = AddToggleOption("Dirty cow ",BACActor.npcs_dirtCow[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)	
		AddEmptyOption()		
		static1 = AddToggleOption("Cellulite skin cow ",BACActor.npcs_celluliteCow[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		static1 = AddToggleOption("  Ass stretch",BACActor.npcs_assStratches[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		static1 = AddToggleOption("  Cellulite skin cow (2)",BACActor.npcs_celluliteCow2[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		
		AddEmptyOption()		
		static1 = AddToggleOption("Veins ",BACActor.npcs_veinsCow1[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		static1 = AddToggleOption("Veins (2) ",BACActor.npcs_veinsCow2[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		AddEmptyOption()		
		static1 = AddToggleOption("Untamed Milk ",BACActor.npcs_untamedMilk[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		static1 = AddToggleOption("  Breast stretch ",BACActor.npcs_breastStratches[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		static1 = AddToggleOption("Uneve﻿n breast ",BACActor.npcs_cowAsBreasts[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		static1 = AddToggleOption("Uneve﻿n breast (2) ",BACActor.npcs_cowAsBreasts2[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		AddEmptyOption()		
		static1 = AddToggleOption("Naked ass ",BACActor.npcs_openassfurCow[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)	
		AddEmptyOption()		
		static1 = AddToggleOption("Fat cow ",BACActor.npcs_fatCow[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)		
		static1 = AddToggleOption(" Fat cow (2)",BACActor.npcs_fatCow2[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)				
		AddEmptyOption()
		static1 = AddToggleOption("Slim cow ",BACActor.npcs_slimCow[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)		
		static1 = AddToggleOption(" Slim cow (2)",BACActor.npcs_slimCow2[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)		
		AddEmptyOption()
		static1 = AddToggleOption(" Slim arms",BACActor.npcs_lymphedema[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)		
		AddEmptyOption()		
		static1 = AddToggleOption("Curvy cow ",BACActor.npcs_curvyCow[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)	
		AddEmptyOption()		
		static1 = AddToggleOption("Cow's face (nose) ",BACActor.npcs_faceCow[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)		
		static1 = AddToggleOption(" Cow's face (mouth) ",BACActor.npcs_faceCow2[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)		
		static1 = AddToggleOption(" Cow's face (eyes)",BACActor.npcs_faceCow3[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		AddEmptyOption()		
		static1 = AddToggleOption(" Cow's nose (fur)",BACActor.npcs_cowNose[BACActor.isRegistered(Game.getPlayer())],OPTION_FLAG_DISABLED)
		AddEmptyOption()
		AddHeaderOption("Regular items")
		allowHornsAndEars = AddToggleOption("Horns & Ears",BACConfig.allowHornsAndEars, getEnableFlag(generalEnabled ))
		allowHooves = AddToggleOption("Hooves (feet)",BACConfig.allowHooves, getEnableFlag(generalEnabled ))
		allowHandHooves = AddToggleOption("Hooves (hands)",BACConfig.allowHooves, getEnableFlag(generalEnabled ))		
		allowTails = 	  AddToggleOption("Tails",BACConfig.allowTails, getEnableFlag(generalEnabled ))
		allowPhaseTats = 	  AddToggleOption("Fur",BACConfig.allowPhaseTats, getEnableFlag(generalEnabled ))
	endif
	
	if (page == "Debug ")
		SetCursorPosition(0)
		static1 =  AddTextOption("OWNER MOD",  BACRQ.getMood()+" : " +BACRQ.getMoodString( BACRQ.getMood()), OPTION_FLAG_DISABLED)
		AddHeaderOption("Rad Quest")
		debug_bacrq_reducetime = AddToggleOption("Reduce waiting time "+BACRQ.wait,false)
		debug_bacrq_reducetime1 = AddToggleOption("0 waiting time:"+BACRQ.wait,false)
		debug_run_quest_addRank = AddToggleOption(" + ",false)
		debug_run_quest_decRank = AddToggleOption(" - ",false)
		debug_run_quest = AddToggleOption("RUN QUEST",false)
		debug_run_quest1 = AddToggleOption("RUN QUEST 2",false)
		debug_run_quest2 = AddToggleOption("RUN QUEST MECH",false)
		
		debug_reset = AddToggleOption("RESET PROGRESS!",false)
		
		skip_story  = AddToggleOption("SKIP STORY!",false)
		skip_story_tats  = AddToggleOption("SKIP STORY (tats)!",false)
		skip_story_items  = AddToggleOption("SKIP STORY (items)!",false)
		;AddHeaderOption("Set phase")
		;debug_max_phase = AddToggleOption("Max Phase instant! ",false)
		;debug_find_newattr = AddToggleOption("Get new attr ",false)
		
		;debug1 = AddSliderOption("d1",BACConfig.PlayerfatFactor1,"{2}")	
		;debug2 = AddSliderOption("d2",BACConfig.PlayerfatFactor2,"{2}")
		
	
	endIf
	
	
	if (page == "Mutations ")
	AddEmptyOption()		
		enabled_npcs_wetCow = AddToggleOption("Wet cow ", BACConfig.enabled_npcs_wetCow, getEnableFlagBool(!BACActor.npcs_wetCow[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_hornyCow = AddToggleOption(" Horny cow ", BACConfig.enabled_npcs_hornyCow, getEnableFlagBool(!BACActor.npcs_hornyCow[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_pregCow = AddToggleOption(" Imaginary pregnancy ", BACConfig.enabled_npcs_pregCow, getEnableFlagBool(!BACActor.npcs_pregCow[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_pregStratches = AddToggleOption("   Belly stretches ", BACConfig.enabled_npcs_pregStratches, getEnableFlagBool(!BACActor.npcs_pregStratches[BACActor.isRegistered(Game.getPlayer())]))
	AddEmptyOption()
		enabled_npcs_tallBody = AddToggleOption("Tall body", BACConfig.enabled_npcs_tallBody, getEnableFlagBool(!BACActor.npcs_tallBody[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_shortBody = AddToggleOption("Short body", BACConfig.enabled_npcs_shortBody, getEnableFlagBool(!BACActor.npcs_shortBody[BACActor.isRegistered(Game.getPlayer())]))
	AddEmptyOption()
		enabled_npcs_bigUdders = AddToggleOption("Big udders  ", BACConfig.enabled_npcs_bigUdders, getEnableFlagBool(!BACActor.npcs_bigUdders[BACActor.isRegistered(Game.getPlayer())]))
		AddEmptyOption()
		enabled_npcs_dirtCow = AddToggleOption("Dirty cow ", BACConfig.enabled_npcs_dirtCow, getEnableFlagBool(!BACActor.npcs_dirtCow[BACActor.isRegistered(Game.getPlayer())]))
		AddEmptyOption()
		enabled_npcs_celluliteCow = AddToggleOption("Cellulite skin cow ", BACConfig.enabled_npcs_celluliteCow, getEnableFlagBool(!BACActor.npcs_celluliteCow[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_assStratches = AddToggleOption("  Ass stretches", BACConfig.enabled_npcs_assStratches, getEnableFlagBool(!BACActor.npcs_assStratches[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_celluliteCow2 = AddToggleOption("  Cellulite skin cow (2)", BACConfig.enabled_npcs_celluliteCow2, getEnableFlagBool(!BACActor.npcs_celluliteCow2[BACActor.isRegistered(Game.getPlayer())]))
		
		AddEmptyOption()		
		enabled_npcs_veinsCow = AddToggleOption("Veins ", BACConfig.enabled_npcs_veinsCow, getEnableFlagBool(!BACActor.npcs_veinsCow1[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_veinsCow2 = AddToggleOption(" Veins (2)", BACConfig.enabled_npcs_veinsCow2, getEnableFlagBool(!BACActor.npcs_veinsCow2[BACActor.isRegistered(Game.getPlayer())]))
		AddEmptyOption()		
		enabled_npcs_untamedMilk = AddToggleOption("Untamed Milk ", BACConfig.enabled_npcs_untamedMilk, getEnableFlagBool(!BACActor.npcs_untamedMilk[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_breastStratches = AddToggleOption("Breast stretches", BACConfig.enabled_npcs_breastStratches, getEnableFlagBool(!BACActor.npcs_breastStratches[BACActor.isRegistered(Game.getPlayer())]))
		AddEmptyOption()		
		enabled_npcs_cowAsBreasts = AddToggleOption("Uneven breast", BACConfig.enabled_npcs_cowAsBreasts, getEnableFlagBool(!BACActor.npcs_cowAsBreasts[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_cowAsBreasts2 = AddToggleOption("Uneven breast (2)", BACConfig.enabled_npcs_cowAsBreasts2, getEnableFlagBool(!BACActor.npcs_cowAsBreasts2[BACActor.isRegistered(Game.getPlayer())]))
		
		AddEmptyOption()		
		enabled_npcs_openassfurCow = AddToggleOption("Naked ass ", BACConfig.enabled_npcs_openassfurCow, getEnableFlagBool(!BACActor.npcs_openassfurCow[BACActor.isRegistered(Game.getPlayer())]))
		
		SetCursorPosition(1)
		
		enabled_npcs_fatCow = AddToggleOption("Fat cow ", BACConfig.enabled_npcs_fatCow, getEnableFlagBool(!BACActor.npcs_fatCow[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_fatCow2 = AddToggleOption(" Fat cow (2)", BACConfig.enabled_npcs_fatCow2, getEnableFlagBool(!BACActor.npcs_fatCow2[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_lymphedema = AddToggleOption(" Short arms", BACConfig.enabled_npcs_lymphedema, getEnableFlagBool(!BACActor.npcs_lymphedema[BACActor.isRegistered(Game.getPlayer())]))
		AddEmptyOption()	
		enabled_npcs_slimCow = AddToggleOption("Slim cow ", BACConfig.enabled_npcs_slimCow, getEnableFlagBool(!BACActor.npcs_slimCow[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_slimCow2 = AddToggleOption(" Slim cow (2)", BACConfig.enabled_npcs_slimCow2, getEnableFlagBool(!BACActor.npcs_slimCow2[BACActor.isRegistered(Game.getPlayer())]))
		
		AddEmptyOption()	
		
		enabled_npcs_fastMetabolism = AddToggleOption("Fast Metabolism ", BACConfig.enabled_npcs_fastMetabolism, getEnableFlagBool(!BACActor.npcs_fastMetabolism[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_slowMetabolism = AddToggleOption("Slow Metabolism ", BACConfig.enabled_npcs_slowMetabolism, getEnableFlagBool(!BACActor.npcs_slowMetabolism[BACActor.isRegistered(Game.getPlayer())]))
		
		AddEmptyOption()	
		
		
		enabled_npcs_curvyCow = AddToggleOption("Curvy cow ", BACConfig.enabled_npcs_curvyCow, getEnableFlagBool(!BACActor.npcs_curvyCow[BACActor.isRegistered(Game.getPlayer())]))
		AddEmptyOption()
		enabled_npcs_faceCow = AddToggleOption("Cow's face (nose) ", BACConfig.enabled_npcs_faceCow, getEnableFlagBool(!BACActor.npcs_faceCow[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_faceCow2 = AddToggleOption(" Cow's face (mouth) ", BACConfig.enabled_npcs_faceCow2, getEnableFlagBool(!BACActor.npcs_faceCow2[BACActor.isRegistered(Game.getPlayer())]))
		enabled_npcs_faceCow3 = AddToggleOption(" Cow's face (eyes) ", BACConfig.enabled_npcs_faceCow3, getEnableFlagBool(!BACActor.npcs_faceCow3[BACActor.isRegistered(Game.getPlayer())]))
		AddEmptyOption()
		enabled_npcs_cowNose = AddToggleOption("Cow's nose (fur)", BACConfig.enabled_npcs_cowNose, getEnableFlagBool(!BACActor.npcs_cowNose[BACActor.isRegistered(Game.getPlayer())]))
		
		
	endif
EndEvent



Event OnOptionSelect(Int Menu)


	if Menu == reenable
		debug.trace("BAC REEnable scene")
		if bacHunterMaster.IsDisabled() == false
			debug.trace("BAC REEnable scene IN")
			game.enablePlayerControls()
			bacHunterMaster.disable()
			bacHunterMaster.enable()
		
			game.disablePlayerControls()
			game.setplayeraidriven(true)
			debug.trace("BAC REEnable scene OUT")
		endif
	endif	

	if Menu == restoreMarc
		Actor cat = BACTearsControll.obt_cat as Actor
		cat.enable()
		cat.resurrect()
		cat.moveTo(Game.GetPlayer());
		BACTearsControll.reloadTearsAlias()
	endif	
	
	if Menu == allowHornsAndEars
		if  BACConfig.allowHornsAndEars == true
			BACConfig.allowHornsAndEars = false			
		else			
			BACConfig.allowHornsAndEars = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.allowHornsAndEars)		
	endIf		
	if Menu == allowTails
		if  BACConfig.allowTails == true
			BACConfig.allowTails = false			
		else			
			BACConfig.allowTails = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.allowTails)		
	endIf		
	if Menu == allowPhaseTats
		if  BACConfig.allowPhaseTats == true
			BACConfig.allowPhaseTats = false			
		else			
			BACConfig.allowPhaseTats = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.allowPhaseTats)		
	endIf	
		if Menu == allowHooves
		if  BACConfig.allowHooves == true
			BACConfig.allowHooves = false			
		else			
			BACConfig.allowHooves = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.allowHooves)		
	endIf			
	if Menu == allowHandHooves
		if  BACConfig.allowHandHooves == true
			BACConfig.allowHandHooves = false			
		else			
			BACConfig.allowHandHooves = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.allowHandHooves)		
	endIf	
	
	if Menu == modEnabled
		if  BACConfig.modEnabled == true
			BACConfig.modEnabled = false			
		else			
			BACConfig.modEnabled = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.modEnabled)	
		needToClearTats = true
		ForcePageReset()		
	endIf	
	if Menu == allowToSpreadColours
		if  BACConfig.allowToSpreadColours == true
			BACConfig.allowToSpreadColours = false			
		else			
			BACConfig.allowToSpreadColours = true			
		endIf
		needToClearTats = true
		SetToggleOptionValue(Menu,  BACConfig.allowToSpreadColours)		
	endIf	
	if Menu == slifExtraValue
		if  BACConfig.slifExtraValue == true
			BACConfig.slifExtraValue = false			
		else			
			BACConfig.slifExtraValue = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.slifExtraValue)		
	endIf		
	if Menu == allowToChangeBodyWeight
		if  BACConfig.allowToChangeBodyWeight == true
			BACConfig.allowToChangeBodyWeight = false			
		else			
			BACConfig.allowToChangeBodyWeight = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.allowToChangeBodyWeight)		
	endIf		
	if Menu == supportDynamicWeight
		if  BACConfig.supportDynamicWeight == true
			BACConfig.supportDynamicWeight = false			
		else			
			BACConfig.supportDynamicWeight = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.supportDynamicWeight)		
	endIf		
	if Menu == allowToLegsDeformation
		if  BACConfig.allowToLegsDeformation == true
			BACConfig.allowToLegsDeformation = false			
		else			
			BACConfig.allowToLegsDeformation = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.allowToLegsDeformation)		
	endIf		
	if Menu == showConsoleOutput
		if  BACConfig.showConsoleOutput == true
			BACConfig.showConsoleOutput = false			
		else			
			BACConfig.showConsoleOutput = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.showConsoleOutput)		
	endIf	
	if Menu == showTraceOutput
		if  BACConfig.showTraceOutput == true
			BACConfig.showTraceOutput = false			
		else			
			BACConfig.showTraceOutput = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.showTraceOutput)		
	endIf		
	if Menu == allowTats
		if  BACConfig.allowTats == true
			BACConfig.allowTats = false			
		else			
			BACConfig.allowTats = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.allowTats)		
	endIf		
	if Menu == solveUdders
		if  BACConfig.solveUdders == true
			BACConfig.solveUdders = false			
		else			
			BACConfig.solveUdders = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.solveUdders)		
	endIf		
	if Menu == solveHands
		if  BACConfig.solveHands == true
			BACConfig.solveHands = false			
		else			
			BACConfig.solveHands = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.solveHands)		
	endIf		
	if Menu == addSounds
		if  BACConfig.addSounds == true
			BACConfig.addSounds = false			
		else			
			BACConfig.addSounds = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.addSounds)		
	endIf		
	if Menu == painLevelEnabled
		if  BACConfig.painLevelEnabled == true
			BACConfig.painLevelEnabled = false			
		else			
			BACConfig.painLevelEnabled = true			
		endIf
		ForcePageReset()
		SetToggleOptionValue(Menu,  BACConfig.painLevelEnabled)		
	endIf	
	if Menu == addFacialExp
		if  BACConfig.addFacialExp == true
			BACConfig.addFacialExp = false			
		else			
			BACConfig.addFacialExp = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.addFacialExp)		
	endIf	
	if Menu == allowTailSound
		if  BACConfig.allowTailSound == true
			BACConfig.allowTailSound = false			
		else			
			BACConfig.allowTailSound = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.allowTailSound)		
	endIf		
	if Menu == hardcoreMode
		if  BACConfig.hardcoreMode == true
			BACConfig.hardcoreMode = false			
		else			
			BACConfig.hardcoreMode = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.hardcoreMode)		
	endIf		
	if Menu == solveDirt
		if  BACConfig.solveDirt == true
			BACConfig.solveDirt = false			
		else			
			BACConfig.solveDirt = true			
		endIf
		SetToggleOptionValue(Menu,  BACConfig.solveDirt)		
	endIf		
	;if Menu == buildInLevelSystem
	;	if  BACConfig.buildInLevelSystem == true
	;		BACConfig.buildInLevelSystem = false				
	;	else			
	;		BACConfig.buildInLevelSystem = true			
	;	endIf
	;	SetToggleOptionValue(Menu,  BACConfig.buildInLevelSystem)
	;	ForcePageReset()				
	;endIf		
	
	;DEBUG
	if Menu == debug_max_phase
		BACActor.npcs_phase[BACActor.isRegistered(Game.getPlayer())]=BACMain.setMaxPhase()
		BACMain.addTransformations(BACActor.isRegistered(Game.getPlayer()))
	endIf		
	
	if Menu == debug_bacrq_reducetime
		BACRQ.wait = BACRQ.wait - 12
		ForcePageReset()
	endIf	
	if Menu == debug_bacrq_reducetime1
		BACRQ.wait = 0
		ForcePageReset()
	endIf		
	if Menu == debug_run_quest_addRank
		BACRQ.Type = BACRQ.Type + 1
		ForcePageReset()
	endIf		
	if Menu == debug_run_quest_decRank
		BACRQ.Type = BACRQ.Type - 1
		ForcePageReset()
	endIf		
	
	if Menu == debug_run_quest
		BACRQ.wait = 0
		BACRQ.failQuest()
		BACRQ.runningQuest = None
		BACRQ.runQuest(BACRQ.BadQ[2])
		ForcePageReset()
	endIf		
	if Menu == debug_run_quest1
		BACRQ.wait = 0
		BACRQ.failQuest()
		BACRQ.runningQuest = None
		BACRQ.runQuest(BACRQ.GoodQ[3])
		ForcePageReset()
	endIf		
	if Menu == debug_run_quest2
		BACRQ.sendMech()
		ForcePageReset()
	endIf
	if Menu ==debug_reset
		BACActor.resetPlayerMutProgress()
		ForcePageReset()
	endif

	if Menu == skip_story_items
		itemCtrl.applyChanges(false,BACStore.bac_cowbell,"bell",1)
		itemCtrl.applyChanges(true,BACStore.bac_cowbellbig,"bell",1)
		itemCtrl.applyChanges(false,BACStore.bac_nosering01,"nose",1)
		itemCtrl.applyChanges(true,BACStore.bac_nosering03,"nose",1)
	endif
	
	if Menu == skip_story_tats
		Game.getPlayer().addToFaction(BACActor.bac_mark)
		Game.getPlayer().setFactionRank(BACActor.bac_mark,3)
		itemCtrl.applyChanges(true,none,"tat3",3)
		itemCtrl.applyChanges(true,none,"tat2",3)
	endif
	
	if Menu == skip_story

;itemCtrl.applyChanges(true,none,"tat2",1)
		
		bac_afterstorm.setStage(90)
		bac_capturedcow2.setStage(100)
		bac_beingacowq.start()
		bac_beingacowq.setStage(10)
		ForcePageReset()
	endIf		
	
	if Menu == debug_find_newattr
		BACActor.randomAttribute(BACActor.isRegistered(Game.getPlayer()))
		BACMain.addTransformations(BACActor.isRegistered(Game.getPlayer()))
	endIf		
	
	
	if Menu == enabled_npcs_wetCow
		if allowToTurnOffMut(4)==false && BACConfig.enabled_npcs_wetCow == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_wetCow = !BACConfig.enabled_npcs_wetCow
		BACConfig.enabled_npcs_hornyCow = BACConfig.enabled_npcs_wetCow
		BACConfig.enabled_npcs_pregCow = BACConfig.enabled_npcs_wetCow
		BACConfig.enabled_npcs_pregStratches = BACConfig.enabled_npcs_wetCow
		
		;SetToggleOptionValue(enabled_npcs_wetCow,  BACConfig.enabled_npcs_wetCow)		
		;SetToggleOptionValue(enabled_npcs_hornyCow,  BACConfig.enabled_npcs_hornyCow)		
		;SetToggleOptionValue(enabled_npcs_pregCow,  BACConfig.enabled_npcs_pregCow)		
		ForcePageReset()
	endIf
	
	if Menu == enabled_npcs_hornyCow	
		if BACConfig.enabled_npcs_wetCow == false
			BACConfig.enabled_npcs_hornyCow = false
			return
		endif	
		if allowToTurnOffMut(3)==false && BACConfig.enabled_npcs_hornyCow == true
		debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_hornyCow = !BACConfig.enabled_npcs_hornyCow
		BACConfig.enabled_npcs_pregCow = BACConfig.enabled_npcs_hornyCow
		BACConfig.enabled_npcs_pregStratches = BACConfig.enabled_npcs_hornyCow
		;SetToggleOptionValue(enabled_npcs_hornyCow,  BACConfig.enabled_npcs_hornyCow)		
		;SetToggleOptionValue(enabled_npcs_pregCow,  BACConfig.enabled_npcs_pregCow)		
		ForcePageReset()
	endIf	
	if Menu == enabled_npcs_pregCow	
		if BACConfig.enabled_npcs_hornyCow == false
			BACConfig.enabled_npcs_pregCow = false
			return
		endif
		if allowToTurnOffMut(2)==false  && BACConfig.enabled_npcs_pregCow == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			
			return
		endif
		BACConfig.enabled_npcs_pregCow = !BACConfig.enabled_npcs_pregCow
		BACConfig.enabled_npcs_pregStratches = BACConfig.enabled_npcs_pregCow
		;SetToggleOptionValue(enabled_npcs_pregCow,  BACConfig.enabled_npcs_pregCow)		
		ForcePageReset()
	endIf
	if Menu == enabled_npcs_pregStratches
		if BACConfig.enabled_npcs_pregCow == false
			BACConfig.enabled_npcs_pregStratches = false
			return
		endif
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_pregStratches == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			
			return
		endif
		BACConfig.enabled_npcs_pregStratches = !BACConfig.enabled_npcs_pregStratches		
		ForcePageReset()
	endIf
	if Menu == enabled_npcs_bigUdders
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_bigUdders == true
		debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_bigUdders = !BACConfig.enabled_npcs_bigUdders
		;SetToggleOptionValue(enabled_npcs_bigUdders,  BACConfig.enabled_npcs_bigUdders)		
		ForcePageReset()
	endIf		
	
	if Menu == enabled_npcs_dirtCow
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_dirtCow == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_dirtCow = !BACConfig.enabled_npcs_dirtCow
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf	
	if Menu == enabled_npcs_celluliteCow
		if allowToTurnOffMut(3)==false  && BACConfig.enabled_npcs_celluliteCow == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_celluliteCow = !BACConfig.enabled_npcs_celluliteCow
		BACConfig.enabled_npcs_celluliteCow2 = BACConfig.enabled_npcs_celluliteCow
		BACConfig.enabled_npcs_assStratches = BACConfig.enabled_npcs_celluliteCow
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf	
	if Menu == enabled_npcs_celluliteCow2
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_celluliteCow2 == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_celluliteCow2 = !BACConfig.enabled_npcs_celluliteCow2
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf
	if Menu == enabled_npcs_assStratches
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_assStratches == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_assStratches = !BACConfig.enabled_npcs_assStratches
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf	
	if Menu == enabled_npcs_veinsCow
		if allowToTurnOffMut(2)==false  && BACConfig.enabled_npcs_veinsCow == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_veinsCow = !BACConfig.enabled_npcs_veinsCow
		BACConfig.enabled_npcs_veinsCow2 = BACConfig.enabled_npcs_veinsCow
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf		
	if Menu == enabled_npcs_veinsCow2
		if BACConfig.enabled_npcs_veinsCow == false
			BACConfig.enabled_npcs_veinsCow2 = false
			return
		endif
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_veinsCow2 == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_veinsCow2 = !BACConfig.enabled_npcs_veinsCow2		
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf	
	
	if Menu == enabled_npcs_untamedMilk
		if allowToTurnOffMut(2)==false  && BACConfig.enabled_npcs_untamedMilk == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_untamedMilk = !BACConfig.enabled_npcs_untamedMilk
		BACConfig.enabled_npcs_breastStratches = BACConfig.enabled_npcs_untamedMilk
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf	
	
	if Menu == enabled_npcs_breastStratches
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_breastStratches == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_breastStratches = !BACConfig.enabled_npcs_breastStratches
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf
	
	if Menu == enabled_npcs_cowAsBreasts
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_cowAsBreasts == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif		
		BACConfig.enabled_npcs_cowAsBreasts = !BACConfig.enabled_npcs_cowAsBreasts
		BACConfig.enabled_npcs_cowAsBreasts2 = BACConfig.enabled_npcs_cowAsBreasts
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf
	if Menu == enabled_npcs_cowAsBreasts2
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_cowAsBreasts2 == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_cowAsBreasts2 = !BACConfig.enabled_npcs_cowAsBreasts2
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf

	if Menu == enabled_npcs_openassfurCow
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_openassfurCow == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_openassfurCow = !BACConfig.enabled_npcs_openassfurCow
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf

	if Menu == enabled_npcs_shortBody
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_shortBody == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_shortBody = !BACConfig.enabled_npcs_shortBody
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf	
	if Menu == enabled_npcs_tallBody
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_tallBody == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_tallBody = !BACConfig.enabled_npcs_tallBody
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf

	if Menu == enabled_npcs_curvyCow
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_curvyCow == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_curvyCow = !BACConfig.enabled_npcs_curvyCow
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf	
	if Menu == enabled_npcs_fastMetabolism
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_fastMetabolism == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		
		BACConfig.enabled_npcs_fastMetabolism = !BACConfig.enabled_npcs_fastMetabolism
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf	
	if Menu == enabled_npcs_slowMetabolism
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_slowMetabolism == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		
		BACConfig.enabled_npcs_slowMetabolism = !BACConfig.enabled_npcs_slowMetabolism
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf
	if Menu == enabled_npcs_cowNose
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_cowNose == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_cowNose = !BACConfig.enabled_npcs_cowNose
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf
	if Menu == enabled_npcs_fatCow
		if allowToTurnOffMut(3)==false  && BACConfig.enabled_npcs_fatCow == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_fatCow = !BACConfig.enabled_npcs_fatCow
		BACConfig.enabled_npcs_fatCow2 = BACConfig.enabled_npcs_fatCow
		BACConfig.enabled_npcs_lymphedema = BACConfig.enabled_npcs_fatCow
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf		
	if Menu == enabled_npcs_fatCow2
		if BACConfig.enabled_npcs_fatCow == false
			BACConfig.enabled_npcs_fatCow2 = false
			return
		endif
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_fatCow2 == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_fatCow2 = !BACConfig.enabled_npcs_fatCow2		
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf	
	if Menu == enabled_npcs_lymphedema
		if BACConfig.enabled_npcs_fatCow == false
			BACConfig.enabled_npcs_lymphedema = false
			return
		endif
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_lymphedema == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_lymphedema = !BACConfig.enabled_npcs_lymphedema		
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf	
	
	if Menu == enabled_npcs_slimCow
		if allowToTurnOffMut(2)==false  && BACConfig.enabled_npcs_slimCow == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_slimCow = !BACConfig.enabled_npcs_slimCow
		BACConfig.enabled_npcs_slimCow2 = BACConfig.enabled_npcs_slimCow
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf		
	if Menu == enabled_npcs_slimCow2
		if BACConfig.enabled_npcs_slimCow == false
			BACConfig.enabled_npcs_slimCow2 = false
			return
		endif
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_slimCow2 == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_slimCow2 = !BACConfig.enabled_npcs_slimCow2		
		;SetToggleOptionValue(enabled_npcs_dirtCow,  BACConfig.enabled_npcs_dirtCow)		
		ForcePageReset()
	endIf
	
	
	if Menu == enabled_npcs_faceCow
		if allowToTurnOffMut(3)==false && BACConfig.enabled_npcs_faceCow == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_faceCow = !BACConfig.enabled_npcs_faceCow
		BACConfig.enabled_npcs_faceCow2 = BACConfig.enabled_npcs_faceCow
		BACConfig.enabled_npcs_faceCow3 = BACConfig.enabled_npcs_faceCow
		
		;SetToggleOptionValue(enabled_npcs_wetCow,  BACConfig.enabled_npcs_wetCow)		
		;SetToggleOptionValue(enabled_npcs_hornyCow,  BACConfig.enabled_npcs_hornyCow)		
		;SetToggleOptionValue(enabled_npcs_pregCow,  BACConfig.enabled_npcs_pregCow)		
		ForcePageReset()
	endIf
	
	if Menu == enabled_npcs_faceCow2	
		if BACConfig.enabled_npcs_faceCow == false
			BACConfig.enabled_npcs_faceCow2 = false
			return
		endif	
		if allowToTurnOffMut(2)==false && BACConfig.enabled_npcs_faceCow2 == true
		debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			return
		endif
		BACConfig.enabled_npcs_faceCow2 = !BACConfig.enabled_npcs_faceCow2
		BACConfig.enabled_npcs_faceCow3 = BACConfig.enabled_npcs_faceCow2
		;SetToggleOptionValue(enabled_npcs_hornyCow,  BACConfig.enabled_npcs_hornyCow)		
		;SetToggleOptionValue(enabled_npcs_pregCow,  BACConfig.enabled_npcs_pregCow)		
		ForcePageReset()
	endIf	
	if Menu == enabled_npcs_faceCow3	
		if BACConfig.enabled_npcs_faceCow2 == false
			BACConfig.enabled_npcs_faceCow3 = false
			return
		endif
		if allowToTurnOffMut(1)==false  && BACConfig.enabled_npcs_faceCow3 == true
			debug.messagebox("You reach maximal amount of disabled points.")
			ForcePageReset()
			
			return
		endif
		BACConfig.enabled_npcs_faceCow3 = !BACConfig.enabled_npcs_faceCow3
		;SetToggleOptionValue(enabled_npcs_pregCow,  BACConfig.enabled_npcs_pregCow)		
		ForcePageReset()
	endIf
	
	
EndEvent

bool function allowToTurnOffMut(int c)
	int max = 8

	if BACConfig.enabled_npcs_fastMetabolism == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_slowMetabolism == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_shortBody == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_tallBody == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_pregStratches == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_assStratches == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_breastStratches == false
		c = c + 1
	endif

	if BACConfig.enabled_npcs_wetCow == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_hornyCow == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_pregCow == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_bigUdders == false
		c = c + 1
	endif	
	if BACConfig.enabled_npcs_dirtCow == false
		c = c + 1
	endif	
	if BACConfig.enabled_npcs_celluliteCow == false
		c = c + 1
	endif		
	if BACConfig.enabled_npcs_celluliteCow2 == false
		c = c + 1
	endif	
	if BACConfig.enabled_npcs_veinsCow == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_veinsCow2 == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_untamedMilk == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_cowAsBreasts == false
		c = c + 1
	endif	
	if BACConfig.enabled_npcs_cowAsBreasts2 == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_openassfurCow == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_fatCow == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_fatCow2 == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_slimCow2 == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_slimCow == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_lymphedema == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_curvyCow == false
		c = c + 1
	endif	
	if BACConfig.enabled_npcs_faceCow == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_faceCow2 == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_faceCow3 == false
		c = c + 1
	endif
	if BACConfig.enabled_npcs_cowNose == false
		c = c + 1
	endif
	if c>max
		return false
	endif
	return true
endFunction


Event OnOptionSliderOpen(Int Menu)
	sliderSetupOpenInt(Menu,debug_player_phase,BACActor.npcs_phase[BACConfig.PlayerSlot],0,BACMain.setMaxPhase(),1);
	sliderSetupOpenInt(Menu,painLevel,BACConfig.painLevel,10,150,5);
	sliderSetupOpenInt(Menu,bellVolume,BACConfig.bellVolume,5,100,1);
	sliderSetupOpenInt(Menu,questPause,BACConfig.questPause,1,7,1);
	sliderSetupOpenInt(Menu,commentProb,BACConfig.commentProb,0,80,1);
	sliderSetupOpenInt(Menu,hpTriggerHit,BACConfig.hpTriggerHit,20,90,1);
	sliderSetupOpenInt(Menu,horseshoeVolume,BACConfig.horseshoeVolume,5,100,1);
	sliderSetupOpenFloat(Menu,bodyButt,BACConfig.bodyButt,0,5,0.1);
	sliderSetupOpenFloat(Menu,bodyBelly,BACConfig.bodyBelly,0,5,0.1);
	
	sliderSetupOpenFloat(Menu,debug1,BACConfig.PlayerfatFactor1,0,5,0.01);
	sliderSetupOpenFloat(Menu,debug2,BACConfig.PlayerfatFactor2,0,5,0.01);
	
	sliderSetupOpenFloat(Menu,bellyMultFakePreg,BACConfig.bellyMultFakePreg,2,5,0.1);
EndEvent


Event OnOptionSliderAccept(Int Menu, Float Val)

	if Menu == debug_player_phase
		SetSliderOptionValue(Menu,Val,"{0}")		
		BACActor.npcs_phase[BACConfig.PlayerSlot] = Val as Int		
		BACActor.reequipItems(BACConfig.PlayerSlot)
		
	endif		
	if Menu == questPause
		SetSliderOptionValue(Menu,Val,"{0}")		
		BACConfig.questPause = Val as Int			
	endif		
	if Menu == painLevel
		SetSliderOptionValue(Menu,Val,"{0}")		
		BACConfig.painLevel = Val as Int			
	endif	
	if Menu == horseshoeVolume
		SetSliderOptionValue(Menu,Val,"{0}")		
		BACConfig.horseshoeVolume = Val as Int			
	endif	
	if Menu == bellVolume
		SetSliderOptionValue(Menu,Val,"{0}")		
		BACConfig.bellVolume = Val as Int			
	endif		
	if Menu == commentProb
		SetSliderOptionValue(Menu,Val,"{0}")		
		BACConfig.commentProb = Val as Int			
	endif		
	if Menu == hpTriggerHit
		SetSliderOptionValue(Menu,Val,"{0}")		
		BACConfig.hpTriggerHit = Val as Int			
	endif	
	if Menu == bodyButt
		SetSliderOptionValue(Menu,Val,"{1}")		
		BACConfig.bodyButt = Val as Float			
	endif
	if Menu == bodyBelly
		SetSliderOptionValue(Menu,Val,"{1}")		
		BACConfig.bodyBelly = Val as Float			
	endif	
	if Menu == bellyMultFakePreg
		SetSliderOptionValue(Menu,Val,"{1}")		
		BACConfig.bellyMultFakePreg = Val as Float			
	endif	
	
	if Menu == debug1
	
		SetSliderOptionValue(Menu,Val,"{2}")		
		BACConfig.PlayerfatFactor1 = Val as Float	
BACMain.addTransformations(BACActor.isRegistered(Game.getPlayer()))		
	endif	
	if Menu == debug2
	
		SetSliderOptionValue(Menu,Val,"{2}")		
		BACConfig.PlayerfatFactor2 = Val as Float	
BACMain.addTransformations(BACActor.isRegistered(Game.getPlayer()))		
	endif
	
EndEvent

event OnOptionMenuOpen(int Menu)
	if (Menu == transformationTempo)
		SetMenuDialogStartIndex(BACConfig.transformationTempo as int)
		SetMenuDialogDefaultIndex(1)
		SetMenuDialogOptions(tempo)
		return
	endIf		
	if (Menu == tatsColor)
		SetMenuDialogStartIndex(BACConfig.tatsColorInt as int)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(color)
		return
	endIf	
EndEvent


Event OnOptionMenuAccept(int Menu, int a_index)
	if (Menu == transformationTempo)
		BACConfig.transformationTempo = a_index as int
		SetMenuOptionValue(Menu, tempo[BACConfig.transformationTempo as int])
	endIf		
	if (Menu == tatsColor)
		BACActor.npcs_color[BACActor.isRegistered(Game.getPlayer())] = a_index
		BACConfig.tatsColorInt = a_index as int
		if a_index == 0
			BACConfig.tatsColor = "Brown"
		endif
		if a_index == 1
			BACConfig.tatsColor = "White"
		endif		
		if a_index == 2
			BACConfig.tatsColor = "Spots"
		endif
		if a_index == 3
			BACConfig.tatsColor = "Brown open"
		endif
		if a_index == 4
			BACConfig.tatsColor = "White open"
		endif		
		if a_index == 5
			BACConfig.tatsColor = "Spots open"
		endif		
		needToClearTats = true
		SetMenuOptionValue(Menu, color[BACConfig.tatsColorInt as int])
	endIf	
EndEvent


function sliderSetupOpenInt(Int Menu, Int IntName,Int ConfValue, int rangeStart = 0, int rangeStop = 100, int interval = 1)
	if (Menu == IntName)
		SetSliderDialogStartValue(ConfValue)
		SetSliderDialogRange(rangeStart,rangeStop)
		SetSliderDialogInterval(interval)
	endIf
endFunction

function sliderSetupOpenFloat(Int Menu, Int IntName,Float ConfValue, float rangeStart = 0.0, float rangeStop = 100.0, float interval = 0.1)
	if (Menu == IntName)
		SetSliderDialogStartValue(ConfValue)
		SetSliderDialogRange(rangeStart,rangeStop)
		SetSliderDialogInterval(interval)
	endIf
endFunction

int function getEnableFlag(int in)

	if in == 1
		return OPTION_FLAG_NONE
	endif
	
	return OPTION_FLAG_DISABLED
endFunction

int function getEnableFlagBool(bool in)

	if in == true
		return OPTION_FLAG_NONE
	endif
	
	return OPTION_FLAG_DISABLED
endFunction

int generalEnabled
int allowTats

int static1
int static2
int debug_player_phase
int showConsoleOutput
int showTraceOutput
int modEnabled

int hardcoreMode


int painLevelEnabled
int painLevel
int horseshoeVolume
int bellVolume
int hpTriggerHit
int addSounds
int addFacialExp

String[] color
String[] tempo
int transformationTempo

int solveUdders
int solveHands
int buildInLevelSystem
int allowToSpreadColours
int allowToChangeBodyWeight
int allowToLegsDeformation
int tatsColor
int supportDynamicWeight 

int allowTailSound
int commentProb
int solveDirt

int bellyMultFakePreg
int bodyBelly
int slifExtraValue
int bodyButt
int debug1 
int debug2
int debug_find_newattr
int debug_max_phase
int debug_bacrq_reducetime
int debug_bacrq_reducetime1
int debug_run_quest_addRank
int debug_run_quest_decRank
int debug_run_quest
int debug_run_quest1
int debug_run_quest2
int debug_reset
int reenable
int restoreMarc
int questPause

int enabled_npcs_fastMetabolism
int enabled_npcs_slowMetabolism
int enabled_npcs_wetCow
int enabled_npcs_hornyCow
int enabled_npcs_pregCow
int enabled_npcs_bigUdders
int enabled_npcs_dirtCow
int enabled_npcs_celluliteCow
int enabled_npcs_celluliteCow2
int enabled_npcs_veinsCow
int enabled_npcs_veinsCow2
int enabled_npcs_untamedMilk
int enabled_npcs_cowAsBreasts
int enabled_npcs_cowAsBreasts2
int enabled_npcs_openassfurCow
int enabled_npcs_slimCow
int enabled_npcs_slimCow2
int enabled_npcs_fatCow
int enabled_npcs_fatCow2
int enabled_npcs_lymphedema
int enabled_npcs_curvyCow
int enabled_npcs_faceCow
int enabled_npcs_faceCow2
int enabled_npcs_faceCow3
int enabled_npcs_cowNose
int enabled_npcs_shortBody
int enabled_npcs_tallBody
int enabled_npcs_pregStratches
int enabled_npcs_assStratches
int enabled_npcs_breastStratches
int skip_story
int skip_story_items
int skip_story_tats

int allowPhaseTats
int allowHornsAndEars
int allowHooves
int allowHandHooves
int allowTails

event OnOptionHighlight(int a_option)
	{Called when the user highlights an option}
	
	
	
	if a_option == buildInLevelSystem
		SetInfoText("If TRUE then mod will provide transformation stage based on milk activity (recommended).\nIf FALSE then transformation stage == MME level.")
	endIf
	
	if a_option == solveUdders
		SetInfoText("Turn on/off udders as transformation element.")
	endIf		
	if a_option == solveHands
		SetInfoText("Turn on/off hands hooves as transformation element.")
	endIf	
	
	if a_option == transformationTempo
		SetInfoText("Speed of transformation.")
	endIf		
	
EndEvent