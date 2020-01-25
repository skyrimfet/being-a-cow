;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_bac_hunt2Pursut_05025650 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
if akActor.HasLOS(Game.GetPlayer()) || Game.GetPlayer().HasLOS(akActor)
akActor.addToFaction(bac_hunter_aggressor)
akActor.setFactionRank(bac_hunter_aggressor,1)
endif
thisQuest.setStage(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest property thisQuest Auto
Faction Property bac_hunter_aggressor Auto

int timeout