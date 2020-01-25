Scriptname bac_colorswitchScript extends activemagiceffect  


bac_actor Property BACActor Auto
Int Slot
Int Property newColour Auto
Event OnEffectStart(Actor akTarget, Actor akCaster)
	Slot = BACActor.isRegistered(akTarget)
	
	if Slot == -1
		self.dispel()
		return
	endIf
	
	if newColour == BACActor.npcs_color[Slot] || newColour ==  (BACActor.npcs_color[Slot]+3)
		self.dispel()
		return
	endIf		

	BACActor.removeTats(Slot,-1,BACActor.getColorName(BACActor.npcs_color[slot]))
	BACActor.removeTats(Slot,-1,BACActor.getColorName(3+BACActor.npcs_color[slot]))
	
	BACActor.npcs_color[slot]=newColour
	BACActor.reequipItems(Slot,false)
	return
	
EndEvent