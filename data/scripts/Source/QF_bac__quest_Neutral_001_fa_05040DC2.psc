;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_bac__quest_Neutral_001_fa_05040DC2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Item4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OwnerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaitLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaitLoc Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
bac__quest_Neutral_001_farmHelpScene.start()

thisQuest.SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Item4.ForceRefTo(Item4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(51,false)
game.disablePlayerControls(true,true,true,false, true, true,false)
game.forcethirdperson()
bacc.timeScale()
Utility.WaitGameTime(0.5)
bacc.resetTimeScale()
game.enablePlayerControls()
thisQuest.SetObjectiveDisplayed(200)
thisQuest.setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
bacc.breakQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Alias_Item4.ForceRefTo(Item4)
bac__quest_Neutral_001_farmHelpScene.stop()
ObjectReference ref = Alias_Item4.getReference() as ObjectReference
ref.disable()
ref.enable()

thisQuest.SetObjectiveDisplayed(51)
thisQuest.SetObjectiveDisplayed(50,false)

bacc.setWaitingTime()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
bacc.reduceDebt( 250 )
thisQuest.SetObjectiveDisplayed(200)
bacc.successQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

bac_beingacow Property bacc Auto
ObjectReference Property Item4 Auto
Quest Property thisQuest Auto
Scene Property bac__quest_Neutral_001_farmHelpScene Auto
