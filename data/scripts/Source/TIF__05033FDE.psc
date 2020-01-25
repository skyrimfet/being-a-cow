;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__05033FDE Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
bac_blacksmith_debt.setValueInt(30000)
bac_afterstorm.setStage(80)
Game.getPlayer().addItem(bacCertificate,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property bac_afterstorm Auto
GlobalVariable Property bac_blacksmith_debt Auto
Book property bacCertificate Auto
