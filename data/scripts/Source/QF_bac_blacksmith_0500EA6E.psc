;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_bac_blacksmith_0500EA6E Extends Quest Hidden

;BEGIN ALIAS PROPERTY bacFurniture
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacFurniture Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacIdle
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacIdle Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacBlacksmith
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacBlacksmith Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY crowdSpot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_crowdSpot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BACPlayer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BACPlayer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_BACBlacksmith.ForceRefTo(or_blacksmith)
Alias_BACPlayer.ForceRefTo(Game.GetPlayer())
Alias_bacFurniture.ForceRefTo(storage.oFurniture)
;debug.trace("st30" + storage)
;debug.trace("st30" + storage.oFurniture)


;debug.trace("st30" + storage.iRank)
;debug.trace("st30" + storage.sWhere)
;debug.trace("st30" + storage.oItem)
;debug.trace("st30" + storage.bToAdd)
;Alias_bacFurniture.ForceRefTo(storage.chair)

thisQuest.SetObjectiveDisplayed(20,false)
thisQuest.SetObjectiveDisplayed(30)

storage.doorRef.SetOpen(true)

storage.chair.disable()
storage.stockVert.disable()
storage.bitchLession.disable()
storage.stock.disable()
storage.altfurniture.disable()

Alias_bacFurniture.GetReference().enable()

questCtr.callActors()

bac_blacksmith_wait.SetValueInt(Utility.randomInt(20,40))
bac_blacksmith_timeout.SetValueInt(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_BACBlacksmith.ForceRefTo(or_blacksmith)
game.disablePlayerControls(true,true,true,false, true, true,false)
game.forcethirdperson()

thisQuest.SetObjectiveDisplayed(30,false)
thisQuest.SetObjectiveDisplayed(40)
bac_blacksmith_timeout.SetValueInt(6)
questCtr.callActors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Alias_BACBlacksmith.ForceRefTo(or_blacksmith)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
qCtr.DoFadeOut(1.0)
questCtr.applyChanges(storage.bToAdd,storage.oItem,storage.sWhere,storage.iRank)
qCtr.DoFadeIn(1.0)

game.enablePlayerControls()

qCtr.setStageQ("blacksmith",20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Alias_BACBlacksmith.ForceRefTo(or_blacksmith)
thisQuest.SetObjectiveDisplayed(20)
thisQuest.SetObjectiveDisplayed(10,false)
thisQuest.SetObjectiveDisplayed(30,false)
thisQuest.SetObjectiveDisplayed(40,false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
thisQuest.SetActive()
thisQuest.SetObjectiveDisplayed(0)

storage.chair.disable()
storage.stockVert.disable()
storage.bitchLession.disable()
storage.stock.disable()
storage.altfurniture.disable()


;qCtr.setStageQ("blacksmith",1)


mainScene.Stop()
Utility.wait(1)
mainScene.ForceStart()

if mainScene.isPlaying()
debug.notification("Quest works")
else
debug.notification("Something went wrong")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(10)
thisQuest.SetObjectiveDisplayed(0,false)
;qCtr.setStageQ("blacksmith",11)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property mainScene Auto
Quest Property thisQuest Auto
bac_blacksmith_storage Property storage Auto
bacBlacksmithQuest  Property questCtr Auto

bac_quest_ctr Property qCtr Auto
GlobalVariable Property bac_blacksmith_wait Auto
GlobalVariable Property bac_blacksmith_timeout Auto
Objectreference  Property or_blacksmith Auto

