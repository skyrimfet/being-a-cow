;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_bac__quest_Pun_001_BeNake_050402D4 Extends Quest Hidden

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
thisQuest.SetObjectiveDisplayed(50,false)
bac__quest_Pun_001_BeNakedScene.Stop()

bacc.setWaitingTime()
SexLabF.StripActor(Game.GetPlayer(),none,false)
Alias_PlayerRef.ForceRefTo(Game.GetPlayer())
Utility.WaitGameTime(1)
Utility.WaitGameTime(1)
Utility.WaitGameTime(1)
Utility.WaitGameTime(1)
Utility.WaitGameTime(1)
Utility.WaitGameTime(1)
;Utility.wait(3*60*6) 
thisQuest.setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Alias_PlayerRef.ForceRefTo(none)
bacc.successQuest(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
bac__quest_Pun_001_BeNakedScene.Start()
thisQuest.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property thisQuest Auto

SexLabFramework Property SexLabF Auto
bac_beingacow Property bacc Auto
Scene Property bac__quest_Pun_001_BeNakedScene Auto
