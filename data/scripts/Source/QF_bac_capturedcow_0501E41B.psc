;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_bac_capturedcow_0501E41B Extends Quest Hidden

;BEGIN ALIAS PROPERTY bacChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacHunter001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacHunter001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacFurniture
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacFurniture Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacHunter002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacHunter002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacHunter003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacHunter003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
questCtr.DoFadeOut(1.0)
itemCtrl.applyChanges(true,none,"tat2",2)
Game.EnablePlayerControls()
game.disablePlayerControls()
Utility.wait(3.0)
questCtr.DoFadeIn(1.0)

utility.wait(2.0)
thisQuest.setStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
game.enablePlayerControls()
game.disablePlayerControls()



;time scale on
;wait
;timescale off
int wait = Utility.randomInt(5,30)
Utility.wait(wait as float)



Game.EnablePlayerControls()
game.setplayeraidriven(false)
thisQuest.SetObjectiveCompleted(60)
thisQuest.SetObjectiveDisplayed(70)
thisQuest.SetObjectiveDisplayed(80)
thisQuest.SetObjectiveDisplayed(70,false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
game.enablePlayerControls()
game.disablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Game.ForceThirdPerson()
Game.EnablePlayerControls()
game.disablePlayerControls()
debug.notification("lets go!")
thisQuest.setStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
thisQuest.SetObjectiveCompleted(80)

Alias_bacHunter003.GetActorReference().AddToFaction(bac_hunter_aggressor)
Alias_bacHunter002.GetActorReference().AddToFaction(bac_hunter_aggressor)
Alias_bacHunter001.GetActorReference().AddToFaction(bac_hunter_aggressor)

while Alias_bacHunter001.GetActorReference().isDead() == false
Utility.wait(5.0)
endWhile

while Alias_bacHunter002.GetActorReference().isDead() == false
Utility.wait(5.0)
endWhile


while Alias_bacHunter003.GetActorReference().isDead() == false
Utility.wait(5.0)
endWhile

thisQuest.setStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
questCtr.turnOnComments()
thisQuest.SetObjectiveCompleted(10)
thisQuest.SetObjectiveCompleted(60)
thisQuest.SetObjectiveCompleted(70)
thisQuest.SetObjectiveCompleted(80)
thisQuest.SetObjectiveCompleted(100)
parentQuest.setStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
questCtr.DoFadeIn(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
questCtr.turnOffComments()
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

game.disablePlayerControls(true,true,true,true)
questCtr.DoFadeOut(1.0)
GameHour.SetValue(23)


thisQuest.SetObjectiveDisplayed(10)
thisQuest.SetActive()
game.disablePlayerControls(true,true,true,true)
;game.disablePlayerControls()
Game.ForceFirstPerson()
Game.ForceThirdPerson()
game.setplayeraidriven(true)
parentQuest.setStage(200)
Utility.wait(1.0)
questCtr.DoFadeIn(1.0)
thisQuest.setStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property thisQuest Auto
Quest Property parentQuest Auto
bac_store Property BACStore Auto
bacBlacksmithQuest  Property itemCtrl Auto
bac_quest_ctr Property  questCtr Auto

Faction Property bac_hunter_aggressor Auto
Faction Property CurrentHireling Auto
Faction Property CurrentFollowerFaction auto
Faction Property DismissedFollowerFaction auto
bac_config Property BACConfig Auto

GlobalVariable property GameHour auto
GlobalVariable Property TimeScale Auto
