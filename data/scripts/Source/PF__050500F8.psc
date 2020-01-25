;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF__050500F8 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
if Game.GetPlayer().GetDistance(mech) < 550
	if thisQuest.getStage() == 10
	
	bacc.sendMech(20)
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property mech Auto
bac_beingacow Property bacc Auto
Quest property thisQuest Auto
