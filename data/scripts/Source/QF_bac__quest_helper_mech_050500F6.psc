;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname QF_bac__quest_helper_mech_050500F6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY mechRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_mechRef Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
bac__quest_helper_mechScene.stop()
thisQuest.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Game.getPlayer().moveTo(blacksmithRef)

debug.trace("fill alias")
Alias_playerRef.ForceRefTo(Game.getPlayer())
Alias_mechRef.ForceRefTo(mechRef)
debug.trace(mechRef)
debug.trace(Alias_mechRef)
debug.trace(Alias_mechRef.getReference() as Actor)
;Alias_ownerRef.ForceRefTo(blacksmithRef)
debug.trace("start stop")
bac__quest_helper_mechScene.stop()
debug.trace("start scene"+bac__quest_helper_mechScene)

bac__quest_helper_mechScene.start()
debug.trace("start started")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
qCtr.DoFadeOut(1.0)
Actor m = mechRef as Actor
m.SetGhost()
m.SetAlpha(0)
Game.getPlayer().addItem(bac_mechW)
Game.getPlayer().equipItem(bac_mechW)

utility.wait(2)

game.disablePlayerControls(true,true,true,false, true, true,false)
game.forcethirdperson()
game.setplayeraidriven(true)

if Game.GetPlayer().IsEquipped(bac_mechW)
mechRef.moveTo(blacksmithRef)
qCtr.DoFadeIn(1.0)
utility.wait(2)
debug.messagebox("When you opened your eyes, you discovered that you were being trapped inside the mech that was following you... You can't control your movement. And you spend next hours in uncomfortable position as passenger of this monstrum.")
utility.wait(2)
bacc.sendMech(60)
else
m.SetGhost(false)
m.SetAlpha(1)
Game.getPlayer().removeItem(bac_mechW)
Game.getPlayer().unequipItem(bac_mechW)
Game.getPlayer().addItem(zbfCrossPoleExtreme)
Game.getPlayer().equipItem(zbfCrossPoleExtreme)
qCtr.DoFadeIn(1.0)
bacc.sendMech(70)


endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
qCtr.DoFadeOut(1.0)
mechRef.moveTo(Game.getPlayer())
Game.getPlayer().removeItem(bac_mechW)
Game.getPlayer().unequipItem(bac_mechW)
Game.getPlayer().removeItem(zbfCrossPoleExtreme)
Game.getPlayer().unequipItem(zbfCrossPoleExtreme)

Actor m = mechRef as Actor
m.SetGhost(false)
m.SetAlpha(1)
qCtr.DoFadeIn(1.0)
game.setplayeraidriven(false)
game.enablePlayerControls()

bacc.sendMech(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;thisQuest.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
utility.wait(5)
if Game.GetPlayer().GetDistance(mechRef) > 100
bacc.sendMech(30)
else
bacc.sendMech(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
utility.wait(10)
if thisQuest.getStage() == 20

bacc.sendMech(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ObjectReference Property  blacksmithRef Auto
ObjectReference Property  MechRef Auto

Scene Property bac__quest_helper_mechScene Auto
Quest property thisQuest Auto
bac_beingacow Property bacc Auto


Armor Property bac_mechW Auto
Armor Property zbfCrossPoleExtreme Auto

bac_quest_ctr Property qCtr Auto
