;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 26
Scriptname QF_bac_afterstorm_05032F78 Extends Quest Hidden

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY milker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_milker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY avenicci
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_avenicci Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
milker.enable()
Alias_avenicci.ForceRefTo(Acenicci)
Alias_milker.ForceRefTo(milker)

thisQuest.SetObjectiveDisplayed(50,false)




debug.trace(Acenicci)
debug.trace(milker)
debug.trace("---")
debug.trace(Alias_avenicci)
debug.trace(Alias_avenicci.getRef())
debug.trace("---")
debug.trace(Alias_milker)
debug.trace(Alias_milker.getRef())







Utility.wait(3.0)

debug.trace("start scene")
bac_afterstormScene.Start()


Utility.wait(1.0)

thisQuest.setStage(61)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;no milk
thisQuest.SetObjectiveDisplayed(50,false)
thisQuest.SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;milk
thisQuest.SetObjectiveDisplayed(50,false)
Utility.wait(2.5)
;

;
Utility.wait(2.5)
game.enablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(10,false)
thisQuest.SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
doors.SetOpen(false)
thisQuest.SetObjectiveDisplayed(60,false)
game.disablePlayerControls()
BACQuestCtrl.addMilk(Game.getPlayer(), 50)
thisQuest.SetObjectiveDisplayed(60,false)

Form p= Game.GetFormFromFile(0x0407372B, "MilkModNEW.esp") as Form
Game.GetPlayer().EquipItem(p)


thisQuest.setStage(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(80,false)
milker.disable()
thisQuest.CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
bac_afterstormScene.Stop()
game.enablePlayerControls()
game.disablePlayerControls()
thisQuest.setStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(10)
;Utility.WaitGameTime(6)
;thisQuest.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
while( BACQuestCtrl.getMilk(Game.getPlayer()) > 1.1 )


utility.wait(2.5)
endwhile

game.enablePlayerControls()
game.disablePlayerControls()
thisQuest.setStage(66)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(20,false)
thisQuest.SetObjectiveDisplayed(30)
;thisQuest.setStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(30,false)
Utility.WaitGameTime(20)
thisQuest.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property Acenicci Auto
Scene Property bac_afterstormScene Auto
Quest Property thisQuest Auto
ObjectReference Property milker Auto
bac_quest_ctr Property BACQuestCtrl Auto 
import StorageUtil
ObjectReference Property doors Auto
Book  Property bacCertificate Auto
