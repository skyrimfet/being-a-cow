;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0503AC05 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
storage.bToAdd = true
storage.oItem = mStore.bac_hooves_hands_heavy
storage.sWhere ="hands"
storage.oFurniture = storage.chair
storage.iRank = 1 

debug.trace("ofurn "+storage.oFurniture)
debug.trace("chair " +storage.chair)
debug.trace(storage)

qCtr.setStageQ("blacksmith",30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property thisQuest Auto
bac_blacksmith_storage Property storage Auto
bac_store Property mStore Auto
bac_quest_ctr Property qCtr Auto
