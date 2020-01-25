;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname QF_bac_unowned_0501DE47 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(250)
thisQuest.SetObjectiveCompleted(250)
thisQuest.SetObjectiveCompleted(200)
capturedQuest.stop()
capturedQuest.CompleteQuest()

bac_tears1.setStage(10)
thisQuest.CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
thisQuest.SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;thisQuest.SetObjectiveCompleted(30)
thisQuest.SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;thisQuest.SetObjectiveCompleted(40)
thisQuest.SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
thisQuest.SetObjectiveCompleted(70)
thisQuest.SetObjectiveDisplayed(100)
bac_afterstorm.setStage(10)
thisQuest.CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
thisQuest.SetActive()
thisQuest.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
thisQuest.SetObjectiveCompleted(70,false)
;thisQuest.SetObjectiveCompleted(200)
thisQuest.SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
thisQuest.SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
thisQuest.SetObjectiveCompleted(40)
thisQuest.SetObjectiveCompleted(50)
thisQuest.SetObjectiveCompleted(60)
thisQuest.SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;thisQuest.SetObjectiveCompleted(30)
thisQuest.SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest property thisQuest Auto
Quest property capturedQuest Auto
Quest Property bac_tears1 Auto
Quest property bac_afterstorm Auto
