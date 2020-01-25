;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0501DE7D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
thisQuest.setStage(30)

bacHunter001.addToFaction(bac_hunter_aggressor)
bacHunter002.addToFaction(bac_hunter_aggressor)
bacHunter003.addToFaction(bac_hunter_aggressor)

bacHunter001.setFactionRank(bac_hunter_aggressor,1)
bacHunter002.setFactionRank(bac_hunter_aggressor,1)
bacHunter003.setFactionRank(bac_hunter_aggressor,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property bac_hunter_aggressor Auto
Actor Property bacHunter001 Auto
Actor Property bacHunter002 Auto
Actor Property bacHunter003 Auto
Quest Property thisQuest Auto
