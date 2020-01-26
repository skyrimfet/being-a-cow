Scriptname bac_debugScript extends activemagiceffect  

bac_actor Property BACActor Auto
Event OnEffectStart(Actor akTarget, Actor akCaster)
int Slot = BACActor.isRegistered(akTarget)
BACActor.resetPlayerMutProgress();

BACActor.npcs_phase[Slot] = 15
BACActor.npcs_tallBody[Slot] = true
BACActor.npcs_assStratches[Slot] = true
BACActor.npcs_pregStratches[Slot] = true
BACActor.npcs_breastStratches[Slot] =  true
BACActor.npcs_openassfurCow[Slot] = true
BACActor.npcs_slimCow[Slot] = true
BACActor.npcs_slowMetabolism[Slot] =  true
BACActor.npcs_celluliteCow[Slot] = true
BACActor.npcs_celluliteCow2[Slot] = true 
BACActor.npcs_curvyCow[Slot] = true
BACActor.npcs_lymphedema[Slot] = true
BACActor.npcs_pregCow[Slot] = true
BACActor.npcs_foodPoints[Slot] = 120
BACActor.reequipItems(Slot,false)
BACActor.reequipItems(Slot,true)
	
EndEvent