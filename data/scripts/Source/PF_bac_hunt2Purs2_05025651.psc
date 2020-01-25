;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_bac_hunt2Purs2_05025651 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
;akActor.addToFaction(bac_hunter_aggressor)
;akActor.setFactionRank(bac_hunter_aggressor,1)
BACt.setAttackMode()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property bac_hunter_aggressor Auto
bac_tears_c Property BACt Auto
