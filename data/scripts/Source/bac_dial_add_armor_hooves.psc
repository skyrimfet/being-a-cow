;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname bac_dial_add_armor_hooves Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;game.disablePlayerControls()
;game.forcethirdperson()
;game.setplayeraidriven(true)
;Utility.wait(2.0)


storage.bToAdd = true
storage.oItem = mStore.bac_hooves_heavy
storage.sWhere ="feet"
storage.oFurniture = storage.chair
storage.iRank = 2

;thisQuest.setStage(30)
qCtr.setStageQ("blacksmith",30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property thisQuest Auto
bac_blacksmith_storage Property storage Auto
bac_store Property mStore Auto
bac_quest_ctr Property qCtr Auto
