;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__05033FDC Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
bac_blacksmith_debt.setValueInt(5000)
questCtrl.addLoveRank(1)
bac_afterstorm.setStage(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property bac_afterstorm Auto
bac_quest_ctr Property questCtrl Auto
GlobalVariable Property bac_blacksmith_debt Auto
