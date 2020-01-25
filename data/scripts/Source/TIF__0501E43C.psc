;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0501E43C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
itemCtrl.applyChanges(false,BACStore.bac_cowbell,"bell",1)
itemCtrl.applyChanges(true,BACStore.bac_cowbellbig,"bell",1)
Game.EnablePlayerControls()
game.disablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
bac_store Property BACStore Auto
bacBlacksmithQuest  Property itemCtrl Auto
