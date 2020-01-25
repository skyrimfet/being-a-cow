;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname QF_bac_tears1_05024AC3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY bacBlacksmith
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacBlacksmith Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacCat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacCat Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;debug

;thisQuest.setStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
thisScene.stop()
thisScene.start()
;debug.messagebox("cat iback")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
thisQuest.SetObjectiveCompleted(90)
tearsScript.restoreQuest()
Actor a

a = bacHunter001 as Actor
a.enable()
a.moveTo(xmarker)

a = bacHunter002 as Actor
a.enable()
a.moveTo(xmarker)

a = bacHunter003 as Actor
a.enable()
a.moveTo(xmarker)

a = bacHunter004 as Actor
a.enable()
a.moveTo(xmarker)

a = bacHunter005 as Actor
a.enable()
a.moveTo(xmarker)

Utility.wait(5.0)

tearsScript.startQuest()
tearsScript.runTick()

Utility.wait(30)
Alias_bacCat.GetReference().disable()
;thisQuest.setStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;tearsScript.initCapturedCow()

;Utility.wait(15.0)
;tearsScript.transformActor()
Alias_bacCat.GetReference().disable()

thisQuest.SetObjectiveCompleted(10)
thisQuest.SetObjectiveCompleted(20)
thisQuest.SetObjectiveDisplayed(21,false)
thisQuest.SetObjectiveCompleted(80)
thisQuest.SetObjectiveCompleted(90)
thisQuest.CompleteQuest()
thisQuest.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
thisQuest.SetObjectiveCompleted(10)
thisQuest.SetObjectiveDisplayed(20)
Alias_bacCat.GetReference().enable()
;Utility.wait(2.0)


;thisQuest.setStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
thisQuest.SetObjectiveCompleted(80)
thisQuest.SetObjectiveDisplayed(21,false)

thisQuest.SetObjectiveDisplayed(90)
thisScene.Stop()
thisScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
thisScene.stop()
thisScene.start()
thisQuest.SetObjectiveCompleted(20)
;thisQuest.SetObjectiveDisplayed(21,false)

utility.wait( (5*60) as float)

if thisQuest.getStage()==50
  thisQuest.setStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
thisQuest.SetActive()
thisQuest.SetObjectiveDisplayed(10)

;Alias_PlayerRef.getActorRef().moveTo(Alias_bacCat.getActorRef())



;debug
;thisQuest.SetObjectiveDisplayed(21)
;thisQuest.setStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
thisScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Alias_bacCat.GetReference().disable()
;debug.messagebox("cat is out")
int wait = Utility.randomInt((1*60),(5*60))
Utility.wait(wait)
tearsScript.reloadTearsAlias()
;debug.messagebox("cat is back")
Alias_bacCat.GetReference().enable()
thisQuest.setStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property thisQuest Auto

Scene Property thisScene Auto

ObjectReference Property xmarker Auto

ObjectReference Property bacHunter001 Auto
ObjectReference Property bacHunter002 Auto
ObjectReference Property bacHunter003 Auto
ObjectReference Property bacHunter004 Auto
ObjectReference Property bacHunter005 Auto

bac_tears_c Property tearsScript Auto
