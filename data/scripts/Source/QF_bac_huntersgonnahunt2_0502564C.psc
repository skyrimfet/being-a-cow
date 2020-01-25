;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_bac_huntersgonnahunt2_0502564C Extends Quest Hidden

;BEGIN ALIAS PROPERTY BACPlayer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BACPlayer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacHunter003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacHunter003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacHunter004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacHunter004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacHunter001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacHunter001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacHunter005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacHunter005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bacHunter002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bacHunter002 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;thisQuest.SetObjectiveDisplayed(10)
;debug.messagebox("huntes start to loking you")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;debug.messagebox("huntes find you")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;debug.messagebox("huntes going to kill you")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property thisQuest Auto
