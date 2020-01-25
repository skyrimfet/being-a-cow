;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__05041362 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
thisScene.stop()
speaker.ForceRefTo(None)
debug.trace("drink it slut start")
bacc.addMilk(Game.getPlayer(),25)
 
Form p= Game.GetFormFromFile(0x0407372B, "MilkModNEW.esp") as Form
 
Game.GetPlayer().EquipItem(p)

debug.trace("drink it slut stop")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property speaker  Auto
Scene Property thisScene Auto
bac_quest_ctr Property bacc Auto
