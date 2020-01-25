;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_bac__quest_Evil_005_Shake_0504A54B Extends Quest Hidden

;BEGIN ALIAS PROPERTY OwnerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaitLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaitLoc Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_Item4.ForceRefTo(Item4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Sound.StopInstance(soundInstance) 
bac__quest_Evil_005_ShakeYourAssCowScene.stop()
bacc.stopCrowd()
bacc.breakQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
bac__quest_Evil_005_ShakeYourAssCowScene.stop()
thisQuest.SetObjectiveDisplayed(10,false)
thisQuest.SetObjectiveDisplayed(60)

bacc.setWaitingTime()

bacc.prepareCrowd()
;bacc.scanForActorsToCrowd(Game.getPlayer(),2000,3)

ObjectReference ref = Alias_Item4.getReference() as ObjectReference
ref.enable()

Utility.WaitGameTime(2)
if thisQuest.getStage() == 60
thisQuest.setStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Sound.StopInstance(soundInstance) 
thisQuest.SetObjectiveDisplayed(80)
bacc.stopCrowd()
Utility.WaitGameTime(2)
if thisQuest.getStage() == 80
thisQuest.setStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
game.disablePlayerControls(true,true,true,false, true, true,false)
game.forcethirdperson()
game.setplayeraidriven(true)
thisQuest.SetObjectiveDisplayed(60,false)

soundInstance= bac_flute_backgroundMarker.play(Game.getPlayer())
Sound.SetInstanceVolume(soundInstance,1.0)  


int i = 1
Actor lastActor = None
gold = 0
bacc.scanForActorsToCrowd(Game.getPlayer(),2000,3)
SexLabF.StripActor(Game.GetPlayer(),none,false)
while i < 42
game.enablePlayerControls()
game.disablePlayerControls(true,true,true,false, true, true,false)
 Utility.WaitGameTime( 0.05)
bacc.scanForActorsToCrowd(Game.getPlayer(),2000,1)

  Actor randomActor = Game.FindRandomActorFromRef(Game.GetPlayer(), 2500.0)
  if randomActor!= lastActor && randomActor!=None && randomActor!=Game.GetPlayer() && bacc.validActor(randomActor)==true  
  lastActor = randomActor
int tip = Utility.randomInt(1*i,10*i)
debug.notification(randomActor.GetLeveledActorBase().GetName()+" paid you "+tip+" septims.")
gold = gold + tip
  endif

 if gold > 500
 i = 200
game.setplayeraidriven(false)
game.enablePlayerControls()
thisQuest.setStage(80)
 endif


i = i + 1
endwhile
game.setplayeraidriven(false)
game.enablePlayerControls()
if thisQuest.getStage() == 70
thisQuest.setStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Sound.StopInstance(soundInstance) 
ObjectReference ref = Alias_Item4.getReference() as ObjectReference
ref.disable()
bacc.reduceDebt( gold )
bacc.successQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
bac__quest_Evil_005_ShakeYourAssCowScene.Start()
thisQuest.SetObjectiveDisplayed(10)
;thisQuest.setStage(60)
;Game.getPlayer().moveto(Item4)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Item4 Auto

Scene Property bac__quest_Evil_005_ShakeYourAssCowScene Auto

Quest Property thisQuest Auto
bac_beingacow Property bacc Auto


int Property gold Auto
SexLabFramework Property SexLabF Auto

Sound property bac_flute_backgroundMarker Auto
Int property soundInstance Auto
