;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0501E40C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
storage.bToAdd = true
storage.oItem = mStore.bac_cowbell
storage.sWhere ="tat"
storage.oFurniture = storage.bitchLession
storage.iRank = 1

qCtr.setStageQ("blacksmith",30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
bac_blacksmith_storage Property storage Auto
bac_store Property mStore Auto
bac_quest_ctr Property qCtr Auto
Quest property thisQuest Auto
