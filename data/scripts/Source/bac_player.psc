Scriptname bac_player extends Quest  


bac_actor Property BACActor Auto
bac_store Property BACStore Auto
bac_config Property BACConfig Auto

function playSound(int slot, sound effect, float volume = 1.0)

	if BACConfig.addSounds == false
		return
	endif

	int lastPointer = BACActor.npcs_lastSound[slot]
	lastPointer = lastPointer + 1
	if lastPointer > 5
		lastPointer = 1
	endif
	
	 BACActor.npcs_lastSound[slot] = lastPointer
		
	
	if lastPointer == 1
		BACActor.npc_sound1[slot] = effect.play(BACActor.npcs_ref[slot])
		Sound.SetInstanceVolume(BACActor.npc_sound1[slot],volume)
	endif
	
	if lastPointer == 2
		BACActor.npc_sound2[slot] = effect.play(BACActor.npcs_ref[slot])
		Sound.SetInstanceVolume(BACActor.npc_sound2[slot],volume)
	endif
	
	if lastPointer == 3
		BACActor.npc_sound3[slot] = effect.play(BACActor.npcs_ref[slot])
		Sound.SetInstanceVolume(BACActor.npc_sound3[slot],volume)
	endif

	if lastPointer == 4
		BACActor.npc_sound4[slot] = effect.play(BACActor.npcs_ref[slot])
		Sound.SetInstanceVolume(BACActor.npc_sound4[slot],volume)
	endif
	
	if lastPointer == 5
		BACActor.npc_sound5[slot] = effect.play(BACActor.npcs_ref[slot])
		Sound.SetInstanceVolume(BACActor.npc_sound5[slot],volume)
	endif
	
	
endfunction


function playTail(int slot)
	playSound(slot, BACStore.NPCCowTailSwing,0.3)
endfunction

function playStep(int slot)
	;playSound(slot, BACStore.NPCCowFootWalkFront,1.0)
endfunction

function playBreath(int slot)
	playSound(slot, BACStore.bac_breath_marker,1.0)
endfunction


function playMoo(int slot)
	playSound(slot, BACStore.bac_moo,1.0)
endfunction

function playPonyL(int slot)
	;float v = BACConfig.horseshoeVolume as float
	;playSound(slot, BACStore.bac_horseshoeL_marker, v / 100)
endfunction
function playPonyR(int slot)
	;float v = BACConfig.horseshoeVolume as float
	;playSound(slot, BACStore.bac_horseshoeR_marker,v / 100)
endfunction
function playBell(int slot)
	float v = BACConfig.bellVolume as float
	playSound(slot, BACStore.bac_bell_marker,v / 100)
endfunction
