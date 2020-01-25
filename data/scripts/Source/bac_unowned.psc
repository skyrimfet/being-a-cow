Scriptname bac_unowned extends Quest  

Quest property thisQuest Auto
Quest Property bac_huntersgonnahunt Auto
Scene Property bac_huntersgonnahuntScene Auto

Quest property bac_capturedcow Auto
Quest property bac_capturedcow2 Auto
Scene property bac_capturedcowScene Auto

ReferenceAlias Property ra_bacPlayer Auto
ReferenceAlias Property ra_bacHunter001 Auto
ReferenceAlias Property ra_bacHunter002 Auto
ReferenceAlias Property ra_bacHunter003 Auto

ReferenceAlias Property cap_ra_bacPlayer Auto
ReferenceAlias Property cap_ra_bacChest Auto
ReferenceAlias Property cap_ra_bacFurniture Auto
ReferenceAlias Property cap_ra_bacHunter001 Auto
ReferenceAlias Property cap_ra_bacHunter002 Auto
ReferenceAlias Property cap_ra_bacHunter003 Auto



ObjectReference Property or_bacHunter001 Auto
ObjectReference Property or_bacHunter002 Auto 
ObjectReference Property or_bacHunter003 Auto

ObjectReference Property or_chest Auto


ObjectReference Property startPoint001 Auto
ObjectReference Property startPoint002 Auto
ObjectReference Property startPoint003 Auto

Faction Property bac_hunter_aggressor Auto


ObjectReference Property capFurniture Auto
ObjectReference Property capXMarker Auto


bac_quest_ctr Property BACQuestCtrl Auto 
bac_config Property BACConfig Auto 

Event OnInit()
	;debug.notification("unowned init")
	;Utility.wait(1.0)
	;prepareCaptureQuest()
	;debug.notification("unowned done")
	;return
	
registerforsingleupdate(5)
or_bacHunter001.disable()
or_bacHunter002.disable()
or_bacHunter003.disable()

;prepareQuest()
endEvent

Int Property waitHunterGonaHunt Auto

Event onUpdate()



if thisQuest.getStage()>=20 && thisQuest.getStage()<=60 

	if bac_huntersgonnahunt.IsRunning()==false
		prepareQuest()
	else
		
		;dialogue was broken? ok we will wait...
		if bac_huntersgonnahunt.getStage()==21 || bac_huntersgonnahunt.getStage()==20
			if Game.getPlayer().IsInCombat()==0
				waitHunterGonaHunt = waitHunterGonaHunt + 1
				debug.notification("hunters.debug: "+waitHunterGonaHunt+"/"+6)
			endif
			if waitHunterGonaHunt > 5
				Actor a = or_bacHunter001 as Actor				
				a.addToFaction(bac_hunter_aggressor)
				a.setFactionRank(bac_hunter_aggressor,1)
				
				a = or_bacHunter002 as Actor				
				a.addToFaction(bac_hunter_aggressor)
				a.setFactionRank(bac_hunter_aggressor,1)
				a = or_bacHunter003 as Actor				
				a.addToFaction(bac_hunter_aggressor)
				a.setFactionRank(bac_hunter_aggressor,1)
				bac_huntersgonnahunt.setStage(30)
			endif
		endif

		
		; all dead
		if ra_bacHunter001.getActorRef().isDead()== true && ra_bacHunter002.getActorRef().isDead()== true && ra_bacHunter003.getActorRef().isDead()== true
			
		;	utility.wait(60.0)
			if utility.randomInt(0,15) == 0
				bac_huntersgonnahunt.stop()
				
			endif
		
		endif
		
		;leader is dead, time to back to home
		if ra_bacHunter001.getActorRef().isDead()== true
			if bac_huntersgonnahunt.getStage() <= 20
				Debug.notification("Unowned manager: Lider is dead, cancel hunter gona hunt Quest! OK")	
				Actor a = or_bacHunter001 as Actor
				a.removeFromFaction(bac_hunter_aggressor)
				a = or_bacHunter002 as Actor
				a.removeFromFaction(bac_hunter_aggressor)
				a = or_bacHunter003 as Actor
				a.removeFromFaction(bac_hunter_aggressor)
				bac_huntersgonnahunt.setStage(40)
			endif
		endif
		
		;pc is arrested, send hunters to home
		if Game.getPlayer().IsArrested()
			Debug.notification("Unowned manager: You are arrested, cancel hunter gona hunt Quest! OK")			
			;ra_bacHunter001.getActorRef().kill()
			;ra_bacHunter002.getActorRef().kill()
			;ra_bacHunter003.getActorRef().kill()
			if bac_huntersgonnahunt.getStage() <= 20
				Actor a = or_bacHunter001 as Actor
				a.removeFromFaction(bac_hunter_aggressor)
				a = or_bacHunter002 as Actor
				a.removeFromFaction(bac_hunter_aggressor)
				a = or_bacHunter003 as Actor
				a.removeFromFaction(bac_hunter_aggressor)
				bac_huntersgonnahunt.setStage(40)
			endif
		endif
		
		
		
	endif

endif

if thisQuest.getStage()<70
	registerforsingleupdate(30)
else
	Debug.notification("Unowned manager is stopped (it's ok) - quest is almost complete! OK")
endif

endEvent


function prepareQuest()
;debug.notification("...")
waitHunterGonaHunt = 0
or_bacHunter001.enable()
or_bacHunter002.enable()
or_bacHunter003.enable()

Actor a = or_bacHunter001 as Actor
a.Resurrect()
a.removeFromFaction(bac_hunter_aggressor)
a = or_bacHunter002 as Actor
a.Resurrect()
a.removeFromFaction(bac_hunter_aggressor)
a = or_bacHunter003 as Actor
a.Resurrect()
a.removeFromFaction(bac_hunter_aggressor)

Int n = Utility.randomInt(1,3)

if n == 1
or_bacHunter001.moveTo(startPoint001)
or_bacHunter002.moveTo(startPoint001)
or_bacHunter003.moveTo(startPoint001)
endif

if n == 2
or_bacHunter001.moveTo(startPoint002)
or_bacHunter002.moveTo(startPoint002)
or_bacHunter003.moveTo(startPoint002)
endif

if n == 3
or_bacHunter001.moveTo(startPoint003)
or_bacHunter002.moveTo(startPoint003)
or_bacHunter003.moveTo(startPoint003)
endif




bac_huntersgonnahunt.reset()

ra_bacPlayer.ForceRefTo(Game.getPlayer())
ra_bacHunter001.ForceRefTo(or_bacHunter001)
ra_bacHunter002.ForceRefTo(or_bacHunter002)
ra_bacHunter003.ForceRefTo(or_bacHunter003)

bac_huntersgonnahunt.start()

bac_huntersgonnahuntScene.start()
bac_huntersgonnahunt.setStage(10)

endfunction

bool property stop auto

function prepareCaptureQuest()
	
	if stop == true
	debug.trace("cap 0 skip")
	return
	endif
	stop = true
	
	
	
	debug.trace("cap 1")
	if bac_huntersgonnahunt.IsRunning()
		bac_huntersgonnahunt.setStage(50)
	endif
	if thisQuest.IsRunning()
	thisQuest.setStage(200)
	endif
	or_bacHunter001.enable()
	or_bacHunter002.enable()
	or_bacHunter003.enable()
	debug.trace("cap 2")
	Actor a = or_bacHunter001 as Actor
	a.Resurrect()
	a.removeFromFaction(bac_hunter_aggressor)
	a = or_bacHunter002 as Actor
	a.Resurrect()
	a.removeFromFaction(bac_hunter_aggressor)
	a = or_bacHunter003 as Actor
	a.Resurrect()
	a.removeFromFaction(bac_hunter_aggressor)
debug.trace("cap 3")

		
		
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
	


	BACQuestCtrl.addMilk(Game.getPlayer(), ( 2 * BACConfig.painLevel ) as float)
	;Form p= Game.GetFormFromFile(0x0407372B, "MilkModNEW.esp") as Form
	int i = 0
	;while i < 10
	;Game.GetPlayer().EquipItem(p)
	;	i = i + 1
	;endwhile
debug.trace("cap 4")	
	
	or_bacHunter001.moveTo(capXMarker)
	or_bacHunter002.moveTo(capXMarker)
	or_bacHunter003.moveTo(capXMarker)
	
	a = or_bacHunter001 as Actor
	a.Resurrect()
	a.removeFromFaction(bac_hunter_aggressor)
	a = or_bacHunter002 as Actor
	a.Resurrect()
	a.removeFromFaction(bac_hunter_aggressor)
	a = or_bacHunter003 as Actor
	a.Resurrect()
	a.removeFromFaction(bac_hunter_aggressor)
	
	Game.getPlayer().moveTo(capFurniture)
	
	cap_ra_bacPlayer.ForceRefTo(Game.getPlayer())
	cap_ra_bacHunter001.ForceRefTo(or_bacHunter001)
	cap_ra_bacHunter002.ForceRefTo(or_bacHunter002)
	cap_ra_bacHunter003.ForceRefTo(or_bacHunter003)
	cap_ra_bacChest.ForceRefTo(or_chest)
	cap_ra_bacFurniture.ForceRefTo(capFurniture)
	
	
	Game.getPlayer().RemoveAllItems(or_chest)
	
	bac_capturedcow.start()
	bac_capturedcow.setStage(10)
	bac_capturedcowScene.start()

	

endfunction

function reloadQuest()

	cap_ra_bacPlayer.ForceRefTo(Game.getPlayer())
	cap_ra_bacHunter001.ForceRefTo(or_bacHunter001)
	cap_ra_bacHunter002.ForceRefTo(or_bacHunter002)
	cap_ra_bacHunter003.ForceRefTo(or_bacHunter003)
	cap_ra_bacChest.ForceRefTo(or_chest)
	cap_ra_bacFurniture.ForceRefTo(capFurniture)
	bac_capturedcowScene.stop()
	bac_capturedcowScene.start()
	
	ra_bacPlayer.ForceRefTo(Game.getPlayer())
	ra_bacHunter001.ForceRefTo(or_bacHunter001)
	ra_bacHunter002.ForceRefTo(or_bacHunter002)
	ra_bacHunter003.ForceRefTo(or_bacHunter003)
	bac_huntersgonnahuntScene.stop()
	bac_huntersgonnahuntScene.start()
endfunction