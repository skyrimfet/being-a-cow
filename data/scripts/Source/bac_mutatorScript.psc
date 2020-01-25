Scriptname bac_mutatorScript extends activemagiceffect  

bac_actor Property BACActor Auto
Int Slot
Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	debug.notification("effect start")
	debug.trace("mutator script run")
	Slot = BACActor.isRegistered(akTarget)
	debug.trace("mutator script run, slot"+Slot)	
	if Slot == -1
		self.dispel()
		return
	endIf
	debug.trace("mutator script wait")	

	;Utility.WaitGameTime(Utility.RandomFloat(0.0,0.1))
	debug.trace("mutator script add random attr")	

	BACActor.randomAttribute(Slot)
	debug.notification("done")
EndEvent
