;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_bac__quest_Neutral_002_Mi_05042925 Extends Quest Hidden

;BEGIN ALIAS PROPERTY OwnerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaitLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaitLoc Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
bac__quest_Neutral_002_MilkBottleScene.stop()

thisQuest.SetObjectiveDisplayed(50,false)
int slot = BACActor.isRegistered(Game.getPlayer())
BACActor.removeMilkFromInventory(slot,20,false)

bacc.reduceDebt( 1000 )
bacc.successQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
int slot = BACActor.isRegistered(Game.getPlayer())
bac_random.setValue(BACActor.getTotalMilkCount(slot))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
bac__quest_Neutral_002_MilkBottleScene.stop()


bacc.setWaitingTime()

thisQuest.SetObjectiveDisplayed(50,false)

;STANDARD WAIT F.
Bool bBreak = False 
int x = 0
int slot = BACActor.isRegistered(Game.getPlayer())

while (x <12*1*24) && !bBreak    

  if thisQuest.getStage()>60
	bBreak = True  
  endif
  
  Utility.WaitGameTime(1/12 as float)

  int milkcount =  BACActor.getTotalMilkCount(slot)
	if milkcount >= 20
		thisQuest.SetObjectiveDisplayed(1)
		thisQuest.SetObjectiveDisplayed(0,false)
	else
		thisQuest.SetObjectiveDisplayed(0)
		thisQuest.SetObjectiveDisplayed(1,false)
	endif
	bac_random.setValue(milkcount)
  x += 1
endWhile



;STANDARD WAIT F.
if thisQuest.getStage()==60
 bacc.showBackInfo()
  bBreak = False 
  x = 0
  while (x < 6) && !bBreak    

   if thisQuest.getStage()>60
     bBreak = True  
    endif
     if bBreak == false
     ;do something
     bacc.punishCow(-1)
     endif
;  Utility.wait(0.5)
    Utility.WaitGameTime(1)
  int milkcount =  BACActor.getTotalMilkCount(slot)
	if milkcount >= 20
		thisQuest.SetObjectiveDisplayed(1)
		thisQuest.SetObjectiveDisplayed(0,false)
	else
		thisQuest.SetObjectiveDisplayed(0)
		thisQuest.SetObjectiveDisplayed(1,false)
	endif
	bac_random.setValue(milkcount)
    x += 1
  endWhile
endif
if thisQuest.getStage()==60
thisQuest.setStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
bac__quest_Neutral_002_MilkBottleScene.stop()
bacc.failQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
bac__quest_Neutral_002_MilkBottleScene.start()
thisQuest.SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


GlobalVariable Property bac_random Auto
bac_actor Property BACActor Auto
Quest property thisQuest Auto
bac_beingacow Property bacc Auto
Scene Property bac__quest_Neutral_002_MilkBottleScene Auto
