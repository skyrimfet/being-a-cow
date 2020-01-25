;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_bac__quest_Good_002_LetMe_05048F99 Extends Quest Hidden

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
bacc.setWaitingTime()
int Slot = BACActor.isRegistered(Game.getPlayer())
BACActor.reequipItems(Slot,true)
bac__quest_Good_002_LetMeFreeYouScene.stop()
bacc.successQuest(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(50)
bac__quest_Good_002_LetMeFreeYouScene.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



Quest Property thisQuest Auto
Scene property bac__quest_Good_002_LetMeFreeYouScene auto


bac_beingacow Property bacc Auto
SexLabFramework Property SexLabF Auto
bac_actor Property BACActor Auto
