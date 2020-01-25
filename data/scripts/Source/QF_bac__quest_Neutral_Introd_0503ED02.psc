;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_bac__quest_Neutral_Introd_0503ED02 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WaitLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaitLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OwnerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnerRef Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(50)
bac__quest_Neutral_IntroductionScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(50,false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property thisQuest Auto
Scene Property bac__quest_Neutral_IntroductionScene Auto
