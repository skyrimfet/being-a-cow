;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname PF_bac_hunt2LeaderFollowYou_0502564E Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
if akActor.HasLOS(Game.GetPlayer()) || Game.GetPlayer().HasLOS(akActor)
thisQuest.setStage(20)
else

testVar = true
while testVar
debug.notification("debug.ai hunters follow ["+timeout+"/30]")
Utility.wait(1.0)
timeout = timeout + 1
if timeout >= 30
if thisQuest.getStage()==10
testVar = false
thisQuest.setStage(20)

endif

endif
if akActor.HasLOS(Game.GetPlayer()) || Game.GetPlayer().HasLOS(akActor)
if thisQuest.getStage()==10
testVar = false
thisQuest.setStage(20)
endif
endif
endWhile

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
testVar = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(Actor akActor)
;BEGIN CODE
testVar = false
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property thisQuest Auto
Scene Property thisScene Auto
Bool Property testVar Auto
int timeout 
