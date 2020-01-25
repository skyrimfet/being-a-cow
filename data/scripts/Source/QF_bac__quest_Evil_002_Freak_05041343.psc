;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_bac__quest_Evil_002_Freak_05041343 Extends Quest Hidden

;BEGIN ALIAS PROPERTY OwnerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item5 Auto
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
bac__quest_Evil_002_FreakShow001Scene01.start()
thisQuest.SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
bacc.stopCrowd()

game.setplayeraidriven(false)
game.enablePlayerControls()

thisQuest.SetObjectiveDisplayed(70,false)
thisQuest.SetObjectiveDisplayed(80)

Bool bBreak = False 
int x = ticker as int

if thisQuest.getStage()==80
 bacc.showBackInfo()
  bBreak = False 
  x = 0
  while (x < 48) && !bBreak    
debug.trace("BAC - freakshow tick 80 , 1")
   if thisQuest.getStage()>80
     bBreak = True  
    endif
     if bBreak == false
     ;do something
     bacc.punishCow(-1)
     endif
;  Utility.wait(0.5)
    Utility.WaitGameTime(1)
    x += 1
  endWhile
endif
if thisQuest.getStage()==80
thisQuest.setStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
bacc.stopCrowd()
bacc.reduceDebt( collected * 500 )
thisQuest.SetObjectiveDisplayed(70,false)
thisQuest.SetObjectiveDisplayed(80)
bacc.breakQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(51,false)
thisQuest.SetObjectiveDisplayed(70)
game.disablePlayerControls(true,true,true,false, true, true,false)
game.forcethirdperson()
game.setplayeraidriven(true)
SexLabF.StripActor(Game.GetPlayer(),none,false)
thisQuest.SetObjectiveDisplayed(51,false)

bacc.prepareCrowd()
bacc.scanForActorsToCrowd(Game.getPlayer(),4000,30)

Form p= Game.GetFormFromFile(0x0407372B, "MilkModNEW.esp") as Form
Game.GetPlayer().AddItem(p,10)

Game.GetPlayer().DropObject(p, 1)
Game.GetPlayer().DropObject(p, 1)
Game.GetPlayer().DropObject(p, 1)

collected = 0


;STANDARD WAIT F.
Bool bBreak = False 
int x = ticker as int
while (x <12*2*24) && !bBreak    
debug.trace("BAC - freakshow tick 70 , 1")
  if collected>Utility.randomInt(4,7)
     bBreak = true
     bac__quest_Evil_002_FreakShow001Scene02.Stop()
     thisQuest.setStage(80)
  endif

  if thisQuest.getStage()>70
     bBreak = True  
  endif
 ; Utility.wait(0.5)
  Utility.WaitGameTime( 1/12 as float )


 if bac__quest_Evil_002_FreakShow001Scene02.IsPlaying()==false
 ObjectReference assignedActor = Alias_Item5.getReference() as ObjectReference
   Actor randomActor = Game.FindRandomActorFromRef(Game.GetPlayer(), 2500.0)
  if randomActor!=None && randomActor!=Game.GetPlayer() && bacc.validActor(randomActor)==true
    bacc.removeActorFromCrowd(randomActor)
    Alias_Item5.ForceRefTo(randomActor)
Game.GetPlayer().DropObject(p, 1)
bac__quest_Evil_002_FreakShow001Scene02.Start()
  endif
endif

  x += 1
ticker = x/12 as float
endWhile


game.setplayeraidriven(false)
game.enablePlayerControls()

 if    bBreak == false
thisQuest.setStage(300)
else
thisQuest.setStage(80)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
bacc.reduceDebt( collected * 500 )
bacc.stopCrowd()
bacc.successQuest()
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
bac__quest_Evil_002_FreakShow001Scene01.stop()

ObjectReference ref = Alias_Item4.getReference() as ObjectReference
ref.enable()

thisQuest.SetObjectiveDisplayed(50,false)
thisQuest.SetObjectiveDisplayed(51)

bacc.setWaitingTime()
Alias_Item4.ForceRefTo(Item4)

ticker = 0


;STANDARD WAIT F.
Bool bBreak = False 
int x = 0
while (x < 2*24) && !bBreak    
debug.trace("BAC - freakshow tick 60 , 1")
  if thisQuest.getStage()>60
   bBreak = True  
  endif
 ; Utility.wait(0.5)
  Utility.WaitGameTime(1)
  x += 1
endWhile

;STANDARD RETURN WAIT

;STANDARD WAIT F.
if thisQuest.getStage()==60
 bacc.showBackInfo()
  bBreak = False 
  x = 0
  while (x < 24) && !bBreak    
debug.trace("BAC - freakshow tick 60 , 2")
   if thisQuest.getStage()>60
     bBreak = True  
    endif
     if bBreak == false
     ;do something
     bacc.punishCow(-1)
     endif
;  Utility.wait(0.5)
    Utility.WaitGameTime(1)
    x += 1
  endWhile
endif
if thisQuest.getStage()==60
thisQuest.setStage(300)
endif

ticker = x as float
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

bac_beingacow Property bacc Auto
Quest Property thisQuest Auto
SexLabFramework Property SexLabF Auto

ObjectReference Property Item4 Auto

Scene Property bac__quest_Evil_002_FreakShow001Scene01 Auto
Scene Property bac__quest_Evil_002_FreakShow001Scene02 Auto
int Property collected Auto

Float Property ticker Auto
