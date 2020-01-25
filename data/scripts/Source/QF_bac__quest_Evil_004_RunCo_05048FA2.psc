;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 23
Scriptname QF_bac__quest_Evil_004_RunCo_05048FA2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY OwnerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaitLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaitLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item4 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(50,false)
thisQuest.SetObjectiveDisplayed(60)
bac__quest_Evil_004_RunCowRunScene.stop()

fasttravel = Game.IsFastTravelEnabled()
Game.EnableFastTravel(false)

thisQuest.setStage(100)
bacc.setWaitingTime()

Utility.WaitGameTime(0.05*12)

if thisQuest.getStage()!=200 || thisQuest.getStage()!=0
thisQuest.setStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
Game.EnableFastTravel(fasttravel)
bacc.reduceDebt( 500 )
bacc.successQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(110,false)
thisQuest.SetObjectiveDisplayed(120)
SexLabF.StripActor(Game.GetPlayer(),none,false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(50)
bac__quest_Evil_004_RunCowRunScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(60,false)
thisQuest.SetObjectiveDisplayed(100)
SexLabF.StripActor(Game.GetPlayer(),none,false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(130,false)
thisQuest.SetObjectiveDisplayed(140)
SexLabF.StripActor(Game.GetPlayer(),none,false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
Game.EnableFastTravel(fasttravel)
bacc.reduceDebt( -500 )
bacc.breakQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(120,false)
thisQuest.SetObjectiveDisplayed(130)
SexLabF.StripActor(Game.GetPlayer(),none,false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(140,false)
thisQuest.SetObjectiveDisplayed(150)
SexLabF.StripActor(Game.GetPlayer(),none,false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(100,false)
thisQuest.SetObjectiveDisplayed(110)
SexLabF.StripActor(Game.GetPlayer(),none,false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(150,false)
thisQuest.SetObjectiveDisplayed(160)
SexLabF.StripActor(Game.GetPlayer(),none,false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Alias_Item4.ForceRefTo(Item4)
Alias_Item5.ForceRefTo(Item5)
Alias_Item6.ForceRefTo(Item6)
Alias_Item7.ForceRefTo(Item7)
Alias_Item8.ForceRefTo(Item8)
Alias_Item9.ForceRefTo(Item9)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property thisQuest Auto
Scene Property bac__quest_Evil_004_RunCowRunScene Auto

ObjectReference Property Item4 Auto
ObjectReference Property Item5 Auto
ObjectReference Property Item6 Auto
ObjectReference Property Item7 Auto
ObjectReference Property Item8 Auto
ObjectReference Property Item9 Auto


bac_beingacow Property bacc Auto


bool Property fasttravel auto

SexLabFramework Property SexLabF Auto
