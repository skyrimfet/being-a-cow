Scriptname bac_quest_ctr extends Quest  

Quest Property bac_blacksmith Auto
Scene Property bac_blacksmith_scene Auto

bac_blacksmith_storage Property BACBStorage Auto
bac_config Property BACConfig Auto

Faction property bac_paul_love Auto

;new ctrl alias
ReferenceAlias Property ra_b_bacBlacksmith Auto
ReferenceAlias Property ra_b_bacPlayer Auto
ReferenceAlias Property ra_b_bacFurniture Auto
ReferenceAlias Property ra_b_bacIdle Auto
ReferenceAlias Property ra_b_bacNpc1 Auto
ReferenceAlias Property ra_b_bacNpc2 Auto
ReferenceAlias Property ra_b_bacNpc3 Auto
ReferenceAlias Property ra_b_bacNpc4 Auto
ReferenceAlias Property ra_b_bacNpc5 Auto
ReferenceAlias Property ra_b_bacNpc6 Auto
ReferenceAlias Property ra_b_bacNpc7 Auto
ReferenceAlias Property ra_b_bacNpc8 Auto
ReferenceAlias Property ra_b_bacNpc9 Auto
ReferenceAlias Property ra_b_bacCrowdSpot Auto

ObjectReference Property or_b_bacBlacksmith Auto
Actor Property ac_b_bacBlacksmith Auto
ObjectReference Property or_b_bacPlayer Auto
ObjectReference Property or_b_bacFurniture Auto
ObjectReference Property or_b_bacIdle Auto
ObjectReference Property or_b_bacCrowdSpot Auto

GlobalVariable Property bac_blacksmith_wait Auto
GlobalVariable Property bac_blacksmith_timeout Auto



event onUpdate()
	
	if bac_blacksmith_wait.getValueInt() > 0
		int c = bac_blacksmith_wait.getValueInt() as Int
		bac_blacksmith_wait.setValueInt(c - 1)
		if c==1
			debug.notification("Paul the Blacksmith wait time is reseted!")
		endif
	endif
	
	if bac_blacksmith_timeout.getValueInt() > 0 && bac_blacksmith.getStage()>=30
		int c = bac_blacksmith_timeout.getValueInt() as Int
		bac_blacksmith_timeout.setValueInt(c - 1)
		if c==1
			debug.notification("Paul the Blacksmith - timeout!")
			setStageQ("blacksmith",20)
		endif
	endif
	
	registerForSingleUpdate(30.0)

endEvent

function startTick()
	registerForSingleUpdate(30.0)
endfunction

function stopTick()
	UnregisterForUpdate()
endfunction



function stopBlacksmithQ()
	bac_blacksmith_scene.stop()
	bac_blacksmith.stop()
endfunction

function setStageQ(string type, int stage, bool silent = false)

debug.trace("setStageQ Type:"+type+", Stage:"+stage)

if type =="blacksmith"

	bac_blacksmith_scene.stop()
	
	if stage < bac_blacksmith.getStage()
		bac_blacksmith.stop()
		bac_blacksmith.reset()
		fillAlias(type)
		bac_blacksmith.start()
		
		if bac_blacksmith.IsRunning() || bac_blacksmith.IsStarting()
		else
	;		debug.messagebox("something went wrong - definitly!")
		endif
		
	endif

	bac_blacksmith.setStage(stage)
	
	bac_blacksmith_scene.start()

	if bac_blacksmith_scene.isPlaying() == false
		bac_blacksmith_scene.ForceStart()
	endif

	if bac_blacksmith_scene.isPlaying() == false
		int m = 40
		int w = 0
		while w < m
			bac_blacksmith_scene.start()			
			;utility.wait(0.5)
			if bac_blacksmith_scene.isPlaying() == true
				w = m
			endif
			w = w + 1
			debug.notification("Emerg. scene blacksmit start. Try "+w+"/"+m)
		endwhile
	endif
	
endif

endfunction

function fillAlias(string name)


if name == "blacksmith"
	
	ra_b_bacBlacksmith.ForceRefTo(ac_b_bacBlacksmith)
	ra_b_bacPlayer.ForceRefTo(Game.getPlayer())
	ra_b_bacCrowdSpot.ForceRefTo(or_b_bacCrowdSpot)
	ra_b_bacNpc1.ForceRefTo(or_b_bacCrowdSpot)
	ra_b_bacNpc2.ForceRefTo(or_b_bacCrowdSpot)
	ra_b_bacNpc3.ForceRefTo(or_b_bacCrowdSpot)
	ra_b_bacNpc4.ForceRefTo(or_b_bacCrowdSpot)
	ra_b_bacNpc5.ForceRefTo(or_b_bacCrowdSpot)
	ra_b_bacNpc6.ForceRefTo(or_b_bacCrowdSpot)
	ra_b_bacNpc7.ForceRefTo(or_b_bacCrowdSpot)
	ra_b_bacNpc8.ForceRefTo(or_b_bacCrowdSpot)
	ra_b_bacNpc9.ForceRefTo(or_b_bacCrowdSpot)
	;if ra_b_bacFurniture.getReference()==None
	;ra_b_bacFurniture.ForceRefTo(or_b_bacFurniture);uwaga!
	ra_b_bacFurniture.ForceRefTo(BACBStorage.altfurniture);uwaga!
	;endif
	
	
	
endif
endfunction

ImageSpaceModifier Property FadeToBlack auto
ImageSpaceModifier Property FadeFromBlack auto

Function DoFadeOut(float time)
   FadeToBlack.Apply()
   Utility.Wait(time)
   Game.FadeOutGame(False,True,50, 1)
EndFunction

;**************************************
; Fade the game back in after a call to DoFadeOut
;**************************************
Function DoFadeIn(float time)
   Game.FadeOutGame(False,True,0.1, 0.1)
   FadeToBlack.PopTo(FadeFromBlack)
EndFunction

import StorageUtil

function addMilk(Actor akActor, Float howmuch)
	debug.trace("UPDATE MILK AMOUNT START")
	SetFloatValue(akActor,"MME.MilkMaid.MilkCount",getMilk(akActor)+howmuch) 
	MilkQUEST MilkQ = Quest.GetQuest("MME_MilkQUEST") as MilkQUEST
	MilkQ.CurrentSize(akActor)
	debug.trace("UPDATE MILK AMOUNT STOP")
endfunction

float function getMilk(Actor akActor)

	return GetFloatValue(akActor,"MME.MilkMaid.MilkCount") 

endfunction

function setLoveRank(int toadd)
  addLoveRank(1)
  addLoveRank(-1)
  Game.getPlayer().setFactionRank(bac_paul_love,toadd)
endfunction

function addLoveRank(int toadd = 1)
	;debug.notification("Your love to Paul is growing...")
	if ac_b_bacBlacksmith.getFactionRank(bac_paul_love)<0
		ac_b_bacBlacksmith.addToFaction(bac_paul_love)
		ac_b_bacBlacksmith.setFactionRank(bac_paul_love,toadd)
		Game.getPlayer().addToFaction(bac_paul_love)
		Game.getPlayer().setFactionRank(bac_paul_love,toadd)
		return
	endif
	int rank = ac_b_bacBlacksmith.getFactionRank(bac_paul_love)
	rank = rank + toadd
	ac_b_bacBlacksmith.setFactionRank(bac_paul_love,rank)
	Game.getPlayer().setFactionRank(bac_paul_love,rank)
	
endfunction

int function getLoveRank()
	return ac_b_bacBlacksmith.getFactionRank(bac_paul_love)
endfunction


function turnOffComments()
	BACConfig.commentEnable = false
endfunction

function turnOnComments()
	BACConfig.commentEnable = false
endfunction