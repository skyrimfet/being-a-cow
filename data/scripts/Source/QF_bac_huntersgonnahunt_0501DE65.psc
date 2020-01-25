;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_bac_huntersgonnahunt_0501DE65 Extends Quest Hidden

;BEGIN ALIAS PROPERTY bacHunter001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacHunter001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacHunter002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacHunter002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacHunter003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacHunter003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BACPlayer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BACPlayer Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
hunter001.disable()
hunter002.disable()
hunter003.disable()




thisQuest.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;thisQuest.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest property thisQuest Auto
Quest property unownQuest Auto

ObjectReference Property hunter001 Auto
ObjectReference Property hunter002 Auto
ObjectReference Property hunter003 Auto




