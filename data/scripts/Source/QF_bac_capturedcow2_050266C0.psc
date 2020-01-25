;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname QF_bac_capturedcow2_050266C0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY bacVil5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacVil5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacBlacksmith
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacBlacksmith Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacHunter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacHunter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacVil4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacVil4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacVil3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacVil3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacVil2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacVil2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacVil1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacVil1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacVil6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacVil6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacCowMaster
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacCowMaster Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
bacc.stopCrowd()

Alias_bacVil1.ForceRefTo(bacVil1)
Alias_bacVil2.ForceRefTo(bacVil2)
Alias_bacVil3.ForceRefTo(bacVil3)
Alias_bacVil4.ForceRefTo(bacVil4)
Alias_bacVil5.ForceRefTo(bacVil5)
Alias_bacVil6.ForceRefTo(bacVil6)

Alias_bacBlacksmith.ForceRefTo(bacBlacksmith)

bac_capturedcow2MainScene2.stop()
bac_capturedcow2MainScene.stop()
qCtr.DoFadeOut(2.0)
qCtr.addMilk(Game.getPlayer(),30)
regenerateAliases()
Alias_PlayerRef.getReference().moveTo(xMarkerAuctionCow)
Alias_bacHunter.getReference().moveTo(xMarkerAuctionHunters)
Alias_bacCowMaster.getReference().moveTo(xMarkerAuctionMaster)

Game.getPlayer().unequipItem(bondageStuff)
Game.getPlayer().removeItem(bondageStuff)

qCtr.DoFadeIn(2.0)
game.enablePlayerControls()
game.disablePlayerControls()
game.setplayeraidriven(true)




bac_capturedcow2MainScene3.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;blackout

Alias_bacVil1.ForceRefTo(bacVil1)
Alias_bacVil2.ForceRefTo(bacVil2)
Alias_bacVil3.ForceRefTo(bacVil3)
Alias_bacVil4.ForceRefTo(bacVil4)
Alias_bacVil5.ForceRefTo(bacVil5)
Alias_bacVil6.ForceRefTo(bacVil6)
Alias_bacBlacksmith.ForceRefTo(bacBlacksmith)
Alias_PlayerRef.ForceRefTo(Game.getPlayer())
Alias_bacCowMaster.ForceRefTo(bacMaster)
qCtr.DoFadeOut(2.0)
;Debug.SendAnimationEvent(Game.getPlayer(), "IdleForceDefaultState")
Alias_bacBlacksmith.getReference().moveTo(bacStables)
Game.getPlayer().moveTo(bacStables)


qCtr.DoFadeIn(2.0)


;blackin

thisQuest.setStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
debug.trace("BAC CAPTURED s1")
int tscale = TimeScale.getValueInt()
TimeScale.setValueInt(1200)

itemCtrl.applyChanges(true,none,"tat3",3)


Utility.WaitGameTime(6)
Utility.wait(15)
debug.trace("BAC CAPTURED s2")
TimeScale.setValueInt(tscale)

debug.messagebox("After longer time, in drowse, you hear: they back...")
Utility.wait(3.0)
qCtr.DoFadeOut(2.0)
debug.trace("BAC CAPTURED s3")
Debug.SendAnimationEvent(Game.getPlayer(), "IdleForceDefaultState")

Alias_PlayerRef.getReference().moveTo(xMarkerRiften)
Utility.wait(3.0)
Alias_PlayerRef.getReference().moveTo(xMarkerRiften)
bacc.prepareCrowd()
bacc.scanForActorsToCrowd(Game.getPlayer(),3000,45)


Alias_bacHunter.getReference().moveTo(xMarkerRiften)
Alias_bacCowMaster.getReference().moveTo(xMarkerRiften)
qCtr.addMilk(Game.getPlayer(),30)

qCtr.DoFadeIn(2.0)

debug.trace("BAC CAPTURED s4")
bac_capturedcow2MainScene.stop()
thisQuest.setStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;transform to 18stage

int Slot = BACActor.isRegistered(Game.getPlayer())
;while Game.getPlayer().getFactionRank(bac_milkmaid)<11
;BACActor.npcs_timesLast[Slot] = BACActor.npcs_timesLast[Slot]  - 1
;Utility.wait(30.0)
;BACActor.npcs_times[slot] = 1000

;debug.trace(slot)
;debug.trace(BACActor.npcs_timesLast[Slot])
;endWhile


int newph = Utility.RandomInt(8,10)
if newph > BACActor.npcs_phase[Slot] 
 BACActor.npcs_phase[Slot] = newph
BACMain.updateEvent(Slot)
endif


thisQuest.setStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;controller

if Game.getPlayer().getFactionRank(bac_milkmaid)<16
thisQuest.setStage(40)

else
Utility.wait(Utility.randomInt(30,90) as Float)
thisQuest.setStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Utility.wait(1.0)
game.enablePlayerControls()
Utility.wait(1.0)
game.disablePlayerControls()
game.setplayeraidriven(true)
debug.trace("BAC CAPTURED s5")
Game.getPlayer().addItem(bondageStuff)

regenerateAliases()


bac_capturedcow2MainScene2.start()
Utility.wait(3.0)
game.enablePlayerControls()
Game.getPlayer().equipItem(bondageStuff)

game.disablePlayerControls()
game.setplayeraidriven(true)
debug.trace("BAC CAPTURED s6")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
Chest.RemoveAllItems(Game.getPlayer())
bac_capturedcow2MainScene2.stop()
bac_capturedcow2MainScene3.stop()
bac_capturedcow2MainScene.stop()
thisQuest.CompleteQuest()
qCtr.setStageQ("blacksmith",0)
Utility.wait(1.0)
qCtr.setStageQ("blacksmith",20)
qCtr.turnOnComments()
tearsQuest.setStage(110);
thisQuest.CompleteQuest()
thisQuest.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Utility.wait(30.0)
;bac_capturedcow2MainScene2.stop()

game.setplayeraidriven(false)
game.enablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
qCtr.turnOffComments()
qbacBlacksmith.stop()
regenerateAliases()
Alias_bacVil1.ForceRefTo(bacVil1)
Alias_bacVil2.ForceRefTo(bacVil2)
Alias_bacVil3.ForceRefTo(bacVil3)
Alias_bacVil4.ForceRefTo(bacVil4)
Alias_bacVil5.ForceRefTo(bacVil5)
Alias_bacVil6.ForceRefTo(bacVil6)
Alias_bacBlacksmith.ForceRefTo(bacBlacksmith)
Alias_PlayerRef.ForceRefTo(Game.getPlayer())
Alias_bacCowMaster.ForceRefTo(bacMaster)

Alias_bacBlacksmith.getReference().moveTo(xMarkerBehind)

game.setplayeraidriven(false)
thisQuest.SetActive()
game.disablePlayerControls(true,true,true,true)
;game.disablePlayerControls()
Game.ForceFirstPerson()
Game.ForceThirdPerson()
game.setplayeraidriven(true)
Alias_PlayerRef.ForceRefTo(Game.getPlayer())


if BACConfig.teammate!=None
  if BACConfig.teammate.IsPlayerTeammate()
    BACConfig.teammate.ModFactionRank(CurrentFollowerFaction, -2)
    BACConfig.teammate.AddtoFaction(DismissedFollowerFaction)
    BACConfig.teammate.SetPlayerTeammate(false)
    BACConfig.teammate.RemoveFromFaction(CurrentHireling)
   BACConfig.teammate.SetActorValue("WaitingForPlayer", 0)
    BACConfig.teammate.EvaluatePackage()
  endif
  BACConfig.teammate = None
endif
;qCtr.
thisQuest.setStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
Alias_bacBlacksmith.getReference().moveTo(xMarkerBehind)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
qCtr.DoFadeIn(1.0)
;debug.notification("sit")
;Game.EnablePlayerControls()
;game.disablePlayerControls()
bac_capturedcow2MainScene.start()


debug.trace("ctrl")
debug.trace(Alias_PlayerRef)
debug.trace(Alias_PlayerRef.getActorRef())

debug.trace("ctrl")
debug.trace(Alias_bacCowMaster)
debug.trace(Alias_bacCowMaster.getActorRef())

debug.trace("ctrl")
debug.trace(Alias_bacHunter)
debug.trace(Alias_bacHunter.getActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property thisQuest Auto

ObjectReference Property w1 Auto
ObjectReference Property w2 Auto
ObjectReference Property xMarkerRiften Auto
Faction Property bac_milkmaid Auto
bac_actor Property BACActor Auto
bac_main Property BACMain Auto


ObjectReference Property xMarkerAuctionCow Auto
ObjectReference Property xMarkerAuctionMaster Auto
ObjectReference Property xMarkerAuctionHunters Auto
ObjectReference Property xMarkerBehind  Auto


ObjectReference Property bacVil1 Auto
ObjectReference Property bacVil2 Auto
ObjectReference Property bacVil3 Auto
ObjectReference Property bacVil4 Auto
ObjectReference Property bacVil5 Auto
ObjectReference Property bacVil6 Auto
ObjectReference Property bacBlacksmith Auto
ObjectReference Property bacStables Auto
ObjectReference Property bacMaster Auto
ObjectReference Property bacHunter Auto

ObjectReference Property Chest Auto


Scene Property bac_capturedcow2MainScene Auto
Scene Property bac_capturedcow2MainScene2 Auto
Scene Property bac_capturedcow2MainScene3 Auto

Quest Property tearsQuest Auto
Quest Property qbacBlacksmith Auto
bac_quest_ctr Property qCtr Auto

Armor Property bondageStuff Auto

bacBlacksmithQuest  Property itemCtrl Auto

GlobalVariable Property TimeScale Auto
Faction Property CurrentHireling Auto
Faction Property CurrentFollowerFaction auto
Faction Property DismissedFollowerFaction auto
bac_config Property BACConfig Auto
bac_beingacow Property bacc Auto
 bac_tears_c Property tearsContainer Auto

function regenerateAliases()
	if thisQuest.getStage()>0
		Alias_bacVil1.ForceRefTo(bacVil1)
		Alias_bacVil2.ForceRefTo(bacVil2)
		Alias_bacVil3.ForceRefTo(bacVil3)
		Alias_bacVil4.ForceRefTo(bacVil4)
		Alias_bacVil5.ForceRefTo(bacVil5)
		Alias_bacVil6.ForceRefTo(bacVil6)
		Alias_bacHunter.ForceRefTo(tearsContainer.bacHunter001)
		Alias_bacBlacksmith.ForceRefTo(bacBlacksmith)
		Alias_PlayerRef.ForceRefTo(Game.getPlayer())
		Alias_bacCowMaster.ForceRefTo(bacMaster)
	endif
endfunction

