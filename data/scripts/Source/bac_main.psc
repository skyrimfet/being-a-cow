Scriptname bac_main extends Quest  

import StorageUtil

bac_utilities Property BACUtilities Auto
bac_config Property BACConfig Auto
bac_update Property BACUpdate Auto
bac_actor Property BACActor Auto
bac_store Property BACStore Auto
bac_player Property BACPlayer Auto

;hardcoded version info
Float function getVersion()
	return 5.7
endFunction

;visual version info
String function getDisplayVersion()
	return "1.9"
endFunction

Int function setMaxPhase()
	return 26
endFunction

Event OnInit()

	debug.notification("Being a Cow (BAC) is starting...")

	BACUtilities.log("BAC::OnInit","Init mod")
	
	BACConfig.modEnabled = true
	BACConfig.modVersion = 0
	
	BACConfig.showConsoleOutput = false
	BACConfig.showTraceOutput = false
	
	BACUtilities.log("BAC::OnInit","Init first update")
	
	BACUpdate.update()
	
	BACUtilities.log("BAC::OnInit","Ok, mod is ready")
	
	debug.notification("Being a Cow (BAC) is ready...")

	RegisterForSingleUpdate(BACConfig.updateInterval)
	
endEvent


Event onUpdate()
	BACUtilities.log("BAC::onUpdate","Start update")
	
	if BACConfig.maintenance == true
		RegisterForSingleUpdate(BACConfig.updateInterval)
		BACUtilities.log("BAC::onUpdate","Stop maintenance mode is enabled!")
		return
	endIf
	
	if BACConfig.modEnabled == true
		
		if standardUpdate() == true
			RegisterForSingleUpdate(0.8)
		else
			RegisterForSingleUpdate(BACConfig.updateInterval)
		endif
	endIf
	
	
	
	BACUtilities.log("BAC::onUpdate","Stop update")
endEvent

function reEnableMod()
	BACUpdate.updateActorEquip()
	RegisterForSingleUpdate(BACConfig.updateInterval)
endFunction

bool function standardUpdate()

	
;	int i = 0
	
	
	;while i < 100
	;	
	;	i+=1
	;endwhile 
	scanForActors()
	return processActors()
endFunction


;**
; Call it everytime when location is changed
;**
function onLocationChange()
	
	UnregisterForModEvent("BACUpdate")
	RegisterForModEvent("BACUpdate","updateEvent")
	
	
	if BACConfig.modEnabled == false
		UnregisterForModEvent("BACUpdate")
		return
	endif
	int i = 0
	while i < 	BACActor.getArrayCount()
    
		if BACActor.npcs_ref[i] != None
			
			if BACActor.npcs_ref[i].hasSpell(BACStore.bac_watchdogSpell )
				BACActor.npcs_ref[i].removeSpell(BACStore.bac_watchdogSpell )
			endIf
			BACActor.npcs_ref[i].addSpell(BACStore.bac_watchdogSpell ,false)
				  
				  
			if BACActor.npcs_ref[i].Is3DLoaded() && BACActor.npcs_needTuUpdate[i] ==true
				;update
				BACActor.npcs_needTuUpdate[i] = false
				BACActor.reequipItems(i, false)
			endif
			if BACActor.npcs_ref[i].Is3DLoaded() == false
				BACActor.npcs_needTuUpdate[i] = true
			endif
		endif
		i+=1
	endWhile	
		
endFunction

Event updateEvent(Int Slot)
	BACActor.npcs_ref[Slot].SetFactionRank(BACStore.bac_milkmaid,BACActor.npcs_phase[Slot] )
	BACActor.reequipItems(Slot, false)
EndEvent


bool function processActors()

	bool somethingHappens = false
	
	if BACConfig.modEnabled == false
		return false
	endif

	int i = 0
	while i < BACActor.getArrayCount()
	
	
		if BACActor.npcs_ref[i]!=None
		
			BACUtilities.log("BACMain::stepsact BEFORE", BACActor.npcs_weightMod[i])
			
			if BACConfig.allowToChangeBodyWeight==true && BACConfig.supportDynamicWeight == true
				if BACActor.npcs_activityPoints[i] > 10			
					
					if BACActor.npcs_fastMetabolism[i] == true
						BACActor.npcs_weightMod[i] = BACActor.npcs_weightMod[i] - 0.06
					endif
					
					if BACActor.npcs_fatCow[i]==false
						BACActor.npcs_weightMod[i] = BACActor.npcs_weightMod[i] - 0.08
						
					else
						BACActor.npcs_weightMod[i] = BACActor.npcs_weightMod[i] - 0.05
					endif
					
					if BACActor.npcs_slimCow[i] == true
						BACActor.npcs_weightMod[i] = BACActor.npcs_weightMod[i] - 0.05
						if BACActor.npcs_slimCow2[i] == true
							BACActor.npcs_weightMod[i] = BACActor.npcs_weightMod[i] - 0.02
						endif
					endif
					
				else
					BACActor.npcs_weightMod[i] = BACActor.npcs_weightMod[i] + 0.001
				endif
			
				if BACActor.npcs_foodPoints[i] > 0
				
					if BACActor.npcs_slowMetabolism[i] == true
						BACActor.npcs_weightMod[i] = BACActor.npcs_weightMod[i] + (0.35 * BACActor.npcs_foodPoints[i])
					endif
					
					if BACActor.npcs_fastMetabolism[i] == true
						BACActor.npcs_weightMod[i] = BACActor.npcs_weightMod[i] + (0.1 * BACActor.npcs_foodPoints[i])
					endif
					if BACActor.npcs_fastMetabolism[i] == false && BACActor.npcs_slowMetabolism[i] == false
						BACActor.npcs_weightMod[i] = BACActor.npcs_weightMod[i] + (0.17 * BACActor.npcs_foodPoints[i])
					endif
				endif
			
			
			
				BACActor.npcs_activityPoints[i] = 0
				BACActor.npcs_foodPoints[i] = 0
				if BACActor.npcs_weightMod[i] > 40.0
					BACActor.npcs_weightMod[i] = 40.0
				endif
				if BACActor.npcs_weightMod[i] < -40.0
					BACActor.npcs_weightMod[i] = -40.0
				endif
			
			endif
			
			BACUtilities.log("BACMain::stepsact AFTER", BACActor.npcs_weightMod[i])
			
			;BACActor.npcs_pregCowCount[i]=BACActor.npcs_pregCowCount-0.05
			;debug.messagebox("preg"+BACActor.npcs_pregCowCount[i])
			if HasFloatValue(BACActor.npcs_ref[i],"MME.MilkMaid.Level") == false
				debug.notification("removed!")
				BACActor.unregisterActor(i)
			endif
		
		EndIf
		
	
	
	
		if BACActor.npcs_ref[i]!=None
			
			
			
			
			if BACConfig.buildInLevelSystem == true
				if BACActor.npcs_phase[i] <= setMaxPhase()
					int level = BACActor.getLevel(i)
					BACUtilities.log("BACMain::ProcessActors", "Maid count:" + i + " - " + level)
				
					;	level	phase	tempo	calc				level	phae	tempo	calc
					;			5		0		5  * 2 * 1 (10)				5		2		5  * 2 * 3 (15)
					;			10		0		10 * 2 * 1 (20)				10		2		10 * 2 * 3 (60)
					;			15		0		15 * 2 * 1 (30)				15		2		15 * 2 * 3 (90)
					;			
					;
					
					if level > (BACActor.npcs_phase[i] * 2 * (BACConfig.transformationTempo + 1) )
						BACActor.npcs_times[i] = 0					
						;BACActor.npcs_lastLevel[i] = level
						;;debug.notification("maid lact level:"+level)
						BACActor.npcs_phase[i] = BACActor.npcs_phase[i] + 1
						
						if BACActor.npcs_phase[i] > 10
							BACActor.randomAttribute(i)
						endif
						
						BACActor.npcs_ref[i].SetFactionRank(BACStore.bac_milkmaid, BACActor.npcs_phase[i])
						;BACActor.reequipItems(i)
						addTransformations(i)
						somethingHappens = true
						BACPlayer.playMoo(i)
						Debug.notification(BACActor.npcs_ref[i].GetLeveledActorBase().GetName() + " is transforming to cow [ Stage"+ BACActor.npcs_phase[i]+"/"+setMaxPhase()+" ]")
						
						
					endif
				endIf
			else
				if BACActor.npcs_phase[i] != BACActor.getMMELevel(i)
				
					BACActor.npcs_phase[i] = BACActor.getMMELevel(i)
					if BACActor.npcs_phase[i] > setMaxPhase()
						BACActor.npcs_phase[i] = setMaxPhase()
					endif
					;need trick
					
					
					BACActor.npcs_ref[i].SetFactionRank(BACStore.bac_milkmaid, BACActor.npcs_phase[i])
					;BACActor.reequipItems(i)
					
					if BACActor.npcs_timesLast[i] != BACActor.npcs_phase[i]
						addTransformations(i)
						somethingHappens = true
						BACPlayer.playMoo(i)
						Debug.notification(BACActor.npcs_ref[i].GetLeveledActorBase().GetName() + " is transforming to cow [ Stage"+ BACActor.npcs_phase[i]+"/"+setMaxPhase()+" ]")
						BACActor.npcs_timesLast[i] = BACActor.npcs_phase[i]
						
						
					endif
					
				endIf
			endif
		endif
		i+=1
	endwhile
	return somethingHappens
endFunction

function addTransformations(int Slot)

	int handle = ModEvent.Create("BACUpdate") 
			;ModEvent.PushForm(handle, DTActor.npcs_ref[i] as Form) 	
	ModEvent.PushInt(handle, Slot)	
	ModEvent.Send(handle)
			
			
	;BACActor.reequipItems(i)
endFunction


function scanForActors()
	Actor[] actors
	actors = getActors(Game.getPlayer())
	
	int i = actors.length
	
	while i > 0
		i -= 1
		if actors[i]!=None
			
			;BACUtilities.log("BAC::Scanner AI","AI for "+actors[i].GetLeveledActorBase().GetName() + " " + actors[i].GetCurrentPackage() )
			
			if actors[i].IsPlayerTeammate()
				BACConfig.teammate = actors[i]
			endIf
			
			
			if BACActor.isRegistered(actors[i]) == -1
				int slot = BACActor.registerActor(actors[i])	
				if slot>-1
					BACUtilities.log("BAC::Scanner","Register actor "+actors[i].GetLeveledActorBase().GetName())
				endif			
			endIf
		endIf		
	endWhile
	
endFunction


Actor[] function getActors(Actor acAktor)

	Actor[] actors
	actors = new Actor[32]

	Actor acActor = acAktor

	float rad = 500.0
	float posx = acActor.GetPositionX()
	float posy = acActor.GetPositionY()
	float posz = acActor.GetPositionZ()


	int i = 0
	int index = 0
	while i < 30
		
		actor npctoadd = Game.FindRandomActor(posx, posy, posz, rad)

		if actors.find(npctoadd)==-1
			actors[index] = npctoadd
			index+=1
		endif
		
		i+=1
	endWhile

	return actors
endFunction



function registerSoulGemOven()
	return
	if BACConfig.soulGemPack == true		
		self.RegisterForModEvent("SGO.OnMilked","SoulMilk")
	endif
endFunction


Event SoulMilk(Actor Who, Form fForm)

	int slot = BACActor.isRegistered(Who)
	if slot >=0
		BACActor.npcs_timesLast[slot] = BACActor.npcs_timesLast[slot] - 1
		
	endif
	Return
EndEvent