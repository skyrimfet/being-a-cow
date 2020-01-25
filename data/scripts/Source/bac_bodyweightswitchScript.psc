Scriptname bac_bodyweightswitchScript extends activemagiceffect  


bac_actor Property BACActor Auto
Int Slot
Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	

	Slot = BACActor.isRegistered(akTarget)
	
	if Slot == -1
		self.dispel()
		return
	endIf
	if BACActor.npcs_fatCow[Slot]==false &&  BACActor.npcs_slimCow[Slot]==false
	self.dispel()
		return
	endif
	
	if BACActor.npcs_fatCow[Slot]==true
	  if BACActor.npcs_fatCow2[Slot]==true
		BACActor.npcs_slimCow2[Slot]=true
		BACActor.npcs_fatCow2[Slot]=false
	  endif
	  
	  BACActor.npcs_fatCow[Slot] = false
	  BACActor.npcs_slimCow[Slot]=true
	  BACActor.reequipItems(Slot,false)
	  return
	  
	endif

	if BACActor.npcs_slimCow[Slot]==true
	  if BACActor.npcs_slimCow2[Slot]==true
		BACActor.npcs_fatCow2[Slot]=true
		BACActor.npcs_slimCow2[Slot]=false
	  endif
	  
	  BACActor.npcs_slimCow[Slot] = false
	  BACActor.npcs_fatCow[Slot]=true
	  BACActor.reequipItems(Slot,false)
	  return
	  
	endif
	
EndEvent