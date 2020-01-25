;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_bac__quest_Good_001_GiveM_05040845 Extends Quest Hidden

;BEGIN ALIAS PROPERTY OwnerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaitLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaitLoc Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
bac__quest_Good_001_GiveMeBreastScene.Stop()
bacc.successQuest()
bacc.setWaitingTime()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
bac__quest_Good_001_GiveMeBreastScene.Start()
thisQuest.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
bac__quest_Good_001_GiveMeBreastScene.Stop()
bacc.setWaitingTime()
bacc.breakQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
bac_beingacow Property  bacc Auto
Scene Property bac__quest_Good_001_GiveMeBreastScene Auto
Quest Property thisQuest Auto
