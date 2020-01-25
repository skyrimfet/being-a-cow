;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__05048F9F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int slot = BACActor.isRegistered(Game.getPlayer())
BACActor.npcs_punishItem[slot] = BACActor.npcs_punishItem[slot] - 1
thisQuest.setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Quest Property thisQuest Auto
bac_actor property BACActor Auto
