Scriptname bac_actor extends Quest  



bac_config Property BACConfig Auto
bac_utilities Property BACUtilities Auto
bac_store Property BACStore Auto
bac_main	Property BACMain Auto

import StorageUtil



Actor[] Property npcs_ref Auto
;Int[] Property npcs_lastLevel Auto
Int[] Property npcs_phase Auto
Int[] Property npcs_times Auto
Int[] Property npcs_timesLast Auto

Float[] Property npcs_milkWearBonus Auto

Int[] Property npcs_lastSound Auto
Int[] Property npc_sound1 Auto
Int[] Property npc_sound2 Auto
Int[] Property npc_sound3 Auto
Int[] Property npc_sound4 Auto
Int[] Property npc_sound5 Auto

Bool[] Property npcs_wetCow Auto
Bool[] Property npcs_hornyCow Auto
Bool[] Property npcs_pregCow Auto
;Float[] Property npcs_pregCowCount Auto
Bool[] Property npcs_openassfurCow Auto
Bool[] Property npcs_dirtCow Auto
Bool[] Property npcs_fatCow Auto
Bool[] Property npcs_fatCow2 Auto
Bool[] Property npcs_slowMetabolism Auto
Bool[] Property npcs_fastMetabolism Auto
Bool[] Property npcs_lymphedema Auto
Bool[] Property npcs_slimCow Auto
Bool[] Property npcs_slimCow2 Auto
Bool[] Property npcs_curvyCow Auto
Bool[] Property npcs_faceCow Auto
Bool[] Property npcs_faceCow2 Auto
Bool[] Property npcs_faceCow3 Auto
Bool[] Property npcs_veinsCow1 Auto
Bool[] Property npcs_veinsCow2 Auto
Bool[] Property npcs_tallBody Auto
Bool[] Property npcs_shortBody Auto
Bool[] Property npcs_bigUdders Auto
Bool[] Property npcs_untamedMilk Auto
Bool[] Property npcs_cowNose Auto
Bool[] Property npcs_cowAsBreasts Auto
Bool[] Property npcs_cowAsBreasts2 Auto
Bool[] Property npcs_pregStratches Auto
Bool[] Property npcs_assStratches Auto
Bool[] Property npcs_breastStratches Auto
Float[] Property npcs_weightMod Auto
Int[] Property npcs_activityPoints Auto
Int[] Property npcs_foodPoints Auto
Bool[] Property npcs_celluliteCow Auto
Bool[] Property npcs_celluliteCow2 Auto
Bool[] Property npcs_needTuUpdate Auto
Int[] Property npcs_color Auto
Int[] Property npcs_punishItem Auto
float[] Property npcs_orgWeight Auto

String[] Property npcs_lastKnownTato Auto

Faction Property bac_mark Auto

int function getArrayCount()
	return ( npcs_ref.length - 1 )
endFunction


int function getActorCount()
	int count = 0
	int i = 0
	while i < getArrayCount()
		if npcs_ref[i] != None
			count+=1
	 	endif
		i+=1
	endWhile
	
	return count

endFunction

int function isRegistered(Actor acAktor)
	int i = 0
    while i < getArrayCount()
		if acAktor == npcs_ref[i]
			return i
		endif
		i+=1
	endWhile
	return -1
endFunction

int function getFirstFreeSlot()
	int i = 0
    while i < getArrayCount()
	  if npcs_ref[i] == None
	    return i
	  endif
	i+=1
	endWhile
	return -1
endFunction


int function registerActor(Actor acAktor)
	
	if isMilkmaid(acAktor) == false
		return -1
	endIf
	
	
	
	int registerId = isRegistered(acAktor)
		
	if registerId>=0    		
		return registerId
	endif
      
	int i = getFirstFreeSlot()
    
	if i >=0
		npcs_orgWeight[i] =  npcs_ref[i].GetActorBase().GetWeight()
		npcs_ref[i] = acAktor
		;npcs_lastLevel[i] = GetFloatValue(acAktor,"MME.MilkMaid.Level") as Int
		;npcs_lastLevel[i] = 0; GetFloatValue(acAktor,"MME.MilkMaid.TimesMilked") as Int
		npcs_lastKnownTato[i] = ""
		npcs_phase[i] = 0
		npcs_times[i] = 0
		npcs_timesLast[i] = 0
		
		npcs_milkWearBonus[i] = 0
		npcs_weightMod[i] = 0
		npcs_activityPoints[i] = 0
		npcs_foodPoints[i] = 0
		
		npcs_punishItem[i] = 0
		npcs_wetCow[i]  = false
		npcs_hornyCow[i]  = false
		npcs_pregCow[i]  = false
		npcs_openassfurCow[i]  = false
		npcs_dirtCow[i]   = false
		npcs_tallBody[i]   = false
		npcs_shortBody[i] = false
		npcs_pregStratches[i]  = false
		npcs_assStratches[i] = false
		npcs_breastStratches[i] = false
		npcs_fatCow[i]   = false
		npcs_fatCow2[i]   = false
		npcs_slimCow[i]   = false
		npcs_slimCow2[i]   = false
		npcs_slowMetabolism[i]   = false
		npcs_fastMetabolism[i]   = false
		npcs_celluliteCow[i]   = false
		npcs_celluliteCow2[i]   = false
		npcs_cowNose[i]   = false
		npcs_veinsCow2[i]   = false
		npcs_veinsCow1[i]   = false
		npcs_bigUdders[i]   = false
		npcs_cowAsBreasts[i] = false
		npcs_cowAsBreasts2[i] = false
		npcs_faceCow[i]   = false
		npcs_faceCow2[i]   = false
		npcs_faceCow3[i]   = false
		npcs_curvyCow[i]   = false
		npcs_untamedMilk[i]   = false
		npcs_lymphedema[i]   = false
		npcs_color[i]   = Utility.randomInt(0,2)
		
		npcs_ref[i].addSpell(BACStore.bac_watchdogSpell ,false)
				
		npcs_ref[i].AddToFaction(BACStore.bac_milkmaid)
		npcs_ref[i].SetFactionRank(BACStore.bac_milkmaid, 0)
		
		return i
	endif
			
	return -1
	
endFunction

function resetPlayerMutProgress()
	int slot = registerActor(Game.getPlayer())
		npcs_lastKnownTato[slot] = ""
		npcs_phase[slot] = 0
		npcs_times[slot] = 0
		npcs_timesLast[slot] = 0
		
		npcs_milkWearBonus[slot] = 0
		npcs_weightMod[slot] = 0
		npcs_activityPoints[slot] = 0
		npcs_foodPoints[slot] = 0
		npcs_tallBody[slot] = false
		npcs_shortBody[slot] = false
		npcs_assStratches[slot] = false
		npcs_pregStratches[slot] = false
		npcs_breastStratches[slot] = false
		
		npcs_punishItem[slot] = 0
		npcs_wetCow[slot]  = false
		npcs_hornyCow[slot]  = false
		npcs_pregCow[slot]  = false
		npcs_openassfurCow[slot]  = false
		npcs_dirtCow[slot]   = false
		npcs_fatCow[slot]   = false
		npcs_fatCow2[slot]   = false
		npcs_slimCow[slot]   = false
		npcs_slimCow2[slot]   = false
		npcs_slowMetabolism[slot]   = false
		npcs_fastMetabolism[slot]   = false
		npcs_celluliteCow[slot]   = false
		npcs_celluliteCow2[slot]   = false
		npcs_cowNose[slot]   = false
		npcs_veinsCow2[slot]   = false
		npcs_veinsCow1[slot]   = false
		npcs_bigUdders[slot]   = false
		npcs_cowAsBreasts[slot] = false
		npcs_cowAsBreasts2[slot] = false
		npcs_faceCow[slot]   = false
		npcs_faceCow2[slot]   = false
		npcs_faceCow3[slot]   = false
		npcs_curvyCow[slot]   = false
		npcs_untamedMilk[slot]   = false
		npcs_lymphedema[slot]   = false
		npcs_color[slot]   = Utility.randomInt(0,2)
		
		
	
endFunction

function removeItems(int slot)
		BACConfig.equipJob = true
		tryToRemove(npcs_ref[slot], 37, BACConfig.hooves, none)
		tryToRemove(npcs_ref[slot], 33, BACConfig.hoovesHands, none)
		tryToRemove(npcs_ref[slot], 42, BACConfig.horns, none)
		tryToRemove(npcs_ref[slot], 40, BACConfig.tails, none)
		tryToRemove(npcs_ref[slot], 53, BACConfig.udders, none)
		tryToRemove(npcs_ref[slot], 55, BACConfig.ears, none)
		tryToRemove(npcs_ref[slot], 44, BACConfig.noserings, none)
		tryToRemove(npcs_ref[slot], 45, BACConfig.bell, none)
		tryToRemove(npcs_ref[slot], 61, BACConfig.wet, none)
		Armor[] tmp
		tmp = new Armor[1]
		tmp[0] = BACStore.bac_punish01
		tryToRemove(npcs_ref[slot], 42, tmp, none)
		tmp[0] = BACStore.bac_punish02
		tryToRemove(npcs_ref[slot], 32, tmp, none)
		tmp[0] = BACStore.bac_punish03
		tryToRemove(npcs_ref[slot], 53, tmp, none)
	BACConfig.equipJob = false
endFunction

function removeAdditionalItems(int slot)
	int i = 0
    while i < 64
		if BACConfig.allItems[i]!=none
			int ccc = npcs_ref[slot].GetItemCount(BACConfig.allItems[i])
			if ccc > 1
			
				npcs_ref[slot].removeItem(BACConfig.allItems[i], ccc - 1,true)
			endif
	  endif
	  
		i+=1
	endWhile
	
endFunction

function clearEffects(int slot)
	removeItems(slot)
npcs_ref[slot].GetActorBase().SetHeight(1)
ActorOverlayRemove(npcs_ref[slot], "body", "dirt",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "dirt",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "dirt",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "dirt",false )		
	
	ActorOverlayRemove(npcs_ref[slot], "body", "fur_supp",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "fur_supp",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "fur_supp",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "fur_supp",false )		

	ActorOverlayRemove(npcs_ref[slot], "body", "fur",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "fur",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "fur",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "fur",false )
	
	ActorOverlayRemove(npcs_ref[slot], "body", "mark",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "mark",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "mark",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "mark",false )	

	ActorOverlayRemove(npcs_ref[slot], "body", "cellulite",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "cellulite",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "cellulite",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "cellulite",false )	

	ActorOverlayRemove(npcs_ref[slot], "body", "cellulite2",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "cellulite2",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "cellulite2",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "cellulite2",false )		
	
	ActorOverlayRemove(npcs_ref[slot], "body", "assstretch",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "assstretch",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "assstretch",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "assstretch",false )		
	
	ActorOverlayRemove(npcs_ref[slot], "body", "breaststretch",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "breaststretch",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "breaststretch",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "breaststretch",false )		
	
	ActorOverlayRemove(npcs_ref[slot], "body", "bellystretch",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "bellystretch",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "bellystretch",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "bellystretch",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "bellystretch",false )	

	ActorOverlayRemove(npcs_ref[slot], "body", "bbondage",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "bbondage",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "bbondage",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "bbondage",false )	
	
	ActorOverlayRemove(npcs_ref[slot], "body", "breastmut",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "breastmut",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "breastmut",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "breastmut",false )
	
	ActorOverlayRemove(npcs_ref[slot], "body", "liquid",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "nose",false )
	
	NiOverride.RemoveNodeTransformScale(npcs_ref[slot],False,True,"NPC R Calf [RClf]","BAC")    
	NiOverride.RemoveNodeTransformScale(npcs_ref[slot],False,True,"NPC L Calf [LClf]","BAC")
	NiOverride.RemoveNodeTransformScale(npcs_ref[slot],False,True,"NPC L Thigh [LThg]","BAC")
	NiOverride.RemoveNodeTransformScale(npcs_ref[slot],False,True,"NPC R Thigh [RThg]","BAC")
	
		NiOverride.RemoveNodeTransformScale(npcs_ref[slot],False,True,"NPC L UpperArm [LUar]","BAC")    
		NiOverride.RemoveNodeTransformScale(npcs_ref[slot],False,True,"NPC L Forearm [LLar]","BAC")
		NiOverride.RemoveNodeTransformScale(npcs_ref[slot],False,True,"NPC R UpperArm [RUar]","BAC")
		NiOverride.RemoveNodeTransformScale(npcs_ref[slot],False,True,"NPC R Forearm [RLar]","BAC")
		
	NiOverride.UpdateNodeTransform(npcs_ref[slot], false, True, "NPC R Calf [RClf]")
	NiOverride.UpdateNodeTransform(npcs_ref[slot], false, True, "NPC L Calf [LClf]") 
	NiOverride.UpdateNodeTransform(npcs_ref[slot], false, True, "NPC L Thigh [LThg]") 
	NiOverride.UpdateNodeTransform(npcs_ref[slot], false, True, "NPC R Thigh [RThg]") 
	NiOverride.UpdateNodeTransform(npcs_ref[slot], false, True, "NPC L UpperArm [LUar]")
	NiOverride.UpdateNodeTransform(npcs_ref[slot], false, True, "NPC L Forearm [LLar]")
	NiOverride.UpdateNodeTransform(npcs_ref[slot], false, True, "NPC R UpperArm [RUar]")
	NiOverride.UpdateNodeTransform(npcs_ref[slot], false, True, "NPC R Forearm [RLar]")		
	
	if BACConfig.slifPack == true
		SLIF_Main.unregisterNode(npcs_ref[Slot], "slif_belly", "BAC")
		SLIF_Main.unregisterNode(npcs_ref[Slot], "slif_butt", "BAC")
		SLIF_Main.unregisterNode(npcs_ref[Slot], "slif_left_breast", "BAC")
	endIf
	
	
	npcs_ref[slot].removeSpell(BACStore.bac_watchdogSpell)
endFunction

function unregisterActor(int slot)


	npcs_lastKnownTato[slot] = ""
	npcs_phase[slot] = 0
	npcs_times[slot] = 0
	npcs_timesLast[slot] = 0
	
	clearEffects(slot)
	npcs_ref[slot].RemoveFromFaction(BACStore.bac_milkmaid)
	
	
	
	ActorOverlayRemove(npcs_ref[slot], "body", "dirt",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "dirt",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "dirt",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "dirt",false )		
	
	ActorOverlayRemove(npcs_ref[slot], "body", "fur_supp",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "fur_supp",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "fur_supp",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "fur_supp",false )		

	ActorOverlayRemove(npcs_ref[slot], "body", "fur",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "fur",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "fur",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "fur",false )
	
	ActorOverlayRemove(npcs_ref[slot], "body", "mark",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "mark",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "mark",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "mark",false )	

	
	ActorOverlayRemove(npcs_ref[slot], "body", "cellulite",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "cellulite",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "cellulite",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "cellulite",false )		
	ActorOverlayRemove(npcs_ref[slot], "body", "cellulite2",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "cellulite2",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "cellulite2",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "cellulite2",false )		
	
	ActorOverlayRemove(npcs_ref[slot], "body", "bbondage",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "bbondage",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "bbondage",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "bbondage",false )	
	
	ActorOverlayRemove(npcs_ref[slot], "body", "breastmut",false )
	ActorOverlayRemove(npcs_ref[slot], "hand", "breastmut",false )
	ActorOverlayRemove(npcs_ref[slot], "feet", "breastmut",false )
	ActorOverlayRemove(npcs_ref[slot], "face", "breastmut",false )		
	
	ActorOverlayCommit(npcs_ref[slot])
	
	changeBodyWeight(npcs_ref[slot], npcs_orgWeight[slot]/2)
	
	npcs_ref[slot] = None
	
		
endFunction



int function getMMELevel(int slot)
	return GetFloatValue(npcs_ref[slot],"MME.MilkMaid.Level") as Int
endFunction

int function getLevel(int slot)

	

	int counter = GetFloatValue(npcs_ref[slot],"MME.MilkMaid.TimesMilked") as Int
	BACUtilities.log("BACActor::getLevel","AddMilkCounter" + npcs_milkWearBonus[slot])
	if npcs_milkWearBonus[slot]>1
		 npcs_milkWearBonus[slot] = npcs_milkWearBonus[slot] - 1
		 npcs_times[slot] =  npcs_times[slot] + 1
		 npcs_timesLast[slot] = counter
		 return npcs_times[slot]
	endif
	
	
	if npcs_times[slot]!=counter && counter != npcs_timesLast[slot]
		npcs_times[slot] = npcs_times[slot] + 1
		npcs_timesLast[slot] = counter
	endif
	return npcs_times[slot]
	;return GetFloatValue(npcs_ref[slot],"MME.MilkMaid.TimesMilked") as Int
	;return GetFloatValue(npcs_ref[slot],"MME.MilkMaid.Level") as Int
endFunction



bool function isMilkmaid(Actor akActor)
	
	if akActor==None
		return false
	endIf
	
	if akActor.isDead() == true || akActor.IsChild() == true || akActor.IsGhost() == true
		return false
	endIf
	
	if akActor.GetActorBase().GetSex() != 1
		return false
	endIf
	
	if GetFloatValue(akActor,"MME.MilkMaid.TimesMilked") > 0.0 || GetFloatValue(akActor," MME.MilkMaid.Level") > 0.0
		return true
	endIf
	
	return false
	

endFunction

function addTats(int slot,string color, int phase)
return
	if BACConfig.slaveTatsPack == false || BACConfig.allowTats == false
		return
	endIf
	if npcs_lastKnownTato[slot] !=  color + " phase "+phase
		removeTats(slot,phase,color)
		;removeTats(slot,phase,"Whi")
		SlaveTats.simple_add_tattoo(npcs_ref[slot], "Being a cow", color + " phase "+phase+" - body")		
		
		SlaveTats.simple_add_tattoo(npcs_ref[slot], "Being a cow", color + " phase "+phase+" - hands")
		
		
		if phase <=3
			SlaveTats.simple_add_tattoo(npcs_ref[slot], "Being a cow", color + " phase "+phase+" - feet")
		endif
		if phase >= 9
			SlaveTats.simple_add_tattoo(npcs_ref[slot], "Being a cow", color + " phase "+phase+" - head")
		endif
		
		if phase >=1 && phase < 4
			SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", "brown connect")
			SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", "brown connect h")	
			SlaveTats.simple_add_tattoo(npcs_ref[slot], "Being a cow", "brown connect h")
		endIf
		if phase >= 4
			SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", "brown connect")
			SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", "brown connect h")	
			SlaveTats.simple_add_tattoo(npcs_ref[slot], "Being a cow", "brown connect")
		endIf
		
		npcs_lastKnownTato[slot] =  color + " phase "+phase
	endIf
endFunction

function removeTats(int slot, int ignorePhase = -1, String color)
	return
	if BACConfig.slaveTatsPack == false
		return
	endIf	
	if ignorePhase == -1
		npcs_lastKnownTato[slot] =  ""
	endIf
	
	int i = 1

	while i < 9
		if i != ignorePhase
		;Debug.notification("Slot"+slot+ ", "+ color + " phase "+i+" - ...")
			;String color = "Brown"
			SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", color + " phase "+i+" - body")				
			SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", color + " phase "+i+" - head")				
			SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", color + " phase "+i+" - feet")				
			SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", color + " phase "+i+" - hands")		
			;color = "White"
			;SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", color + " phase "+i+" - body")				
			;SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", color + " phase "+i+" - head")				
			;SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", color + " phase "+i+" - feet")				
			;SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", color + " phase "+i+" - hands")				
		endIf
		i+=1
	endWhile
	SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", "brown connect")
	SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", "brown connect h")	
	
	
	
	
endFunction

function reequipItems(int slot, bool quick = false)


	if BACConfig.equipJob == true
		return
	endIf
	BACConfig.equipJob = true

	;BACConfig.maintenance = true

	BACUtilities.log("Actor::reequipItems["+slot+"]","Start")
;BACUtilities.log("Actor::pain["+slot+"]",)
	
	
	;tats colour

	
	;Debug.SendAnimationEvent(npcs_ref[slot],"ZazAPCAOMilk01Massage");
	
	
	Armor horns = none
	Armor tails = none
	Armor hooves = none
	Armor hoovesHands = none
	Armor udders = none 	
	Armor ears = none
	Armor noserings = none
	Armor bell = none
	Armor ringnoseshadow = none
	Armor wet = none
	
	
	Int weight = 0
	
	Int TatPhase = -1
	
	
	
	if npcs_phase[slot] >= 1		
		horns = BACConfig.horns[0]
		if npcs_ref[slot] == Game.getPlayer()
		
			;add marged models
			if BACConfig.bell[0] ==  BACStore.bac_cowbell
				BACConfig.bell[0] = BACStore.bac_cowbell_ring_45
				BACConfig.noserings[0] = BACStore.bac_cowbell_ring_44
			endif
			if BACConfig.bell[0] ==  BACStore.bac_cowbellbig
				BACConfig.bell[0] = BACStore.bac_cowbell_ring_big_45
				BACConfig.noserings[0] = BACStore.bac_cowbell_ring_big_44
			endif
			
			noserings = BACConfig.noserings[0]	;hunt quest
			bell = BACConfig.bell[0]
			
			if bell == BACStore.bac_cowbell_ring_45
				ringnoseshadow = BACStore.bac_cowbell_ring_47
			endif
			
			if bell == BACStore.bac_cowbell_ring_big_45
				ringnoseshadow = BACStore.bac_cowbell_ring_big_47
			endif
			
		endif
		weight = 0
	endIf
	
	if npcs_phase[slot] >= 2		
		horns = BACConfig.horns[1]		
		;weight = 1
	endIf
	
	if npcs_phase[slot] >= 3		
		ears = BACConfig.ears[0]
		;weight = 
	endIf
	
	if npcs_phase[slot] >= 4
		ears = BACConfig.ears[1]
		weight = 1
	endIf
	
	if npcs_phase[slot] >= 5
		horns = BACConfig.horns[2]			;horns are ready
		weight = 2
	endIf

	if npcs_phase[slot] >= 6
		ears = BACConfig.ears[2]			;ears are ready
		ears = BACConfig.ears[3]			;ears are ready
		horns = BACConfig.horns[3]			;horns are ready
	endIf

	if npcs_phase[slot] >= 7
		hooves = BACConfig.hooves[0]
		weight = 3
	endIf	

	if npcs_phase[slot] >= 8			
		TatPhase = 1
		weight = 5
	endIf	
	
	if npcs_phase[slot] >= 9
		hooves = BACConfig.hooves[1]		;hooves are readt		
	endIf	
	
	if npcs_phase[slot] >= 10	
		TatPhase = 2
		weight = 10
	endIf	
	
		if npcs_phase[slot] >= 11
		tails = BACConfig.tails[0]
		weight = 15
	endIf	
	
	if npcs_phase[slot] >= 12
		hoovesHands = BACConfig.hoovesHands[0]
		TatPhase = 3
		weight = 20
	endif

	



	if npcs_phase[slot] >= 13
		tails = BACConfig.tails[1]			;tail are ready
		weight = 25		
	endIf	

	if npcs_phase[slot] >= 14
		hooves = BACConfig.hooves[2]
		TatPhase = 4		
		weight = 30		
	endif	
	
	if npcs_phase[slot] >= 15
		TatPhase = 5
		weight = 35		
	endif
	
	if npcs_phase[slot] >= 16
		udders = BACConfig.udders[0]
		TatPhase = 6
		weight = 40		
	endif
	
	if npcs_phase[slot] >= 17		
		TatPhase = 7
		weight = 50		
	endif		

	if npcs_phase[slot] >= 18
		udders = BACConfig.udders[1]
		TatPhase = 8
		weight = 60		
	endif	

	if npcs_phase[slot] >= 19
		TatPhase = 9		
	endif	
	
	if npcs_wetCow[slot] == true 
	  wet = BACConfig.wet[0]
	endif
	
	if npcs_hornyCow[slot] == true
		wet = BACConfig.wet[1]
	endif

	;noserings = BACConfig.noserings[2]
	
	;if npcs_phase[slot] == 355
	;	horns = BACConfig.horns[2]		
	;	tails = BACConfig.tails[2]
	;	hooves = BACConfig.hooves[2]
	;	udders = BACConfig.udders[2]
	;endIf
	if BACConfig.allowPhaseTats == false
			TatPhase=-1
		endif
	if quick==false
		changeBodyWeight(npcs_ref[slot],getWeightFromActor(slot))
		changeGrowth(slot)
		addOverlayFur(slot,TatPhase)
		addOverlayTats(slot)
		ActorOverlayCommit(npcs_ref[slot])
	endif
	

	
	
	if TatPhase>-1 && quick == false
	
		if BACConfig.allowToSpreadColours == false
			if TatPhase > 3
				TatPhase = 3
			endif
		endif
		
	
		;SlaveTats.simple_remove_tattoo(npcs_ref[slot], "DTTatsDays", "day"+day)	
		;SlaveTats.simple_remove_tattoo(npcs_ref[slot], "DTTatsDays", "day"+dayMinusOne)
		
		int tatsModif = 0
		
		if npcs_openassfurCow[slot]==true
			tatsModif = 3
		endif
		
		;addTats(slot,getColorName(npcs_color[slot] + tatsModif),TatPhase)
	
	
	endIf
		;now always

	
	;quest 
	if npcs_ref[slot] == Game.getPlayer()
	
		if npcs_bigUdders[slot] == true
			udders = BACConfig.udders[2]
		endif
	
		if hooves == BACConfig.hooves[2]
			if BACConfig.hooves[3] != None
				hooves = BACConfig.hooves[3]
			endif
		endif
		
		
		if BACConfig.hoovesHands[1] != None
				hoovesHands = BACConfig.hoovesHands[1]
		endif
		
		
	endif
	
	if BACConfig.solveUdders == false
		udders = none
	endIf	
	if BACConfig.solveHands == false
		hoovesHands = none
	endIf
	
	
	BACUtilities.log("BACActor::reequipItems","Hardcore mode:"+ BACConfig.hardcoreMode as int)

	if Utility.randomInt(0,10)==0
		removeAdditionalItems(slot)
	endif
	
	if npcs_punishItem[slot]>=1
		Armor[] tmp
		tmp = new Armor[1]
		tmp[0] = BACStore.bac_punish01
		
		if tryToRemove(npcs_ref[slot], 42, tmp, BACStore.bac_punish01) == false
			npcs_ref[slot].addItem(BACStore.bac_punish01,1,true)
			npcs_ref[slot].EquipItem(BACStore.bac_punish01,true,true)
		endIf
	else
		npcs_ref[slot].UnequipItem(BACStore.bac_punish01,true,true)		
	endif

	if npcs_punishItem[slot]>=2
		Armor[] tmp
		tmp = new Armor[1]
		tmp[0] = BACStore.bac_punish02
		if tryToRemove(npcs_ref[slot], 32, tmp, BACStore.bac_punish02) == false
			if isAbleToEquip(npcs_ref[slot],32)
				npcs_ref[slot].addItem(BACStore.bac_punish02,1,true)
				npcs_ref[slot].EquipItem(BACStore.bac_punish02,false,true)
			endif
		endIf
	else
		npcs_ref[slot].UnequipItem(BACStore.bac_punish02,true,true)		
	endif

	if npcs_punishItem[slot]>=3
		Armor[] tmp
		tmp = new Armor[1]
		tmp[0] = BACStore.bac_punish03
		if tryToRemove(npcs_ref[slot], 53, tmp, BACStore.bac_punish03) == false
			if isAbleToEquip(npcs_ref[slot],53)
				npcs_ref[slot].addItem(BACStore.bac_punish03,1,true)
				npcs_ref[slot].EquipItem(BACStore.bac_punish03,false,true)
			endif
		endIf
	else
		npcs_ref[slot].UnequipItem(BACStore.bac_punish03,true,true)		
	endif
	
	if wet != None
		if tryToRemove(npcs_ref[slot], 61, BACConfig.wet, wet) == false
			if isAbleToEquip(npcs_ref[slot],61)
				npcs_ref[slot].addItem(wet,1,true)
				npcs_ref[slot].EquipItem(wet,false,true)
			endif
		endIf
	endIf
	
	if bell != None
		if tryToRemove(npcs_ref[slot], 45, BACConfig.bell, bell) == false
			if isAbleToEquip(npcs_ref[slot],45)
				npcs_ref[slot].addItem(bell,1,true)
				npcs_ref[slot].EquipItem(bell,false,true)
				ringnoseshadow = none ; cancel shadow
			endif
		endIf
	endIf
	
	if noserings != None
		if tryToRemove(npcs_ref[slot], 44, BACConfig.noserings, noserings) == false
			if isAbleToEquip(npcs_ref[slot],44)
				npcs_ref[slot].addItem(noserings,1,true)
				npcs_ref[slot].EquipItem(noserings,false,true)
				ringnoseshadow = none ; cancel shadow
			endif
		endIf
	endIf	
	;alt bell and ring set (backpack)
	
	
	if BACConfig.allowHooves==false
		hooves = none
	endif
	if BACConfig.allowHandHooves==false
		hoovesHands = none
	endif
	if BACConfig.allowTails==false
		tails = none
	endif
	if BACConfig.allowHornsAndEars==false
		ears = none
		horns = none
	endif
	
	if ringnoseshadow != None
	
	Armor[] tmp
		tmp = new Armor[2]
		tmp[0] = BACStore.bac_cowbell_ring_47
		tmp[1] = BACStore.bac_cowbell_ring_big_47
	
		if tryToRemove(npcs_ref[slot], 47, tmp, ringnoseshadow) == false
			if isAbleToEquip(npcs_ref[slot],47)
				npcs_ref[slot].addItem(ringnoseshadow,1,true)
				npcs_ref[slot].EquipItem(ringnoseshadow,false,true)
			endif		
		endif
	endIf
	
	if ears != None
		if tryToRemove(npcs_ref[slot], 55, BACConfig.ears, ears) == false
			if isAbleToEquip(npcs_ref[slot],55)
				npcs_ref[slot].addItem(ears,1,true)
				npcs_ref[slot].EquipItem(ears,BACConfig.hardcoreMode,true)
			endif
		endIf
	endIf
	
	
	if horns != None
		if tryToRemove(npcs_ref[slot], 42, BACConfig.horns, horns) == false
			if isAbleToEquip(npcs_ref[slot],42)
				npcs_ref[slot].addItem(horns,1,true)
				npcs_ref[slot].EquipItem(horns,BACConfig.hardcoreMode,true)
			endif
		endIf
	endIf
	
	if tails != None
		if tryToRemove(npcs_ref[slot], 40, BACConfig.tails, tails) == false
			if isAbleToEquip(npcs_ref[slot],40)
				npcs_ref[slot].addItem(tails,1,true)
				npcs_ref[slot].EquipItem(tails,BACConfig.hardcoreMode,true)
			endif
		endIf
	endIf

	if udders != None
		if tryToRemove(npcs_ref[slot], 53, BACConfig.udders, udders) == false
			if isAbleToEquip(npcs_ref[slot],53)
				npcs_ref[slot].addItem(udders,1,true)
				npcs_ref[slot].EquipItem(udders,BACConfig.hardcoreMode,true)
			endif
		endIf
	endIf
	
	if hooves != None
		if tryToRemove(npcs_ref[slot], 37, BACConfig.hooves, hooves) == false
			if isAbleToEquip(npcs_ref[slot],37)				
				npcs_ref[slot].addItem(hooves,1,true)
				npcs_ref[slot].EquipItem(hooves,BACConfig.hardcoreMode,true)
			endif
		endIf
	endIf

	if hoovesHands != None
		if tryToRemove(npcs_ref[slot], 33, BACConfig.hoovesHands, hoovesHands) == false
			if isAbleToEquip(npcs_ref[slot],33)
				npcs_ref[slot].addItem(hoovesHands,1,true)
				npcs_ref[slot].EquipItem(hoovesHands,BACConfig.hardcoreMode,true)
			endIf
		endIf
	endIf	
	
	
	BACConfig.equipJob = false
	;BACConfig.maintenance = false
	
endFunction


float function getWeightFromActor(int slot)
	
	;if not support weight
	if BACConfig.allowToChangeBodyWeight==false
		return npcs_ref[slot].GetActorBase().GetWeight() as float
	endif
	float weight = 0

	if npcs_phase[slot] >= 4	
		weight = 1
	endIf
	
	if npcs_phase[slot] >= 5		
		weight = 2
	endIf

	if npcs_phase[slot] >= 7
		weight = 3
	endIf	

	if npcs_phase[slot] >= 8			
		weight = 5
	endIf	
	
	if npcs_phase[slot] >= 10	
		weight = 10
	endIf	
	
	if npcs_phase[slot] >= 11
		weight = 15
	endIf	
	
	if npcs_phase[slot] >= 12
		weight = 20
	endif

	if npcs_phase[slot] >= 13
		weight = 25		
	endIf	

	if npcs_phase[slot] >= 14
		weight = 30		
	endif	
	
	if npcs_phase[slot] >= 15
		weight = 35		
	endif
	
	if npcs_phase[slot] >= 16
		weight = 40		
	endif
	
	if npcs_phase[slot] >= 17		
		weight = 50		
	endif		

	if npcs_phase[slot] >= 18
		weight = 60		
	endif	
	
	if npcs_fatCow[slot] == true
	  weight = weight + 10
	endIf

	if npcs_fatCow2[slot] == true
	  weight = weight + 10
	endIf	

	if npcs_slimCow[slot] == true
	  weight = weight - 15
	endIf

	if npcs_slimCow2[slot] == true
	  weight = weight - 15
	endIf	
	
	if  BACConfig.supportDynamicWeight==true
		weight = weight + npcs_weightMod[slot]
	endif
	
	if weight > 100
		weight = 100
	endIf

	if weight < 0
		weight = 0
	endif

	return weight

endFunction




function changeBodyWeight(Actor acActor, Float weight)
	
	int actorSlot = isRegistered(acActor)
	
	weight = weight + npcs_orgWeight[actorSlot]
	
	;if BACConfig.allowToChangeBodyWeight==false
	
	;	return
	;endif
	

;	if npcs_fatCow[actorSlot] == true
	  ;weight = weight + 10
	;endIf

	;if npcs_fatCow2[actorSlot] == true
	 ; weight = weight + 10
	;endIf	

	;if npcs_slimCow[actorSlot] == true
	  ;weight = weight - 15
	;endIf

	;if npcs_slimCow2[actorSlot] == true
	  ;weight = weight - 15
	;endIf	
	
	;if  BACConfig.supportDynamicWeight==true
	;	weight = weight + npcs_weightMod[actorSlot]
	;endif
	
	if weight > 100
		weight = 100
	endIf

	if weight < 0
		weight = 0
	endif
	
	float PlayerOrigWeight = acActor.GetWeight() ;Collect the Player's original weight.
	float PlayerNewWeight = weight
	
	;nothing to do? so skip!
	if weight == PlayerOrigWeight
		;DTTools.log2("DTBody::setActorWeight","Skip ->Input weight:"+weight+", current weight:"+PlayerNewWeight)
		return
	endIf
	
	Float NeckDelta = (PlayerOrigWeight / 100) - (PlayerNewWeight / 100) ;Work out the neckdelta.
	
	;DTTools.log2("DTBody::setActorWeight","NeckDelta: "+NeckDelta)
	
	if BACConfig.allowToChangeBodyWeight==true
		if PlayerOrigWeight < weight
			acActor.GetActorBase().SetWeight(weight) 
			acActor.UpdateWeight(NeckDelta) ;Apply the changes.
			acActor.QueueNiNodeUpdate() ;Apply the changes.
		endif
	endif
	 
	 
	 if weight > 50 && BACConfig.allowToLegsDeformation == true
	 
		float fat1 = BACConfig.fatFactor1
		float fat2 = BACConfig.fatFactor2
		if (acActor == Game.getPlayer())
			fat1 = BACConfig.PlayerfatFactor1
			fat2 = BACConfig.PlayerfatFactor2
			
		endif
		float param = 1 + (fat1 * ((weight/2)/ 50))
		;DTTools.log2("DTBody::setActorWeight","Thigh factor "+param)
			NiOverride.AddNodeTransformScale(acActor,False,True,"NPC L Thigh [LThg]","BAC", param )
			NiOverride.AddNodeTransformScale(acActor,False,True,"NPC L Calf [LClf]","BAC",  2 - (param*fat2) )	;was 1.2
			NiOverride.AddNodeTransformScale(acActor,False,True,"NPC R Thigh [RThg]","BAC", param )
			NiOverride.AddNodeTransformScale(acActor,False,True,"NPC R Calf [RClf]","BAC",  2 - (param*fat2) )
			NiOverride.UpdateNodeTransform(acActor, false, True, "NPC L Thigh [LThg]")
			NiOverride.UpdateNodeTransform(acActor, false, True, "NPC L Calf [LClf]")
			NiOverride.UpdateNodeTransform(acActor, false, True, "NPC R Thigh [RThg]")
			NiOverride.UpdateNodeTransform(acActor, false, True, "NPC R Calf [RClf]")
			
			param = 1 + (fat1 * ((weight/2)/ 50))
			
			if npcs_lymphedema[actorSlot] == true
				NiOverride.AddNodeTransformScale(acActor,False,True,"NPC L UpperArm [LUar]","BAC", param )
				NiOverride.AddNodeTransformScale(acActor,False,True,"NPC L Forearm [LLar]","BAC",  2 - (param*fat2) )	;was 1.2
				NiOverride.UpdateNodeTransform(acActor, false, True, "NPC L UpperArm [LUar]")
				NiOverride.UpdateNodeTransform(acActor, false, True, "NPC L Forearm [LLar]")
			
				NiOverride.AddNodeTransformScale(acActor,False,True,"NPC R UpperArm [RUar]","BAC", param )
				NiOverride.AddNodeTransformScale(acActor,False,True,"NPC R Forearm [RLar]","BAC",  2 - (param*fat2) )	;was 1.2
				NiOverride.UpdateNodeTransform(acActor, false, True, "NPC R UpperArm [RUar]")
				NiOverride.UpdateNodeTransform(acActor, false, True, "NPC R Forearm [RLar]")					
				
			endif
			
	else
		NiOverride.RemoveNodeTransformScale(acActor,False,True,"NPC L UpperArm [LUar]","BAC")    
		NiOverride.RemoveNodeTransformScale(acActor,False,True,"NPC L Forearm [LLar]","BAC")
		NiOverride.RemoveNodeTransformScale(acActor,False,True,"NPC R UpperArm [RUar]","BAC")
		NiOverride.RemoveNodeTransformScale(acActor,False,True,"NPC R Forearm [RLar]","BAC")

		NiOverride.RemoveNodeTransformScale(acActor,False,True,"NPC R Calf [RClf]","BAC")    
		NiOverride.RemoveNodeTransformScale(acActor,False,True,"NPC L Calf [LClf]","BAC")
		NiOverride.RemoveNodeTransformScale(acActor,False,True,"NPC L Thigh [LThg]","BAC")
		NiOverride.RemoveNodeTransformScale(acActor,False,True,"NPC R Thigh [RThg]","BAC")

		NiOverride.UpdateNodeTransform(acActor, false, True, "NPC R Calf [RClf]")
		NiOverride.UpdateNodeTransform(acActor, false, True, "NPC L Calf [LClf]") 
		NiOverride.UpdateNodeTransform(acActor, false, True, "NPC L Thigh [LThg]") 
		NiOverride.UpdateNodeTransform(acActor, false, True, "NPC R Thigh [RThg]") 
		NiOverride.UpdateNodeTransform(acActor, false, True, "NPC L UpperArm [LUar]")
		NiOverride.UpdateNodeTransform(acActor, false, True, "NPC L Forearm [LLar]")
		NiOverride.UpdateNodeTransform(acActor, false, True, "NPC R UpperArm [RUar]")
		NiOverride.UpdateNodeTransform(acActor, false, True, "NPC R Forearm [RLar]")	
		
	endif
	
	
	
	if BACConfig.slifPack == true
		
		; belly = 100
		; now = ?
		
		float extraValue = 0
		if BACConfig.slifExtraValue == true
		extraValue = 1.0
		endif
		float pregModif = 1.0
		if npcs_pregCow[actorSlot] == true
			pregModif = BACConfig.bellyMultFakePreg
		endif
		
		if BACConfig.bodyBelly > 0 && ( npcs_curvyCow[actorSlot] || npcs_pregCow[actorSlot] == true)
			SLIF_Main.inflate(acActor, "BAC", "slif_belly", (pregModif * ((BACConfig.bodyBelly * weight as float) / 100)) as float + extraValue, -1, -1, "BAC")
		else
			SLIF_Main.unregisterNode(acActor, "slif_belly", "BAC")
		
		endIf

		if BACConfig.bodyButt > 0  && npcs_curvyCow[actorSlot]
			SLIF_Main.inflate(acActor, "BAC", "slif_butt", ((BACConfig.bodyButt* weight as float) / 100) as float + extraValue, -1, -1, "BAC")
		else
			SLIF_Main.unregisterNode(acActor, "slif_butt", "BAC")
		endIf		
		
		if npcs_cowAsBreasts[actorSlot]==true
			float r_breast_size = SLIF_Main.GetValue(acActor, "All Mods", "slif_right_breast")
			;SLIF_Main.inflate(acActor, "BAC", "slif_left_breast", r_breast_size*1.1, -1, -1, "BAC")
			SLIF_Main.inflate(acActor, "BAC", "slif_left_breast", 2, -1, -1, "BAC")
		else
			SLIF_Main.unregisterNode(acActor, "slif_left_breast", "BAC")		
		endif
		
		if npcs_cowAsBreasts2[actorSlot]==true
			SLIF_Main.inflate(acActor, "BAC", "slif_left_breast", 3.5, -1, -1, "BAC")
		else
		endif

	
	endIf
	
endFunction

bool function isAbleToEquip(Actor acActor, Int slot)

	BACUtilities.log("Equip::AbleTest","Try to add to actor "+acActor+" item to slot "+slot)
	if BACConfig.hardcoreMode == true
		BACUtilities.log("Equip::AbleTest","Hardcore mode - always true")
		return true
	endif
	
	Armor test = acActor.GetWornForm(BACConfig.slotMask[slot]) as Armor
	BACUtilities.log("Equip::AbleTest","Founded armor in slot "+ slot + " This armor: " + test)
	if test == None
		BACUtilities.log("Equip::AbleTest","Empty slot - sure")
		return true
	EndIf
	BACUtilities.log("Equip::AbleTest","No Empty slot - noway")
	return false

endFunction

bool function tryToRemove(Actor acActor, Int slot, Armor[] list, Armor item)

	int i = 0
	if item==none
		while i < list.length 
			
			BACUtilities.log("BACActor::tryToRemove","Removing item from list: "+ list + " with index " + i)
			;if acActor.GetWornForm(BACConfig.slotMask[slot]) as Armor == list[i]
				if list[i]!=None
					acActor.UnequipItem(list[i],false,true)
					acActor.UnequipItem(list[i],true,true)
					acActor.removeItem(list[i],1,true)
					acActor.removeItem(list[i],2,true)
					acActor.removeItem(list[i],3,true)
				endif
		;	endIf
			
		i+=1
		endWhile
	endIf

	bool isWear = false
	
	if acActor.GetWornForm(BACConfig.slotMask[slot]) as Armor == item
		isWear = true
	endIf
	
	i = 0

    while i < list.length 
			if list[i]!= item
				if list[i]!=None
					if acActor.GetWornForm(BACConfig.slotMask[slot]) as Armor == list[i]
						acActor.UnequipItem(list[i],false,true)
						acActor.UnequipItem(list[i],true,true)
						acActor.removeItem(list[i],1,true)
						acActor.removeItem(list[i],2,true)
						acActor.removeItem(list[i],3,true)
					endif
				endIf
			endIf
		i+=1
	endWhile
	
	return isWear
	
endFunction


function randomAttribute(Int slot)
	;if npcs_ref[slot] != Game.getPlayer()
	;	return
	;endif
	
	bool found = false
	int secCounter = 0
	int jump = 0
	int max = 28
	
	while ( found == false )
		secCounter = secCounter + 1
		
		
		if Utility.randomInt(jump,max)==max && npcs_shortBody[slot] == false &&  npcs_tallBody[slot] == false && BACConfig.enabled_npcs_shortBody == true
			npcs_shortBody[slot] = true
			changeGrowth(slot)
			;debug.notification("BAC Mutation: short body")
			return
		endIf		
		if Utility.randomInt(jump,max)==max && npcs_shortBody[slot] == false &&  npcs_tallBody[slot] == false && BACConfig.enabled_npcs_tallBody == true
			npcs_tallBody[slot] = true
			changeGrowth(slot)
			;debug.notification("BAC Mutation: tall body")
			return
		endIf
		
		if Utility.randomInt(jump,max)==max && npcs_cowAsBreasts[slot] == false && BACConfig.slifPack==true && BACConfig.enabled_npcs_cowAsBreasts == true
			npcs_cowAsBreasts[slot] = true
			reequipItems(slot,true)
			;debug.notification("BAC Mutation: Uneven breast")
			return
		endIf
		
		if Utility.randomInt(jump,max)==max && npcs_cowAsBreasts[slot] == true && npcs_cowAsBreasts2[slot] == false && BACConfig.slifPack==true && BACConfig.enabled_npcs_cowAsBreasts2 == true
			npcs_cowAsBreasts2[slot] = true
			reequipItems(slot,true)
			;debug.notification("BAC Mutation: Uneven breast II")
			return
		endIf
	
		if Utility.randomInt(jump,max)==max && npcs_veinsCow1[slot] == false && BACConfig.slaveTatsPack == true && BACConfig.allowTats == true  && BACConfig.enabled_npcs_veinsCow == true
			;debug.messagebox("dirt cow!")
			npcs_veinsCow1[slot] = true		
			ActorOverlayRemove(npcs_ref[slot], "body", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "hand", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "feet", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "face", "dirt",false )			
			;SlaveTats.simple_add_tattoo(npcs_ref[slot], "Being a cow", "BMutation1")			
			;debug.notification("BAC Mutation: Veins")
			return
		endIf

		if Utility.randomInt(jump,max)==max && npcs_veinsCow1[slot] == true && npcs_veinsCow2[slot] == false && BACConfig.slaveTatsPack == true && BACConfig.allowTats == true && BACConfig.enabled_npcs_veinsCow2 == true
			;debug.messagebox("dirt cow!")
			npcs_veinsCow2[slot] = true		
			ActorOverlayRemove(npcs_ref[slot], "body", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "hand", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "feet", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "face", "dirt",false )		
			;debug.notification("BAC Mutation: Veins II")			
			;SlaveTats.simple_add_tattoo(npcs_ref[slot], "Being a cow", "BMutation2")			
			;SlaveTats.simple_remove_tattoo(npcs_ref[slot], "Being a cow", "BMutation1")	
			return
		endIf
		
		if Utility.randomInt(jump,max)==max && npcs_dirtCow[slot] == false && BACConfig.slaveTatsPack == true && BACConfig.allowTats == true && BACConfig.enabled_npcs_dirtCow == true
			;debug.messagebox("dirt cow!")
			npcs_dirtCow[slot] = true
			;SlaveTats.simple_add_tattoo(npcs_ref[slot], "Being a cow", "DirtBody")	
			;SlaveTats.simple_add_tattoo(npcs_ref[slot], "Being a cow", "DirtFace")	
			;SlaveTats.simple_add_tattoo(npcs_ref[slot], "Being a cow", "DirtFeet")	
			;SlaveTats.simple_add_tattoo(npcs_ref[slot], "Being a cow", "DirtHands")
			
			;debug.notification("BAC Mutation: Dirty cow")
			return
		endIf
		
		if Utility.randomInt(jump,max)==max && npcs_celluliteCow[slot] == false && BACConfig.slaveTatsPack == true && BACConfig.allowTats == true && BACConfig.enabled_npcs_celluliteCow==true
			;debug.messagebox("dirt cow!")
			npcs_celluliteCow[slot] = true
			ActorOverlayRemove(npcs_ref[slot], "body", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "hand", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "feet", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "face", "dirt",false )
			; SlaveTats.simple_add_tattoo(npcs_ref[slot], "Being a cow", "Cellulite")
			;debug.notification("BAC Mutation: Cellulite skin")	
			return
		endIf
		
		if Utility.randomInt(jump,max)==max && npcs_untamedMilk[slot] == true && npcs_breastStratches[slot] == false && BACConfig.slaveTatsPack == true && BACConfig.allowTats == true && BACConfig.enabled_npcs_breastStratches==true
			npcs_breastStratches[slot] = true
			addOverlayTats(slot)
			;debug.notification("BAC Mutation: Breasts stratches")
		endif
		
		if Utility.randomInt(jump,max)==max && npcs_celluliteCow[slot] == true && npcs_assStratches[slot] == false && BACConfig.slaveTatsPack == true && BACConfig.allowTats == true && BACConfig.enabled_npcs_assStratches==true
			npcs_assStratches[slot] = true
			addOverlayTats(slot)
			
		endif		
		
		if Utility.randomInt(jump,max)==max && npcs_celluliteCow[slot] == true && npcs_celluliteCow2[slot] == false && BACConfig.slaveTatsPack == true && BACConfig.allowTats == true && BACConfig.enabled_npcs_celluliteCow2==true
			npcs_celluliteCow2[slot] = true
			addOverlayTats(slot)
		endif
		
		
		
		
		if Utility.randomInt(jump,max)==max && npcs_bigUdders[slot] == false && BACConfig.solveUdders == true && npcs_phase[slot]>18 && BACConfig.enabled_npcs_bigUdders == true
			;debug.messagebox("wet cow!")
				npcs_bigUdders[slot] = true
				reequipItems(slot,true)
			return
		endIf
		
		
		if Utility.randomInt(jump,max)==max && npcs_untamedMilk[slot] == false && BACConfig.enabled_npcs_untamedMilk == true
			;debug.messagebox("wet cow!")
			  npcs_untamedMilk[slot] = true		
			ActorOverlayRemove(npcs_ref[slot], "body", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "hand", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "feet", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "face", "dirt",false )			  
			return
		endIf		
		
		if Utility.randomInt(jump,max)==max && npcs_wetCow[slot] == false && BACConfig.enabled_npcs_wetCow == true
			;debug.messagebox("wet cow!")
			  npcs_wetCow[slot] = true
			ActorOverlayRemove(npcs_ref[slot], "body", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "hand", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "feet", "dirt",false )
			ActorOverlayRemove(npcs_ref[slot], "face", "dirt",false )
			  if Game.getPlayer() == npcs_ref[slot] && BACConfig.showNotifications==true
			 Debug.messagebox("BAC: Your vagina is now noticeable wet. Always wet.")
			 endif
			return
		endIf

		if Utility.randomInt(jump,max)==max && npcs_hornyCow[slot] == false && npcs_wetCow[slot] == true && BACConfig.enabled_npcs_hornyCow == true
			;debug.messagebox("wet cow!")
			  npcs_hornyCow[slot] = true
			  if Game.getPlayer() == npcs_ref[slot] && BACConfig.showNotifications==true
			  Debug.messagebox("BAC: Your vagina is shaked by spontaneous squirts.")
			  endif
			return
		endIf		
		
		
		;
		if Utility.randomInt(jump,max)==max && npcs_openassfurCow[slot] == false && BACConfig.allowToSpreadColours == true && BACConfig.slaveTatsPack && BACConfig.enabled_npcs_openassfurCow == true
			;debug.messagebox("wet cow!")
			  npcs_openassfurCow[slot] = true
			  
			    ;removeTats(slot,-1,getColorName(npcs_color[slot]))
							
				;reequipItems(slot,false)
				
			  if Game.getPlayer() == npcs_ref[slot] && BACConfig.showNotifications==true
				Debug.messagebox("BAC: Your butt is exposed by fur!")
			  endif
			return
		endIf	
		
		if Utility.randomInt(jump,max)==max && npcs_hornyCow[slot] == true && npcs_pregCow[slot] == false && BACConfig.slifPack == true && BACConfig.enabled_npcs_pregCow == true
			;debug.messagebox("wet cow!")
			  npcs_pregCow[slot] = true
			   reequipItems(slot,false)
			  if Game.getPlayer() == npcs_ref[slot] && BACConfig.showNotifications==true
				Debug.messagebox("BAC: Your body thinks that you are pregnant. - Imaginary pregnancy.")
			  endif
			return
		endIf
		
		if Utility.randomInt(jump,max)==max && npcs_pregCow[slot] == true && npcs_pregStratches[slot] == false  && BACConfig.slaveTatsPack &&  BACConfig.enabled_npcs_pregStratches == true
			npcs_pregStratches[slot] = true
			addOverlayTats(slot)
			return
		endIf	

		if Utility.randomInt(jump,max)==max && BACConfig.allowToChangeBodyWeight == true && npcs_slowMetabolism[slot]==false && npcs_fastMetabolism[slot]==false && BACConfig.enabled_npcs_fastMetabolism == true
			;debug.messagebox("fat cow!")
			 npcs_fastMetabolism[slot] = true 
			return
		endIf	

		if Utility.randomInt(jump,max)==max && BACConfig.allowToChangeBodyWeight == true && npcs_slowMetabolism[slot]==false && npcs_fastMetabolism[slot]==false && BACConfig.enabled_npcs_slowMetabolism == true
			;debug.messagebox("fat cow!")
			 npcs_slowMetabolism[slot] = true 
			return
		endIf	
		
		
		if Utility.randomInt(jump,max)==max && npcs_fatCow[slot] == false && BACConfig.allowToChangeBodyWeight == true && npcs_slimCow[slot]==false && BACConfig.enabled_npcs_fatCow == true
			;debug.messagebox("fat cow!")
			 npcs_fatCow[slot] = true	
			 reequipItems(slot,false)
			 if Game.getPlayer() == npcs_ref[slot] && BACConfig.showNotifications==true
			Debug.messagebox("BAC: Your body is very heavy, You are simply fat.")
			endif			
			return
		endIf	 

		if Utility.randomInt(jump,max)==max && npcs_fatCow2[slot] == false && BACConfig.allowToChangeBodyWeight == true && npcs_fatCow[slot]==true && BACConfig.enabled_npcs_fatCow2 == true
			;debug.messagebox("fat cow!")
			 npcs_fatCow2[slot] = true
			  reequipItems(slot,false)
			 if Game.getPlayer() == npcs_ref[slot] && BACConfig.showNotifications==true
			 Debug.messagebox("BAC: Your body is very heavy, You are simply very fat.")
			 endif
			return
		endIf	 		
		
		if Utility.randomInt(jump,max)==max && npcs_fatCow[slot] == true && npcs_curvyCow[slot] == true &&  BACConfig.allowToLegsDeformation == true && BACConfig.enabled_npcs_lymphedema==true
			npcs_lymphedema[slot] = true
			NiOverride.RemoveNodeTransformScale(npcs_ref[slot],False,True,"NPC L UpperArm [LUar]","BAC")    
			NiOverride.RemoveNodeTransformScale(npcs_ref[slot],False,True,"NPC L Forearm [LLar]","BAC")
				NiOverride.RemoveNodeTransformScale(npcs_ref[slot],False,True,"NPC R UpperArm [RUar]","BAC")
				NiOverride.RemoveNodeTransformScale(npcs_ref[slot],False,True,"NPC R Forearm [RLar]","BAC")
				
				NiOverride.UpdateNodeTransform(npcs_ref[slot], false, True, "NPC L UpperArm [LUar]")
				NiOverride.UpdateNodeTransform(npcs_ref[slot], false, True, "NPC L Forearm [LLar]")
				NiOverride.UpdateNodeTransform(npcs_ref[slot], false, True, "NPC R UpperArm [RUar]")
				NiOverride.UpdateNodeTransform(npcs_ref[slot], false, True, "NPC R Forearm [RLar]")		
			reequipItems(slot,false)
			return
		endif

		if Utility.randomInt(jump,max)==max && npcs_slimCow[slot] == false && BACConfig.allowToChangeBodyWeight == true && npcs_fatCow[slot]==false && BACConfig.enabled_npcs_slimCow == true
			;debug.messagebox("fat cow!")
			 npcs_slimCow[slot] = true
			  reequipItems(slot,false)
			 if Game.getPlayer() == npcs_ref[slot] && BACConfig.showNotifications==true
			  Debug.messagebox("BAC: Your body is slimmer than before, You lost some of your weight.")
			  endif
			return
		endIf	 

		if Utility.randomInt(jump,max)==max && npcs_slimCow2[slot] == false && BACConfig.allowToChangeBodyWeight == true && npcs_slimCow[slot]==true && BACConfig.enabled_npcs_slimCow2 == true
			;debug.messagebox("fat cow!")
			 npcs_slimCow2[slot] = true
			  reequipItems(slot,false)
			 if Game.getPlayer() == npcs_ref[slot] && BACConfig.showNotifications==true
			 Debug.messagebox("BAC: Your body is slimmer than before, You will not fat cow.")
			 endif
			return
		endIf	
		
		if Utility.randomInt(jump,max)==max && npcs_curvyCow[slot] == false && BACConfig.slifPack == true && BACConfig.enabled_npcs_curvyCow == true
			;debug.messagebox("shapeCow cow!")
			npcs_curvyCow[slot] = true
			 reequipItems(slot,false)
			if Game.getPlayer() == npcs_ref[slot] && BACConfig.showNotifications==true
			Debug.messagebox("BAC: Your butt and belly seems to grow. You are chubby and curvy.")
			endif
			return
		endIf		
		
		if Utility.randomInt(jump,max)==max && npcs_faceCow[slot] == false && BACConfig.enabled_npcs_faceCow == true
			;debug.messagebox("shapeCow cow!")
			npcs_faceCow[slot] = true
			npcs_ref[slot].GetActorBase().SetFacePreset(4, 0)
			;npcs_ref[slot].GetActorBase().SetFacePreset(8, 2)
			;npcs_ref[slot].GetActorBase().SetFacePreset(11, 3)
			npcs_ref[slot].QueueNiNodeUpdate()
			if Game.getPlayer() == npcs_ref[slot] && BACConfig.showNotifications==true
			Debug.messagebox("BAC: Something happens with your nose.")
			endif
			return
		endIf		
		
		if Utility.randomInt(jump,max)==max &&  npcs_cowNose[slot] == false && npcs_phase[slot]>16 && BACConfig.enabled_npcs_cowNose == true
			;debug.messagebox("shapeCow cow!")
			npcs_cowNose[slot] = true			
			if Game.getPlayer() == npcs_ref[slot] && BACConfig.showNotifications==true
			Debug.messagebox("BAC: Something happens with your nose.")
			endif
			return
		endIf			
	
	
		if Utility.randomInt(jump,max)==max && npcs_faceCow2[slot] == false && npcs_faceCow[slot] == true && BACConfig.enabled_npcs_faceCow2 == true
			;debug.messagebox("shapeCow cow!")
			npcs_faceCow2[slot] = true
			npcs_ref[slot].GetActorBase().SetFacePreset(4, 0)
			;npcs_ref[slot].GetActorBase().SetFacePreset(8, 2)
			npcs_ref[slot].GetActorBase().SetFacePreset(11, 3)
			npcs_ref[slot].QueueNiNodeUpdate()
			if Game.getPlayer() == npcs_ref[slot] && BACConfig.showNotifications==true
			Debug.messagebox("BAC: Something happens with your mouth.")
			endif
			return
		endIf		
	
		if Utility.randomInt(jump,max)==max && npcs_faceCow3[slot] == false && npcs_faceCow2[slot] == true && BACConfig.enabled_npcs_faceCow3 == true
			;debug.messagebox("shapeCow cow!")
			npcs_faceCow3[slot] = true
			npcs_ref[slot].GetActorBase().SetFacePreset(4, 0)
			npcs_ref[slot].GetActorBase().SetFacePreset(8, 2)
			npcs_ref[slot].GetActorBase().SetFacePreset(11, 3)
			npcs_ref[slot].QueueNiNodeUpdate()
			if Game.getPlayer() == npcs_ref[slot] && BACConfig.showNotifications==true
			Debug.messagebox("BAC: Something happens with your eyes.")
			endif
			return
		endIf		
	
		;still nothing? ok go away
		if jump>=max+1
			return
		endif
	
		jump = jump + 1
	
	endWhile	
		
		
	
	
	
	
endFunction


Function ActorOverlayCommit(Actor akActor)
		NiOverride.ApplyNodeOverrides(akActor)
endFunction

Function ActorOverlayRemove(Actor akActor, String bodyPart,String kind, Bool commit = true)


	String NodeName = ActorOverlayGetSlot(akActor,bodyPart,kind)
	if NodeName == ""
		return
	endif

	Bool NodeSex = (akActor.GetLeveledActorBase().GetSex() == 1)
	String textureName = "BAC.Overlay."+kind+"."+bodyPart

	NiOverride.RemoveAllNodeNameOverrides(akActor,NodeSex,NodeName)
	NiOverride.AddNodeOverrideString(akActor,NodeSex,NodeName,9,0,"textures\\Actors\\character\\overlays\\default.dds",TRUE)
	StorageUtil.UnsetStringValue(akActor,textureName)
	if commit == true
		NiOverride.ApplyNodeOverrides(akActor)
	endif

	Return
EndFunction

Function ActorOverlayAdd(Actor akActor, String bodyPart,String kind, String textureName, bool commit = true, float alpha = 1.0)
	String NodeName = ActorOverlayGetSlot(akActor,bodyPart,kind)
	if NodeName == ""
		return
	endif
	textureName = "textures\\Actors\\character\\slavetats\\bac\\"+textureName+".dds"
	BACUtilities.log("BACActor::ActorOverlayGetSlot texture location:",textureName)
	Bool NodeSex = (akActor.GetLeveledActorBase().GetSex() == 1)
	
	NiOverride.AddNodeOverrideString(akActor,NodeSex,NodeName,9, 0,textureName,TRUE)
	NiOverride.AddNodeOverrideFloat(akActor,NodeSex,NodeName,8,-1,alpha,TRUE)
	NiOverride.AddNodeOverrideInt(akActor,NodeSex,NodeName,7,-1,1, TRUE)
	if kind == "assstretch" || kind == "breaststretch" || kind =="bellystretch"
		NiOverride.AddNodeOverrideInt(akActor,NodeSex,NodeName,7,-1,0xffeaea, TRUE)
	endif
	;; NiOverride.AddNodeOverrideInt(Who,NodeSex,NodeName,0,-1,0,TRUE)
	;; NiOverride.AddNodeOverrideFloat(Who,NodeSex,NodeName,0,-1,1.0,TRUE)
	if commit == true
		NiOverride.ApplyNodeOverrides(akActor)
	endif
	
endFunction


String Function ActorOverlayGetSlot(Actor akActor, String bodyPart,String kind )
{find the next available overlay slot, or the slot we were already using.}

	String NodeName

	;; prefix the overlay name.

	String textureName = "BAC.Overlay."+kind+"."+bodyPart

	;; see if we already selected a node.

	NodeName = StorageUtil.GetStringValue(akActor,textureName)
	If(NodeName != "")
		Return NodeName
	EndIf

	;; alright lets find an empty slot and gank it.

	;int Function GetNumBodyOverlays() native global
	;int Function GetNumHandOverlays() native global
	;int Function GetNumFeetOverlays() native global
	;int Function GetNumFaceOverlays() native global
	
	
	Int NodeCount = 0;
	String PartName = "";
	if bodyPart == "body"
		NodeCount = NiOverride.GetNumBodyOverlays()
		PartName = "Body"
	endif
	
	if bodyPart == "hand"
		NodeCount = NiOverride.GetNumHandOverlays()
		PartName = "Hands"
	endif
	
	if bodyPart == "feet"
		NodeCount = NiOverride.GetNumFeetOverlays()
		PartName = "Feet"
	endif

	if bodyPart == "face"
		NodeCount = NiOverride.GetNumFaceOverlays()
		PartName = "Face"
	endif
	
	BACUtilities.log("BACActor::ActorOverlayGetSlot actor:",akActor)
	
	BACUtilities.log("BACActor::ActorOverlayGetSlot NodeCount:",NodeCount)
	BACUtilities.log("BACActor::ActorOverlayGetSlot PartName:",PartName)
	
	Int NodeIter = 0
	Bool NodeSex = (akActor.GetLeveledActorBase().GetSex() == 1)
	String NodeTexture

	While(NodeIter < NodeCount)
		NodeName = PartName+" [Ovl" + NodeIter + "]"
		NodeTexture = NiOverride.GetNodeOverrideString(akActor,NodeSex,NodeName,9,0)

		If(NodeTexture == "" || NodeTexture == "textures\\Actors\\character\\overlays\\default.dds")
			;; mine now.
			StorageUtil.SetStringValue(akActor,textureName,NodeName)
			BACUtilities.log("BACActor::ActorOverlayGetSlot Found free node!:",NodeName)
			Return NodeName
		EndIf

		NodeIter += 1
	EndWhile
	BACUtilities.log("BACActor::ActorOverlayGetSlot Node not found:","-")
	Return ""
EndFunction


String function getColorName(int index)


		
		if index == 0
			return "Brown"
		endif
		if index == 1
			return "White"
		endif		
		if index == 2
			return "Spots"
		endif
		if index == 3
			return "Brown open"
		endif
		if index == 4
			return  "White open"
		endif		
		if index == 5
			return  "Spots open"
		endif		
		return "Brown"
endFunction



function addOverlayFur(int slot,int TatPhase)
	if TatPhase == -1
		return
	endif
	
	
	if BACConfig.allowToSpreadColours == false
		if TatPhase > 4
			TatPhase = 4
		endif
	endIf
	
	
	;addTats(slot,getColorName(npcs_color[slot] + tatsModif),TatPhase)
	String overlayName = getColorName(npcs_color[slot])+"_phase_"
	
	if npcs_openassfurCow[slot]==true && TatPhase>=6
		overlayName = overlayName+"open_"
	endIf
	
	if TatPhase<=9
		overlayName = overlayName+"0"
	endIf
	overlayName = overlayName+TatPhase as String
	
	BACUtilities.log("BACActor::ActorOverlayGetSlot overlayName:",overlayName)
	
	ActorOverlayAdd(npcs_ref[slot], "body", "fur" , overlayName,false)
	
	if TatPhase < 4
		ActorOverlayAdd(npcs_ref[slot], "body", "fur_supp" , "brown_connect_h",false)
	else
		ActorOverlayAdd(npcs_ref[slot], "body", "fur_supp" , "brown_connect",false)
	endIf
	
	;hands
	if npcs_color[slot] == 0
		ActorOverlayAdd(npcs_ref[slot], "hand", "fur" , "brown_hands",false)
	else
		ActorOverlayAdd(npcs_ref[slot], "hand", "fur" , "white_hands",false)
	endif
	
	;feet
	if TatPhase < 4
		ActorOverlayAdd(npcs_ref[slot], "feet", "fur" , overlayName,false)
	else
		ActorOverlayRemove(npcs_ref[slot], "feet", "fur",false )
	endif
	
	if TatPhase == 8
		if npcs_color[slot] == 0
			ActorOverlayAdd(npcs_ref[slot], "face", "fur" , "brown_head",false)
		else
			ActorOverlayAdd(npcs_ref[slot], "face", "fur" , "white_head",false)
		endif
	endif	
	
	if TatPhase == 9
		if npcs_color[slot] == 0
			ActorOverlayAdd(npcs_ref[slot], "face", "fur" , "brown_head2",false)
		else
			ActorOverlayAdd(npcs_ref[slot], "face", "fur" , "white_head2",false)
		endif
	endif	
	
	;connections
	
	;ActorOverlayCommit(npcs_ref[slot])
	
endFunction


function addOverlayTats(int slot)

	BACUtilities.log("BACActor::addOverlayTats","DirtyCow - " + slot + " - " + npcs_dirtCow[slot] as int)
	if npcs_dirtCow[slot] == true && BACConfig.solveDirt == true
		ActorOverlayAdd(npcs_ref[slot], "body", "dirt" , "dirty_body",false,0.5)
		ActorOverlayAdd(npcs_ref[slot], "hand", "dirt" , "dirty_hands",false,0.5)
		ActorOverlayAdd(npcs_ref[slot], "feet", "dirt" , "dirty_body",false,0.5)
		ActorOverlayAdd(npcs_ref[slot], "face", "dirt" , "dirty_face",false,0.5)
		
		
	endif
	
	BACUtilities.log("BACActor::addOverlayTats","npcs_cowNose - " + slot + " - " + npcs_cowNose[slot] as int)
	if 	npcs_cowNose[slot] == true	
		ActorOverlayAdd(npcs_ref[slot], "face", "nose" , "cowface",false)
	endif
	
	
	BACUtilities.log("BACActor::addOverlayTats","breast_mut1 - " + slot + " - " + npcs_veinsCow1[slot] as int)
	if 	npcs_veinsCow1[slot] == true	
		ActorOverlayAdd(npcs_ref[slot], "body", "breastmut" , "breast_mut1",false)
	endif
	
	BACUtilities.log("BACActor::addOverlayTats","breast_mut2 - " + slot + " - " + npcs_veinsCow2[slot] as int)
	if 	npcs_veinsCow2[slot] == true	
		ActorOverlayAdd(npcs_ref[slot], "body", "breastmut" , "breast_mut2",false)
	endif
	
	BACUtilities.log("BACActor::addOverlayTats","npcs_celluliteCow - " + slot + " - " + npcs_celluliteCow[slot] as int)
	if npcs_celluliteCow[slot] == true && npcs_celluliteCow2[slot] == false
		float value = getWeightFromActor(slot)
		ActorOverlayAdd(npcs_ref[slot], "body", "cellulite" , "cellulite",false, value/100)
	endif
	if npcs_celluliteCow[slot] == true && npcs_celluliteCow2[slot] == true
		float value = getWeightFromActor(slot)
		value = value/100
		if value>0.5
			value = 0.5
		endif
		ActorOverlayAdd(npcs_ref[slot], "body", "cellulite2" , "cellulite",false, 0.5 + value)
	endif
	
	if npcs_assStratches[slot] == true 
		ActorOverlayAdd(npcs_ref[slot], "body", "assstretch" , "StretchToosh",false, 0.25)
	endIf	
	
	if npcs_breastStratches[slot] == true 
		ActorOverlayAdd(npcs_ref[slot], "body", "breaststretch" , "StretchBreasts",false,0.35)
	endIf
	if npcs_pregStratches[slot] == true 
		ActorOverlayAdd(npcs_ref[slot], "body", "bellystretch" , "StretchPregnancy",false,0.15)
	endIf
	
	BACUtilities.log("BACActor::addOverlayTats","mark1 - " + slot + " - " + npcs_ref[slot].getFactionRank(bac_mark) as int)
	if npcs_ref[slot].getFactionRank(bac_mark) == 1
		ActorOverlayAdd(npcs_ref[slot], "body", "mark" , "paul",false)
	endif
	
	BACUtilities.log("BACActor::addOverlayTats","mark2 - " + slot + " - " + npcs_ref[slot].getFactionRank(bac_mark) as int)
	if npcs_ref[slot].getFactionRank(bac_mark) == 2
		ActorOverlayAdd(npcs_ref[slot], "body", "mark" , "hunters",false)
	endif
	
	BACUtilities.log("BACActor::addOverlayTats","mark3 - " + slot + " - " + npcs_ref[slot].getFactionRank(bac_mark) as int)
	if npcs_ref[slot].getFactionRank(bac_mark) == 3
		ActorOverlayAdd(npcs_ref[slot], "body", "mark" , "hunters",false)
		ActorOverlayAdd(npcs_ref[slot], "face", "mark" , "hunters_head",false)
	endif
	
	BACUtilities.log("BACActor::addOverlayTats","npcs_untamedMilk - " + slot + " - " + npcs_untamedMilk[slot] as int)
	BACUtilities.log("BACActor::addOverlayTats","npcs_hornyCow - " + slot + " - " + npcs_hornyCow[slot] as int)
	if npcs_untamedMilk[slot] == true && npcs_hornyCow[slot] == false
		ActorOverlayAdd(npcs_ref[slot], "body", "liquid" , "liqb",false)
	endif
	if npcs_untamedMilk[slot] == false && npcs_hornyCow[slot] == true
		ActorOverlayAdd(npcs_ref[slot], "body", "liquid" , "liqv",false)
	endif	
	if npcs_untamedMilk[slot] == true && npcs_hornyCow[slot] == true
		ActorOverlayAdd(npcs_ref[slot], "body", "liquid" , "liqvandb",false)
	endif	
	
	if npcs_punishItem[slot] == 2
		ActorOverlayAdd(npcs_ref[slot], "body", "bbondage" , "BreastOverlayLight",false)
	endif
	
	;ActorOverlayCommit(npcs_ref[slot])
endFunction


; check count of total milk bootles in inventory

int function getTotalMilkCount(int slot)
	int x = 0
	int count = 0
	while x < BACConfig.milks.length
		count = count + npcs_ref[slot].GetItemCount( BACConfig.milks[x] )
		x = x + 1
	endWhile
	return count
endFunction



; remove milk from inventory
; slot - slot in base
; amount - how much
; mustBeAll - will remove only if it is possible


bool function removeMilkFromInventory(int slot, int amount = 1, bool mustBeAll = true)
	if amount > getTotalMilkCount(slot) && mustBeAll
		BACUtilities.log("BACActor::removeMilkFromInventory","Cannot remove milk becouse amount is bigger than inventory store")
		return false
	endif
	int x = 0
	;int removed = amount
	while x < BACConfig.milks.length
		int toRemove = npcs_ref[slot].GetItemCount( BACConfig.milks[x] )
		if toRemove > 0
			if toRemove > amount
				toRemove = amount
			endif
			npcs_ref[slot].RemoveItem(BACConfig.milks[x],toRemove)
			amount = amount - toRemove
		endif
		if amount <= 0 
			BACUtilities.log("BACActor::removeMilkFromInventory","Milk was removed!")
			x = BACConfig.milks.length + 10
			return true
		endif
		x = x + 1
	endWhile
	BACUtilities.log("BACActor::removeMilkFromInventory","This line should never occur, something went wrong - amount to remove: "+ amount)
	return false
endFunction

function changeGrowth(int slot)
if npcs_shortBody[slot] == true
	npcs_ref[slot].GetActorBase().SetHeight(0.92)
endif
if npcs_tallBody[slot] == true
	npcs_ref[slot].GetActorBase().SetHeight(1.11)
endif
endFunction