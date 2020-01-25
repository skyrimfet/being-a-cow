Scriptname bac_levelupScript extends activemagiceffect  

bac_actor Property BACActor Auto
Int Slot
Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	debug.notification("spell level up")
	
	
	Slot = BACActor.isRegistered(akTarget)
	
	debug.notification("spell level up - Slot - "+Slot)
	
	if Slot == -1
		self.dispel()
		return
	endIf
	BACActor.npcs_times[Slot] = BACActor.npcs_phase[Slot] * 100
EndEvent
