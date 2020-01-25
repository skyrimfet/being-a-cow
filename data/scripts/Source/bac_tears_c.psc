Scriptname bac_tears_c extends Quest  

import StorageUtil

bac_quest_ctr Property BACQuestCtrl Auto 
bac_unowned Property BACUnowned Auto
bac_actor Property BACActor Auto
bac_main Property BACMain Auto
bac_store Property BACStore Auto

ObjectReference Property bacHunter001 Auto
ObjectReference Property bacHunter002 Auto
ObjectReference Property bacHunter003 Auto
ObjectReference Property bacHunter004 Auto
ObjectReference Property bacHunter005 Auto
ObjectReference Property bacCowMaster Auto

ObjectReference Property bacDropplace Auto
ObjectReference Property or_chest Auto

ReferenceAlias Property ra_bacPlayer Auto
ReferenceAlias Property ra_bacHunter001 Auto
ReferenceAlias Property ra_bacHunter002 Auto
ReferenceAlias Property ra_bacHunter003 Auto
ReferenceAlias Property ra_bacHunter004 Auto
ReferenceAlias Property ra_bacHunter005 Auto

ReferenceAlias Property racc_bacPlayer Auto
ReferenceAlias Property racc_bacCowMaster Auto

ReferenceAlias Property racc_bacHunter Auto


ReferenceAlias Property bt_cat Auto
ReferenceAlias Property bt_player Auto
ReferenceAlias Property bt_blacksmith Auto

ObjectReference Property obt_cat Auto
ObjectReference Property obt_blacksmith Auto

ObjectReference Property questfurniture Auto

Faction Property bac_hunter_aggressor Auto
Faction Property bac_milkmaid Auto

Quest Property bac_huntersgonnahunt2 Auto
Scene Property bac_huntersgonnahunt2Scene Auto

Quest Property bac_capturedcow2 Auto
Scene Property bac_capturedcow2MainScene Auto 

Scene Property bac_tears1MainScene Auto

Quest Property thisQuest Auto

Bool Property testTrue Auto

function restoreActors()
Actor a 
a = bacHunter001 as Actor
a.removeFromFaction(bac_hunter_aggressor)
a.enable()
a.Resurrect()

a = bacHunter002 as Actor
a.removeFromFaction(bac_hunter_aggressor)
a.enable()
a.Resurrect()

a = bacHunter003 as Actor
a.removeFromFaction(bac_hunter_aggressor)
a.enable()
a.Resurrect()

a = bacHunter004 as Actor
a.removeFromFaction(bac_hunter_aggressor)
a.enable()
a.Resurrect()

a = bacHunter005 as Actor
a.removeFromFaction(bac_hunter_aggressor)
a.enable()
a.Resurrect()

Int n = Utility.randomInt(1,3)

if n == 1
bacHunter001.moveTo(BACUnowned.startPoint001)
bacHunter002.moveTo(BACUnowned.startPoint001)
bacHunter003.moveTo(BACUnowned.startPoint001)
bacHunter004.moveTo(BACUnowned.startPoint001)
bacHunter005.moveTo(BACUnowned.startPoint001)
endif

if n == 2
bacHunter001.moveTo(BACUnowned.startPoint002)
bacHunter002.moveTo(BACUnowned.startPoint002)
bacHunter003.moveTo(BACUnowned.startPoint002)
bacHunter004.moveTo(BACUnowned.startPoint002)
bacHunter005.moveTo(BACUnowned.startPoint002)
endif

if n == 3
bacHunter001.moveTo(BACUnowned.startPoint003)
bacHunter002.moveTo(BACUnowned.startPoint003)
bacHunter003.moveTo(BACUnowned.startPoint003)
bacHunter004.moveTo(BACUnowned.startPoint003)
bacHunter005.moveTo(BACUnowned.startPoint003)
endif


endfunction

function reloadTearsAlias()
	if thisQuest.getStage()>0 && thisQuest.getStage()<110
	bt_player.ForceRefTo(Game.getPlayer())
	bt_cat.ForceRefTo(obt_cat)
	bt_blacksmith.ForceRefTo(obt_blacksmith)
		if thisQuest.getStage() >= 40 && thisQuest.getStage() <= 100
			debug.trace("reload scene!")
			bac_tears1MainScene.stop()
			bac_tears1MainScene.start()
			
			debug.trace("scene"+bac_tears1MainScene.IsPlaying())
		endif
	endif

endfunction

function reloadAlias()
ra_bacPlayer.ForceRefTo(Game.getPlayer())
ra_bacHunter001.ForceRefTo(bacHunter001)
ra_bacHunter002.ForceRefTo(bacHunter002)
ra_bacHunter003.ForceRefTo(bacHunter003)
ra_bacHunter004.ForceRefTo(bacHunter004)
ra_bacHunter005.ForceRefTo(bacHunter005)

endfunction

function restoreQuest()
restoreActors()
bac_huntersgonnahunt2.reset()
reloadAlias()


bac_huntersgonnahunt2.start()
bac_huntersgonnahunt2.setStage(0)

endfunction

function startQuest()
bac_huntersgonnahunt2.setStage(10)
bac_huntersgonnahunt2Scene.start()
testTrue = true
endfunction

function setAttackMode()
	Actor a 
	a = bacHunter001 as Actor
	a.addToFaction(bac_hunter_aggressor)
	a.setFactionRank(bac_hunter_aggressor,1)
	
	a = bacHunter002 as Actor
	a.addToFaction(bac_hunter_aggressor)
	a.setFactionRank(bac_hunter_aggressor,1)
	
	a = bacHunter003 as Actor
	a.addToFaction(bac_hunter_aggressor)
	a.setFactionRank(bac_hunter_aggressor,1)
	
	a = bacHunter004 as Actor
	a.addToFaction(bac_hunter_aggressor)
	a.setFactionRank(bac_hunter_aggressor,1)
	
	a = bacHunter005 as Actor
	a.addToFaction(bac_hunter_aggressor)
	a.setFactionRank(bac_hunter_aggressor,1)
endfunction


function unsetAttackMode()
	Actor a 
	a = bacHunter001 as Actor
	a.removeFromFaction(bac_hunter_aggressor)
	a.stopCombat()
	
	a = bacHunter002 as Actor
	a.removeFromFaction(bac_hunter_aggressor)
	a.stopCombat()
	
	a = bacHunter003 as Actor
	a.removeFromFaction(bac_hunter_aggressor)
	a.stopCombat()
	
	a = bacHunter004 as Actor
	a.removeFromFaction(bac_hunter_aggressor)
	a.stopCombat()
	
	a = bacHunter005 as Actor
	a.removeFromFaction(bac_hunter_aggressor)
	a.stopCombat()
endfunction

function runTick()
	registerforsingleupdate(5.0)	
endfunction

function transformActor()
return 
endfunction

event onupdate()
	if thisQuest.getStage()==100
		;debug.notification("tick")
		if ra_bacHunter001.getActorRef().isDead()== true && ra_bacHunter002.getActorRef().isDead()== true && ra_bacHunter003.getActorRef().isDead()== true && ra_bacHunter004.getActorRef().isDead()== true && ra_bacHunter005.getActorRef().isDead()== true
			if Utility.randomInt(0,10) == 0
				restoreQuest()
				startQuest()
			endif
		endif
		if Game.getPlayer().IsArrested()
			restoreQuest()
			startQuest()
		endif
		if bac_capturedcow2.getStage()==0
			registerforsingleupdate(5.0)
		endif
	endif

endevent

function initCapturedCow()
	unsetAttackMode()
	if testTrue==false
		return
	endif
	testTrue = false

	bool waitExtra = false
	if  Game.getPlayer().isBleedingOut() || Game.getPlayer().GetActorValue("Paralysis") > 0 || Game.getPlayer().IsUnconscious()
		waitExtra = true
		debug.trace("WAIT EXTRA")
	endif
	while Game.getPlayer().isBleedingOut() || Game.getPlayer().GetActorValue("Paralysis") > 0 || Game.getPlayer().IsUnconscious()
		Utility.wait(0.2)
		debug.trace("WAIT EXTRA BLEEDOUT")
		debug.trace( Game.getPlayer().isBleedingOut() )
		debug.trace( Game.getPlayer().GetActorValue("Paralysis") )
		debug.trace( Game.getPlayer().IsUnconscious() )
	endwhile
	
	if waitExtra==true
		Utility.wait(2)
	endif
	Utility.wait(1)
	Game.ForceFirstPerson()
	Game.ForceThirdPerson()
	game.disablePlayerControls(true,true,true,true)
	game.setplayeraidriven(true)
	Game.getPlayer().stopCombat()
	Game.getPlayer().SheatheWeapon()
	
	Utility.wait(2)
	Debug.SendAnimationEvent(Game.getPlayer(), "IdleBoundKneesStart") 
	Utility.wait(5)
	BACQuestCtrl.DoFadeOut(1.0)
	Debug.SendAnimationEvent(Game.getPlayer(), "IdleForceDefaultState") 
	Utility.wait(1)
	;Debug.SendAnimationEvent(Game.getPlayer(), "IdleForceDefaultState") 
	game.EnablePlayerControls()
	



	restoreActors()
	utility.wait(0.5)
	bac_huntersgonnahunt2Scene.stop()
	bac_huntersgonnahunt2.stop()
	Game.getPlayer().moveTo(questfurniture)
	Game.getPlayer().RemoveAllItems(or_chest)
	;restoreActors()
	debug.trace("step1")
	bac_capturedcow2.reset()
	debug.trace("step2")
	racc_bacPlayer.ForceRefTo(Game.getPlayer())
	racc_bacCowMaster.ForceRefTo(bacCowMaster)
	
	racc_bacHunter.ForceRefTo(bacHunter001)
	Actor a = bacHunter001 as Actor
	a.removeFromFaction(bac_hunter_aggressor)
	a.enable()
	a.Resurrect()
	bacHunter001.moveTo(bacDropplace)
	
	debug.trace("step3")
	bac_capturedcow2.start()
	racc_bacPlayer.ForceRefTo(Game.getPlayer())
	racc_bacCowMaster.ForceRefTo(bacCowMaster)
	
	racc_bacHunter.ForceRefTo(bacHunter001)	
	debug.trace("step4")
	bac_capturedcow2.setStage(10)
	debug.trace("step5")
	;bac_capturedcow2MainScene.start()
	debug.trace("step6")
	
endfunction