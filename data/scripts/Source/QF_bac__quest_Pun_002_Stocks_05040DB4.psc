;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_bac__quest_Pun_002_Stocks_05040DB4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY OwnerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaitLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaitLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item4 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_Item4.ForceRefTo(Item4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
game.disablePlayerControls(true,true,true,false, true, true,false)
game.forcethirdperson()
game.setplayeraidriven(true)

bacc.prepareCrowd()

bacc.scanForActorsToCrowd(Game.getPlayer(),2000,30)


SexLabF.StripActor(Game.GetPlayer(),none,false)
thisQuest.SetObjectiveDisplayed(51,false)
bacc.timeScale()
bac__quest_Pun_002_StocksShowScene2.start()
Utility.WaitGameTime(1.0)
bacc.scanForActorsToCrowd(Game.getPlayer(),2000,30)
Utility.WaitGameTime(1.0)
bacc.scanForActorsToCrowd(Game.getPlayer(),2000,30)
Utility.WaitGameTime(1.0)


game.setplayeraidriven(false)
bac__quest_Pun_002_StocksShowScene2.stop()
bacc.resetTimeScale()
game.enablePlayerControls()
thisQuest.SetObjectiveDisplayed(200)
thisQuest.setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Alias_Item4.ForceRefTo(Item4)

ObjectReference ref = Alias_Item4.getReference() as ObjectReference
ref.enable()
bac__quest_Pun_002_StocksShowScene1.stop()
bacc.setWaitingTime()

thisQuest.SetObjectiveDisplayed(51)
thisQuest.SetObjectiveDisplayed(50,false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
bacc.stopCrowd()
thisQuest.SetObjectiveDisplayed(200)
bacc.successQuest(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
bac__quest_Pun_002_StocksShowScene1.start()

thisQuest.SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Item4 Auto
bac_beingacow Property bacc Auto
Quest Property thisQuest Auto
Scene Property bac__quest_Pun_002_StocksShowScene1 Auto
Scene Property bac__quest_Pun_002_StocksShowScene2 Auto
SexLabFramework Property SexLabF Auto
