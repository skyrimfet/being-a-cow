;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_bac_whoiam_05019CFD Extends Quest Hidden

;BEGIN ALIAS PROPERTY bacBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacPriest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacPriest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacDiary
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacDiary Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
thisQuest.SetActive()
thisQuest.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
thisQuest.SetObjectiveCompleted(10)
thisQuest.SetObjectiveCompleted(20)

thisQuest.SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
thisQuest.SetObjectiveCompleted(30)

;thisQuest.SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
unownedQuest.setStage(10)
thisQuest.SetObjectiveCompleted(60)
thisQuest.CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
thisQuest.SetObjectiveCompleted(10)
thisQuest.SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
thisQuest.SetObjectiveCompleted(50)
thisQuest.SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property thisQuest Auto
Quest Property unownedQuest Auto
